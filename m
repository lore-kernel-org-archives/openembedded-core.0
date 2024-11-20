Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8F7CD711B8
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 15:32:15 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.16426.1732116732076691172
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 07:32:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cJTa0PwF;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43152b79d25so47992415e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 07:32:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732116730; x=1732721530; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y+gdm9Ihcl1EuKlMchYJBAJx6W0hx3xxuUD2FPetQok=;
        b=cJTa0PwFGFlOc83PuV7P5O1xLmn5JRH2Jmwnhj2V3nKI9DDnht37JsfsIuHTciL8ne
         oP1bSYCfmoMv3XE3S6kxC8XneuUIGlAYndgw5rDF+xqOucLIDhIceRzt08R/I6vhcvD+
         aAMNmHLSxoNtK+wiDL8YfquR2vj72vDRGzl7yL8qOn2oR+dtc25cubBfVXqsEvg6/QGV
         NfL+NBoseeWhLrkwP/VYxi2X/dqXdbbtiTVNc1FLezPOoTWJnhbvi+Ms7hVsPUPFoZ5U
         vO1xS1lE2sdjBXkZeylC3Hxpj9Fs33lakM8GmnqnFGPmFyefU/QLfKWPx89CjrCVeUME
         5qgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732116730; x=1732721530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y+gdm9Ihcl1EuKlMchYJBAJx6W0hx3xxuUD2FPetQok=;
        b=QkYeMBmi+0Mbxzgtz1biFxl7nqOyELEdRUA+ocTMay0NbrfL7/Qe5ljpIoU33y3YBG
         QHdahGMdZ9TGjs8vxZSrQzes6TcVvfqHKxBVh91gkYjc1reEYjZcA6s3NZbhXQRK10dE
         6R4AgXs4oJKOoQK1O+6V3nz0eQjo+wjnfr+O1t7SzOWF/o6xgMiKyblLQ9DhGgotm15I
         1UA2Up4BhtxNgeX+Xcbz2Wb0UcfSfMe7ZtGJEeZNz0SuRxB4nVkX9BIDK/nD6vxNfwHX
         lsNa9f9lwMTyCGJcX/wNZKFgadd/5pelBRYsia7HxNs8Vlb7ffM6KF7lzm7dAPs+B9Z2
         vE2g==
X-Gm-Message-State: AOJu0Yz1Yt7sDf4nJQnjHfOM+xTsE1J2ikVPFjDtqTqYbM80/Nb2Tml7
	mNF9oLgNLy9t87rJjXnoTJM0K6u+6CLfp1bwQklF/47I43O48HjjSXqFqA==
X-Google-Smtp-Source: AGHT+IFXHl0r0UyhOmoDDLhjeoj+56dkCEYgBCGkY+4W6T7WgEQAM4132f6m3QL8Q4gis4DWXXPfZA==
X-Received: by 2002:a05:600c:310b:b0:431:55af:a22f with SMTP id 5b1f17b1804b1-433489b2b61mr28528035e9.13.1732116730390;
        Wed, 20 Nov 2024 07:32:10 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825490522csm2363349f8f.17.2024.11.20.07.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 07:32:09 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 2/3] package_rpm: use zstd's default compression level
Date: Wed, 20 Nov 2024 16:32:04 +0100
Message-Id: <20241120153205.2525735-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241120153205.2525735-1-alex.kanavin@gmail.com>
References: <20241120153205.2525735-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 15:32:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207462

From: Alexander Kanavin <alex@linutronix.de>

zstd uses 3 by default (and ZSTD_COMPRESSION_LEVEL is set to that),
while 19 is the highest and slowest.

It's not clear why 19 was picked to begin with, possibly
I copy-pasted it from rpm's examples without thinking:
https://git.yoctoproject.org/poky/commit/?h=master-next&id=4a4d5f78a6962dda5f63e9891825c80a8a87bf66

This brings significant speedups in rpm's compression step:
for example compressing webkitgtk takes 11s instead of 36s.

The rpm size increases from 175648k to 234860k. I think it's
a worthy default tradeoff.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>

zstd fixup

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-global/package_rpm.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
index ddc4bf3a6a5..fab8f568781 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -10,7 +10,7 @@ IMAGE_PKGTYPE ?= "rpm"
 
 RPM = "rpm"
 RPMBUILD = "rpmbuild"
-RPMBUILD_COMPMODE ?= "${@'w19T%d.zstdio' % int(d.getVar('ZSTD_THREADS'))}"
+RPMBUILD_COMPMODE ?= "${@'w%dT%d.zstdio' % (int(d.getVar('ZSTD_COMPRESSION_LEVEL')), int(d.getVar('ZSTD_THREADS')))}"
 
 PKGWRITEDIRRPM = "${WORKDIR}/deploy-rpms"
 
-- 
2.39.5


