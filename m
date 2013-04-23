Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jason.wessel@windriver.com>) id 1UUg2e-0001cC-8S
	for Openembedded-core@lists.openembedded.org;
	Tue, 23 Apr 2013 18:26:05 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r3NG8Mba012690
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2013 09:08:22 -0700 (PDT)
Received: from ord-lpggp2.wrs.com (128.224.65.244) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 23 Apr 2013 09:08:22 -0700
From: Jason Wessel <jason.wessel@windriver.com>
To: <Openembedded-core@lists.openembedded.org>
Date: Tue, 23 Apr 2013 11:08:19 -0500
Message-ID: <1366733299-14804-1-git-send-email-jason.wessel@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [PATCH] libpcre, ncurses: Fix problems expanding the IMAGE_INSTALL package groups
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 23 Apr 2013 16:26:05 -0000
Content-Type: text/plain

The ncurses and libpcre packages were generating the following errors
as a result of not specifing the PACKAGES_DYNAMIC correctly.  These
errors only appear when using the IMAGE_INSTALL list that has been
expanded by the hob or from the pkgdata.

ERROR: Nothing RPROVIDES 'ncurses-libtinfo'
ERROR: Nothing RPROVIDES 'libpcreposix'

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-core/ncurses/ncurses.inc        |    2 ++
 meta/recipes-support/libpcre/libpcre_8.32.bb |    2 ++
 2 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index bcb9c94..78ff153 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -42,6 +42,8 @@ EXCONFIG_ARGS_virtclass-nativesdk = " \
 		--with-chtype='long' \
 		--with-mmask-t='long'"
 
+PACKAGES_DYNAMIC = "^${PN}-.*"
+
 # Fall back to the host termcap / terminfo for -nativesdk and -native
 # The reality is a work around for strange problems with things like
 # "bitbake -c menuconfig busybox" where it cannot find the terminfo
diff --git a/meta/recipes-support/libpcre/libpcre_8.32.bb b/meta/recipes-support/libpcre/libpcre_8.32.bb
index 4d17741..71cc119 100644
--- a/meta/recipes-support/libpcre/libpcre_8.32.bb
+++ b/meta/recipes-support/libpcre/libpcre_8.32.bb
@@ -26,6 +26,8 @@ inherit autotools binconfig
 
 PARALLEL_MAKE = ""
 
+PACKAGES_DYNAMIC = "^${PN}.*"
+
 EXTRA_OECONF = "\
     --enable-newline-is-lf \
     --enable-rebuild-chartables \
-- 
1.7.1



