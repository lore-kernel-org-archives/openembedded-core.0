Return-Path: <fahad.usman@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 7DC01601A8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 16:22:40 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id d1so2802419wiv.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 09:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=0OeNhX6LQOqZDkzZaS+LBfpkc6fdvZCP/H0someYhUs=;
	b=anb3aw580imw+MpJtmOGI4t9LkWdTN1uWpNQf58OUr0f2OEkpJXW9XROO7KR4CIKJp
	hJJ3ksT0masYRE9s3KB/QevxRXoO5ev852W/5mMLeyc3qW+oa00mxWChwWBW3GHrQPMi
	3jcpO1unktCn9vratzYHUgX7nnr8v5KbZcVKnYqLBYsjwySvKYzTcGTho7z3LXQeZBEn
	yi+LgNqLbrxiKxg4G+Fr9VTPTFdCRiww8k0m5TCRFIH/+ogCLzCBtwpelYOKGluYwpSj
	DBFQz9eggHFBmpXdZdf9jY1dNhs+JIbWTDcANGu/T7T5CXe+0crY1TcsI1gLaTXS9KkT
	40eA==
X-Received: by 10.180.75.49 with SMTP id z17mr16094603wiv.80.1408983761794;
	Mon, 25 Aug 2014 09:22:41 -0700 (PDT)
Received: from svr-pkl-eng-06.pkl.mentorg.com ([110.93.212.98])
	by mx.google.com with ESMTPSA id fy1sm2186140wic.6.2014.08.25.09.22.39
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 25 Aug 2014 09:22:41 -0700 (PDT)
Sender: Fahad Usman <fahad.usman@gmail.com>
From: Fahad Usman <fahad_usman@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Aug 2014 21:22:04 +0500
Message-Id: <1408983725-45864-1-git-send-email-fahad_usman@mentor.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 1/2] logrotate: obey our flags
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
X-List-Received-Date: Mon, 25 Aug 2014 16:22:46 -0000

Needed to quiet GNU_HASH warnings, amd some minor fixes.

Signed-off-by: Fahad Usman <fahad.usman@gmail.com>
Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 meta/recipes-extended/logrotate/logrotate_3.8.7.bb |   18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/logrotate/logrotate_3.8.7.bb b/meta/recipes-extended/logrotate/logrotate_3.8.7.bb
index 3a6a228..42cd764 100644
--- a/meta/recipes-extended/logrotate/logrotate_3.8.7.bb
+++ b/meta/recipes-extended/logrotate/logrotate_3.8.7.bb
@@ -16,7 +16,21 @@ SRC_URI = "https://fedorahosted.org/releases/l/o/logrotate/logrotate-${PV}.tar.g
 SRC_URI[md5sum] = "99e08503ef24c3e2e3ff74cc5f3be213"
 SRC_URI[sha256sum] = "f6ba691f40e30e640efa2752c1f9499a3f9738257660994de70a45fe00d12b64"
 
-EXTRA_OEMAKE = ""
+# If RPM_OPT_FLAGS is unset, it adds -g itself rather than obeying our
+# optimization variables, so use it rather than EXTRA_CFLAGS.
+EXTRA_OEMAKE = "\
+    LFS= \
+    OS_NAME='${OS_NAME}' \
+    \
+    'CC=${CC}' \
+    'RPM_OPT_FLAGS=${CFLAGS}' \
+    'EXTRA_LDFLAGS=${LDFLAGS}' \
+"
+
+# OS_NAME in the makefile defaults to `uname -s`. The behavior for
+# freebsd/netbsd is questionable, so leave it as Linux, which only sets
+# INSTALL=install and BASEDIR=/usr.
+OS_NAME = "Linux"
 
 do_compile_prepend() {
     # Make sure the recompile is OK
@@ -24,7 +38,7 @@ do_compile_prepend() {
 }
 
 do_install(){
-    oe_runmake install DESTDIR=${D} PREFIX=${D} MANDIR=${mandir}
+    oe_runmake install DESTDIR=${D} PREFIX=${D} MANDIR=${mandir} BINDIR=${bindir}
     mkdir -p ${D}${sysconfdir}/logrotate.d
     mkdir -p ${D}${sysconfdir}/cron.daily
     mkdir -p ${D}${localstatedir}/lib
-- 
1.7.9.5


