Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 415E1C02192
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 04:36:55 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.5027.1738730205177624822
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Feb 2025 20:36:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lIW/RY+K;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4361b0ec57aso64163905e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 20:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738730203; x=1739335003; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Z33boj7pGtYcolLkVuB2BN8XGLwwBhzBrRsmf6JH5g=;
        b=lIW/RY+K9VpvkzbsTxoCiffGA0q9NR+gd2WJU3P6iT5xnMYAdZ8Vm0ecGUDJv0iY0h
         Tjs6Cw/fhGum4gAJXaWliAqQJCE6FjGqBqPzAaXFIRW9NenH1wHKkrgX11yAn1YgqrD4
         jw1j53op1PvXALgQpAjf5uE2COksJOfccu+82m9JH/fRnjeeEdYrKwZ+g3vtRIO6/IeK
         BzXOqSgxv4LxZE+MEAUcr6d7sMFLVMK1MmHVkoHUHtRlmtr3BSG4Q+PKHeRzB/dYCMDf
         QZTlrDugkxbplK+oci79fmpbHLqQNyowP7uhCGd8Szawb2ADtBfotWe2RcWZZzXxdHJD
         duIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738730203; x=1739335003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Z33boj7pGtYcolLkVuB2BN8XGLwwBhzBrRsmf6JH5g=;
        b=V+qw7+8lpreaUqx40eCq7fm6hhGWPv2CoWc5E6IbCYWiLRje2Up7K7ipfnfIHVIJhG
         HTRQut+NNDX8Dtij2eFr6hC8CtG5L+T7f3VNgNxOgfSuIaCQUAIULL1mvREIW9E6DnZd
         yppX2rI4xvWDISlmvbCPJXLwjeUEq+AVYhZQD4qsyn/rBzJCTDqWSUK7r0G6Z8zswd2J
         lfBaKT84h/IF9lHai6ESF78nP0qjpyGDSteQxQqPUWLCDSXbvKcNgta4m3mBkpN3Rz0J
         8Rd2K4v0beXB9/YkDnIIZjgeCx0AqAacLOGmizSiZZ3Ni39ByIc3Z58qv9IMlaSPeP5U
         r7Mw==
X-Gm-Message-State: AOJu0YwW/vvGU2AqJNMsWxfa9VC6TnroNsN7/DvLF7bF3R1v9LcH/R3J
	+4KSByo5XU7p5EqZfmht8KukP/hn06Vm8nH7AzokAM1RP4OCJO0ib3SsKw==
X-Gm-Gg: ASbGncsyhW0Aohi/wvr2iMZbZSVNJlUgxNd+4NidTGDQeW7+xjvt1ubtMw4PR4ALIwQ
	GfdsZUOlMZZjEkFAd0XxjvzH77rEmkcNHGhU0iVrmQmSv7RHVH6Oa/rcOLAWkop4Icd/CW4auZU
	G0Kyj/kp19YPsC6f9NIfet0bw0gW+ajoGSxtLHoio9E1riPgrGc/iNqn5nNgGKqNdtCR8v3uVjO
	D2G35N8xi/tBZYO2gnWU5Pna3ADFIzs/aKvS05LIhuWoLaIdQjdDsMvww1AfDvU5cZMc2SEKQTW
	ItZ7DQVuYSvB2BXbmiUd/XfwsDhVUdeE9tqOTSWIXPFNww==
X-Google-Smtp-Source: AGHT+IG+qAEvuqgGe4x1e1Q5P4P16gmrtPdKooQFFzvVPsCNKjDuBJcDFRHiaBGD7sMgfOQhjeL7ug==
X-Received: by 2002:a05:600c:3511:b0:436:8a6f:b6db with SMTP id 5b1f17b1804b1-4390d55fc9bmr6136045e9.22.1738730202450;
        Tue, 04 Feb 2025 20:36:42 -0800 (PST)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390db1150csm8117865e9.39.2025.02.04.20.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 20:36:42 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Randy MacLeod <randy.macleod@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [OE-core][PATCH v6 2/3] sign_rpm.bbclass: Use the crypto policy file shipped by rpm-sequoia
Date: Wed,  5 Feb 2025 05:36:36 +0100
Message-ID: <20250205043637.2649428-2-zboszor@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250205043637.2649428-1-zboszor@gmail.com>
References: <20250205043637.2649428-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 04:36:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210827

Set SEQUOIA_CRYPTO_POLICY to the path of the crypto policy file
shipped by rpm-sequoia-native. This allows signing rpm packages
on hosts that do not have the crypto policy file for rpm-sequoia.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/classes/sign_rpm.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/sign_rpm.bbclass b/meta/classes/sign_rpm.bbclass
index ee0c4808fa..0bcd10d1f3 100644
--- a/meta/classes/sign_rpm.bbclass
+++ b/meta/classes/sign_rpm.bbclass
@@ -40,6 +40,9 @@ RPM_GPG_BACKEND ?= 'local'
 RPM_FILE_CHECKSUM_DIGEST ?= '8'
 RPM_GPG_SIGN_CHUNK ?= "${BB_NUMBER_THREADS}"
 
+# The file "rpm-sequoia.config" is shipped by rpm-sequoia[-native].
+# Use it to sign rpms.
+export SEQUOIA_CRYPTO_POLICY = "${RECIPE_SYSROOT_NATIVE}${sysconfdir}/crypto-policies/back-ends/rpm-sequoia.config"
 
 python () {
     if d.getVar('RPM_GPG_PASSPHRASE_FILE'):
-- 
2.48.1


