Return-Path: <charles-antoine.couret@mind.be>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46E86F3D60F
	for <webhook@archiver.kernel.org>; Sun, 29 Mar 2026 13:47:57 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29773.1774792069402717578
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Mar 2026 06:47:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mind.be header.s=google header.b=dhB5PCp6;
 spf=pass (domain: essensium.com, ip: 209.85.128.52, mailfrom: charles-antoine.couret@essensium.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-486fe36cfabso22834685e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 06:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mind.be; s=google; t=1774792068; x=1775396868; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kw79mGZD9hhjELFAHn8A7IWzh1DTuWLo7CaIIMkilK8=;
        b=dhB5PCp6cTexTHE4UZLbG3KbwAsFAVID9vMzCshmNDGoP0pphBRJ9QMwX3a5TFwArQ
         ccwJ05AQgas+Zev+qVg6t35W5HUDAjd3PKM44dqQoWr7VYyBnbR+QX9mlwi+tUQsTup3
         9weLNWy/jxv34IIZNU9Tre4oSsZiHmkD6GGit6Nr44+aCwzbBl6eW+42v7gPTwkpSw7J
         Wvy9XyWnObLK86XVpKWwtjCyz/9oo7+SsQRujUafxFR5FlPYvzq6cJAvvO14+qQGc/OV
         z0Q7taUz5MaWSkuSyA0fb6x8X7hbprGAzc1lDwZJYkUcag4a1HpNmNMCxoE00q8AQGeq
         JSPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774792068; x=1775396868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Kw79mGZD9hhjELFAHn8A7IWzh1DTuWLo7CaIIMkilK8=;
        b=Sdivf9SCZpQ3HNbVIeXYQon/Q3qcr3gIBUnbXQXmoJySngFWyJTcw/GShbByTRo8gs
         OmTRjU1LOeNRyZ1TLB2vsoSNNtR/I3NnP3i+C9jp6wF+HDQ0Y2PaOanUzCpZSTkS0Xey
         OTeneHvBe6TaZNskvt486dGbH0I86nu0EmxW8DcI0fhH0zQm0Piinto3/PxrGGD76bGI
         EvMZt7MpdT8Q5ltYyNAm8pOew3S7N1dCfQkF2QQHuJGGKdzAN0VLUNG9FL8gQlCNyqZP
         icRM0MuHuK2parfA9Vpvnu/OXe98M+dW11JdQa53H1YQSFOQAqaE+xl6ofI3gGQ+mjQE
         Zs7Q==
X-Gm-Message-State: AOJu0YySxI/1us8LE38Ke9JbLWygv1Yrxsx+bbeWWkTrsXVfTQCi5Wuf
	LzMQ/t5lttnaDq4dDuIKIjv0M7jdR0qpcSgqocO0h60afa6Zr7c9z4BdVCowLPCanHEs9zAjqig
	GuK8v
X-Gm-Gg: ATEYQzzySu/JxQRsPM1osNy1/bogOTF7VQbKYcoZAnRyE4Sz8ph9n8Ev+xLXiVtbpEC
	nWZudATU671/yNZujx4U1Ab1iOx1tK5Z6Crjn8QFi0M/WSdaPoMQczQgE1spNdg+F3Mdbizp7GN
	B5r3k5YF745Hz9u1kzZ+OG62oDMoRjuSoxhuEHwXoxRnBJ/U+upVMYKDPLWRaj0IvS5rDpdWIax
	ld5QMbSqsGO6k6Nu9N3AVMRuecfbHaxfeC01falWQXBhN71dpiH+7dwAdoRHLvJ/7nFiWsfSUpk
	JCVAbTSA6bbD4M8Up8A3DSWD03a7IsWyBAoMhCS29qbwIuTVXpYJzRLnJtGJAle/cgbKezEQ55j
	L3g2Xt4aplmcjZ9OtxizUMLA2PmbPChBTpoXycx+INvWsdYeIo35GYi2bYvBvfutHSg/zKID8cE
	R7HgLVkswOJDPk739nacNxfru/x26Pqyb+mfrOATUgOuM=
X-Received: by 2002:a05:600c:638e:b0:485:3c09:843 with SMTP id 5b1f17b1804b1-48722be44b4mr227073595e9.9.1774792067662;
        Sun, 29 Mar 2026 06:47:47 -0700 (PDT)
Received: from Jimmy.fritz.box ([2a02:578:85c6:1101:1ab9:445:1169:11e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21e9e18sm11162908f8f.9.2026.03.29.06.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 06:47:47 -0700 (PDT)
From: charles-antoine.couret@mind.be
To: openembedded-core@lists.openembedded.org
Cc: Charles-Antoine Couret <charles-antoine.couret@mind.be>
Subject: [PATCH 4/5 v4] image_types: use IMAGE_FILE_MAXSIZE variable for f2fs image types
Date: Sun, 29 Mar 2026 15:47:14 +0200
Message-ID: <20260329134716.3185469-5-charles-antoine.couret@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260329134716.3185469-1-charles-antoine.couret@mind.be>
References: <20260329134716.3185469-1-charles-antoine.couret@mind.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 13:47:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234147

From: Charles-Antoine Couret <charles-antoine.couret@mind.be>

If defined, this variable value overrides the size of f2fs partition file created by mkfs.
Otherwise previous logic based on ROOTFS_SIZE variable is used.

It should be set when the final file size would not be above a specific value due to fixed
partitionning for example.

Signed-off-by: Charles-Antoine Couret <charles-antoine.couret@mind.be>
---
 meta/classes-recipe/image_types.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes-recipe/image_types.bbclass b/meta/classes-recipe/image_types.bbclass
index 125fd64313..915e31e0bb 100644
--- a/meta/classes-recipe/image_types.bbclass
+++ b/meta/classes-recipe/image_types.bbclass
@@ -276,6 +276,12 @@ IMAGE_CMD:f2fs () {
         # 500M the standard IMAGE_OVERHEAD_FACTOR does not work, so add additional
         # space here when under 500M
 	size=${ROOTFS_SIZE}
+	image_file_maxsize=${@get_max_image_size(d, "f2fs")}
+
+	if [ ${image_file_maxsize} -ne 0 ]; then
+		size=${image_file_maxsize}
+	fi
+
 	if [ ${size} -lt ${MIN_F2FS_SIZE} ] ; then
 		size=${MIN_F2FS_SIZE}
 		bbwarn "Rootfs size is too small for F2FS. Filesystem will be extended to ${size}K"
-- 
2.53.0


