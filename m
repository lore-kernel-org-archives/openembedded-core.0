Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91106CD98F8
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 18:33:12 +0000 (UTC)
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48973.1781893985981130293
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2026 11:33:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=hQCWo0zg;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=Atca89Lg;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.146, mailfrom: paul@pbarker.dev)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 805971D0008F
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 14:33:05 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Fri, 19 Jun 2026 14:33:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781893985;
	 x=1781980385; bh=fe+SLPQ3fvkL0FtIbSRPkTrmAnXeabXRGnFV9+zsjPM=; b=
	hQCWo0zgNCRtDzCuJdpFXGcVwYiP1bApEs/lrt7kP91nKZlugO207nZVkit6/ik+
	ETp5lZr+SgAYzwFtQiXU08EW3qKSSbVmrUyC/c5ZuRflMt2G27/fBYBJLm+WtnyT
	vE9kO9BB3keiVWBwKxtWPQYIQkIdU+7TTgsE8IPcV+MlJ98r1WaqKgngZpc2t4mg
	Y6GHZbnF3KyI7x2oBJMcCbCoeYolq5BGEHPKr22I5I0nyTw0ZxEaHEgnQH6OhiRX
	2Hsv2vUgCcdRQ0PruI0G7TF7b++64nYbL+wnKZsLeBllCMm0JSh5hYe5qoTa3JSo
	PFohgGoYt9MyU9NHfCVqMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1781893985; x=1781980385; bh=f
	e+SLPQ3fvkL0FtIbSRPkTrmAnXeabXRGnFV9+zsjPM=; b=Atca89Lggjy12PF2B
	4WF9nv9RCzHcjJDGe0/F4ohUYOmPdeHbrXt8FBIS2msODT3sijvyBmEc5QKqXmya
	lzaYFVOHXquTQP6vaMDsS9ApUr3SkjQ4b91yOCEiMizxcAkkRl7/3/4d1JkSA4eC
	Jfao8JjdpSLQ1WmPPH+n8a3R3dchEbVtSmkE3HudJSbedg/hdG6nn6egeYuGproc
	snahYonTv8huLgoa0iZZTXW8Qh4mGzIrZUWFRPC/EpeqQhFtdL8UvpvRW20fkr0Z
	exQZRzh7KaTU4v7u6HnsBQrKi++NZkphHLrA5yp4Y3UR7GLV2CDI9JK9MG+eTl0L
	xJKJQ==
X-ME-Sender: <xms:YYs1ajnErcD_Bm6VK6tuMc-VATCFaU3vnU_SzhwbFfZFFVJP5ZNXQg>
    <xme:YYs1atzWcyFOXMXlReW6mybOVwCcNwO8sKRLvWrHp1nLjtSfK_Stn7WknJgI9Rk8C
    UAmv9AAPJX_51gJXj5DASoBMluqCW1GALt2UxZ5B9btwyAtz6xGPpM>
X-ME-Received: <xmr:YYs1avSOTqhoIuUNnTB_pJJLhA-b8PRwxgxYsnKegcefbNd9exOhLnb_5iyXaQEmUbLiVPWcFQzmGnbtlIICEaZFAny05cE>
X-ME-Proxy-Cause: dmFkZTGOTUup33GWndBNxYHdkITC7sR52X/72Kv0cyy7AsI2eNVF7y77D9ZS3AjDlImbmh
    SgQniPzdwcqS2xWzTRrRCkOhKVOD/mceDEbIyixSx1dSbAFBzc2Sj3LmD/IkuSQZtxQ2lj
    bC8Y86hRQ/2T5UVDuioAAp6IxTIn3uvML8kTIv9gXvIwdVvbiFczdXRbS5GacmCH7f9y2L
    S2x/3LBWrQYIdfNF/alFTN57n1O8rZQgib0gfwjS5WOS2tAGMzxmIQy/9p14+73a61MjhJ
    TqTeMpwtoeFgtf2Pabd2uk67zpjd8svHFpHkG+bt4hpyuFwtAZiVtg532KZLlFIJkf85mY
    2DSosIBN+tl9U858GufJMr5D8CnIxhlLRGda2VBSCoovU/tV/IwfuZpjOuI8Lr1kQuNphO
    m3SIGt58x/fAfAzTwOqibqvST5fQ026Ptk5QvoRxf2m6DrXbMdCRUpbyBV9MDz9TKXLXY8
    yK7DehXOyMyx5ly3NHcsmU0lzPBbJHbw5AHzA2Wqdhxty7WLG4knQqs5HHb0cLHxYXk5KB
    ZUnMpgkYq5w96g7MMoZEPMKq6G2KvBEbrnCe1jJD+1owtgH22J8PBw2YNvADDsCcjQRjFK
    vI9+iiVrMfw6BisHPz2IBu8YAiHdLHrK4yOEY057QUm/K0i2XXJjJs0Vtpyw
X-ME-Proxy: <xmx:YYs1aguXRwfndbM3HnXnXtiXaWkGv55tOUsC14i-kaKs1D6jMwhX-w>
    <xmx:YYs1ahsneNSlrIAxwLhyiGwNiIgcx7HTw_dONoDuU58DweVztLNG_Q>
    <xmx:YYs1amzV2aKcFImROPGMMKcqknXrcoMVcuL8QlgH5FlPooHT8YurFQ>
    <xmx:YYs1anjwDYMS3xCtmh8HlBbrYD6Ci1-X2Y-Z_J4qq6Jk90M8nsIk5w>
    <xmx:YYs1ahHb_hG-9UhTM2-qvo_JvA7fFb6CnmnxaxTEnnqrAC7f2XEK85y3>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openembedded-core@lists.openembedded.org>; Fri,
 19 Jun 2026 14:33:04 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Fri, 19 Jun 2026 19:32:23 +0100
Subject: [PATCH 5/5] ffmpeg: upgrade 8.1.1 -> 8.1.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260619-auh-v1-5-62299dbd8231@pbarker.dev>
References: <20260619-auh-v1-0-62299dbd8231@pbarker.dev>
In-Reply-To: <20260619-auh-v1-0-62299dbd8231@pbarker.dev>
To: openembedded-core@lists.openembedded.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3329; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=a9CVit8vu1yDxf1z10h+U+1dVjPQ8t75x5cmvK/jYYk=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWSZdse0b5e+vPAG07fGeE322FPs1R2Ou2IWsf5ZyFZpw
 6u370BlRykLgxgXg6yYIsvmnq/3n/Y68maE3FKAmcPKBDKEgYtTACbyVpuRYfe/jTsuvOWWZlKr
 af/D0NO46prK0ee6KY++bJw1aZfICUdGhmanNjcG67mr2m+ZMt1LvcK+vNxSMpMvyzrSk+uwCHc
 SOwA=
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 18:33:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239189

- Various fixes for out-of-bounds accesses, buffer overflows, integer
  overflows, SIGFPE, use-after-free/double-free and NULL-deref issues.

- Input validation and robustness improvements.

- Correctness and functional fixes.

- Compatibility with NVIDIA Video Codec SDK 13.1.

For more details, see:
  https://git.ffmpeg.org/gitweb/ffmpeg.git/blob_plain/refs/heads/release/8.1:/Changelog

Also, add a link to the submitted patch.

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 ...002-ffbuild-common.mak-ensure-target-directories-are-cre.patch | 8 +++++---
 .../ffmpeg/{ffmpeg_8.1.1.bb => ffmpeg_8.1.2.bb}                   | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/0002-ffbuild-common.mak-ensure-target-directories-are-cre.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/0002-ffbuild-common.mak-ensure-target-directories-are-cre.patch
index 2e26078f0f51..8874c2a48f83 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/0002-ffbuild-common.mak-ensure-target-directories-are-cre.patch
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/0002-ffbuild-common.mak-ensure-target-directories-are-cre.patch
@@ -1,4 +1,4 @@
-From 6cd4855ea3dd62e6eb36c0796f8cd7bd4aaae05c Mon Sep 17 00:00:00 2001
+From 894c92ca133c5f1532a4ae155ae8f4d2c6da3c9a Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Thu, 11 Dec 2025 19:55:46 +0100
 Subject: [PATCH] ffbuild/common.mak: ensure target directories are created
@@ -20,14 +20,16 @@ than add a Makefile dependency, I've injected the dir creation directly
 in front of commands that can otherwise fail - a proper fix would probably
 add the rule rather.
 
-Upstream-Status: Submitted [by email to ffmpeg-devel@ffmpeg.org,softworkz@hotmail.com,kasper93@gmail.com]
+Upstream-Status: Submitted
+    [by email to ffmpeg-devel@ffmpeg.org,softworkz@hotmail.com,kasper93@gmail.com,
+    https://lists.ffmpeg.org/archives/list/ffmpeg-devel@ffmpeg.org/message/6QKXQGZKGDNDQXH2XO5IO4LAQKVHHWZG/ ]
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
 ---
  ffbuild/common.mak | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/ffbuild/common.mak b/ffbuild/common.mak
-index 0a60d01..346bb0a 100644
+index 06d6f39..52a9a20 100644
 --- a/ffbuild/common.mak
 +++ b/ffbuild/common.mak
 @@ -126,8 +126,8 @@ $(BIN2CEXE): ffbuild/bin2c_host.o
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.1.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.1.2.bb
similarity index 99%
rename from meta/recipes-multimedia/ffmpeg/ffmpeg_8.1.1.bb
rename to meta/recipes-multimedia/ffmpeg/ffmpeg_8.1.2.bb
index 0aa8c6e8e186..38eccbf2adbd 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.1.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.1.2.bb
@@ -26,7 +26,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://0002-ffbuild-common.mak-ensure-target-directories-are-cre.patch \
            "
 
-SRC_URI[sha256sum] = "b6863adde98898f42602017462871b5f6333e65aec803fdd7a6308639c52edf3"
+SRC_URI[sha256sum] = "464beb5e7bf0c311e68b45ae2f04e9cc2af88851abb4082231742a74d97b524c"
 
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
 ARM_INSTRUCTION_SET:armv4 = "arm"

-- 
2.43.0


