Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C736C0219D
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 15:23:42 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.13580.1739460212818266998
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Feb 2025 07:23:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iK5VRKPu;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-436ce2ab251so7609745e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 07:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739460211; x=1740065011; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rPu4S32qezSc3KLY7SyMngOyXn0YoKwhtJNV1US/CBo=;
        b=iK5VRKPuH+RyKUGZyb/2Css2yYmqkguM+9J/LOPNGWvUH0gHmIlMdTu8Xs0YHeEsQZ
         4XGRT7+Nd0KvzuxMa2rtsD/9lmw+A2HXElkqx5iIFfselMg0FuOS6LyQfKDTrtLI12so
         w8d9x9Rt51o5mWI/Xze17H/Q0CAmwyVft2Umx+RGpAG33Fu0uj7YcwKKAyXjDodAryJT
         hJpm8hC5oco/hZWPqIFkmhLm0BCxkl/dyFZCmD1UeJtDyIoakzG3HiLSuxeXfUCCoXa1
         dRwbLDKurPD7rkfhK1oIbYNOvJ4Tdj0/BJ73bGWtt+i65adYpCwlwmCiQ0bJ/zrRlpkP
         PMBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739460211; x=1740065011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rPu4S32qezSc3KLY7SyMngOyXn0YoKwhtJNV1US/CBo=;
        b=lhLtygzCmoxU9ffgiOjZAsG0vlCAIkQD0qBIr/2s2izMjEiX2mnbY28YXLDAw90RAr
         LFAr+S7mYHHRqhkLs/C9fWO9ugYJDvxMrOixRWHPWs0I29C+ak9CljykRDhTWJGXLIVz
         DiqSYRAsnhc3cnWLPfNqahZQePh4118pFPrfrOV2U/VMfCOHuGGbWwIKhG9obQ8TqJx4
         pUK5T14NW/eXoW+XYkzB9OoJ0NXjYvzBBe2NqZGzjmcHCYXPHb4cU1r4AToyEOm5aqVP
         clC+9THQItBhRXNJ9FuixHtiRLigL3HsHGLPBjXJ/ecIjSgyDrJNkA1ZtulZ+2vBkNlo
         DHqw==
X-Gm-Message-State: AOJu0YxuVN0DIVCVSlRIcciqnOnV8ZICL0IV0aoanWCTpgMLUYfcZdzu
	JaNyoy15xhvlOajs+hKwSO3t7AMIfgcCc4WwAPgdaPArYytsQnQ9h/ffyQ==
X-Gm-Gg: ASbGnctUAGmcYxKK+zr4Pb03nrAmPThff0lXv23xju++66SJB+c57pBjQ9qfAeg4JSN
	tF47cvQNTqPeG9X6Rmo9IDk2psMMcKpafaPM2+TxZS7NO0jrBV5VCGJ/8mqUPICIBAQDbzsSc5Q
	VtOAs03XN3mGcMl813vzaB1lLcop19h6NksAUZMZ6wx/TXSpzwmiszo7xZZd6Sn9L2hRNSos3RD
	9txIp4mByICGFh4CiM6htius2MGPP4RYIg03JSAnXyOEJuo9vYOZKfZGAMgp+WgYnSmZ0qd68uN
	RNWyv8c4Evszi/iWL36mb13KRQgguNTYvprnMWauQUuS5Q==
X-Google-Smtp-Source: AGHT+IEFYFkr+KCcwgRfx/1N/pm8HUZAOerpsWqoqmV3mswxcT+9NANDutOLsoeryqHcrHSoLonNPQ==
X-Received: by 2002:a5d:6d88:0:b0:38d:b28f:564a with SMTP id ffacd0b85a97d-38dea26f160mr8718759f8f.21.1739460210924;
        Thu, 13 Feb 2025 07:23:30 -0800 (PST)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258b434fsm2223564f8f.16.2025.02.13.07.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 07:23:30 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Randy MacLeod <randy.macleod@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [OE-core][PATCH v12.1 4/5] dnf: Set SEQUOIA_CRYPTO_POLICY in wrapped tools
Date: Thu, 13 Feb 2025 16:23:23 +0100
Message-ID: <20250213152324.4016755-4-zboszor@gmail.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211353

Point to the crypto policy file	so dnf can work with signed packages.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-devtools/dnf/dnf_4.22.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/dnf/dnf_4.22.0.bb b/meta/recipes-devtools/dnf/dnf_4.22.0.bb
index f9d6ea1fa6..e5ac3c9824 100644
--- a/meta/recipes-devtools/dnf/dnf_4.22.0.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.22.0.bb
@@ -69,6 +69,7 @@ do_install:append() {
 # Direct dnf-native to read rpm configuration from our sysroot, not the one it was compiled in
 do_install:append:class-native() {
         create_wrapper ${D}/${bindir}/dnf \
+                SEQUOIA_CRYPTO_POLICY=${STAGING_DATADIR_NATIVE}/crypto-policies/back-ends/rpm-sequoia.config \
                 RPM_CONFIGDIR=${STAGING_LIBDIR_NATIVE}/rpm \
                 RPM_NO_CHROOT_FOR_SCRIPTS=1
 }
-- 
2.48.1


