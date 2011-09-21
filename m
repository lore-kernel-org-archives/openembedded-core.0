Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1R6Rnr-0001GH-9V
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Sep 2011 20:45:51 +0200
Received: by mail-bw0-f47.google.com with SMTP id 11so2123662bke.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2011 11:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=Cz1ChXlAhTvxz/bnDA7Gku6ctSTsFnUW6xWSyVtuYOM=;
	b=YRdb+4gI+KrmBr/57QqigVJ24oNndqqiALSCqr7mh8Pp5SdcJHxqEyoVyxV9/GRFjK
	2JXDdEhWOxBU5Kkad7a4nMe+D214kjIJnqqM1fOzGnzatD6UlpLqrFz8BYitAwvWIcM/
	a7AMO6yFMbltkblBH1KLt1+gN2MsJR0YhEa+Q=
Received: by 10.204.130.138 with SMTP id t10mr845801bks.10.1316630434026;
	Wed, 21 Sep 2011 11:40:34 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id t16sm5806554bkv.11.2011.09.21.11.40.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Sep 2011 11:40:33 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Sep 2011 22:39:58 +0400
Message-Id: <1316630404-10336-11-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1316630404-10336-1-git-send-email-dbaryshkov@gmail.com>
References: <1316630404-10336-1-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [PATCH 11/17] eglibc: fix packaging of some of nativesdk packages
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Sep 2011 18:45:51 -0000

eglibc.inc contains packaging rules that depend on PKGSUFFIX expansion.
However that variable wasn't expanded properly in some case. E.g.

PACKAGES = " ... nscd${PKGSUFFIX} ..."
FILES_nscd${PKGSUFFIX} = "${sbindir}/nscd*"

would be expanded to

PACKAGES = " ... nscd-nativesdk ..."
FILES_nscd = "${sbindir}/nscd*"

Thus leading to empty -nativesdk packages and missing files. To overcome
that use python code blob to properly define PKGSUFFIX variable.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 meta/recipes-core/eglibc/eglibc-locale.inc  |   13 +++++++++----
 meta/recipes-core/eglibc/eglibc-package.inc |    9 +++++++--
 meta/recipes-core/eglibc/eglibc_2.12.bb     |    2 +-
 meta/recipes-core/eglibc/eglibc_2.13.bb     |    2 +-
 4 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc-locale.inc b/meta/recipes-core/eglibc/eglibc-locale.inc
index 9424ff5..cfc7d84 100644
--- a/meta/recipes-core/eglibc/eglibc-locale.inc
+++ b/meta/recipes-core/eglibc/eglibc-locale.inc
@@ -26,10 +26,15 @@ BINARY_LOCALE_ARCHES ?= "arm.* i[3-6]86 x86_64 powerpc mips"
 # set "0" for qemu emulation of native localedef for locale generation
 LOCALE_GENERATION_WITH_CROSS-LOCALEDEF = "1"
 
-PR = "r16"
-
-PKGSUFFIX = ""
-PKGSUFFIX_virtclass-nativesdk = "-nativesdk"
+PR = "r17"
+
+python __anonymous () {
+    import bb
+    if bb.data.inherits_class("nativesdk", d):
+        bb.data.setVar("PKGSUFFIX", "-nativesdk", d)
+    else:
+        bb.data.setVar("PKGSUFFIX", "", d)
+}
 
 PROVIDES = "virtual/libc-locale${PKGSUFFIX}"
 
diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes-core/eglibc/eglibc-package.inc
index 519a49c..dc6fce0 100644
--- a/meta/recipes-core/eglibc/eglibc-package.inc
+++ b/meta/recipes-core/eglibc/eglibc-package.inc
@@ -17,8 +17,13 @@ python __anonymous () {
 # Set this to zero if you don't want ldconfig in the output package
 USE_LDCONFIG ?= "1"
 
-PKGSUFFIX = ""
-PKGSUFFIX_virtclass-nativesdk = "-nativesdk"
+python __anonymous () {
+    import bb
+    if bb.data.inherits_class("nativesdk", d):
+        bb.data.setVar("PKGSUFFIX", "-nativesdk", d)
+    else:
+        bb.data.setVar("PKGSUFFIX", "", d)
+}
 
 PACKAGES = "${PN}-dbg ${PN} catchsegv${PKGSUFFIX} sln${PKGSUFFIX} nscd${PKGSUFFIX} ldd${PKGSUFFIX} ${PN}-utils eglibc-extra-nss${PKGSUFFIX} eglibc-thread-db${PKGSUFFIX} ${PN}-pic ${PN}-dev ${PN}-doc libcidn${PKGSUFFIX} libmemusage${PKGSUFFIX} libsegfault${PKGSUFFIX} ${PN}-pcprofile libsotruss${PKGSUFFIX}"
 
diff --git a/meta/recipes-core/eglibc/eglibc_2.12.bb b/meta/recipes-core/eglibc/eglibc_2.12.bb
index a9d208b..7a1a569 100644
--- a/meta/recipes-core/eglibc/eglibc_2.12.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.12.bb
@@ -1,7 +1,7 @@
 require eglibc.inc
 
 DEPENDS += "gperf-native"
-PR = "r24"
+PR = "r25"
 
 SRCREV = "14158"
 
diff --git a/meta/recipes-core/eglibc/eglibc_2.13.bb b/meta/recipes-core/eglibc/eglibc_2.13.bb
index b549496..e172785 100644
--- a/meta/recipes-core/eglibc/eglibc_2.13.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.13.bb
@@ -3,7 +3,7 @@ require eglibc.inc
 SRCREV = "14157"
 
 DEPENDS += "gperf-native"
-PR = "r15"
+PR = "r16"
 PR_append = "+svnr${SRCPV}"
 
 EGLIBC_BRANCH="eglibc-2_13"
-- 
1.7.2.5



