Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.3652.1627472645785091713
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jul 2021 04:44:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6532E31B
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Jul 2021 04:44:04 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0C78E3F66F
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Jul 2021 04:44:03 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libx11: fix xkb compilation with _EVDEVK symbols
Date: Wed, 28 Jul 2021 12:44:02 +0100
Message-Id: <20210728114402.2325698-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

New xkeyboard-config writes defines that use _EVDEVK(), which makekeys
can't parse.  Take a patch from upstream to also parse these symbols.

[ YOCTO #14489 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../xorg-lib/libx11/keysym.patch              | 46 +++++++++++++++++++
 .../recipes-graphics/xorg-lib/libx11_1.7.2.bb |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11/keysym.patch

diff --git a/meta/recipes-graphics/xorg-lib/libx11/keysym.patch b/meta/re=
cipes-graphics/xorg-lib/libx11/keysym.patch
new file mode 100644
index 0000000000..f4d7419c02
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11/keysym.patch
@@ -0,0 +1,46 @@
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/xorg/lib/libx=
11/-/merge_requests/79]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From e92efc63acd7b377faa9e534f4bf52aaa86be2a9 Mon Sep 17 00:00:00 2001
+From: Peter Hutterer <peter.hutterer@who-t.net>
+Date: Tue, 27 Jul 2021 11:46:19 +1000
+Subject: [PATCH] makekeys: handle the new _EVDEVK xorgproto symbols
+
+These keys are all defined through a macro in the form:
+   #define XF86XK_BrightnessAuto		_EVDEVK(0x0F4)
+
+The _EVDEVK macro is simply an offset of 0x10081000.
+Let's parse these lines correctly so those keysyms end up in our
+hashtables.
+
+Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
+---
+ src/util/makekeys.c | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/src/util/makekeys.c b/src/util/makekeys.c
+index e847ef4c..4896cc53 100644
+--- a/src/util/makekeys.c
++++ b/src/util/makekeys.c
+@@ -78,6 +78,18 @@ parse_line(const char *buf, char *key, KeySym *val, c=
har *prefix)
+         return 1;
+     }
+=20
++    /* See if we can parse one of the _EVDEVK symbols */
++    i =3D sscanf(buf, "#define %127s _EVDEVK(0x%lx)", key, val);
++    if (i =3D=3D 2 && (tmp =3D strstr(key, "XK_"))) {
++        memcpy(prefix, key, (size_t)(tmp - key));
++        prefix[tmp - key] =3D '\0';
++        tmp +=3D 3;
++        memmove(key, tmp, strlen(tmp) + 1);
++
++        *val +=3D 0x10081000;
++        return 1;
++    }
++
+     /* Now try to catch alias (XK_foo XK_bar) definitions, and resolve =
them
+      * immediately: if the target is in the form XF86XK_foo, we need to
+      * canonicalise this to XF86foo before we do the lookup. */
+--=20
+GitLab
+
diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb b/meta/recipe=
s-graphics/xorg-lib/libx11_1.7.2.bb
index 5d7e9e3783..c9ddc12f08 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb
@@ -12,6 +12,7 @@ PE =3D "1"
=20
 SRC_URI +=3D "file://Fix-hanging-issue-in-_XReply.patch \
            file://disable_tests.patch \
+           file://keysym.patch \
            "
=20
 SRC_URI[sha256sum] =3D "1cfa35e37aaabbe4792e9bb690468efefbfbf6b147d9c69d=
6f90d13c3092ea6c"
--=20
2.25.1

