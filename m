Return-Path: <joaohf@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D4F7CCF9F8
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 18:14:55 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.190.1762193685508199058
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 10:14:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KZBoUhOh;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: joaohf@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7aa3d98838aso124268b3a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 10:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762193684; x=1762798484; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IIVKSsGDZbO3W8k59MHOf1bPlfTnp+MojG24gU+3uBE=;
        b=KZBoUhOhlZPhQuXgyOx9TYCIzvYUK7p1z6ZLQIeO7eKRsqWlROOmdSAgxjylpZ5I7X
         SWW7DdXazC3d/67xYRkSooRif8MZTcVNHOtDX1eJIH1eIolQTMf71iiYH5HqmbxCo1Vm
         Lav8SXv8dIZF35rYVkOBe5kzt0fIwIZtIDRIepEPhm8v6no8olNIZpP7hBEooz3Ys1ru
         vVogJOKUZd8g8nphV4QmUN+8lVGislSWDJwobxrwUSr/TyJ6ei+SfLRXCsasLcHkjuSB
         bsU82rRtxLNED3UYS3pNyFl3DIvoTSRAtYW4jt+Y3RDt0w1dMejpczubhrn5344rXeqv
         FPHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762193684; x=1762798484;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IIVKSsGDZbO3W8k59MHOf1bPlfTnp+MojG24gU+3uBE=;
        b=iFkuB2na2T3Xgwp+TUGBrwnMWBGXrRE2J5iibw61Ce0oF2EtJz2Z3DSxgyaBrX+tzB
         7KhkEy5lkdTEbAU8+p7FoYNUdJU/dTrhmBK+A1bX2D/GZUluw9ue0C75E+QCO4ZnKM+Q
         bVdzbHKcL5+KotbTVtpwk7rCTnEl52o3/VB4uUupb49RVIR8PL6DwEpiBFoSkQFFp0JH
         gD5Mv9L3fz8JWL/+thgtA1MdI9xb7nw9w4ZQ3HkB8cafZIBr8Onsm0vZ2iNSzcjLLdlT
         4d1KOCSo2qRyHnvokBPmH7Y2p3LEbD7kMdoQpVmf+jfrYVOSBFlFv+yKP7DYcMD7wy+U
         ORAg==
X-Gm-Message-State: AOJu0YzDw4DqhAlptUsXmtaueWrQ4W2WWnfyIpdHk5916+PmJHpg03cx
	gP8pQdnI2MVLPWiV9HshQY66Sz0Rt5RT/jxq2bJRThmvg8g4CBOz0BY6DkFidUmM
X-Gm-Gg: ASbGncuo7aLlXQ3Rv7Xe/uvx1gWVMEoXlYbCGwkdpkVXkrDlcU8MqwbX5h5TZaAxrus
	xxinXx3oNpuyAY/Ln2AUY/+whWB/Aqan/XMVdCNPavA9VzdiiAf+7rjXtez6a1GHTJUP7qMPrpR
	qNXS+I0X+KVt+4108te6XeXp5VzTKJCXz5+b4mulCHo3zSbJykv7K7mDQykmBsIb8wk0xHng5NB
	f66zNxx9q3NjmFtCHaZ/7ro/lKXPLZznNS9wMdKoLuwXFsXDHY3mRWgEZj64+sI18GtRyl2ek0T
	TaxO/2jjaPfAiLDN+ZdaXr9LuTvrSxtPyBkbjvmFBbAYyhcstBchOlVqvvoheBg1qM7+c6L9JCQ
	7eLwE5sUd3H1q4QWOgdIJnpgnOA2Xfhb3RmkCQdIIwfDWVW5Su/YvlGx/tPvVhxsG3p0ko4hSGu
	hP314+PoY2u+I=
X-Google-Smtp-Source: AGHT+IGfdTD358+iLXS9q3vDEeUBOepxt06UVknC8BApSMlMJ63CrEoYHnLB/KHNgxDysW76X7CUyw==
X-Received: by 2002:a05:6a00:39a0:b0:77e:ec80:b3d0 with SMTP id d2e1a72fcca58-7a7797c305emr9184283b3a.3.1762193684398;
        Mon, 03 Nov 2025 10:14:44 -0800 (PST)
Received: from porco.. ([177.188.211.85])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7acd3247ef3sm45308b3a.11.2025.11.03.10.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 10:14:43 -0800 (PST)
From: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?= <joaohf@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?= <joaohf@gmail.com>,
	Jose Quaresma <quaresma.jose@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3] readline: backport a patch to fix for caller setting rl_prompt to NULL
Date: Mon,  3 Nov 2025 15:14:09 -0300
Message-ID: <20251103181409.3191690-1-joaohf@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 18:14:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225687

I've observed this issue affecting iwctl and connmanctl.

Patching readline solves the issue.

The original patch from [5] mixes many fixes in one commit. I've extract
only what matters to solve the issues observed with connman and iwd. The
final patch is the same patch sent by readline author to readline's mail list [6].

References:

1: https://gitlab.archlinux.org/archlinux/packaging/packages/readline/-/issues/1
2: https://gitlab.archlinux.org/archlinux/packaging/packages/readline/-/commit/b30636dc66fc783a091af51b049dc5240f861dd0
3: https://lists.gnu.org/archive/html/bug-readline/2025-07/msg00007.html
4: https://lore.kernel.org/connman/20251018212411.181909-1-jsbronder@cold-front.org/
5: https://cgit.git.savannah.gnu.org/cgit/readline.git/commit/display.c?h=devel&id=488d7edc22894d30b6de7f2d4190bf7403f63ffd
6: https://lists.gnu.org/archive/html/bug-readline/2025-07/txtmA7rksnmmi.txt

Fixes [YOCTO #16047]

CC: Jose Quaresma <quaresma.jose@gmail.com>
CC: Khem Raj <raj.khem@gmail.com>
CC  Paul Barker <paul@pbarker.dev>
Signed-off-by: João Henrique Ferreira de Freitas <joaohf@gmail.com>
---

Notes:
    changes in v3:
    - remove unnecessary whitespace change
    - keep notes for readline patch

 ...for-caller-setting-rl_prompt-to-NULL.patch | 40 +++++++++++++++++++
 meta/recipes-core/readline/readline_8.3.bb    |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-core/readline/readline/fix-for-caller-setting-rl_prompt-to-NULL.patch

diff --git a/meta/recipes-core/readline/readline/fix-for-caller-setting-rl_prompt-to-NULL.patch b/meta/recipes-core/readline/readline/fix-for-caller-setting-rl_prompt-to-NULL.patch
new file mode 100644
index 0000000000..a23e2f3bce
--- /dev/null
+++ b/meta/recipes-core/readline/readline/fix-for-caller-setting-rl_prompt-to-NULL.patch
@@ -0,0 +1,40 @@
+From a0a4c011c0c5e598c5b51cbf81d3b4501fa72e0c Mon Sep 17 00:00:00 2001
+From: Chet Ramey <chet.ramey@case.edu>
+Date: Thu, 30 Oct 2025 14:19:41 -0300
+Subject: [PATCH] fix for caller setting rl_prompt to NULL
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The original patch came from [1, 2] and it has been integrated into
+readline git repository, commit (488d7edc22894d30b6de7f2d4190bf7403f63ffd)
+
+This patch has only the fix needed to solve the follow issues [3,4].
+
+I added the original author as this patch has been sent through readline mail
+list.
+    
+1: https://lists.gnu.org/archive/html/bug-readline/2025-07/msg00007.html
+2: https://lists.gnu.org/archive/html/bug-readline/2025-07/txtmA7rksnmmi.txt
+3: https://lore.kernel.org/connman/20251018212411.181909-1-jsbronder@cold-front.org/
+4: https://gitlab.archlinux.org/archlinux/packaging/packages/readline/-/issues/1
+
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/readline.git/commit/display.c?h=devel&id=488d7edc22894d30b6de7f2d4190bf7403f63ffd]
+Signed-off-by: João Henrique Ferreira de Freitas <joaohf@gmail.com>
+---
+ display.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/display.c b/display.c
+index 9aa8c7b..edb525d 100644
+--- a/display.c
++++ b/display.c
+@@ -783,7 +783,7 @@ _rl_optimize_redisplay (void)
+ 
+ /* Useful shorthand used by rl_redisplay, update_line, rl_move_cursor_relative */
+ #define INVIS_FIRST()	(local_prompt_invis_chars[0])
+-#define WRAP_OFFSET(line, offset)  ((line <= prompt_last_screen_line) ? local_prompt_invis_chars[line] : 0)
++#define WRAP_OFFSET(line, offset)  ((line <= prompt_last_screen_line && local_prompt_invis_chars) ? local_prompt_invis_chars[line] : 0)
+ 
+ #define W_OFFSET(line, offset) ((line) == 0 ? offset : 0)
+ #define VIS_LLEN(l)	((l) > _rl_vis_botlin ? 0 : (vis_lbreaks[l+1] - vis_lbreaks[l]))
diff --git a/meta/recipes-core/readline/readline_8.3.bb b/meta/recipes-core/readline/readline_8.3.bb
index a2f23eb353..b425b78e1f 100644
--- a/meta/recipes-core/readline/readline_8.3.bb
+++ b/meta/recipes-core/readline/readline_8.3.bb
@@ -2,6 +2,7 @@ require readline.inc
 
 SRC_URI += "file://norpath.patch \
             file://fix-for-readline-event-hook.patch \
+            file://fix-for-caller-setting-rl_prompt-to-NULL.patch \
             "
 
 SRC_URI[archive.sha256sum] = "fe5383204467828cd495ee8d1d3c037a7eba1389c22bc6a041f627976f9061cc"

