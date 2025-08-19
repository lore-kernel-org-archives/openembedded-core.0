Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DF87CA0EE6
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 11:57:03 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.12184.1755604616931909877
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Aug 2025 04:56:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c0uWYfDB;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3b9ba300cb9so3259235f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 04:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755604615; x=1756209415; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qyjoIfjTAr746JTqxQT1GBCIbXbzpCsZ7ugpn7eeR+A=;
        b=c0uWYfDBYOJ6H3Wl6P7HNoPKyNVDYqFqQ5EpRGutnxFZ0wvgfqCezZE3MeGseIzy1W
         6CZWLHuKiYHtAg7C6NlruFATT9WP7BuxbLlTXLvMj3KgDZ5F+LQmRI43agmju7b6squl
         vGfaRcp2suLktRUox4a+tpfYFvt/GYLlNYRGRf6QUzW2x3XIhu2eHCpiUY0sFDPVmeu8
         Rhdr7iU8NQyLzseqohQKQoJT47bQzJvO/+4y0qTwlpgM8poTP+WxrFxQJbL8ebQ1ncDv
         Be8seMtNVezT8m5AATFRa/oeUrW2OaRdT8PscDBzi5IQd/gL7JUpgfO/0Fbjlmxflah2
         We8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755604615; x=1756209415;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qyjoIfjTAr746JTqxQT1GBCIbXbzpCsZ7ugpn7eeR+A=;
        b=ASfpzuujm0vWgzxMDm5JgGXH4lumYMSalTQW/zu5n+kiX5OOwZH5mk/kz5bOZxFtLl
         cjRomB011kcGjJtEnr+YzVEwyj24EcCe/fZFGtgpzNUKP3C+cIocMYD/Jccdhhn4TQr2
         fDHdncXGKugl+u7/VUhITky8392pqbLYqRERh18RffuHFR08YSyECVOryDtGoyiTcijX
         3Fm93wBTtk+doKCyeKHp0eE6t+Ayl52QHb5dvAyT/dRUoe8hA8pJefEIOi5T99dcDDVk
         7p16xvd8Cg4gksS1qlETMoUCy+VivCGWCj76fXz17zyy3AdZMw8E8M/X0k0XAX9g9t14
         wkLQ==
X-Gm-Message-State: AOJu0YxbDwPVnq/JJYDMPYvAapXC3hFr4b0PGVijzeK11xJBsgDGP6ns
	YXy0/I7bH894h6EWH+OvsSlqXufbQ5cBiSAsTPELzWhXX2bweeXADvktRkpFqg==
X-Gm-Gg: ASbGncupZ2nW5hlG+XlBiQBr1ROW2kdsms2iRPAUTHw1n4sdGTTeavUcynQQgxDlSPL
	TLM2KxCIT9/jBxPbrL92EOyAtBhqlebzUAvYOr5HxKzhSEyGOLX2s91ga59K2ncV/PILBABAYI3
	XrWVaQzivHWOSwe6d6TnwPfozyi6ztLiiIpftPRiodskxcwLxbtKqjHuDf8xdHeAejk3n+OCReE
	7wRU0fYJDxnO7uJV21eXvY87lW+K1BLxVfo0c2QQx719/fV58VMuE5Vdf7FM9kkjLQ/sdxYmATv
	SXRKCGNOR1SHwxZzJTHERzvXScLIMiO0eOhxQGfZcHFtDkyV47W0YKfikstdo6TtLKKH421grls
	oupCCvfc1czGOYKE83p9xf0i3AOBe2aYHg1fmEFFno/3IhpJZRVPWrPRCESc=
X-Google-Smtp-Source: AGHT+IFDzXERktir0Gk+jzJTGYTwT5wdRO/vel51jCTZtcFsO388ZEh+s9fsU2oIrxnFw9Dt2g1QFQ==
X-Received: by 2002:a05:6000:2909:b0:3b6:d0d:79c1 with SMTP id ffacd0b85a97d-3c12add3401mr1854599f8f.10.1755604615036;
        Tue, 19 Aug 2025 04:56:55 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c6cd044sm223676985e9.9.2025.08.19.04.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 04:56:54 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v3 1/2] goarch.bbclass: do not leak TUNE_FEATURES into crosssdk task signatures
Date: Tue, 19 Aug 2025 13:56:50 +0200
Message-Id: <20250819115651.3725293-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 11:57:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222104

From: Alexander Kanavin <alex@linutronix.de>

The default assignments look like this:
TARGET_GO386 = "${@go_map_386(d.getVar('TARGET_ARCH'), d.getVar('TUNE_FEATURES'), d)}"

TUNE_FEATURES is a target-specific variable, and so should be used
only for target builds. The change is similar to what is already done
for native packages.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-recipe/goarch.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes-recipe/goarch.bbclass b/meta/classes-recipe/goarch.bbclass
index 1ebe03864fe..0e9ef3a6ec6 100644
--- a/meta/classes-recipe/goarch.bbclass
+++ b/meta/classes-recipe/goarch.bbclass
@@ -24,6 +24,9 @@ TARGET_GOMIPS = "${@go_map_mips(d.getVar('TARGET_ARCH'), d.getVar('TUNE_FEATURES
 TARGET_GOARM:class-native = "7"
 TARGET_GO386:class-native = "sse2"
 TARGET_GOMIPS:class-native = "hardfloat"
+TARGET_GOARM:class-crosssdk = "7"
+TARGET_GO386:class-crosssdk = "sse2"
+TARGET_GOMIPS:class-crosssdk = "hardfloat"
 TARGET_GOTUPLE = "${TARGET_GOOS}_${TARGET_GOARCH}"
 GO_BUILD_BINDIR = "${@['bin/${HOST_GOTUPLE}','bin'][d.getVar('BUILD_GOTUPLE') == d.getVar('HOST_GOTUPLE')]}"
 
-- 
2.39.5


