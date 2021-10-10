Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77D49C43217
	for <webhook@archiver.kernel.org>; Sun, 10 Oct 2021 19:10:19 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.2167.1633893018265090076
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Oct 2021 12:10:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jodwEmVp;
 spf=pass (domain: gmail.com, ip: 209.85.221.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id g25so2097681wrb.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Oct 2021 12:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=D03pAYHGWRgsrSlOZoO+2QtcAS0C0YwmdIpkNnwC7ss=;
        b=jodwEmVpEP4RrUChFYCdLNl4K/LDfszfBmCGyyiRx6z2efKPxMqqcMj+tw6e4QR19X
         DBL+nazuOnosiYMMFl56jmHhierasQt/nc9Eq3FnrBU3daQ9jKdry3NVwqra0C1khyA6
         wjTdQhcDaeCxE5hWlb/EtDgOJpYXBJXTcD39ptMFrj2DxBQ562m23ICDdKHkpHqNdu40
         JJqOR9VF+ReA6mBsoe4e1wgj9Z8/Cc1PU569/SlcbLOQSZ+XDz5/iN2pYRuEqgRiweav
         /KOplYPhCXJIUzXtkcP1idL90Zlcn7dNZwzgdwGKf0hplhoxGVgnxD0hhPZpJkOSRVJe
         SjTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=D03pAYHGWRgsrSlOZoO+2QtcAS0C0YwmdIpkNnwC7ss=;
        b=XQBJz6UimBkNUL2AnaVGdALU+3371dYh7AFwPEHkUCnRUVvss2CODxmr6Y//mmCVfe
         gjL8VC3R2smMfZcfzh1OWrs0D/xl9DapkpqypCBPeeLGyo6NuoVxiXxzYeGla2GaIxuW
         yN2M9MSkm/3n2g6xmN9hoKVTcag+N79+sEebAP8J2TYVDfdwZ4QwXYcBSPygnyCkXIoC
         B30NqS9wFo57E+D1ZXx+b62y2krzZPcKeePIDwbDt4hSH6ns7CAf1oDu6cpHHgDFzU5C
         7jWK2x48ERsjD24Bp1KMScivCY0W13v8o9qyGyZRx1gR7uFMPRPjsfYOWFWuGB6BasBG
         07cA==
X-Gm-Message-State: AOAM530b0k4vG93nqcPJrltKb5fmQZDp+qcttl3HOsSCN2k+oHCRQktb
	yHMs1SYeeVlyxRuTSn13dnX7JBSRE0U=
X-Google-Smtp-Source: 
 ABdhPJzLMMK4K+DtSYzhDCf3CFMeckbs2078Nbofo7GTADfqwbRMSw7yrRo6XAHylBp9PDCJg807tg==
X-Received: by 2002:a05:600c:1c03:: with SMTP id
 j3mr8068707wms.171.1633893016911;
        Sun, 10 Oct 2021 12:10:16 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id z6sm7962025wmp.1.2021.10.10.12.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Oct 2021 12:10:16 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 09/13] gstreamer1.0-plugins-bad: disable rsvg on x32
Date: Sun, 10 Oct 2021 21:10:04 +0200
Message-Id: <20211010191008.4122049-9-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211010191008.4122049-1-alex@linutronix.de>
References: <20211010191008.4122049-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Oct 2021 19:10:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156802

librsvg throws:

| error[E0080]: erroneous constant used
|    --> /home/alex/development/poky/build-x32/tmp/work/x86_64_x32-poky-linux-gnux32/librsvg/2.52.0-r0/librsvg-2.52.0/vendor/thin-slice/src/lib.rs:111:25
|     |
| 111 |         } else if len < TAG_LIMIT {
|     |

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb               | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb
index 81c8391213a..4f2810e0400 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb
@@ -28,8 +28,9 @@ PACKAGECONFIG ??= " \
     ${@bb.utils.filter('DISTRO_FEATURES', 'directfb vulkan', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gl', '', d)} \
-    bz2 closedcaption curl dash dtls hls openssl rsvg sbc smoothstreaming \
+    bz2 closedcaption curl dash dtls hls openssl sbc smoothstreaming \
     sndfile ttml uvch264 webp \
+    ${@bb.utils.contains('TUNE_FEATURES', 'mx32', '', 'rsvg', d)} \
 "
 
 PACKAGECONFIG[aom]             = "-Daom=enabled,-Daom=disabled,aom"
-- 
2.20.1


