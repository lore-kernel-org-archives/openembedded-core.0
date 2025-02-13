Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2111FC021A0
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 15:23:42 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.13419.1739460211726384789
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Feb 2025 07:23:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OpXgOatC;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-38f1e8efe84so420017f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 07:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739460210; x=1740065010; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tYwCLwTXsWcD5PyL2nUUnTMHmh9cW8k7Toz/VlTxjHI=;
        b=OpXgOatCuVWsk973+4VIW0Wq0bg4QC/Q1LOwVopdqATi+v4/Lzn9j0C4De53D9Pq+1
         lGqywBIlHzzbrABTAIdXcGE0JJyGJ9qg7ScHmVBbSZ9lupBrc9Sp4bOifZlNCO7UBvMo
         oGpSzYb81NeI+PquTIa+/rVpLt9rrtMEzH4NJw546klTm+dhY4mslMK8g6QlGE6in0yz
         yuS84m6Pr6c+skIRD3VI2R80wT23I0tkz+Wze3DTI+aS2xNoM8qDn9aeK0jz00zfTOpz
         scUBsv2SgO7n03oNzGapwkgyV36Id6taLG3lilmJcvosyko/npdE+iYGOxB7m8TJlXX6
         mXbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739460210; x=1740065010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tYwCLwTXsWcD5PyL2nUUnTMHmh9cW8k7Toz/VlTxjHI=;
        b=ZOxkFREX2Ct499k/lwLB8HlSFbOlYMDh7dcrfnmEhLBBrtegjZqpJUhDc9XqpcjIdN
         /m0ULAK8t9iqNyJ0Y/lxDmAxajuK5gddS51nLvQfqcQeuHUEVMsfJCZ/kTZFAB3IWHwi
         I57JMlck5si6zRQwQwgSgollffc3pPrW4ZYhkR4JWznBt1vYDCziRvzdz0KG1h6KXlD7
         Gjb1fd9i12BoIPLeHntG/kikyLDQy5TNXv/vNyeYNIDORQ/M/oBDqOMw3/axVFj/NQkE
         ixALhCs7U0J2qVI5qBOaf4X2Lv4rgPMG0APvy1DHt/G4NLA5T2IfxcYKbBS1MnxEBvER
         y5lQ==
X-Gm-Message-State: AOJu0Yz2/xPIJvXmi/zjiImBucP79BxSMqegTgAGGuovj7ht3qruSE2d
	BfK4y16pZLoO6RgX3XhDRJKuIW+t7/wQ+feZZ2HDR8e3jojC1Qi7YlVi4Q==
X-Gm-Gg: ASbGncuAuhzE9bTrZwFwP46++D1fsiPpcsg5shKCKLcGUrdShVr9i4YxwyMomL9mUVH
	/IuS05HxA/w75ztIA7UzNmCuwqENsVdFMwLJ6CKLqUye9DGslnioKlWznDV5UrlyLe9JFEBiGms
	f/+7DXQ9dxVAftEO4+qruNSwPdZI9tv9d5fkeuyzspL1bP8J2W2og8XwqL2VSR4MyQGQUmfIyPj
	AUMIga4Tr2BBu4f5ma1pDgkqXAc1JR0hRw3Aid5gaF8Dkc+7fr6SSCbp2lBhDrrYhqcD86XbSLC
	4Bcez3Vu4nTLJb1nWKowJojSFCfuK3x/ICjTsEmVhnJzHQ==
X-Google-Smtp-Source: AGHT+IGxKfaqytN3DjEiSIaV8p87geTGG4XFtJzypBXvC/zecJKyVgbM97E/rWlrx9eSzf1Ti0UiUg==
X-Received: by 2002:a5d:5984:0:b0:38f:2350:7f70 with SMTP id ffacd0b85a97d-38f235080e6mr4006035f8f.24.1739460209612;
        Thu, 13 Feb 2025 07:23:29 -0800 (PST)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258b434fsm2223564f8f.16.2025.02.13.07.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 07:23:29 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Randy MacLeod <randy.macleod@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [OE-core][PATCH v12.1 3/5] rpm: Set SEQUOIA_CRYPTO_POLICY in wrapped tools
Date: Thu, 13 Feb 2025 16:23:22 +0100
Message-ID: <20250213152324.4016755-3-zboszor@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250213152324.4016755-1-zboszor@gmail.com>
References: <20250213152324.4016755-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 15:23:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211352

Point to the crypto policy file so RPM signing may work.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-devtools/rpm/rpm_4.20.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/rpm/rpm_4.20.0.bb b/meta/recipes-devtools/rpm/rpm_4.20.0.bb
index 45487ad32c..281fde1c82 100644
--- a/meta/recipes-devtools/rpm/rpm_4.20.0.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.20.0.bb
@@ -100,6 +100,7 @@ WRAPPER_TOOLS = " \
 do_install:append:class-native() {
         for tool in ${WRAPPER_TOOLS}; do
                 test -x ${D}$tool && create_wrapper ${D}$tool \
+                        SEQUOIA_CRYPTO_POLICY=${STAGING_DATADIR_NATIVE}/crypto-policies/back-ends/rpm-sequoia.config \
                         RPM_CONFIGDIR=${STAGING_LIBDIR_NATIVE}/rpm \
                         RPM_ETCCONFIGDIR=${STAGING_DIR_NATIVE} \
                         MAGIC=${STAGING_DIR_NATIVE}${datadir_native}/misc/magic.mgc \
-- 
2.48.1


