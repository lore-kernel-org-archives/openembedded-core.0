Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93A05C021A4
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 11:14:09 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.48184.1739186045230503846
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Feb 2025 03:14:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nrKd2YF6;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43934d41730so16002915e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 03:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739186043; x=1739790843; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yTfvEU+fE4BHGbvdhuF8cxM6p4lUxcDUI+coObHyPiI=;
        b=nrKd2YF6NsbRt+sKyb5TErU3eEhlUfZ20mqhYVTMNb2vY2deOlzFdQGftLhcgoY2RQ
         WksaK3tLfs+fbIcwtN7yvZ9oAey8kXEzRc1l9QM2CFFAU9x+L4HFA3gxvBUn35u/eV67
         hpDcibWnUfEhpFCKCkOE+iZqDRU71bO+hlQQuYLYbHgrJ6xuNtMptOfAcoLipWjbrW70
         rl00uzfCrsG6aC+LwQ32iqbIri/qI1yDG07qFqQ5AItMumiJAb9uSEcDMrXattCO0H+P
         1ikvISt72oDc20gvYvHa6LYmuuM3Du+Z3El29aPPbJVXdMaD17GTO3im78kgT3qpcKEJ
         Bt4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739186043; x=1739790843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yTfvEU+fE4BHGbvdhuF8cxM6p4lUxcDUI+coObHyPiI=;
        b=AreMkKPfedOFPFoo+9FM2OCG7u4z+2xxH9ScrgeczweOSiySCX+H0aGbubh9u1T98s
         xAaAQvahzghAEm4mBUre9m4aUX/VqmbTsBlCvuEuXffnHCrAPq59xjrgPh3Craj+8i/p
         RVJz5gV0D0BCCNq0bK0N7LyDHATC4pQA5RNn9dgfYj0GmVSIHdg9ebXPw4DOy8wCVsXI
         +Ve77tMerNipEiR2bVtkyD7+6N4gwdE0F5q7QC8Jfs5Qxt8QTJKGO7RrG23ySYKh8J3u
         9s4PL+kPtT5vmjAWWj1LpjfUJGRo3DZ6rVJ77GfwIsaeVmAT35aS3/6VUtD2XCjNaPAN
         gt+g==
X-Gm-Message-State: AOJu0YxUwW0hN7c9FmBT4ODJEWzGdnUVw3iVDL2wLq0as5xydYmaZp+X
	ymi+N11QZWJGGXwLEerG4JathYAKcyERCKgkGEqP3d9z1pJPLZnyg1L/GA==
X-Gm-Gg: ASbGncvwaZCtFRomjDgjuFcdK7JyfCHQGnZTdvThNM4p6bT0iMmQdC7AIlrsPWF0LPY
	cCkobgPbgsMVKswmEo0wDGWr+mqpAVNU+AdJD8mu68u8ReiVZBIbaNcXgHsRLXaTP1Xe+qGfMol
	P5mg4GH29IcedB9H6Zt/QZo69G8ngChwljsgidIFq9iRbPWCHHulFxzWZgfxaRPceC6yhp8ueeP
	X0StEDM9D0pYk734JsScaxUVpGDnxpYX4miDJa3jG2WBb1i1QovLUHN1qwWuStEZU1iEMmlhuK8
	ddvMWVO5b3BQjMBH4ZdLPjuYO/8tOb+h8yBTCrJF+n+uOQ==
X-Google-Smtp-Source: AGHT+IE5ub1SwDR4Nt4HiMjJ7P0TJIL0Jh7hv4/3kQqRNRK5ADKw8kysdKob44+GxW1pgeXvWj/NhA==
X-Received: by 2002:a05:600c:83ca:b0:436:4708:9fb6 with SMTP id 5b1f17b1804b1-439249af1edmr102519755e9.20.1739186043079;
        Mon, 10 Feb 2025 03:14:03 -0800 (PST)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390db11264sm174789785e9.35.2025.02.10.03.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 03:14:02 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Randy MacLeod <randy.macleod@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [OE-core][PATCH v11 3/5] rpm: Set SEQUOIA_CRYPTO_POLICY in wrapped tools
Date: Mon, 10 Feb 2025 12:13:56 +0100
Message-ID: <20250210111358.1120877-3-zboszor@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250210111358.1120877-1-zboszor@gmail.com>
References: <20250210111358.1120877-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 11:14:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211088

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


