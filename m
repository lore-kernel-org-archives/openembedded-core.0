Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02ECFC982E2
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 22:08:40 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1711.1789682910277405407
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 15:08:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=VKwiRGQh;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d822dso780245e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789682908; x=1790287708; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bGLtBz27fL0mASa1JK0nhht9u8A7ucM1rIGI/xQo3Sg=;
        b=VKwiRGQhNrRJrDincOE0n6TGxNBfAtE1E5RpwT0rcvHekrhzlEo2cyJYwvUWfjv95a
         3ENfRO8DeQNIR8UOGUj6H3aAceKYX6cOc50OrC2a7D+ayBTQSLVmb16QHufWTA+JvvAA
         yb7WL1oVsX89RN5GqRdeoHQKZMjx05aWb0OaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682908; x=1790287708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=bGLtBz27fL0mASa1JK0nhht9u8A7ucM1rIGI/xQo3Sg=;
        b=VM1DkpBsJeDl7Jo/R2YiTDKHw41gTpbyZWHp6Ck9TAW0fBEzvmGMfOTgGEwLJOj4Gr
         lmWkVD+HaEorrsEoDAKEfFC03H0Hx2N3wj2tRHZy2Zs0xzt+p3P2sDq30EQp6ZNbAYvm
         a3iveyUPH1KpxlR14xFTNTPQyVX7V0xASoVtyttR3W1PLabfwWGJsDBgSLOVGosocIkn
         pV5Q1PXkq69c3GSHZEGByc8gZB6SCNlCiGIeQyC75aDZOo8KQ4BKAZx8GeOyFlsePHyr
         6UCMmWTyWJoKqB+oV/+XWq4Zwdq8GvZGwLqa0nZxFmeCSrr6D7jFJEtJK7rr4nMfuN/+
         r1sg==
X-Gm-Message-State: AFuF++ncA5GRWpihw9zktvA/zuXzkw/hDU0vFIjpHFPDqsK717ErIU5j
	tXdHnW+mQ7mIqJynjqnsdifOyWvcS4MITaDhXS89Nrkn6ZzHqdeeEdarn4tNXcZIm3ggHgT4o3b
	TKey7wJM=
X-Gm-Gg: AYBFou3T9hzEYyzYjbFhGmng5pbcueNIODaI+RWEvePMHxeVz4n7Uw4+ztfM17AFjTf
	a7YNgEjrF3e+81yz3B/5eYiDr8CEZ/ImIxiZdpQBm30xPTAhl9Fb+8w4+vZCw47vrMSpA9PA1Gw
	vBMIUJZ6YjWkewPNlRPLqw57HMy7+s6ZCw9nIS1rLTLzo0BjBc9tby0dK/uOrVY0yQyK8SF+iiw
	EcioX07GrrVUNZlZ9Qd1wHmv55TTlDPG6tpBe39KEN896j9jF5UFPIoEk2mDP4sCryEdYw3l6Mt
	sUogrw4G8IH79Z2vnf+es49jWHBL7tGcEAE1zVyf2jrL+1kN2cm3jd7x/MfYtceCD2WCRRDLLqk
	CNoLmYu3Ju+ifBwnkWdCVT1IKp1w3Khf8gYPTW/3t/u9KXdwjJJpOJK2+0YD0s4op/XgTRCQWHB
	o7uQUatOnpLAdqZ4R7mKPKCYc/NiMyNs6hV25f+HVGdYX2FiEa4cJ5mhsyAXF0WfIZ6B+ZR8JWp
	h0mFdXhSxLnzvePT5yl7N1GXs86IUghqOFwM8B8lY60n276kZz9SZJgNi+ceYhWVc6FzNVksgva
	1Fotf2uesw==
X-Received: by 2002:a05:600c:4eca:b0:49c:d818:8764 with SMTP id 5b1f17b1804b1-49fc56adf0emr3552235e9.11.1789682908502;
        Thu, 17 Sep 2026 15:08:28 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm8984075e9.0.2026.09.17.15.08.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:08:28 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 72/79] ffmpeg: Fix for CVE-2026-64833
Date: Fri, 18 Sep 2026 00:06:57 +0200
Message-ID: <59e03c4fb5a83a7d11c18638ca4d3b93d881e8c9.1789681419.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789681419.git.yoann.congal@smile.fr>
References: <cover.1789681419.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 22:08:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246167

From: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>

Pick the patch from [1], also referenced in the NVD report [2].

[1] https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/6f80e2765492700622596af720534cef33dd31b4
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-64833

Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../ffmpeg/ffmpeg/CVE-2026-64833.patch        | 36 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-64833.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-64833.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-64833.patch
new file mode 100644
index 00000000000..407ebf0ece3
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-64833.patch
@@ -0,0 +1,36 @@
+From 9d412e4715b17404b5e4c6d9f0d2b5c1a100aa74 Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Tue, 30 Jun 2026 00:11:50 +0200
+Subject: [PATCH 2/9] avformat/spdifenc: bound DTS core_size against the packet
+ size in the HD path
+
+Fixes: out of array read
+Fixes: yBSax492UIB9
+Fixes: 482d98f69b2 (spdifenc: IEC 61937 encapsulation of DTS-HD for HDMI)
+Found-by: Pavel Kohout (Aisle Research)
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+
+CVE: CVE-2026-64833
+Upstream-Status: Backport [https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/6f80e2765492700622596af720534cef33dd31b4]
+
+Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
+---
+ libavformat/spdifenc.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libavformat/spdifenc.c b/libavformat/spdifenc.c
+index ab3f73d..16eebda 100644
+--- a/libavformat/spdifenc.c
++++ b/libavformat/spdifenc.c
+@@ -225,7 +225,7 @@ static int spdif_header_dts4(AVFormatContext *s, AVPacket *pkt, int core_size,
+              * (dtshd_fallback == 0) */
+             ctx->dtshd_skip = 1;
+     }
+-    if (ctx->dtshd_skip && core_size) {
++    if (ctx->dtshd_skip && core_size && core_size <= pkt->size) {
+         pkt_size = core_size;
+         if (ctx->dtshd_fallback >= 0)
+             --ctx->dtshd_skip;
+-- 
+2.43.0
+
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
index 4192b1a5c97..35153b81a99 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
@@ -29,6 +29,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://CVE-2026-64830.patch \
            file://CVE-2026-64831.patch \
            file://CVE-2026-64832.patch \
+           file://CVE-2026-64833.patch \
            "
 
 SRC_URI[sha256sum] = "6136812ea6d4e68bdba27e33c2a94382711cdf4f8602ffef056ff792bd6f9818"

