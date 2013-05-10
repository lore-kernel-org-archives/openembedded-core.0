Received: from mail-ee0-f42.google.com ([74.125.83.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Uakk2-0003Bf-HX
	for openembedded-core@lists.openembedded.org;
	Fri, 10 May 2013 12:40:03 +0200
Received: by mail-ee0-f42.google.com with SMTP id c13so2109697eek.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 May 2013 03:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=UDnEQSwLhINQzcxfTVWCMc1b2xOkWhwS5iU86o/j9qM=;
	b=NerrV3ZWOYyOmjEJWbb+oY4ZKAAjkOEVgjlD+HyauKYQrUTC6fWqdHAQyJFjqtY3bZ
	BV6Bwh7IxZLO5KHSEsBKjR+qi/X4has70sbYouBEFH3ykR/d+eIkHrRaawoOV0dtrwDk
	CbrtSgXDoZdOkvUaoCQdgTXLTbDMq3orraiIRCHYlX/YHpxAJsRqadCLqw9s4SUOlFdi
	CZpEcNZ3wcUExXavNm/it3FAx+ZZnEcFxz72WoRwCfo4o+OPbZMDLnH3jfSQU6VLyUkW
	4lqnixn7Eyk6x+fk4FLeg/KeYgmhD6fUbU4td4AeLMqsYuPD1pY2lXOnMfEQTAbBmiA3
	IcHw==
X-Received: by 10.14.0.129 with SMTP id 1mr39489222eeb.43.1368181313673;
	Fri, 10 May 2013 03:21:53 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	k43sm2691813een.2.2013.05.10.03.21.52 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 10 May 2013 03:21:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 May 2013 12:21:52 +0200
Message-Id: <1368181312-18059-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <518BE30F.5050104@linux.intel.com>
References: <518BE30F.5050104@linux.intel.com>
Subject: [PATCHv2] flex: fix reported executable name caused by OE wrapper
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
X-List-Received-Date: Fri, 10 May 2013 10:40:17 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/flex/flex.inc                 | 15 ++++++++++++++-
 .../flex/flex/drop.suffix.from.wrapper.patch        | 21 +++++++++++++++++++++
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/flex/flex/drop.suffix.from.wrapper.patch

diff --git a/meta/recipes-devtools/flex/flex.inc b/meta/recipes-devtools/flex/flex.inc
index 517db16..02a66cf 100644
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
+	sed -i "/^\s*doc /d" ${S}/Makefile.am
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



