Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAC2FC982EB
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 22:08:17 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1591.1789682896783613870
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 15:08:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=sH4YGne+;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6c0fce17so585555e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789682895; x=1790287695; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=H+cvQyfnd75XcDVK1mc4cC9M57/SDsrtPWc2L4OTYNQ=;
        b=sH4YGne+pVgHnwNQORwRNigUbP3q4njoQ7BpPPUyLrG8xSzaqY+5gkmFVk7MvZZKHr
         M8+npkW2soSWjlx9A5qg4fUQdBLA2V3xBzy4BOr3jKg9tDtXC6AojMD288aHGlkanQU3
         /4w0iqsuIvuVv4xLZ9KZg9noEbjYuLs4TcQlk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682895; x=1790287695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=H+cvQyfnd75XcDVK1mc4cC9M57/SDsrtPWc2L4OTYNQ=;
        b=jKtqTBSTZ12uo7Pjr3tJqNYDVhEOG//WGCmTizkr0+m6lT6E9Uxk7IRbdhmGUPAle4
         mVflilcmeXtwaqAKYmOqKzbQxnAAHd1n/+FuAEZZiuNZ3aRurEk4mMfpnfMcuoPzI3/Y
         eafS1YDRdCFR7EM7q+Vvy3o0z3kVzYgFsM3yn6qfyCxb9nE7GyC7+ylyb0rbxDzY13Vq
         2RDv5a5ORs4cBnvvJd2PHp+iANJ/JWH0+Vo6wmeEz1I/Z2Nt8gGXImABFd1XiOqFvrRX
         X+R0no4NbeiDsCGJL4BNsz+2y5d+kZzcG06JJk8ZPnZWzwzu9DVYhA/HBFSBv9x8VMgp
         gdGg==
X-Gm-Message-State: AFuF++kOD8F87vDYW7v4Im+cHH8ZUzIZt3AtVQblUz/Tt+rLYO1LMYco
	IbS6yvYW0NC1Mb7pne9YKS2O2l2n0axepr39HtsGH51iP2IzLBilKxE8cK03dbgA6gUkY0mVTNH
	P7vxRY3U=
X-Gm-Gg: AYBFou3lUQYW84KVBCSm4xv/MFX8iVEyraRjC5pRBusIUQUq6WwcThb3bTET7bZWQ5v
	9RGraPIdbBIX88mK5ABvp4ueEP2hu8LXrkt2Gwr3++DKUx7Kd/OY21ZJ1fTnVHmlfUroppMLUBK
	A8HYzyP3lzX3r3dqqMCe0+SsWoHT8EHLkGEPDS4cg2P5IGUB89F5LyeohR/3ehzemb1TZxb8p30
	9bdqRu7rgB5eXPcFmUJUakDNdxzbvmvlKoZtVgLPbU9CEBFaEPlEc90wSnc7rNDG5hi5eRsiP25
	177oALwtSGi9OtkCEEQzTI15IfOlQf7mvAwZW1b1n5PBR0zrf2HXjR08TPk4Lhd35PlbPD/rleQ
	ulGktZ9t7XQegeB2ydYkuC5cYD5oVcWrY69OvwXjKQHjiCsCR+cWdO7JPg/TZhMHuDc60wwOA7L
	0Ja3nCIgl2tVCanW+dGQjbMYOYs+olAUGKaSKET8DWSMHl6yV4T9aBMBLGrZSgf95BiO68W+Gie
	G67uxm4t6jv9hgA1qXa3X/rbRqFZv+AFfSBlOX6IRGQ+JsS5LyeyQ/1fTq2QDCAyDVgasHILzQ=
X-Received: by 2002:a05:600c:310d:b0:49d:15b9:2a2a with SMTP id 5b1f17b1804b1-49fc5721b9dmr3319005e9.10.1789682895054;
        Thu, 17 Sep 2026 15:08:15 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm8984075e9.0.2026.09.17.15.08.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:08:14 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 48/79] libslirp: upgrade 4.9.1 -> 4.9.3
Date: Fri, 18 Sep 2026 00:06:33 +0200
Message-ID: <3888ddc31d2e2a9ec59d08733a5ddad9a83e2f84.1789681419.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789681419.git.yoann.congal@smile.fr>
References: <cover.1789681419.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 22:08:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246143

From: Alexander Kanavin <alex@linutronix.de>

License-Update: license moved to a separate file
https://gitlab.com/qemu-project/libslirp/-/commit/d6cfac6d060d57c0e38a9c61157eaf6962b6c257

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 16f511425c537239e487b73998f9d8133a8ca2c4)

Full release notes:
* https://gitlab.freedesktop.org/slirp/libslirp/-/blob/v4.9.3/CHANGELOG.md?ref_type=tags

It also shows one "change":
* bootp: allow https for UEFI HTTP boot
It however does not change ABI and can also be interpreted as security
feature (allowing https), thus should be allowed for LTS backport.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../slirp/{libslirp_4.9.1.bb => libslirp_4.9.3.bb}           | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/slirp/{libslirp_4.9.1.bb => libslirp_4.9.3.bb} (70%)

diff --git a/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb b/meta/recipes-connectivity/slirp/libslirp_4.9.3.bb
similarity index 70%
rename from meta/recipes-connectivity/slirp/libslirp_4.9.1.bb
rename to meta/recipes-connectivity/slirp/libslirp_4.9.3.bb
index 50577fd4ae2..734e59a59b1 100644
--- a/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb
+++ b/meta/recipes-connectivity/slirp/libslirp_4.9.3.bb
@@ -2,10 +2,11 @@ SUMMARY = "A general purpose TCP-IP emulator"
 DESCRIPTION = "A general purpose TCP-IP emulator used by virtual machine hypervisors to provide virtual networking services."
 HOMEPAGE = "https://gitlab.freedesktop.org/slirp/libslirp"
 LICENSE = "BSD-3-Clause & MIT"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=bca0186b14e6b05e338e729f106db727"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=f95a9bf4a7e411164fe843697ccda59e \
+                    file://LICENSE;md5=cfea6044642fd63b90ce9d79f5db64d9"
 
 SRC_URI = "git://gitlab.freedesktop.org/slirp/libslirp.git;protocol=https;branch=master"
-SRCREV = "9c744e1e52aa0d9646ed91d789d588696292c21e"
+SRCREV = "dd76415fce457e319d665eb8210d05c5731360ba"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 DEPENDS = "glib-2.0"

