Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C622BCFD301
	for <webhook@archiver.kernel.org>; Sat, 22 Nov 2025 22:14:53 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3756.1763849691975204240
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Nov 2025 14:14:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=BUnxn9Lf;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3436d6aa66dso2079449a91.1
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Nov 2025 14:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1763849691; x=1764454491; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O5w/xsOph5MqaJ52W0khjcqyjUyULQq1fQKx1UlYGAE=;
        b=BUnxn9LfZLaDCntK3Pr4ltkzd5xASkBp42P9doy+5IhFoCwGKeA6aBSST13jErvofN
         mL0wv4jC8nqmjQ9dMiAMmSlHkwaVErT8BeQo49PVQp6bEAC/t20ifXu0SQxrPmnDT3dg
         GKPLue4HJWvgphRADnMG2BoIG/Gf8o+TxzovNG3JDXeqERhh25tGyJfj1XFYpRnnvh8P
         rl8QTX+2+OnqTj8UOWl2eKF7kCyZKuuGrPEumBZZo5Wa0aRKpUzD7MXgIlkyFIjjl+55
         WZrVu8aqH87riAYRHkrUedxWkUAhzMTD/EVZFTK1KdHGhqExLAHuIAq+7PanLnEvA+ym
         1vvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763849691; x=1764454491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O5w/xsOph5MqaJ52W0khjcqyjUyULQq1fQKx1UlYGAE=;
        b=sWcNxyC+yzGeGfDcRSbDJdDUZCPuhzW3gYJSESpQqILCqOgF755JR7vlWV11FTDixA
         gYd2y7+gS5oqzTc7DNFNUq+f1MTWjor0SoI7znnSbCkFO3kJI8s0ndBItk8iP1c8CiK5
         eRa2dfcP17NlHpO8X4MI6kZeqVgMuHfGSR1j4Z7yzdbBvRyrz7nLa50D1CMPIvODAfzv
         0Ov+vm/SMdXVTdfZXI+CBrzepymboGU6jKXZGOVLM6SW3rEgzw9Zxg9wz5rvprKea6bW
         1vKaeFW+NtMpVPOV6iAt2AmCKWBpVg9DPP9yRtd0Uby2tDkk1HUi6eYoGKFEw3jxNrdz
         LPow==
X-Gm-Message-State: AOJu0YyrP0a6QWPG2bahkAv+U0QyA9RM12V30BTb4pGLggVz75aayR0d
	2bp9GQuG2fIyRR1NFTjVDGee61Oy2p0XoMapKgiRcau9DNQ1zHddnrvOYnrsUYTIxLznjGFqvzQ
	DUHFA
X-Gm-Gg: ASbGncunJJbNu79fFHSSK8HDTWaKQGqGTrevs0gXsdNYJRs1EjaP5pKQ/niSV2wQe/m
	UnpqoPIls6eAfKIlm6X4N7iyKQL2U5aQ/jlbcdAMBVrWGk/mdxNbW6QOvyZdlDcBqhMynsaA6Te
	V6lWhVzkM1oCfXkiAf9LJOTYtXswl88xlKEw0v3wY1InPTw/Lh6z7PhRq2TmlbKB3cTH9Kkmjg3
	hekFPGMHXa2MTuZ3GquvRp+QvKR75ZQuGg90FFwMYYVwUIGQqKmyW5MaONSbp7I70eiQMaC8uUf
	Y6Er0+e/3KW9UFVXdQLpEvq4el0QwoRIP8u+kPU4Ankm14ThXWBa7qclJSGF5a6yJnqeW8/eO4G
	+819K7X3HkZoiNo3cdZsImIKr4OPym3VlScMInf83TAuFqYk0jNLozLfkUo4wy8mhWIc7MYctUf
	+niw==
X-Google-Smtp-Source: AGHT+IGBwsF/JP0jrFpxwQc0LEHE6E65H/iAyrGjMw7V2gQLwFvu46lbMJ9F35I1MvilY23nQ6WsyQ==
X-Received: by 2002:a17:90b:33c2:b0:340:68ee:ae5e with SMTP id 98e67ed59e1d1-347331a7cbfmr7047169a91.4.1763849691172;
        Sat, 22 Nov 2025 14:14:51 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:a812:a9e4:3291:bb61])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-345af26d8b1sm7158274a91.3.2025.11.22.14.14.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 14:14:50 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 10/21] rust-target-config: fix nativesdk-libstd-rs build with baremetal
Date: Sat, 22 Nov 2025 14:14:16 -0800
Message-ID: <4c3f321304f2aa8b75cb58699b59fea80a23690c.1763849517.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1763849517.git.steve@sakoman.com>
References: <cover.1763849517.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Nov 2025 22:14:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226708

From: Ovidiu Panait <ovidiu.panait@windriver.com>

If TCLIBC='baremetal' is set in local.conf, nativesdk-libstd-rs build fails
with:

| error[E0412]: cannot find type `c_char` in the crate root
|   --> /usr/src/debug/libstd-rs/1.75.0/rustc-1.75.0-src/vendor/libc/src/unix/mod.rs:56:29
|    |
| 6  | pub type c_schar = i8;
|    | ---------------------- similarly named type alias `c_schar` defined here
| ...
| 56 |         pub gr_name: *mut ::c_char,
|    |                             ^^^^^^

This happens because rust_gen_target() sets os="none" when TCLIBC is
'baremetal' - even for nativesdk targets. However, nativesdk packages are
built against glibc, so the correct 'os' value should be "linux".

Fix this by setting the os field based on {TARGET,HOST,BUILD}_OS variables,
as it is already done in rust_base_triple(), instead of relying on TCLIBC.

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(master rev: 3eaf2cd5647585a1e6df03fc20e2753da27bb692) -- backport
Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/rust-target-config.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classes-recipe/rust-target-config.bbclass
index 1bd7626bd8..31b4bd9afd 100644
--- a/meta/classes-recipe/rust-target-config.bbclass
+++ b/meta/classes-recipe/rust-target-config.bbclass
@@ -329,6 +329,7 @@ def rust_gen_target(d, thing, wd, arch):
     sys = d.getVar('{}_SYS'.format(thing))
     prefix = d.getVar('{}_PREFIX'.format(thing))
     rustsys = d.getVar('RUST_{}_SYS'.format(thing))
+    os = d.getVar('{}_OS'.format(thing))
 
     abi = None
     cpu = "generic"
@@ -368,7 +369,7 @@ def rust_gen_target(d, thing, wd, arch):
     tspec['target-c-int-width'] = d.getVarFlag('TARGET_C_INT_WIDTH', arch_abi)
     tspec['target-endian'] = d.getVarFlag('TARGET_ENDIAN', arch_abi)
     tspec['arch'] = arch_to_rust_target_arch(rust_arch)
-    if "baremetal" in d.getVar('TCLIBC'):
+    if "elf" in os:
         tspec['os'] = "none"
     else:
         tspec['os'] = "linux"
-- 
2.43.0


