Return-Path: <Catalin.Enache@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2414C60125
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Nov 2017 16:30:22 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vA1GUNx1008611
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 1 Nov 2017 09:30:24 -0700
Received: from no3.corp.ad.wrs.com (128.224.125.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Wed, 1 Nov 2017 09:30:23 -0700
From: Catalin Enache <catalin.enache@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 1 Nov 2017 18:28:49 +0200
Message-ID: <1509553729-22718-1-git-send-email-catalin.enache@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] libxfont: CVE-2017-13720, CVE-2017-13722
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
X-List-Received-Date: Wed, 01 Nov 2017 16:30:23 -0000
Content-Type: text/plain

In the PatternMatch function in fontfile/fontdir.c in libXfont through 1.5.2
and 2.x before 2.0.2, an attacker with access to an X connection can cause
a buffer over-read during pattern matching of fonts, leading to information
disclosure or a crash (denial of service). This occurs because '\0'
characters are incorrectly skipped in situations involving ? characters.

In the pcfGetProperties function in bitmap/pcfread.c in libXfont through 1.5.2
and 2.x before 2.0.2, a missing boundary check (for PCF files) could be used
by local attackers authenticated to an Xserver for a buffer over-read, for
information disclosure or a crash of the X server.

References:
https://nvd.nist.gov/vuln/detail/CVE-2017-13720
https://nvd.nist.gov/vuln/detail/CVE-2017-13722

Upstream patches:
https://cgit.freedesktop.org/xorg/lib/libXfont/commit/?id=d1e670a4a8704b8708e493ab6155589bcd570608
https://cgit.freedesktop.org/xorg/lib/libXfont/commit/?id=672bb944311392e2415b39c0d63b1e1902905bcd

Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
---
 .../xorg-lib/libxfont/CVE-2017-13720.patch         | 37 +++++++++++++++
 .../xorg-lib/libxfont/CVE-2017-13722.patch         | 55 ++++++++++++++++++++++
 meta/recipes-graphics/xorg-lib/libxfont_1.5.2.bb   |  4 ++
 3 files changed, 96 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/libxfont/CVE-2017-13720.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libxfont/CVE-2017-13722.patch

diff --git a/meta/recipes-graphics/xorg-lib/libxfont/CVE-2017-13720.patch b/meta/recipes-graphics/xorg-lib/libxfont/CVE-2017-13720.patch
new file mode 100644
index 0000000..79d2cac
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libxfont/CVE-2017-13720.patch
@@ -0,0 +1,37 @@
+From d1e670a4a8704b8708e493ab6155589bcd570608 Mon Sep 17 00:00:00 2001
+From: Michal Srb <msrb@suse.com>
+Date: Thu, 20 Jul 2017 13:38:53 +0200
+Subject: [PATCH] Check for end of string in PatternMatch (CVE-2017-13720)
+
+If a pattern contains '?' character, any character in the string is skipped,
+even if it is '\0'. The rest of the matching then reads invalid memory.
+
+Upstream-Status: Backport
+CVE: CVE-2017-13720
+
+Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
+Signed-off-by: Julien Cristau <jcristau@debian.org>
+Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
+---
+ src/fontfile/fontdir.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/fontfile/fontdir.c b/src/fontfile/fontdir.c
+index 4ce2473..996b7d1 100644
+--- a/src/fontfile/fontdir.c
++++ b/src/fontfile/fontdir.c
+@@ -400,8 +400,10 @@ PatternMatch(char *pat, int patdashes, char *string, int stringdashes)
+ 		}
+ 	    }
+ 	case '?':
+-	    if (*string++ == XK_minus)
++	    if ((t = *string++) == XK_minus)
+ 		stringdashes--;
++	    if (!t)
++		return 0;
+ 	    break;
+ 	case '\0':
+ 	    return (*string == '\0');
+-- 
+2.10.2
+
diff --git a/meta/recipes-graphics/xorg-lib/libxfont/CVE-2017-13722.patch b/meta/recipes-graphics/xorg-lib/libxfont/CVE-2017-13722.patch
new file mode 100644
index 0000000..92d149b
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libxfont/CVE-2017-13722.patch
@@ -0,0 +1,55 @@
+From 672bb944311392e2415b39c0d63b1e1902905bcd Mon Sep 17 00:00:00 2001
+From: Michal Srb <msrb@suse.com>
+Date: Thu, 20 Jul 2017 17:05:23 +0200
+Subject: [PATCH] pcfGetProperties: Check string boundaries (CVE-2017-13722)
+
+Without the checks a malformed PCF file can cause the library to make
+atom from random heap memory that was behind the `strings` buffer.
+This may crash the process or leak information.
+
+Upstream-Status: Backport
+CVE: CVE-2017-13722
+
+Signed-off-by: Julien Cristau <jcristau@debian.org>
+Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
+---
+ src/bitmap/pcfread.c | 13 +++++++++++--
+ 1 file changed, 11 insertions(+), 2 deletions(-)
+
+diff --git a/src/bitmap/pcfread.c b/src/bitmap/pcfread.c
+index dab1c44..ae34c28 100644
+--- a/src/bitmap/pcfread.c
++++ b/src/bitmap/pcfread.c
+@@ -45,6 +45,7 @@ from The Open Group.
+ 
+ #include <stdarg.h>
+ #include <stdint.h>
++#include <string.h>
+ 
+ void
+ pcfError(const char* message, ...)
+@@ -311,11 +312,19 @@ pcfGetProperties(FontInfoPtr pFontInfo, FontFilePtr file,
+     if (IS_EOF(file)) goto Bail;
+     position += string_size;
+     for (i = 0; i < nprops; i++) {
++	if (props[i].name >= string_size) {
++	    pcfError("pcfGetProperties(): String starts out of bounds (%ld/%d)\n", props[i].name, string_size);
++	    goto Bail;
++	}
+ 	props[i].name = MakeAtom(strings + props[i].name,
+-				 strlen(strings + props[i].name), TRUE);
++				 strnlen(strings + props[i].name, string_size - props[i].name), TRUE);
+ 	if (isStringProp[i]) {
++	    if (props[i].value >= string_size) {
++		pcfError("pcfGetProperties(): String starts out of bounds (%ld/%d)\n", props[i].value, string_size);
++		goto Bail;
++	    }
+ 	    props[i].value = MakeAtom(strings + props[i].value,
+-				      strlen(strings + props[i].value), TRUE);
++				      strnlen(strings + props[i].value, string_size - props[i].value), TRUE);
+ 	}
+     }
+     free(strings);
+-- 
+2.10.2
+
diff --git a/meta/recipes-graphics/xorg-lib/libxfont_1.5.2.bb b/meta/recipes-graphics/xorg-lib/libxfont_1.5.2.bb
index b11dda5..c2f5fcf 100644
--- a/meta/recipes-graphics/xorg-lib/libxfont_1.5.2.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfont_1.5.2.bb
@@ -16,6 +16,10 @@ PE = "1"
 
 XORG_PN = "libXfont"
 
+SRC_URI +=  "file://CVE-2017-13720.patch \
+             file://CVE-2017-13722.patch \
+            "
+
 BBCLASSEXTEND = "native"
 
 SRC_URI[md5sum] = "254ee42bd178d18ebc7a73aacfde7f79"
-- 
2.10.2


