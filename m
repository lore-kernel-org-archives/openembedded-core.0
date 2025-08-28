Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F229CA0FF7
	for <webhook@archiver.kernel.org>; Thu, 28 Aug 2025 18:13:51 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.4442.1756404828483007914
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Aug 2025 11:13:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=DmCwL8wT;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45a1b066b5eso7357745e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 11:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1756404826; x=1757009626; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y7r0NU2THxDOSXBCWwQ+TliGgfU2udJP5Al3hVcEGCY=;
        b=DmCwL8wTj654sQJH7wGXpoahDMaNDmxLh5TSqj3ehWExZBD+E5mTfEZ6ABWl4QNuif
         Sv1yCafY3U+26kVn/W6aCt9V+xQvkgmAAmeRy5V+uYmGvWFBLeVe/O0fm95F0RWqJZeI
         CZKWPqqlNMAOWBIyzX6vNXoXWt4DpYPZ/PlhU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756404826; x=1757009626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y7r0NU2THxDOSXBCWwQ+TliGgfU2udJP5Al3hVcEGCY=;
        b=Bny7wswuftdSIYboZOL7TXk0M4j7gH7NVw0hzNJ9iLfNRllJXx+2Lvkkcyrkqlh0Bg
         3Iy2RISwcG3ZUe2eSaRvua8n4v0YCFhD38ewZ0CaS8RJW6luo25CbO4Z3sTQxPc1Nrea
         PTkjza/AJF7C/2GUOZfJIHagUEP9zljea4hDPPqf8lOYtEu4jb6w67RAeEcH1GIQmVht
         gq9lGMJW2RbU4yXj6LIKq5/ivvpW8Pswxu1Ju41zHZEHtvYBiMKzrHOlHQflYSayow81
         qDrPdmWKKNlDuw8SK92I81W1sS0UG7bKXOsz/aDXIoVykCHJcorkKX/onTQgvFsLBkE0
         mF7w==
X-Gm-Message-State: AOJu0YzF92NVBGdj7/zNyoi3+etaT2y9sOscFRIV08UZ7HlWh/GtcqRv
	IBJ0QXU7UY8fZVVVRt4HOaZfgzz1l2skOL1HKR1s5JWtg/UfWft8wAcxpqIcXs+LC0pESs7PUwa
	VXkPo
X-Gm-Gg: ASbGnctSZFmAxbCEZCX2YhAw+wSh7K/bcqRe3FmP0Qjc3y3CJoLRbufsV0fSXBH7Jtk
	kvTSt/tyTWJhLhQh4aAg6amSkrfSwabrClixJvJKQzC/uinCc3RXlMq37toTxT1RU4R1KtgrfRi
	GgagxwK8Hb9g1WoOdPNmsa8iO9++Ev6HMiTupm1kXhqGbLFoi+VMPZBnyR0kXgnb4xbNH08pOIq
	VEH21n2Cdj7kRQ0K2cZcfo55+GElXhFJ1vCeu9EtiCYRUpGY5dTpJT///n31nuTpvvW+UXkb6a+
	1F70S22bWb4RQp3Zr1KS2iLx0KhxUrbe5c3dokSDdp8CTMX6SoEW8lnwQPSkTyn8VrCVhqwslR8
	ouLTnq2hjSTWP1bjSUTFX04BuWDRL8jgjZTiEjhSVspsgQwRs/9Q43+N7t/VMAwNl6dLFGHSjEq
	hCI3k/iPRe2M1OKn7+sCyi0Vdc+HS2
X-Google-Smtp-Source: AGHT+IFslRfoAHpCHPUxi7EK99/oQiF1zyDtqMsz25QcLpSFsJdB6FgJDcaNfTDPU2AqpXVQnEmVtg==
X-Received: by 2002:a05:600c:4e90:b0:458:a559:a693 with SMTP id 5b1f17b1804b1-45b517b957emr231965875e9.18.1756404826305;
        Thu, 28 Aug 2025 11:13:46 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.local (2a02-8440-8200-223f-aa73-038a-bc54-ae8d.rev.sfr.net. [2a02:8440:8200:223f:aa73:38a:bc54:ae8d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf33adf1e2sm222976f8f.34.2025.08.28.11.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 11:13:45 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH v2 2/2] rpm-sequoia: remove rc initialisation from run-ptest
Date: Thu, 28 Aug 2025 20:13:24 +0200
Message-Id: <20250828181324.3147715-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250828181324.3147715-1-yoann.congal@smile.fr>
References: <20250828181324.3147715-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 18:13:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222590

From: Yoann Congal <yoann.congal@smile.fr>

With the previous patch "ptest-cargo: move run-ptest rc variable
initialisation", rc is initialised by the ptest-cargo class.
Remove the (now) redundant initialisation and the related comment.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/rpm-sequoia/files/run-ptest | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta/recipes-devtools/rpm-sequoia/files/run-ptest b/meta/recipes-devtools/rpm-sequoia/files/run-ptest
index 83e59b8031..36adfba7b4 100644
--- a/meta/recipes-devtools/rpm-sequoia/files/run-ptest
+++ b/meta/recipes-devtools/rpm-sequoia/files/run-ptest
@@ -7,9 +7,4 @@
 # The test that ptest-cargo class generates requires the
 # TEST_DONT_BUILD_LIB environment variable to be set before
 # it would be executed, and this is what this script does.
-# The "rc" variable is used by the script generated by
-# ptest-cargo, and is expected to exist, in case the
-# run-test script exists, and not created by that class.
-
-rc=0
 export TEST_DONT_BUILD_LIB=1

