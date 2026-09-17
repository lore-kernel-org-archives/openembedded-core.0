Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8D6FC982DF
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 22:08:39 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1710.1789682909752127090
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 15:08:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=DKviWKvn;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d3920so877205e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789682908; x=1790287708; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6x8C4HMJL7SEOtTzwT1kc5qOyfkxghFDFhkQG2mQiFY=;
        b=DKviWKvnEp8vTz/WCV1MYO8Lwdn1P/6uQWj+6lp6hGcG9/+tEDFWj4t2hYzn21WuJu
         24vTqoqgKZr48rmtM4dyA9D2yYxwSUdL9zTWsY1Xg7yv9vpXb3c7Ntx/wnaHlk/rrP86
         jQ08LnTUPtg72voEcjTF3af/nCt+ZY8OYUTs0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682908; x=1790287708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=6x8C4HMJL7SEOtTzwT1kc5qOyfkxghFDFhkQG2mQiFY=;
        b=yOvKtjvyPgApFC/OZ8l4WEAcrwqnGAxL41N2Ax/861MdpNiubSWfI5aA7owOo9rJzM
         0mqqVF93ZaQIUaJKCCLmgaaSl4KQmaSeMdCYAYiAYkJL6EOEthL524sDBlNDh0hjs2o2
         HdbjTBe4ZmCRbT/xAOrmzK7HKz45Omot3Bo0EDB2UiF5PdXG1QfpmT1MSWvwnTsZgBN0
         pmEs6bord5FOXiAP1+gplz7bhK39Nkjq1J0Yvo1ir/Wd0zC8DheqIBz5C/v7jqgfO6+o
         1j38e+REJ8UpolaNvb1WlFBTFt9ZAeqytARyW2Bk4vH7G2qbN9pX/wAPdIGr2z3uhgfv
         /uCw==
X-Gm-Message-State: AFuF++m3IBiL5zZU34fFS964mwS4V1Yngu/EjB66MNbbk1lL/gtiXrII
	3XAgIRF+RfkhDiJ4uTElKbue0+wO1LX5gMeWTiFAYZtFuWLHQNSiXwqJZFSC+ur7Zd2BXPNlrdZ
	+ZuHmiXs=
X-Gm-Gg: AYBFou2bAtd2VsebJywqHsDT47RhbA8JkK7z1DU0BFDdvQlzD8RswVE2eniXJdoyOK/
	A66f7fOqD+kKal/OqX0fQnx55YLAe8yLhWtrgGvnEFGbf5KQXS8KoJUe00G2S04WIF+dM3/h8yI
	mhHNY0u2JhUX4J4Q814QlDnWjZ2yaUB85Mm3MOgsu51faa5J89X/b125dehX5razbGumnkgAu1e
	P+qikLWNJcPIgpk8CrOgPE4jgnLjTa0o4t4AxabqaypSv15yQjF3+oWGTnVepETGzvtykBwQTxz
	CX76cTJ2yrpX3dNOqRmo1Eyzlqfn2OvmxzPcK1j10ZRNl425CoyZpvROuFSQuznsO9gCOeZF7p6
	woidyR2rYNS6+wRvZAT0G8uiibLKJGtXWVhA4sb89mcJ5VsjuGRdtsf7RvrE461oRDnPg/prh5b
	Jwfp0QBSWGa1QBBCHFz3sH9ReisdVvPqxw19bWvvcEGbSdeuwQfVmN+hMUc2WQfzXfSsHYywH79
	7VkuzJxDw5ImkC2oc8Izhhi5rPiTRvVYwztLlaaFieWxU14VyeLdbBg7/bRZPV8fkOA7Jm8OZQi
	QmCR5ihYkw==
X-Received: by 2002:a05:600c:1f8f:b0:49e:8354:26fb with SMTP id 5b1f17b1804b1-49fc574c729mr3407585e9.32.1789682908042;
        Thu, 17 Sep 2026 15:08:28 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm8984075e9.0.2026.09.17.15.08.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:08:27 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 71/79] ffmpeg: Fix for CVE-2026-64832
Date: Fri, 18 Sep 2026 00:06:56 +0200
Message-ID: <318ff4bc617515c33ec94af6b8468acbaa247323.1789681419.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789681419.git.yoann.congal@smile.fr>
References: <cover.1789681419.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 22:08:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246166

From: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>

Pick the patch from [1], also referenced in the NVD report [2].

[1] https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/4c6217477fc64305055b37d9d1d0d76d30e37f97
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-64832

Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../ffmpeg/ffmpeg/CVE-2026-64832.patch        | 47 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-64832.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-64832.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-64832.patch
new file mode 100644
index 00000000000..28d6c0343f5
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-64832.patch
@@ -0,0 +1,47 @@
+From 55645f03fa9dc2e5ef5f79b875950391e920506b Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Tue, 30 Jun 2026 00:24:07 +0200
+Subject: [PATCH] avcodec/nvdec: don't double free the fdd-owned context on the
+ sep_ref error path
+
+Fixes: double free
+Fixes: rpSz7v3yq2u8
+Fixes: 72982f8cb5dad6252a14226d28128313eed4a5ff (avcodec/nvdec: add support for separate reference frame)
+Found-by: Pavel Kohout (Aisle Research)
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+
+CVE: CVE-2026-64832
+Upstream-Status: Backport [https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/4c6217477fc64305055b37d9d1d0d76d30e37f97]
+
+Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
+---
+ libavcodec/nvdec.c | 6 +-----
+ 1 file changed, 1 insertion(+), 5 deletions(-)
+
+diff --git a/libavcodec/nvdec.c b/libavcodec/nvdec.c
+index 7c29f25718..787a9d7c28 100644
+--- a/libavcodec/nvdec.c
++++ b/libavcodec/nvdec.c
+@@ -628,8 +628,7 @@ int ff_nvdec_start_frame_sep_ref(AVCodecContext *avctx, AVFrame *frame, int has_
+             cf->ref_idx_ref = av_refstruct_pool_get(ctx->decoder_pool);
+             if (!cf->ref_idx_ref) {
+                 av_log(avctx, AV_LOG_ERROR, "No decoder surfaces left\n");
+-                ret = AVERROR(ENOMEM);
+-                goto fail;
++                return AVERROR(ENOMEM);
+             }
+         }
+         cf->ref_idx = *cf->ref_idx_ref;
+@@ -639,9 +638,6 @@ int ff_nvdec_start_frame_sep_ref(AVCodecContext *avctx, AVFrame *frame, int has_
+     }
+ 
+     return 0;
+-fail:
+-    nvdec_fdd_priv_free(cf);
+-    return ret;
+ }
+ 
+ int ff_nvdec_end_frame(AVCodecContext *avctx)
+-- 
+2.43.0
+
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
index 02b9cf65a5f..4192b1a5c97 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
@@ -28,6 +28,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://0002-ffbuild-common.mak-ensure-target-directories-are-cre.patch \
            file://CVE-2026-64830.patch \
            file://CVE-2026-64831.patch \
+           file://CVE-2026-64832.patch \
            "
 
 SRC_URI[sha256sum] = "6136812ea6d4e68bdba27e33c2a94382711cdf4f8602ffef056ff792bd6f9818"

