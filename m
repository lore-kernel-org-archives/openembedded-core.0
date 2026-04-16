Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DBBCFA0C5E
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 06:48:21 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7569.1776322099793783901
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 23:48:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=STr9bOYR;
 spf=pass (domain: smile.fr, ip: 209.85.128.68, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-488a29e6110so80097255e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 23:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776322098; x=1776926898; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jRCl0tVwqYErBK7HJ84GPbGXwrPXvclOxp+FY6afpe0=;
        b=STr9bOYRTSHNsiz5SofIkpbS+cPVrOnZiB38b1VGb4vMJHdliw4G4RYDVs63Vr4ctS
         hWmz1BLzOb3t/xnfkzF/Wp1LB6fQbhIwzxFfidMhxkUZhxJUXd6786Anyz1RaIrg8GP1
         AZg5nqC3bchsqAZg2r3NejqQzmfmHUzP5VR2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776322098; x=1776926898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jRCl0tVwqYErBK7HJ84GPbGXwrPXvclOxp+FY6afpe0=;
        b=Njcc3I9ZycFn8tZ/GTCUwu8hI7Jn/mLuv8lyTdegfnMiBZ0DdFZMaPLdJV/s5E3YJM
         dz1v8KiM48v9M/VsySFDI+7AlBLR9DHJzzTaKbmF0KBgKGJyLdIl4u7JCLcAY0oKpD4Y
         Ku1MqxlDbW5mUKL/j/389NN4pa5ybvl3MNQMi9bLckScyit2ewabbX3g8pG2DCEn0r5S
         +SO2dw+ojjQYmRt2mDXUmLMp6NfE+FKNJ51TYABr90eGZ9HaLAzJwCYZupjCrGIc/+FP
         zJyAGHQ2XSS1n2lOPKaCtdiOpUbB0Onj/9ckyRxEUiaPheF+0ZnJI3yTXxNxi1AzrL3a
         VfMA==
X-Gm-Message-State: AOJu0YycqnkpIiuy7XLH3VWoHjO+eu6sVwra1fOnhzfyGCP/HwDMmIDb
	dxUSKvp8Sq9wvHw56IBd+5amAmfSSGsDoMd3FuD4ZjnCShrDH7T1LwhcsduRTTzomN4KvuJ490t
	X38lbtavH2WIi
X-Gm-Gg: AeBDietQKKaDXBBXaLGLI3ojNgm8K4OvSA39xxI1OSeTY61pr1BDCoqRlFtttKTkpHR
	jjT0MQApT8pjZj7dVUIEVnMrCAcNNY/6cUjtqYYLZX/GEaZlWTJysytY5rx/UvXpAR/dV+M+tEM
	UjAxgFLAKTCWo3LY6OoNP9YBUBgu9m8LfUy0OoujKArTAB1TePnIYf+sglILsQPP5RX5mh7UGcc
	0pWPdOOL6b6I3QmiBPkX9YuBUls2JwGAWmad+AuMeEL0hgjE4rlh3bJWmKvvHVteKUUNiSFwGD0
	V77WH5AMlJmWuXT3ukbIe/E2EP+EAHWO4xHjDX3BkSrnQb13ospjS/wE3lZDdiUVn2sn9xPNbu1
	0Zg1yQbzPRUn9UHHBax+B3EdRKGc6GfShdcj7+3rdMIm3LYRp4J4cuMXaJJA5VX76UkSb7wuBvk
	KWlYXTY01Jdwhsp3PAwWAP1yyLzffxItxhBpAL+TdNQ8NSn+5y/klPkbguG75d3kZM3T1rbCy5C
	RZocgyZadK25yyQpE2AJ1BY0+ScieIXW2iOMA==
X-Received: by 2002:a05:600c:4f56:b0:480:690e:f14a with SMTP id 5b1f17b1804b1-488d68765fcmr365878595e9.14.1776322097649;
        Wed, 15 Apr 2026 23:48:17 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead3d5ea9sm11200017f8f.21.2026.04.15.23.48.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 23:48:17 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 01/47] binutils: mark CVE-2025-69650 and CVE-2025-69651 as disputed
Date: Thu, 16 Apr 2026 08:47:02 +0200
Message-ID: <8c5819cb2464d5dcc5c0812ae1d8c2f1e0db6866.1776321810.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776321810.git.yoann.congal@smile.fr>
References: <cover.1776321810.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 06:48:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235344

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

Both CVEs are disputed by third parties. The observed behavior
(double free / invalid pointer free in readelf) only occurred in
pre-release code and did not affect any tagged version [1][2].

CVE_STATUS[CVE-2025-69650] = "disputed: observed behavior only in pre-release code, does not affect any tagged version"
CVE_STATUS[CVE-2025-69651] = "disputed: observed behavior only in pre-release code, does not affect any tagged version"

[1] https://www.cve.org/CVERecord?id=CVE-2025-69650
[2] https://www.cve.org/CVERecord?id=CVE-2025-69651

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
(cherry picked from commit 9c6df56fe18237880c391798c2083dca595566f4)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/binutils/binutils-2.45.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/binutils/binutils-2.45.inc b/meta/recipes-devtools/binutils/binutils-2.45.inc
index 16a63cabc5b..5cd4d185ac1 100644
--- a/meta/recipes-devtools/binutils/binutils-2.45.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.45.inc
@@ -20,6 +20,8 @@ UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
 CVE_STATUS[CVE-2025-7545] = "cpe-stable-backport: fix available in used git hash"
 CVE_STATUS[CVE-2025-7546] = "cpe-stable-backport: fix available in used git hash"
+CVE_STATUS[CVE-2025-69650] = "disputed: observed behavior only in pre-release code, does not affect any tagged version"
+CVE_STATUS[CVE-2025-69651] = "disputed: observed behavior only in pre-release code, does not affect any tagged version"
 
 SRCREV ?= "2f028c6bb163a045db95439fb92e1dcbc919413c"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=https"

