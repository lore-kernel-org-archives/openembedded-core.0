Received: from mail-ea0-f179.google.com ([209.85.215.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UaS9k-0000a5-Ne
	for openembedded-core@lists.openembedded.org;
	Thu, 09 May 2013 16:49:22 +0200
Received: by mail-ea0-f179.google.com with SMTP id h14so1588869eaj.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 May 2013 07:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=2WeV36aaisPUZwYviSS3+aPwAq+v5zXpw88dl1+F6lE=;
	b=L5wjuxD5u0vx1vfxAFHMJ+pp6kbCqy3PAPO/ADQ5Ga0ewfjFb/5EwNPbfMNzEVPpxW
	D9JNJGhWaX6Ut9FKvMipoMgHmhW37mah4Oob2gh4OGHMLE6+Wsl5swkaQfN9Cy1384Rl
	VRjs/A4vZIseQ44LmyS4PaaA9hzByajK6S8npZoObqCadtOua5sFz3rERThcfz5a39yR
	MVQh+wCbmtQ8vIhZzP49SZzOn+LR7eoI+jhjfHkhD+sRjiuRte5blo/spd6F3D1T769F
	laBPLmOw4qzX2aA5tgQZQYcssYiuhozybcldTXO9xU5Qwe3jN9dyadmSPOYexe0OV1MJ
	Or9g==
X-Received: by 10.15.95.74 with SMTP id bc50mr29606977eeb.36.1368109873060;
	Thu, 09 May 2013 07:31:13 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	bn53sm4551398eeb.7.2013.05.09.07.31.12 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 09 May 2013 07:31:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 May 2013 16:31:12 +0200
Message-Id: <1368109872-4273-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <20130509130319.GE3188@jama>
References: <20130509130319.GE3188@jama>
Subject: [PATCH] flex: fix reported executable name caused by OE wrapper
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
X-List-Received-Date: Thu, 09 May 2013 14:49:23 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/flex/flex.inc                 | 15 ++++++++++++++-
 .../flex/flex/drop.suffix.from.wrapper.patch        | 21 +++++++++++++++++++++
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/flex/flex/drop.suffix.from.wrapper.patch

diff --git a/meta/recipes-devtools/flex/flex.inc b/meta/recipes-devtools/flex/flex.inc
index 517db16..344b716 100644
--- a/meta/recipes-devtools/flex/flex.inc
+++ b/meta/recipes-devtools/flex/flex.inc
@@ -6,10 +6,23 @@ HOMEPAGE = "http://sourceforge.net/projects/flex/"
 SECTION = "devel"
 LICENSE = "BSD"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/flex/flex-${PV}.tar.bz2 "
+SRC_URI = "${SOURCEFORGE_MIRROR}/flex/flex-${PV}.tar.bz2 \
+           file://drop.suffix.from.wrapper.patch \
+"
 
 inherit autotools gettext
 
+# drop building doc, there is openembedded-core/scripts/help2man
+# but that just returns exit 1 and flex.1 is immediately removed:
+# openembedded-core/scripts/help2man --name='the fast lexical analyser generator' \
+# --section=`echo $i | sed -e 's/.*\.\([^.]*\)$/\1/'` \
+#  ../flex > $i || rm -f $i ; \
+# and do_install fails, it wasn't failing before, because flex.1 included in
+# release tarbal was valid until we patched main.c in drop.suffix.from.wrapper.patch
+do_configure_prepend() {
+	sed -i "/^\s*doc /d" Makefile.am
+}
+
 M4 = "${bindir}/m4"
 M4_class-native = "${STAGING_BINDIR_NATIVE}/m4"
 
diff --git a/meta/recipes-devtools/flex/flex/drop.suffix.from.wrapper.patch b/meta/recipes-devtools/flex/flex/drop.suffix.from.wrapper.patch
new file mode 100644
index 0000000..9bbd088
--- /dev/null
+++ b/meta/recipes-devtools/flex/flex/drop.suffix.from.wrapper.patch
@@ -0,0 +1,21 @@
+Upstream probably doesn't expect wrappers like we create for flex.
+
+This also fixes disabled C_plus_plus functions in flex++ if we ever create wrapper for flex++.
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+
+--- flex-2.5.35/main.c.orig	2013-05-09 15:19:34.619281743 +0200
++++ flex-2.5.35/main.c	2013-05-09 15:19:10.216280868 +0200
+@@ -984,6 +984,10 @@
+ 	/* Enable C++ if program name ends with '+'. */
+ 	program_name = basename2 (argv[0], 0);
+ 
++	/* Drop trailing .real suffix if it's there */
++	if (strstr(program_name, ".real") != NULL && strstr(program_name, ".real") - program_name == strlen(program_name) - 5)
++	    program_name[strlen (program_name) - 5] = '\0';
++
+ 	if (program_name[0] != '\0' &&
+ 	    program_name[strlen (program_name) - 1] == '+')
+ 		C_plus_plus = true;
-- 
1.8.2.1



