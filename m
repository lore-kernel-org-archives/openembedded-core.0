Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A2ABCCD183
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 13:24:19 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.43389.1760361856859089286
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Oct 2025 06:24:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=rMUWBsnP;
 spf=pass (domain: konsulko.com, ip: 209.85.128.53, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-46e4473d7f6so27000925e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 06:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1760361855; x=1760966655; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MzRgFkIShQDHEuCiKUEA3RS+RReGFfwW/8KcOGFTxJM=;
        b=rMUWBsnPrVYVg0sINxpqeyfDR0s+B4oS4eJpMUQwTx3GenNWPcrTUUaxWgeNMST7rN
         RZajAeYzVVrk+cBB7i6uwZkXvdNXlQfGYGDJ5hvd/hujVE3jVDtjmXbRHgzDttV67EXk
         VUC/X+425up5SW/X6WaXtltfeKnxJ0lJmQAzU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760361855; x=1760966655;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MzRgFkIShQDHEuCiKUEA3RS+RReGFfwW/8KcOGFTxJM=;
        b=u0xKC0EwzYAMSI+/qZBNMPIvandGP0PYRN39uyrDVXQ2CwbOao8aelTDwUIkHa+d7M
         lL4S/kkngiE+Yt3if/QdWEm6JsNiSF4S/KdkH0YaGq1XYeu5jXCICmftwDOnjTqMh4mU
         6wsLnaipYMezlh0PJ+xfzOL5nrc4x333wx4gdRur5YwWsRHQUtS9GI2BSssiJ4EuLpgr
         Iu/UnRW0BUeu7XhXhuAuxJ6xJH0ZnOIUJmcdVbVU3BEpdPI3oMGKhpd/DwRFBc9Wkw9W
         RcokNvR+RwcdOCLPDiZr4uJ8X4L4K17jcUFT54INjufkGllk8qXOhWvuJsSq5pnNybaT
         yIeQ==
X-Gm-Message-State: AOJu0YyoPSzm+P2Kr4bxzkbE1vY58k7xwDLM9yyh+7129Flg9OH/xTVl
	mavSKnKFgzjYBy2zTarVg0Vci0YSIsOLVVy2tEdLPow4FkQnHDSgz0NphM0AqBdbczIQZN99pTl
	XUUe7
X-Gm-Gg: ASbGncvwWBWGsM1QMGNQTjAufElQ+nz1vD/iPnlL0BfqbR5vljOqgu928kgcTtI74U8
	7AVMdR8haEzv8qI/tkMCmk8jqyQpnUR/Y1L091HKn+DNSeyeLmo8DTal6j0kWfQA0DlTsdoJCCR
	YFCjzJ4opE1EeX/HSr96vYRSf0f/tdHA1AAjueim2DhBfgqbQpdjll1sDvWVLTErcdnXSfTCcLz
	VaCU4k5A4N57ie/oEPDtETOyFKt3GyrXgQI6h+jmJngPsXdtVi0J7gguVGZI3fyJtVGDilnCEv3
	wR7dWIV/UUlU6WQvf7SD/ppFnyHBYCZYsTK723PYsh2giya3UJTHbYvdr8l9+PFZwYIkq5nY+QM
	Ly5HzFkHCJxbSK8cIuCx5ewNsYsBcptLjj0Zc+PA9w2c+66Kg8/ayTdWNev0EOlfBSQ==
X-Google-Smtp-Source: AGHT+IEXSU40DDK8ynPRgK+WxxZxMfa9qNb/4zmyvD9AbQrpizeTpnmWEw7Sj6lIi40oTLdargeOJA==
X-Received: by 2002:a05:600c:1d18:b0:46e:4c02:c2f9 with SMTP id 5b1f17b1804b1-46fa9b18e0emr157800365e9.36.1760361855007;
        Mon, 13 Oct 2025 06:24:15 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fab500706sm130394695e9.3.2025.10.13.06.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 06:24:14 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [PATCH] python3-idna: Upgrade 3.10 -> 3.11
Date: Mon, 13 Oct 2025 16:24:09 +0300
Message-ID: <20251013132409.2584147-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 13:24:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224785

Upgrade to release 3.11:

- Update to Unicode 16.0.0, including significant changes to UTS46
  processing. As a result of Unicode ending support for it,
  transitional processing no longer has an effect and returns the
  same result.
- Add support for Python 3.14, lowest supported version is
  Python 3.8.
- Various updates to packaging, including PEP 740 support.

License-Update: Update years

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-idna_3.10.bb => python3-idna_3.11.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-idna_3.10.bb => python3-idna_3.11.bb} (67%)

diff --git a/meta/recipes-devtools/python/python3-idna_3.10.bb b/meta/recipes-devtools/python/python3-idna_3.11.bb
similarity index 67%
rename from meta/recipes-devtools/python/python3-idna_3.10.bb
rename to meta/recipes-devtools/python/python3-idna_3.11.bb
index bd6529e720..de4595c1d4 100644
--- a/meta/recipes-devtools/python/python3-idna_3.10.bb
+++ b/meta/recipes-devtools/python/python3-idna_3.11.bb
@@ -1,9 +1,9 @@
 SUMMARY = "Internationalised Domain Names in Applications"
 HOMEPAGE = "https://github.com/kjd/idna"
 LICENSE = "BSD-3-Clause & Python-2.0 & Unicode-TOU"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=204c0612e40a4dd46012a78d02c80fb1"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=18a4795c19833413a7e2f1cb3cd3b143"
 
-SRC_URI[sha256sum] = "12f65c9b470abda6dc35cf8e63cc574b1c52b11df2c86030af0ac09b01b13ea9"
+SRC_URI[sha256sum] = "795dafcc9c04ed0c1fb032c2aa73654d8e8c5023a7df64a53f39190ada629902"
 
 inherit pypi python_flit_core ptest-python-pytest
 
-- 
2.47.3


