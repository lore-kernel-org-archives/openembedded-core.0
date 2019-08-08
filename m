Return-Path: <jwessel@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A394E7F2A4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2019 12:55:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x78CtBmI021329
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Aug 2019 05:55:11 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Thu, 8 Aug 2019 05:55:11 -0700
Received: by ala-lpggp2.wrs.com (Postfix, from userid 5002)	id 61FF9AA4825;
	Thu,  8 Aug 2019 05:55:11 -0700 (PDT)
From: Jason Wessel <jason.wessel@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 8 Aug 2019 05:55:09 -0700
Message-ID: <20190808125509.120784-4-jason.wessel@windriver.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190808125509.120784-1-jason.wessel@windriver.com>
References: <20190808125509.120784-1-jason.wessel@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] dpkg: Provide update-alternative for start-stop-daemon
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Aug 2019 12:55:10 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

When using DISTRO_FEATURE usrmerge, busybox and something that
requires dpkg-start-stop there is a conflict which prints the
following error.

===

ERROR: core-image-minimal-1.0-r1 do_rootfs: Postinstall scriptlets of ['busybox'] have failed. If the intention is to defer them to first boot,
then please place them into pkg_postinst_ontarget_${PN} ().
Deferring to first boot via 'exit 1' is no longer supported.
Details of the failure are in /build/tmp-glibc/work/intel_x86_64-linux/core-image-minimal/1.0-r1/temp/log.do_rootfs.
ERROR: core-image-minimal-1.0-r1 do_rootfs: Function failed: do_rootfs

===

Looking at the log file, it shows the problem:

update-alternatives: Error: not linking /build/tmp-glibc/work/intel_x86_64-linux/core-image-minimal/1.0-r1/rootfs/usr/sbin/start-stop-daemon to /usr/bin/busybox.nosuid since /build/tmp-glibc/work/intel_x86_64-linux/core-image-minimal/1.0-r1/rootfs/usr/sbin/start-stop-daemon exists and is not a link

===

The solution is to add an update-alternative to start-stop-daemon for dpkg.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 meta/recipes-devtools/dpkg/dpkg.inc | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index fee7a75814..1c3c585d79 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -9,7 +9,7 @@ RDEPENDS_${PN}_class-native = ""
 
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/d/dpkg/"
 
-inherit autotools gettext perlnative pkgconfig perl-version
+inherit autotools gettext perlnative pkgconfig perl-version update-alternatives
 
 PERL_class-native = "${STAGING_BINDIR_NATIVE}/perl-native/perl"
 
@@ -76,7 +76,10 @@ RDEPENDS_${PN}-perl += "perl-module-carp perl-module-constant \
 # the bitbake version.
 #
 PACKAGES =+ "${PN}-start-stop"
-FILES_${PN}-start-stop = "${sbindir}/start-stop-daemon"
+FILES_${PN}-start-stop = "${sbindir}/start-stop-daemon.${BPN}"
+ALTERNATIVE_${PN}-start-stop = "start-stop-daemon"
+ALTERNATIVE_LINK_NAME[start-stop-daemon] = "${sbindir}/start-stop-daemon"
+ALTERNATIVE_PRIORITY = "100"
 
 RDEPENDS_${PN} += "${PN}-start-stop"
 
-- 
2.21.0


