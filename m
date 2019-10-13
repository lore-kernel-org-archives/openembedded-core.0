Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id C75A57D534
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Oct 2019 00:51:25 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id q21so8267576pfn.11
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Oct 2019 17:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=YuwNuLkodPP7b0SWTFc2BYN3VxTFbzHVC7hzH2klhw0=;
	b=I6xoSXbXRAngnznzDgVPR2a03cZa0dPYwdh9FfaxhpCMmh15fA6s+8wH1XkEXHdMCj
	0siVAk6OE9qtt+p80ngnuUoHfBs7pgY6qVdjNxWmatgw08J63igmZN/MfVI7ObASG/FM
	3yTg/1Fspf0oKlI+4dcNYtKNzTKs9AroaGLTivku0dSI3kwWbl/gJ+XFXpdTSW6WqKwk
	E3UkTjy12kp9271dOKdjL6WxynqxioDTmQkHaDIcmWwU8wO0Jc8/pbB5Lcp8dAKE7IQF
	WnUhHUpHlr9+hNpE7Guf7co6AMn/Q1RxHC7Z63Ehxy1+NWE6oeF15DQTG0XnAh4KDXGS
	uzZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=YuwNuLkodPP7b0SWTFc2BYN3VxTFbzHVC7hzH2klhw0=;
	b=c0Lgu8oiLGqo6gxLmmMcPCSnDb7Y50uX++cpNKc+ClhSbQ5MJD+dvZbeBh3FQX38cv
	PFwoEYh/aPzcc9ydUtJQ/+3Ppkv6w//9Q8i0t5/pkX7Eer3jCs5vZc7zPuAvveFrSV71
	E2H2q4Pfu0CIX6R3koU4E4dm0XK6QRaYOmcSf5mEMCf7siT6DwsUW1JAdULaYGk5LRRF
	2DZ/ag+5gGc74b0xWt8jqjdBrAstcSEp8VyI7L/U/939rXhueUPsHmtukxx/dnkPIeYT
	Wn2joKjt5Qz2noaI0cT2RTEZXnYcFGD3JfFvC0II6HTaXYw98jNfwgOrtWAV8/LdMAfD
	n/Qg==
X-Gm-Message-State: APjAAAV3qZ76fy5r4WbwYgPfrReQ3tZUZMsDP5rAgmOIvXXDTC3fxm9z
	RkEIXxOSLOHWBwkuNMB2DaXqc9iRCp4=
X-Google-Smtp-Source: APXvYqyhktxJRa3z76qvhuXu6PV2qxYIIyNaat7GYPcOR73vWEHWttVMgfUQHT+oF4hNblTaI4Fi+Q==
X-Received: by 2002:a17:90a:cf8c:: with SMTP id
	i12mr26871518pju.77.1570927885851; 
	Sat, 12 Oct 2019 17:51:25 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::7275])
	by smtp.gmail.com with ESMTPSA id
	d1sm14629304pfc.98.2019.10.12.17.51.24
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 12 Oct 2019 17:51:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 12 Oct 2019 17:51:17 -0700
Message-Id: <20191013005117.841034-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] glib-2.0: Fix build with clang compiler
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
X-List-Received-Date: Sun, 13 Oct 2019 00:51:25 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...on-Run-atomics-test-on-clang-as-well.patch | 31 +++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.62.1.bb |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-meson-Run-atomics-test-on-clang-as-well.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-meson-Run-atomics-test-on-clang-as-well.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-meson-Run-atomics-test-on-clang-as-well.patch
new file mode 100644
index 0000000000..833ad2540e
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-meson-Run-atomics-test-on-clang-as-well.patch
@@ -0,0 +1,31 @@
+From cce617bec254e327ed7bcad60f58208024c6dc42 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 12 Oct 2019 17:46:26 -0700
+Subject: [PATCH] meson: Run atomics test on clang as well
+
+Fixes
+./glib-2.62.1/glib/gatomic.c:675:2: error: G_ATOMIC_LOCK_FREE defined, but incapable of lock-free atomics.
+^
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 9731de4..c678931 100644
+--- a/meson.build
++++ b/meson.build
+@@ -1634,7 +1634,7 @@ atomicdefine = '''
+ # We know that we can always use real ("lock free") atomic operations with MSVC
+ if cc.get_id() == 'msvc' or cc.get_id() == 'clang-cl' or cc.links(atomictest, name : 'atomic ops')
+   have_atomic_lock_free = true
+-  if cc.get_id() == 'gcc' and not cc.compiles(atomicdefine, name : 'atomic ops define')
++  if (cc.get_id() == 'gcc' or cc.get_id() == 'clang') and not cc.compiles(atomicdefine, name : 'atomic ops define')
+     # Old gcc release may provide
+     # __sync_bool_compare_and_swap but doesn't define
+     # __GCC_HAVE_SYNC_COMPARE_AND_SWAP_4
+-- 
+2.23.0
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.62.1.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.62.1.bb
index 6d841ec9d9..7897170a7d 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.62.1.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.62.1.bb
@@ -14,6 +14,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://0010-Do-not-hardcode-python-path-into-various-tools.patch \
            file://0001-Set-host_machine-correctly-when-building-with-mingw3.patch \
            file://0001-Do-not-write-bindir-into-pkg-config-files.patch \
+           file://0001-meson-Run-atomics-test-on-clang-as-well.patch \
            "
 
 SRC_URI_append_class-native = " file://relocate-modules.patch"
-- 
2.23.0


