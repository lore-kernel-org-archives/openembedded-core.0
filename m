Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BF54C35FF8
	for <webhook@archiver.kernel.org>; Sun, 16 Mar 2025 16:12:22 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.31776.1742141537158861159
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Mar 2025 09:12:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EYeC4aff;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3913b539aabso2317368f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 09:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742141535; x=1742746335; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UEQ2/6FG/DT3Q71Qy6seAfllzBu8XHMGp7b8Hr893hI=;
        b=EYeC4aff/gDJNNp1rOq/dltdSjU5b/ni1otbjN1fZIHS9/Hro2dlzfd7/vyH4lFgq4
         14BxnnS24i9xGvLFJX8jEGemapSoQxqZ/Dsf3SFlC5qPvvInrUljwRpowziLHPssp72/
         ok9p+RqJmfs03bIXFXJPOaFOA4jJ8uqrga1sM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742141535; x=1742746335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UEQ2/6FG/DT3Q71Qy6seAfllzBu8XHMGp7b8Hr893hI=;
        b=wlBgfvAlYeLs7lImPAyG56FrtaCOs7aEh0FPdWBeXpmG7GBtAUQsJkwJGP7t+hQ2qB
         0yMNC/TXtXhg/7IoGQhDn6V+yG8+KDTtR8dNDB1XarkhcF3Rsio1C0pNNT25CQlAuWqo
         0HNOuy57oklq/CCqQtHfRx1kEHbOTAN3A7KDSoSTsDaucIgiEhCJchgqiJKczX4kKyXb
         yYUyt8VRlf4b/WQ4mXnoEvS6tZvw9xv4W8m0bNBpKupB41gtBh/Rv0NmAfAcCv13eU/l
         3AlqJnn21FQM8QklADDgQtRoSdzMQcilszFf7i9GbJLekxsDaDtddx6rhzaK2GULOUiV
         ORMw==
X-Gm-Message-State: AOJu0YwOSJXBZPejQNMsJtJTvNFFSuLOXrixxyqeZIKDXkqiDY2G11PC
	f0GvTxE/sLApMPnFkUG5B+mrivxHP5kmIn+8fuiddZSAIecQtkn9ub++lXY+mCFpXOWpHVj/T28
	c
X-Gm-Gg: ASbGncteAe4VapETTXW27NlDskQdyIIRtpSVwuZKeRRsNdx9oJWs1E0VCWnEN95dCOZ
	/8LxVD76QBQnw4wtm0FBOOjHTa3Bf1BrKXwiW9TUUUKIuWqs4ck21Vk797yQdsfdol61+NGAI9b
	F51gUqD8Kyx1OBre9xmSrbYCsTS3q95UIN0XqfP9dUZ3Dh70V8rXXz0cS6jMJ61EXZLdB6bqtQw
	vDIOA7Py8sMuq8slHL7OOLIyGCEMe3fDdF86PaBW4plhUL4ZMEAAfK/v3C+lTLCyVX2w2jKotA6
	wU5PAamyn1PJ24E5d+WiA7e3/wtZmTUbj9AKk9VC3/ZVWiJYj/VNL3awU1cRiU4CZkVeEuAf3Q=
	=
X-Google-Smtp-Source: AGHT+IFxSpHj0s22avnmfnfe3vue1/GXblqAxuyLzS3GCQRqSZSc8Jn++PmVVNiMwDek+DHCowOM4A==
X-Received: by 2002:a05:6000:156b:b0:397:3900:ef80 with SMTP id ffacd0b85a97d-3973900f07emr9763707f8f.22.1742141534806;
        Sun, 16 Mar 2025 09:12:14 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:bead:7cef:d139:9ec0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d200faebbsm80252225e9.30.2025.03.16.09.12.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 09:12:13 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/43] ell: upgrade 0.73 -> 0.74
Date: Sun, 16 Mar 2025 16:11:30 +0000
Message-ID: <20250316161209.3629986-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
References: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 16:12:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213007

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/ell/{ell_0.73.bb => ell_0.74.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ell/{ell_0.73.bb => ell_0.74.bb} (88%)

diff --git a/meta/recipes-core/ell/ell_0.73.bb b/meta/recipes-core/ell/ell_0.74.bb
similarity index 88%
rename from meta/recipes-core/ell/ell_0.73.bb
rename to meta/recipes-core/ell/ell_0.74.bb
index c6691c7e54c..afacedac2ed 100644
--- a/meta/recipes-core/ell/ell_0.73.bb
+++ b/meta/recipes-core/ell/ell_0.74.bb
@@ -15,4 +15,4 @@ DEPENDS = "dbus"
 inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "ae97f848b45a59be7741369880badfa8c08a55a24b21eae3468342cc012df11b"
+SRC_URI[sha256sum] = "f1690913024f80fafff19ecf010accb58a56784d78937bae536c016b8276bb75"

