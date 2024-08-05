Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE7D7C3DA4A
	for <webhook@archiver.kernel.org>; Mon,  5 Aug 2024 15:04:27 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.10159.1722870262849584719
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Aug 2024 08:04:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ou+aiXE8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3684407b2deso5689601f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Aug 2024 08:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1722870261; x=1723475061; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=1i/Nejpm3oy6BMOXcJzFPPELWwa39F/YBfqKBCSXNvk=;
        b=Ou+aiXE8XUwOvE+9hqNvANBBRRzW28zNzGSR8iOwRsp0sA0D8TFkOfFQkOZ5Evsjie
         vt8hmwT6osE4W+tUID7ytAKAyr8iLapgGFIyh7qIiMUIyj5bMcICdN92GVcZ0w8V48Ot
         woCwMVmtuVm3XY6ZzFTLCT2BbzZ2F6R7EXhDc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722870261; x=1723475061;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1i/Nejpm3oy6BMOXcJzFPPELWwa39F/YBfqKBCSXNvk=;
        b=NoFxMlLNs5bIoKH8VJnWU8e9Qdl9MP/Fgl+4DP5tRTHnb37C9ndZsBbBXXxD87aj2U
         BS1aFRH3uZLbzebqK+NbdH5eVGns4lQ8N1i9GPzQ3AifwheFrGhjdUN+iDE3nNj/utgP
         T6Ip6DaPui1jQjTheyCStGaA603CyiP1S0JoWwPM+C82vYGxRVQBo6yX9cYPA5m6sS4L
         JD4q5OTDXy6maDgOTNbesG4Dp0Ftt1nf2XyFnNBXs0lekNbHmtCOTuiH/Qvq1kzYzRYb
         iLHBt6f21V/sWvFh3mnPIDdHYSWfSNOPfElyoJFw4S0sEvd6TDb/KMS3Yts5ICPXns1w
         5Dtg==
X-Gm-Message-State: AOJu0Yy1YGyo2BmER0mINnoElokQ2sB5PedXhN1ACf36zIsuwDFbYuuB
	SJigCJGCaPWd6ye9dH98YP+qhIWspt6iBmrCdP/bQoraUTa0ia3upOsHvl2VIY4e2lYb/VVGl7/
	R9zI=
X-Google-Smtp-Source: AGHT+IHqcWu9NUSHHua6v1mQrM0x5+rY3D7zIxwtuqhnND/kTIWB/0GPALeM6o6ZxTLb+nqtEIFyGQ==
X-Received: by 2002:a5d:6d49:0:b0:368:36e6:b248 with SMTP id ffacd0b85a97d-36bbc0cc71cmr8952706f8f.23.1722870260585;
        Mon, 05 Aug 2024 08:04:20 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:e8f5:87f4:f4e7:7ee7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36bbd059e60sm10175378f8f.82.2024.08.05.08.04.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 08:04:20 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] pixman: Backport fix for recent binutils
Date: Mon,  5 Aug 2024 16:04:19 +0100
Message-ID: <20240805150419.1919043-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Aug 2024 15:04:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202996

With recent binutils, we see a compile failure. Backport the patch for this
from upstream.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...6ce00bb79a6b925ed4c2c436e1533e4472aa.patch | 103 ++++++++++++++++++
 .../xorg-lib/pixman_0.42.2.bb                 |   1 +
 2 files changed, 104 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/pixman/865e6ce00bb79a6b925ed4c2c436e1533e4472aa.patch

diff --git a/meta/recipes-graphics/xorg-lib/pixman/865e6ce00bb79a6b925ed4c2c436e1533e4472aa.patch b/meta/recipes-graphics/xorg-lib/pixman/865e6ce00bb79a6b925ed4c2c436e1533e4472aa.patch
new file mode 100644
index 00000000000..b5ed0f73c52
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/pixman/865e6ce00bb79a6b925ed4c2c436e1533e4472aa.patch
@@ -0,0 +1,103 @@
+From 865e6ce00bb79a6b925ed4c2c436e1533e4472aa Mon Sep 17 00:00:00 2001
+From: Mike Hommey <mh@glandium.org>
+Date: Fri, 12 Jul 2024 11:11:17 -0400
+Subject: [PATCH] pixman: Adjust arm assembly for binutils change
+
+A change in the latest version of binutils broke building pixman for arm.
+
+The binutils change:
+https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=226749d5a6ff0d5c607d6428d6c81e1e7e7a994b
+
+Closes: https://gitlab.freedesktop.org/pixman/pixman/-/issues/96
+---
+ pixman/pixman-arm-simd-asm.S | 44 ++++++++++++++++++------------------
+ 1 file changed, 22 insertions(+), 22 deletions(-)
+
+Upstream-Status: Backport [865e6ce00bb79a6b925ed4c2c436e1533e4472aa]
+
+Index: pixman-0.42.2/pixman/pixman-arm-simd-asm.S
+===================================================================
+--- pixman-0.42.2.orig/pixman/pixman-arm-simd-asm.S
++++ pixman-0.42.2/pixman/pixman-arm-simd-asm.S
+@@ -818,13 +818,13 @@ generate_composite_function \
+ .macro over_white_8888_8888_ca_1pixel_tail
+         mvn     TMP0, WK1
+         teq     WK1, WK1, asr #32
+-        bne     01f
+-        bcc     03f
++        bne     1f
++        bcc     3f
+         mov     WK3, WK1
+-        b       02f
+-01:     over_white_8888_8888_ca_combine WK1, WK3
+-02:     pixst   , 4, 3, DST
+-03:
++        b       2f
++1:      over_white_8888_8888_ca_combine WK1, WK3
++2:      pixst   , 4, 3, DST
++3:
+ .endm
+ 
+ .macro over_white_8888_8888_ca_2pixels_head
+@@ -835,21 +835,21 @@ generate_composite_function \
+         pixld   , 8, 3, DST
+         mvn     TMP0, WK1
+         teq     WK1, WK1, asr #32
+-        bne     01f
++        bne     1f
+         movcs   WK3, WK1
+-        bcs     02f
++        bcs     2f
+         teq     WK2, #0
+-        beq     05f
+-        b       02f
+-01:     over_white_8888_8888_ca_combine WK1, WK3
+-02:     mvn     TMP0, WK2
++        beq     5f
++        b       2f
++1:      over_white_8888_8888_ca_combine WK1, WK3
++2:      mvn     TMP0, WK2
+         teq     WK2, WK2, asr #32
+-        bne     03f
++        bne     3f
+         movcs   WK4, WK2
+-        b       04f
+-03:     over_white_8888_8888_ca_combine WK2, WK4
+-04:     pixst   , 8, 3, DST
+-05:
++        b       4f
++3:      over_white_8888_8888_ca_combine WK2, WK4
++4:      pixst   , 8, 3, DST
++5:
+ .endm
+ 
+ .macro over_white_8888_8888_ca_process_head  cond, numbytes, firstreg, unaligned_src, unaligned_mask, preload
+@@ -1065,9 +1065,9 @@ generate_composite_function \
+   .if offset != 0
+         ldrb    ORIG_W, [SRC, #offset]
+   .endif
+-        beq     01f
++        beq     1f
+         teq     STRIDE_M, #0xFF
+-        beq     02f
++        beq     2f
+  .endif
+         uxtb16  SCRATCH, d                 /* rb_dest */
+         uxtb16  d, d, ror #8               /* ag_dest */
+@@ -1077,13 +1077,13 @@ generate_composite_function \
+         uxtab16 d, d, d, ror #8
+         mov     SCRATCH, SCRATCH, ror #8
+         sel     d, SCRATCH, d
+-        b       02f
++        b       2f
+  .if offset == 0
+ 48:     /* Last mov d,#0 of the set - used as part of shortcut for
+          * source values all 0 */
+  .endif
+-01:     mov     d, #0
+-02:
++1:     mov     d, #0
++2:
+ .endm
+ 
+ .macro in_reverse_8888_8888_tail  numbytes, reg1, reg2, reg3, reg4
diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb b/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb
index 3c55c1705a6..4be72665f96 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb
@@ -10,6 +10,7 @@ DEPENDS = "zlib"
 SRC_URI = "https://www.cairographics.org/releases/${BP}.tar.gz \
            file://0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch \
            file://0001-pixman-combine-float.c-fix-inlining-failed-in-call-t.patch \
+           file://865e6ce00bb79a6b925ed4c2c436e1533e4472aa.patch \
            "
 SRC_URI[sha256sum] = "ea1480efada2fd948bc75366f7c349e1c96d3297d09a3fe62626e38e234a625e"
 

