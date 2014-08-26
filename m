Return-Path: <fahad.usman@gmail.com>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 341D1706F1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Aug 2014 08:17:27 +0000 (UTC)
Received: by mail-pd0-f175.google.com with SMTP id r10so21627218pdi.20
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Aug 2014 01:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=SCkWDFxcAXEKFwWY9eIkN3KbrxJOo0VS8/N6+yZvSx4=;
	b=joNkTkIIhpffo5Gloz/9QwYsqCAb4fCsCBftDIJ4s54C4kwt4894Ss3tNv8rb4Cf7j
	3tjvHmclMjISDyNCloWYdhAbagc8zSOVnP+W4ozf+ivLHU/WeI9Mw6c4UWBTRaOm/u69
	NooA5mKoHxD2Me+zaLUyadUhuSp1oFRAkJVxkRdt/CYNXuS0m3eCFamor84SmpBXUL1W
	fN988wvixnJhZ4cTUvO/8Dv6p7IL88fbgZQHSXmHhlpNmwo6kZOSA5mWqVHBZeHQfEQC
	gpFBwU0f7+pu2SNWttsNACr3RLOAeDaIv9odjo0N6GXwpF9dYWr2bjqXJh9TmTF2PyIO
	7DGg==
X-Received: by 10.68.133.170 with SMTP id pd10mr5448391pbb.83.1409041049430;
	Tue, 26 Aug 2014 01:17:29 -0700 (PDT)
Received: from svr-pkl-eng-06.pkl.mentorg.com ([110.93.212.98])
	by mx.google.com with ESMTPSA id ek9sm3392317pdb.55.2014.08.26.01.17.26
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 26 Aug 2014 01:17:28 -0700 (PDT)
Sender: Fahad Usman <fahad.usman@gmail.com>
From: Fahad Usman <fahad_usman@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Aug 2014 13:16:48 +0500
Message-Id: <1409041009-49315-1-git-send-email-fahad_usman@mentor.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH v2 1/2] logrotate: obey our flags
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
X-List-Received-Date: Tue, 26 Aug 2014 08:17:36 -0000

Needed to quiet GNU_HASH warnings, and some minor fixes.

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


