Received: from forward5-smtp.messagingengine.com (forward5-smtp.messagingengine.com [66.111.4.239])
 by mx.groups.io with SMTP id smtpd.web10.5022.1595047218141137889
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2020 21:40:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=CtNwH8tn;
 spf=neutral (domain: iki.fi, ip: 66.111.4.239, mailfrom: tanuk@iki.fi)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
	by mailforward.nyi.internal (Postfix) with ESMTP id 652D6194089D
	for <openembedded-core@lists.openembedded.org>; Sat, 18 Jul 2020 00:40:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Sat, 18 Jul 2020 00:40:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=yDD1GJ7rzNqGw/Cgd
	AYQyF4QPTm6sccur1zl+3K7hLM=; b=CtNwH8tnWWaBfV4Phqjf77y5QgzKmQNq2
	lYGrVq0n4/OUuAongaWpGRgJRSvMExFWhPFeP/Hi8SPVh6xn5UNr1Cu8r6ac1OLV
	JEoqDfb+sGw0uTvV2AGQAjF+xlar8rXEb3CcUh1NCRdPCqp26f7Bx247nNhyJSGH
	jEBXOnPQmSJ35FBtqmXjvhbme4Udv7PYpNoQxxTQ2ku4yhsW4KnbIQ9Iw4V3WuU0
	er0kQy8s6UsiQ1RQuqhGKPWjpgkNu25sGpCtcizRlJveKsy6iw+Chobx79NsAO73
	F040tKW0pE56gkpwCx7Vj/hf50bPT8AOln6IuTqvct+pJfY27pSNw==
X-ME-Sender: <xms:MH0SX9BdrrVcfbIRIeSU0yE-_5SHYViXSV_MefNurTQD1c0CKVQFHg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrfeekgdekkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
    dtnecuhfhrohhmpefvrghnuhcumfgrshhkihhnvghnuceothgrnhhukhesihhkihdrfhhi
    qeenucggtffrrghtthgvrhhnpeeuheefffetgfffhfdvheejudekgffhheeigfehvdelhe
    efieevgeekgeefveehkeenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhg
    pdhfrhgvvgguvghskhhtohhprdhorhhgnecukfhppeekvddruddtvddrvddtrddujeelne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepthgrnhhu
    khesihhkihdrfhhi
X-ME-Proxy: <xmx:MH0SX7jtPCfJ40g1NSMqVSRGWDfVITWy0UaS_QYOEB2YekqnWvEYeQ>
    <xmx:MH0SX4nfhB_zhwg-tcg68-1MyGA_5Ne2Cy_9RNkqKTMeSnG2MZXttA>
    <xmx:MH0SX3yvl_FDPWBnmlBayQOh33So0KXG0nZwgh-g8aLS8c59ZCHwKw>
    <xmx:MX0SXwBWri2s6vJBzuueDojmAXyTMmLgn9PNAMGVVlAc1ZWnBcjhcg>
Received: from localhost.localdomain (unknown [82.102.20.179])
	by mail.messagingengine.com (Postfix) with ESMTPA id 7F6DB328005E
	for <openembedded-core@lists.openembedded.org>; Sat, 18 Jul 2020 00:40:16 -0400 (EDT)
From: "Tanu Kaskinen" <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] pulseaudio: improve the Thumb frame pointer fix
Date: Sat, 18 Jul 2020 07:40:10 +0300
Message-Id: <20200718044010.13546-1-tanuk@iki.fi>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

By changing the register that PulseAudio uses in its asm code makes it
unnecessary to care whether frame pointers are enabled or not.

This fix was suggested by Andre McCurdy.

Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
---
 .../pulseaudio/pulseaudio.inc                 |  8 ---
 ..._neon-use-register-r12-instead-of-r7.patch | 49 +++++++++++++++++++
 .../pulseaudio/pulseaudio_13.0.bb             |  1 +
 3 files changed, 50 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0001-remap_neon-use-register-r12-instead-of-r7.patch

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index c7f3e67022..4e32b27087 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -63,14 +63,6 @@ DEPENDS += "speexdsp libxml-parser-perl-native libcap"
 
 inherit autotools bash-completion pkgconfig useradd gettext perlnative systemd manpages gsettings
 
-# When compiling for Thumb or Thumb2, frame pointers _must_ be disabled since the
-# Thumb frame pointer in r7 clashes with pulseaudio's use of inline asm to make syscalls
-# (where r7 is used for the syscall NR). In most cases, frame pointers will be
-# disabled automatically due to the optimisation level, but append an explicit
-# -fomit-frame-pointer to handle cases where optimisation is set to -O0 or frame
-# pointers have been enabled by -fno-omit-frame-pointer earlier in CFLAGS, etc.
-CFLAGS_append_arm = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
-
 # *.desktop rules wont be generated during configure and build will fail
 # if using --disable-nls
 USE_NLS = "yes"
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-remap_neon-use-register-r12-instead-of-r7.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-remap_neon-use-register-r12-instead-of-r7.patch
new file mode 100644
index 0000000000..53a765a4c8
--- /dev/null
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-remap_neon-use-register-r12-instead-of-r7.patch
@@ -0,0 +1,49 @@
+From 4a1668f341f0228904105f77fe5871b9d59b2663 Mon Sep 17 00:00:00 2001
+From: Tanu Kaskinen <tanuk@iki.fi>
+Date: Mon, 13 Jul 2020 12:42:14 +0300
+Subject: [PATCH] remap_neon: use register r12 instead of r7
+
+When the Thumb instructions set is used and frame pointers are enabled
+(-fno-omit-frame-pointer), r7 can't be used, because it's used for the
+frame pointer. Trying to use r7 caused the compilation to fail.
+
+Thanks to Andre McCurdy for suggesting[1] this fix, all I had to do was to
+test that it works. The code builds now, and cpu-remap-test also
+succeeds.
+
+[1] https://lists.openembedded.org/g/openembedded-core/message/136786
+
+Upstream-Status: Submitted
+[https://gitlab.freedesktop.org/pulseaudio/pulseaudio/-/merge_requests/324]
+
+Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
+---
+ src/pulsecore/remap_neon.c | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/src/pulsecore/remap_neon.c b/src/pulsecore/remap_neon.c
+index ca3b95b48..6f71345f8 100644
+--- a/src/pulsecore/remap_neon.c
++++ b/src/pulsecore/remap_neon.c
+@@ -52,11 +52,15 @@ static void remap_mono_to_stereo_float32ne_generic_arm(pa_remap_t *m, float *dst
+         __asm__ __volatile__ (
+             "ldm        %[src]!, {r4,r6}        \n\t"
+             "mov        r5, r4                  \n\t"
+-            "mov        r7, r6                  \n\t"
+-            "stm        %[dst]!, {r4-r7}        \n\t"
++
++            /* We use r12 instead of r7 here, because r7 is reserved for the
++             * frame pointer when using Thumb. */
++            "mov        r12, r6                 \n\t"
++
++            "stm        %[dst]!, {r4-r6,r12}    \n\t"
+             : [dst] "+r" (dst), [src] "+r" (src) /* output operands */
+             : /* input operands */
+-            : "memory", "r4", "r5", "r6", "r7" /* clobber list */
++            : "memory", "r4", "r5", "r6", "r12" /* clobber list */
+         );
+     }
+ 
+-- 
+2.20.1
+
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_13.0.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_13.0.bb
index d2f201d06e..53e9a2357d 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_13.0.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_13.0.bb
@@ -4,6 +4,7 @@ SRC_URI = "http://freedesktop.org/software/pulseaudio/releases/${BP}.tar.xz \
            file://0001-client-conf-Add-allow-autospawn-for-root.patch \
            file://0002-do-not-display-CLFAGS-to-improve-reproducibility-bui.patch \
            file://0001-remap-arm-Adjust-inline-asm-constraints.patch \
+           file://0001-remap_neon-use-register-r12-instead-of-r7.patch \
            file://volatiles.04_pulse \
            "
 SRC_URI[md5sum] = "e41d606f90254ed45c90520faf83d95c"
-- 
2.20.1

