Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3EC6CDB471
	for <webhook@archiver.kernel.org>; Sat, 20 Jun 2026 13:00:26 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5959.1781960422361812906
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Jun 2026 06:00:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=LP0RAADl;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-45ef29c5561so1683547f8f.0
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 06:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781960421; x=1782565221; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6lceHptTXqC6ZEfc3VRvkHrgnNw+4qoSPxtWxUE2LRY=;
        b=LP0RAADlvTYdAswAFcurwK2T5cEbn3IFr/wqFpXJ0hnN3JQuqZeeNHS1GsX00nohLz
         fyjI7u5NGzEwEj9M5+OiFEdPURPDtkT2YIIDF9EDbHv86lNSzv+hb749BRsQg1P3Na5P
         8RtykGHLth7TwRjEJ0NR+vvblsES7peBsWi7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781960421; x=1782565221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6lceHptTXqC6ZEfc3VRvkHrgnNw+4qoSPxtWxUE2LRY=;
        b=NCvafAhSx/9w2O5xPfdXfTX9HMYdky6MNkbl0hewzVI9UYplPUaKpkAkI5Z60zTX/e
         lxj+AdrN3oANMl2btueB/A1Hpl8R2gGS/RdAoQVAxZuQA/Q88zcrb9y2CoOc+Z7jAPN3
         1tvxANdAN4Ei3nfE6UEn1ammY4wPb4dHH1qIbn3ujyES5LtHpuF/mJBqpZomHZMW3UBf
         A4/QzIJj58oxAVlZW2bZECDK6pzSRs+n9YxamvMOVK0rY9TArYddC/MDHTTOCm7jfese
         0/fkmGkMzR33Jcf25Bh/ZZi5BDkIDAHcuRne242tyWsYSDERc4arN6lmn8ALRHr57O39
         L80w==
X-Gm-Message-State: AOJu0YzczV8cY3eggaw97ZYlWU64IWjWsZSMGmtdac5v5rYKVQslEDsj
	l7A1WYdT5eCbI7QQizNYtpaKom3IDKbSqGwcfru1I7j27hTY5ssdXH1umCnELLD2sOpBUBg59dQ
	YdzFm
X-Gm-Gg: AfdE7cmwzWciqXYvaxdk08cwllTRxC6IXgb1oUnQaLZdeLS/EvKTVQ0LlkbiVIBA/rS
	WpW60lD1jXmzcS2tmpGaueeuAMillM/kVc29Ubit/g1AgzrJCUyMwY50GFWHBcYJYlSS5F00YzY
	u1LnjbRtO+Me5xGSfL/DbDskcz7VnDlGsjuTABeYIr0J5PWctTMD08hPZrEaAdhfNLQaB5m+u6J
	+RpIkDyvRtyWDcbXATrrPCpwGZm9bbxUQYxQaAsPUw0UDRAlmAHtVyqzl5xkFzyRKVis6ot5p0Q
	/I2lvEiRw6RP+ExdME7Wms6Z4u3HIVJ4oAVEjVNTsVtFVHpxJhoQ6OJJ0qDY84XI47o4R+jw4sb
	v7+uQDOOrubVD5numZMqX7rOTScKCfo7WkF8jRCHl6rhyyNyztc0uo1nebxnF2qCOZd6s6wekGp
	MbZaLmwbfUS7HElURq53ZR5PTlnkHFLb2MyWnOV0RQ5VaxIYH8Rw5KuOj7iRdSXhBKi3yWH02r7
	owzflL1cmvWptc9
X-Received: by 2002:a05:6000:1447:b0:460:3233:f994 with SMTP id ffacd0b85a97d-4650373c248mr12214488f8f.43.1781960420376;
        Sat, 20 Jun 2026 06:00:20 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4666722141csm7338573f8f.34.2026.06.20.06.00.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 06:00:20 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 18/36] sbom-cve-check: Fix breakage with empty IMAGE_LINK_NAME
Date: Sat, 20 Jun 2026 14:59:33 +0200
Message-ID: <b814c552a547217fe2757de97ca5637082f98038.1781960051.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781960051.git.yoann.congal@smile.fr>
References: <cover.1781960051.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 13:00:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239227

From: Niko Mauno <niko.mauno@vaisala.com>

Avoid following build breakage:

  sbom-cve-check: error: [Errno 2] No such file or directory: '/build/layers/openembedded-core/build/tmp/deploy/images/qemuarm/.spdx.json'

when IMAGE_LINK_NAME is set as empty string, by changing the reference
to IMAGE_NAME instead.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2a80840a4fe0d38254ed3e9f96c893f6e04db8d8)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes-recipe/sbom-cve-check.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/sbom-cve-check.bbclass b/meta/classes-recipe/sbom-cve-check.bbclass
index fe145a2212b..451595f1d76 100644
--- a/meta/classes-recipe/sbom-cve-check.bbclass
+++ b/meta/classes-recipe/sbom-cve-check.bbclass
@@ -14,7 +14,7 @@ python do_sbom_cve_check() {
     """
     Task: Run sbom-cve-check analysis on SBOM.
     """
-    sbom_path = d.expand("${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.spdx.json")
+    sbom_path = d.expand("${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.spdx.json")
     image_name = d.getVar("IMAGE_NAME")
     link_name = d.getVar("IMAGE_LINK_NAME")
     run_sbom_cve_check(d, sbom_path, image_name, link_name)

