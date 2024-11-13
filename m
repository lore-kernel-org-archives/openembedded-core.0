Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8486FD42B9E
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 03:16:48 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.3428.1731467804736824171
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 19:16:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=eYs9LL/y;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-723f37dd76cso6650952b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 19:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1731467804; x=1732072604; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ecaKFYDLo9b1JJoi2t90ngt9ICJBbeGXc7G+uW+dtn4=;
        b=eYs9LL/ymh3iez3JyYXYmworjFzBBd99NMd9b1L8M+cTJX3dtJ/0BSDj8skdpteJPP
         obX/l6HLcApllHBPeeK9gjNmdE34WXX1DEP/nSonxp/8hAtJlqcIGrlmvvJcPEg0uJgO
         IxeGiQLgxY1TwK7f8/3ASRvsH9Cm9dRES3nFTFq9N6yhKKDNgfLRltApzWA0aTzSgDS8
         6+YHM6kKVZUHN4O+fqGaLJo5gyoxsmZ1lGjLjOhc5ORcTIutwOPL113lFKO9rj724GJg
         cMInGz4Eyh/bpd0WmEFWIEAsHcioFrv1aorj7+oKI3GFPOVNiMQZDjMq8zbdNspOR1yk
         Z79A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731467804; x=1732072604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ecaKFYDLo9b1JJoi2t90ngt9ICJBbeGXc7G+uW+dtn4=;
        b=Adgl2GHb1RsqeaaOkeNDHhlzcPhoMV//LJPhzbr3EasxnZ711uvRSE4BbRbrNBUUC6
         hrmvHPYcpzoS1Iulc3ousABdoMfCpPZLMDP1ZiTqfGcDtQVfA9bHFXSd9sAZKIjt0aWl
         KSJIxyoAegF6Xe9SE9oLYVpRu/zg9ppGccWT2VutGTQ8GjkW+rUkn6CwLpHKjFRgSc3t
         5P/koj4hmClgxn+SgsBJYDJJRemNjaRxNCurfD3ayV5v2nhj503w3U22AOoEZsqvI9Yl
         4xe811LPPmdJUidrFICheVxyf5hEVvznJNd1V2aim915buyvqIy0dmtZpeIJ3YNs0CnY
         PyAw==
X-Gm-Message-State: AOJu0YzQzX7TvT1wfibwCb0sRkvYlwhWATeT59EjPNF1i5IkmmyVy7Wo
	ps6iAhGAvuTO896shr+MxbjtktE8o0OvsViAwS5XXycfZG8LLSKLyTjbBQwYg4Eu2xFe1KWVIN+
	P
X-Google-Smtp-Source: AGHT+IGNoE3wDf3LeCd8Nl9tEyb7QUSSsAMzdMZdhh2OlsZ3xSPqVkeIhTkaH1XITW15SLzP29QwgA==
X-Received: by 2002:a05:6a21:9993:b0:1db:e82f:2a63 with SMTP id adf61e73a8af0-1dc70338e88mr2381364637.3.1731467803982;
        Tue, 12 Nov 2024 19:16:43 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f41f64616csm9660213a12.64.2024.11.12.19.16.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 19:16:43 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 16/19] pseudo: Update to pull in python 3.12+ fix
Date: Tue, 12 Nov 2024 19:16:09 -0800
Message-Id: <82526703823e252070dbf689e6f82a12ceb3b035.1731467662.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1731467662.git.steve@sakoman.com>
References: <cover.1731467662.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 03:16:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207089

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Pull in a fix which avoids syntax warnings with python 3.12.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 5a7ccb5761..50c3b59975 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -14,7 +14,7 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "0d292df61aeb886ae8ca33d9edc3b6d0ff5c0f0f"
+SRCREV = "e11ae91da7d0711f5e33ea9dfbf1875dde3c1734"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.34.1


