Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 461776E593
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Feb 2015 00:17:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t1B0Hn1R020666
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Feb 2015 16:17:50 -0800 (PST)
Received: from op3.wrs.com (128.224.56.210) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 10 Feb 2015 16:17:49 -0800
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Feb 2015 19:17:37 -0500
Message-ID: <1423613857-19514-1-git-send-email-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.2.1
MIME-Version: 1.0
Subject: [PATCH] avahi: fix do_rootfs failure due to version skew
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
X-List-Received-Date: Wed, 11 Feb 2015 00:17:56 -0000
Content-Type: text/plain

The following failure was observed:

error: libavahi-ui-dev-0.6.31-r11.0 requires avahi-daemon = 0.6.31-r11.0
error: libavahi-ui-dev-0.6.31-r11.0 requires libavahi-core7 = 0.6.31-r11.0
error: libavahi-ui-dev-0.6.31-r11.0 requires libavahi-client3 = 0.6.31-r11.0
ERROR: Function failed: do_rootfs
ERROR: Logfile of failure stored in: poky/build/tmp/work/intel_corei7_64-poky-linux/op3-graphical-builder/0.2-r0/temp/log.do_rootfs.8407

Investigating, one finds the following RPM versions:

op3:~/poky/build/tmp/deploy$ ls -l rpm/*core2*/libavahi*
-rw-r--r-- 2 paul paul  31487 Feb 10 13:15 rpm/core2_64/libavahi-client3-0.6.31-r11.1.core2_64.rpm
-rw-r--r-- 2 paul paul  25974 Feb 10 13:15 rpm/core2_64/libavahi-common3-0.6.31-r11.1.core2_64.rpm
-rw-r--r-- 2 paul paul  98862 Feb 10 13:15 rpm/core2_64/libavahi-core7-0.6.31-r11.1.core2_64.rpm
-rw-r--r-- 2 paul paul   9677 Feb 10 13:15 rpm/core2_64/libavahi-glib1-0.6.31-r11.1.core2_64.rpm
-rw-r--r-- 2 paul paul  22097 Feb 10 13:15 rpm/core2_64/libavahi-gobject0-0.6.31-r11.1.core2_64.rpm
-rw-r--r-- 2 paul paul 123301 Feb 10 13:16 rpm/core2_64/libavahi-ui-dbg-0.6.31-r11.0.core2_64.rpm
-rw-r--r-- 2 paul paul   8721 Feb 10 13:16 rpm/core2_64/libavahi-ui-dev-0.6.31-r11.0.core2_64.rpm
-rw-r--r-- 2 paul paul   4706 Feb 10 13:16 rpm/core2_64/libavahi-ui-doc-0.6.31-r11.0.core2_64.rpm
-rw-r--r-- 2 paul paul  71637 Feb 10 13:16 rpm/core2_64/libavahi-ui-staticdev-0.6.31-r11.0.core2_64.rpm
-rw-r--r-- 2 paul paul  11743 Feb 10 13:16 rpm/core2_64/libavahi-ui-utils-0.6.31-r11.0.core2_64.rpm
-rw-r--r-- 2 paul paul  25517 Feb 10 13:16 rpm/core2_64/libavahi-ui0-0.6.31-r11.0.core2_64.rpm
op3:~/poky/build/tmp/deploy$

Note the difference between r11.0 and r11.1 in the above listing.  That
difference causes the fail because:

op3:~/poky$ git grep EXTE meta/recipes-connectivity/avahi/
meta/recipes-connectivity/avahi/avahi.inc:RDEPENDS_${PN}-dev = "avahi-daemon (= ${EXTENDPKGV}) libavahi-core (= ${EXTENDPKGV}) libavahi-client (= ${EXTENDPKGV})"
op3:~/poky$

i.e. we require strict package version matching.  We can see why this version
mismatch happens as follows:

op3:~/poky$ git grep INC meta/recipes-connectivity/avahi/
meta/recipes-connectivity/avahi/avahi-ui_0.6.31.bb:PR = "${INC_PR}.0"
meta/recipes-connectivity/avahi/avahi.inc:INC_PR = "r11"
meta/recipes-connectivity/avahi/avahi_0.6.31.bb:PR = "${INC_PR}.1"
op3:~/poky$

Here, we change the version matching to be more relaxed by stopping at the
INC_PR value, and extending the matching to be greater or equal.

Suggested-by:  Mark Hatle <mark.hatle@windriver.com>
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 meta/recipes-connectivity/avahi/avahi.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
index b060437c1242..7749386b8419 100644
--- a/meta/recipes-connectivity/avahi/avahi.inc
+++ b/meta/recipes-connectivity/avahi/avahi.inc
@@ -102,7 +102,7 @@ FILES_libavahi-glib = "${libdir}/libavahi-glib.so.*"
 FILES_libavahi-gobject = "${libdir}/libavahi-gobject.so.*"
 FILES_avahi-utils = "${bindir}/avahi-*"
 
-RDEPENDS_${PN}-dev = "avahi-daemon (= ${EXTENDPKGV}) libavahi-core (= ${EXTENDPKGV}) libavahi-client (= ${EXTENDPKGV})"
+RDEPENDS_${PN}-dev = "avahi-daemon (>= ${PKGV}-${INC_PR}) libavahi-core (>= ${PKGV}-${INC_PR}) libavahi-client (>= ${PKGV}-${INC_PR})"
 
 # uclibc has no nss
 RRECOMMENDS_avahi-daemon_append_libc-glibc = " libnss-mdns"
-- 
2.2.1


