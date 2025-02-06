Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62EA5C02196
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 04:43:12 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.32633.1738816982037381192
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Feb 2025 20:43:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NeDmnErW;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-436ce2ab251so2566185e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 20:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738816980; x=1739421780; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a+0wgd1r0I5jaWnOY0o4AHBMkNOb/+K8k5EPia/XQj0=;
        b=NeDmnErW9/HfBzwf+lt3Rs/TcfGeGOnRwVpAY4sV8xYeyDAt3ND6Fkt0o/qDLlyKGQ
         Io0cQX6IbsMQs+Fv1YPkiEirk5YQCtQFug1Qq5hmwvfRmVx2u+EPufIPKzZZwNAvVPwJ
         XUxFmO8qAS18/uAwh7C+BQ9ah8GinIfcNmJX2LyzGanuuiipbO8rIYK6SduqSjhSW29W
         AVgkcsHvOuVRQzwoAWVGiPbhsWB9742yCvb2/pfh9aFYcI2F5QDzSSN5b8oXr9C7t775
         F85T4jb4mdEgufzKcnJ4SEhI8HuokXbhtNNYXKz3aG8WpA74AeE+RyJgQJt4ADa6sSMv
         jdEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738816980; x=1739421780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a+0wgd1r0I5jaWnOY0o4AHBMkNOb/+K8k5EPia/XQj0=;
        b=xVVdx6rhIVVlSo96A1pl96OKONJzOe/1Ur+a57p/Np0ovdCujxVekVhoL5TEGTKAup
         7B4fiRh0HoBONgCUkSWJonEzOJOFlwjKEWZhnDojSNgQ5+EdC9kheHkYpXAyTNpumhcx
         kwurrxDX/i4r4JZJEfAZjx+KYeRbKQQaLIgItqgeRTT7XxFe2Jcpw9Zi+j6d7jegphV2
         +zIGT+w+GPShrUCIV1UfZz49sblI5JTM+cKnVn2ge0F2HjZkI6MVPzOsK0GlYmL4//Sg
         59GCrfbsdqvOvC5hDQDoo2HIykl2wO6PpcklHj0TW6EjyyYGiZZsVw8d2I7XsTI8F9zJ
         P6Ig==
X-Gm-Message-State: AOJu0Yx+6AtkxEP8QmtRkFeb8Ag8qgAtFt3nQ0i4DbUPTNGZHpwdbvma
	mJm9UodMLQ95UXPFnpQmN8iA/y3yHJK9eUZf/JuffbcEofXdViHK+wusKw==
X-Gm-Gg: ASbGncsQ9pgGi7qcDcxjWoliS9aU3siKpvAAHkvT0+0eskBLh5R5kALUiX1/eS/HyIt
	WM2D0YtXh51Q9I+LsLyf72fylovBvUVpKzBtrbGZcp0Zcch4CBKlKAGalL0+jryKq3VB2WnTNFs
	fTY0BCqbriTFHmCp178Ag0JqVGAMD55AU4iQqpAwCuWTLj39OnmL/ZAQaZ8sV0OaQpu0Jdshcxg
	CYXaSXbr1mNiLIkjL1Wa9exq+eBomueWHw72k9TQlA9W3xX42bkwvUOYZy5Bn5QIs177lvbBoxJ
	lUuoWNGHz62ekCnVNKJ/Zfzp29NWICJmeMPUCBnTK4jn+g==
X-Google-Smtp-Source: AGHT+IEg9zyoWRoj821rQDT2r8TqPlvRIJJ2H6W9bb52FslNMzm5yDw/GQNEJrCJHot9C5y+Iac9WQ==
X-Received: by 2002:a05:600c:3b11:b0:434:a7b6:10e9 with SMTP id 5b1f17b1804b1-4390d43f76emr39844055e9.17.1738816979870;
        Wed, 05 Feb 2025 20:42:59 -0800 (PST)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dca34a8sm5819695e9.16.2025.02.05.20.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 20:42:59 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Randy MacLeod <randy.macleod@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [OE-core][PATCH v7 3/5] rpm: Set SEQUOIA_CRYPTO_POLICY in wrapped tools
Date: Thu,  6 Feb 2025 05:42:48 +0100
Message-ID: <20250206044250.3311711-3-zboszor@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250206044250.3311711-1-zboszor@gmail.com>
References: <20250206044250.3311711-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 04:43:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210891

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


