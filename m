Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C999FD4F1F
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 18:41:24 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2668.1773168075053632632
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Mar 2026 11:41:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZKCW6v5B;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-46702742c7dso667580b6e.1
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 11:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773168074; x=1773772874; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AOEUATX1R3zaee+T2FPZecNpF7K6G1L1mqigJuVHEzo=;
        b=ZKCW6v5BaG4sG7JQvP/XSEc8fhKco1L4iEle9DoAwSVLwbhw8PO5m63Lc3glqjqU9T
         MuG7FFHcHD5yd9w+74QcIovK7CPQNQZSSC7FSYXR7nvPBDY1Wjik+jk3wYCPmTIIKfK6
         jIZlNPbgKEjhiv+ebEFyfo+2B/5hi8UWuLlCqgn4fM7QW0K0e29w6uMCg+raOv6G2Wkj
         K9rQMoGGuerExbqcm/8zkBWBMVyIt81Sg0b6qzmOMq6dc4nbQLXp8Dx2h6elzp+emXzD
         BKxr4cUe2SneRiOxRjRERuxLuXAQfeTPWEwIGQwtLsO5HHUHX4BQRw+CxSCrMQDjcrQa
         0riQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773168074; x=1773772874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AOEUATX1R3zaee+T2FPZecNpF7K6G1L1mqigJuVHEzo=;
        b=XnnWgVSg3qhXIhLysQT6aHjHeDFOIkC+m/CXOBg/FhU/0iB/o67M/caiWsM6CDoWTC
         pLVbaTsLEU/mU19F1ujmBpQWEbxpGs1s3sakk9CCkFQxp0IdsTzQD4xTpEwU8VM6SMV4
         XPj43JoTFC7JWt3HwLfOJCnBjde2HearBh8Htffkwd/N1Bfskvvnwf5d4oKzQriCVYJw
         L6TlD1dEiRkaEf4rBDnRZRR15ieaCiGm2x6wYlsKoAwjhqluKTlc3OEzaEAL3hI23wxu
         45KyRQRbEAHYx2RttB3wRPLWF2+rQi50OKofi53UpAldXhwD0mm5xRyzVDlQy5zdevzT
         7Y7w==
X-Gm-Message-State: AOJu0YyyZw/GIW+jGToYId3/Vk/yEHX/UaslkAEX4UOuwnj99vGHBZ5j
	Zmd//cjWvJXPmd9WOOTXFT4EiOWegj21/KmQESj9Q4fQQDxlDwtrd3ZSTkKntg==
X-Gm-Gg: ATEYQzxnusTHUBpEG/C+JQ8k/mfU7YcOvTBHcuJOfPTglxmQlaDrP/9SogLyp8j3p8p
	spGLujNAkjBzWftQCY2noyQSV3b6I5oL9zrGCuh7MJJVc/100rHcNpX+vSvx5stbneZpi2sgSL9
	QIjy6uc7khwUx9roc3QrA/W5bnt+hwghcHZxSwqPEJOvvzw7bTwvOB4XwaXXOLhrjsHQV2k80bh
	glLWcQD2qAIzQjvohIxXFKpM1PUK12WBFv3cPemmYEXV4DFzTvHj/0hYi/3FpfQ9YpYwj27jKFq
	ToIfqS8MyF2453ofnBv2hPjKz2NBwZfNONu+JnJ8UBC36yEtEp8T60WzAi0+wHKvpb06mumovGr
	e+7qGFtJvojFH7uLlr9KWAjg3pzlxQRGNw7dTXAXnFRqyQ3nKk3AqJRcae65F6I3jOm/E7FEyL1
	4O+jTWscbUFGfccWCAOUAD
X-Received: by 2002:a05:6808:1b0e:b0:467:2020:cae9 with SMTP id 5614622812f47-4672020e208mr1909172b6e.2.1773168074156;
        Tue, 10 Mar 2026 11:41:14 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4200:11c0::9891])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4671d2a7ebfsm2444524b6e.20.2026.03.10.11.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 11:41:13 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v6 13/15] glibc-testsuite: Do not generate SPDX
Date: Tue, 10 Mar 2026 12:38:33 -0600
Message-ID: <20260310184058.533343-14-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310184058.533343-1-JPEWhacker@gmail.com>
References: <20260304164835.3072507-1-JPEWhacker@gmail.com>
 <20260310184058.533343-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 18:41:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232824

glibc-testsuite does not run on target or factor into the build supply
chain, since its purpose is run tests in Qemu at build time

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-core/glibc/glibc-testsuite_2.42.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/glibc/glibc-testsuite_2.42.bb b/meta/recipes-core/glibc/glibc-testsuite_2.42.bb
index 6477612feb..1a83a09802 100644
--- a/meta/recipes-core/glibc/glibc-testsuite_2.42.bb
+++ b/meta/recipes-core/glibc/glibc-testsuite_2.42.bb
@@ -32,6 +32,7 @@ do_check:append () {
 }
 
 inherit nopackages
+inherit nospdx
 deltask do_stash_locale
 deltask do_install
 deltask do_populate_sysroot
-- 
2.53.0


