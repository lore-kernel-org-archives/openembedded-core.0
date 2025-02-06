Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE2AAC0219D
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 11:46:04 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.38809.1738842359811197185
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Feb 2025 03:46:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iu9NbnRx;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-38dc0cd94a6so191847f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 03:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738842358; x=1739447158; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yTfvEU+fE4BHGbvdhuF8cxM6p4lUxcDUI+coObHyPiI=;
        b=iu9NbnRxbIBn2s6U0hw2CbPTZ5FOx8digGBsOWOAeOGGw1YERvnLWKWerFkl3eJoth
         atCr06r9GZS2UuasL2PuO4VV70yS258+Ti1XnNI5pm+xEAE5WLYljvucGtri90sQybBz
         PMZQuELqqrkBb48UJUwZDJbvXeh/dloeytgSR8qsRX7MeT7V8SEsea3jdEi0u6KoGmie
         Nat7OKv+v0xY37xKMMZnBvVm7jg3Eti+wjFsaegxc76Jzngty3swwIT7cvjv2KMjrRyv
         uzRGH51rIxgXripFfdNX89Bcz4K/gYxeylRl244uAw6J/cRNN4150SU7XN2weBbio4Vq
         15xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738842358; x=1739447158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yTfvEU+fE4BHGbvdhuF8cxM6p4lUxcDUI+coObHyPiI=;
        b=d+QmFja48yBsBx6eQOkrTu4BkuzbNb2fv3HeM+Ey3BYK+ayMW93SXzG/bf5OI8xQ8z
         E+Xnzo1nVmqeZ5/ZqkkgwetO/aFmO0BnMS0Xsqh7axqSmFgU5lHLM8vXYG7xt5B1Cja6
         ZOoORJDhoEJ1NmiPKSitu9rACTxDhxNnaNTGIqw087AWymds2kKcCvyzZ2eSesl8iJyF
         r+CqwFVOSS4WdTHc/9Yn3en7AQxHn8zx5H7bRS06+5VKSrJc9odIvtXkNwL3qjVO0i2l
         il8hhcH13dPViiBeoo0/gm3fMFEnSXTx2lU+f4UJpyo35Pp5/zU3cLk+CKjWDfXlgPre
         pj9w==
X-Gm-Message-State: AOJu0YxaSMueZJd62ccTCQMu0GLCrAe/sbEeHJ0YwI01zcno1zUz6P1B
	gpv4v9szn4wTtMpMPlYhMRIdw5gi3GjMn4WKHFMX8cE+uwEMNCg/5aYPDQ==
X-Gm-Gg: ASbGnctWzCJ1ejZ5F6+RA9weyQxdHfEnf8yZaazuE2tIwBvqEJftC1Rc+DxAqkp/fhr
	TOidv0iNw2IeE9tWKc1wMtaH584DZsElyhjgWGx9jS2v7sWAgzIz1okX7AB8eZhvzS1Wo9VoZCo
	jatshY03j8XswuhosUEn0b1YlLC8uk2hi7L9cl6JQyO7IArlMJV2DkosKn9BJ86BcnJtnceOXOZ
	s+3Bj/bSAKKp+1NseUfDewgZoXD6UD9QqMYREvfv6X7CGw3cx4GiGNV/0oYNa1yzFETbxPlKgKy
	2Hs1v6sOaZxYzduabiz5GNIGGHDZ4uW7RgE6w6LvqSzwGg==
X-Google-Smtp-Source: AGHT+IGjxSu4LdW64767cEBspVahTJD9N0gh8DdQdx1T4nCpqW6fwDfVFnfC7Y/T5+283A7nGV5d1g==
X-Received: by 2002:a05:6000:4020:b0:38c:617c:ee18 with SMTP id ffacd0b85a97d-38db490e3bemr4674265f8f.34.1738842357363;
        Thu, 06 Feb 2025 03:45:57 -0800 (PST)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dfd802csm16158235e9.34.2025.02.06.03.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 03:45:56 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Randy MacLeod <randy.macleod@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [OE-core][PATCH v9 3/5] rpm: Set SEQUOIA_CRYPTO_POLICY in wrapped tools
Date: Thu,  6 Feb 2025 12:45:45 +0100
Message-ID: <20250206114547.3441965-3-zboszor@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250206114547.3441965-1-zboszor@gmail.com>
References: <20250206114547.3441965-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 11:46:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210921

Point to the crypto policy file so RPM signing may work.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-devtools/rpm/rpm_4.20.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/rpm/rpm_4.20.0.bb b/meta/recipes-devtools/rpm/rpm_4.20.0.bb
index 6c995ff50c..d296c20d78 100644
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


