Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B99FEB7ED8
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 16:48:47 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22982.1772642926856090964
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 08:48:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k5WRWfPT;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-415e568a7ecso988070fac.0
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 08:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772642926; x=1773247726; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0l9blCT/wsqpVcoJlBIomjEadTw/LWIOr1Fg6FyV5X0=;
        b=k5WRWfPTW7Bt2raLfydKVmPUv9N73UWAFGJymUMUOF5/BffPInHQ08o3mwMTLLlqxX
         sfArJWy3YMLewuH+fGZ10aw0uw3Ymg12Sy7hUjGvyF1RAz8fsCjn0L45pHgkrJPrtQa9
         F2EiJj6si48lfbSKU3eAWhlXr5Td41jgntnTGciSbJjB7ZQvrrNyfkh0W27cvki9JU0O
         HSf3JK4uN+qOfQL1R2efdZO928q2vR8uYt5sFh3lLsJlsknWiWUGQ96a6sDbQgGM4oJ4
         KOM5Ijx+KguYN2Ig84YZ//fs0N6TmrXXFoNrmykZ1IKNV3EUMXwkWsWzKxhC7yQkCKSY
         9rJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772642926; x=1773247726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0l9blCT/wsqpVcoJlBIomjEadTw/LWIOr1Fg6FyV5X0=;
        b=qeE0wfcs5fDNTOdg9yghPhTwsE3YwcKd0K0w/bPem/jbMNQJmGpCru61jzvFkjLUrc
         W2nPIHB9MGuObgZElBEAzEyQZishguz2oiHcJ+U4UY3VTH6KAxRio7VCSIyd20mR1gu/
         s7Vs6+LadaMQ4cHVkBnTgjvffxSJdMlrQmfmTcjPjxH2SedgcUYF71rYw1tdwUTCQE8G
         XJekQnAW1rGI8wmKgWFMKPH4p5wunWGk+D7eo5qch9Z+EEZ1UHNuN7c92SRg2Bc41Cxg
         /d5W8cL3IIPx89UojawfnqHct+zO1+cIJ9XlNLu/gEWHx9HG7pxkhR9Pdz7Ax+nTqrbd
         Ji+Q==
X-Gm-Message-State: AOJu0YxqdEkbU6N+74f9VH+WIAATbWWxN36AxIvAbej7PMVj4HCR349h
	KLQty0UOblYP+xLSD2E8hWSUziZywG9/IUYBcZzcI8VWRT9I9JTslV4qrQec8Q==
X-Gm-Gg: ATEYQzzG/nWF3CIHJt+socQyRFO8umCiTAm+cWAJXI6FrUK8ODvArZ1sfRUGvN0OZCd
	v6hUGwGI620MJRZBmLOp92psbWVscfZvgzhg39yrDbyFhDlg8RhtzU1mAxRhS/7gy/qsjGgreR8
	Nw89XPmPykQXVPA2LLHrQeuMCH9OMIeKgPaSXNeJ++oR5u1KvkOefAzCpuPXWbwg+e1He8Lz+tZ
	mxt/MqiaLyozV2mQVvju6AfXmVbnoWA2pTrBF2tPEQThizNJZc+kJd4b28AZQFdCFu9yJMq3osc
	910WqdMXsXjZXroLBtlzod+giT3MmQJJ24b9rt8X88GdVEh3jjKbgrHxiUPMatd8W+6V3r0zbFq
	mDDFytIXaZTTWKkULsRq3PW0Z1NhVhTN7Ppx65greI99AgPoaTPabE5BNpWARK5DWN+dPL2dse3
	xzbWUEE6NwtAdiEaH+bp/HCzmPlFrVUm4=
X-Received: by 2002:a05:6870:41d5:b0:3ec:4e22:bbb0 with SMTP id 586e51a60fabf-416ab5fc87amr1399828fac.18.1772642925842;
        Wed, 04 Mar 2026 08:48:45 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4200:11c0::f681])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4160d2c9fc2sm18466442fac.18.2026.03.04.08.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 08:48:45 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v5 10/13] dummy-sdk-package: Disable SPDX
Date: Wed,  4 Mar 2026 09:44:21 -0700
Message-ID: <20260304164835.3072507-11-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304164835.3072507-1-JPEWhacker@gmail.com>
References: <20260303004550.650726-1-JPEWhacker@gmail.com>
 <20260304164835.3072507-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 16:48:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232399

The dummy SDK packages do not need SPDX support, and since they play
some games with allarch that cause problems, it's simplest to disable
their SPDX output.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-core/meta/dummy-sdk-package.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/dummy-sdk-package.inc b/meta/recipes-core/meta/dummy-sdk-package.inc
index bf453cac9b..71e788b0b9 100644
--- a/meta/recipes-core/meta/dummy-sdk-package.inc
+++ b/meta/recipes-core/meta/dummy-sdk-package.inc
@@ -4,6 +4,7 @@ LICENSE = "MIT"
 PACKAGE_ARCH = "all"
 
 inherit allarch
+inherit nospdx
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-- 
2.53.0


