Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5598AC0015E
	for <webhook@archiver.kernel.org>; Tue, 11 Jul 2023 01:11:15 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web11.68.1689037871305594723
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jul 2023 18:11:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=cVjvjtCd;
 spf=pass (domain: baylibre.com, ip: 209.85.219.52, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-635e0e6b829so39550346d6.0
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 18:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689037870; x=1691629870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O3UY8+CKPFSyZIEwUp28Yj/Nn875TX+OOxQQ4p9YjsM=;
        b=cVjvjtCdmjNXkOFhbf1K+q6lMKfYR8mT4sOqcsI+tUU/MJpB8pTxVzED8giTd1FqIU
         vJFlC5XVFwhIjD2Fyc6BThNluY2hYp1BZT+W1XHJEjW6AuM86XLA4oFCL1rP8tcfm8Tx
         VwF6KuG+L2Z+rISIS4ZDzRxQAGI4No02boqYeuIBlpADqm7P1VDs9WaHLnod4K6xsdiz
         LZjxtuHKMdqvy5zPyPNPaqJKk4q80KMBIhlKMJRO7zlS00fJgmiuOr+A5GlYnfrFKCWN
         Wcx/zxTNBU21Gim9TLcNLouU12Du4D5emqdDpv8fnT/ecWFO1/GWP0S9vN/529zHTlRr
         6J2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689037870; x=1691629870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O3UY8+CKPFSyZIEwUp28Yj/Nn875TX+OOxQQ4p9YjsM=;
        b=Jk8qE+tPH2iB90gGx8PrJqLhv5cg+qsi68M6Z1UWebWtQlDRb7djaJfUJoau3aGWLF
         Mvuz42UQ2q6s7YXS6HB5haOanq2FDvNk3pUef+lskgKoGENZYk11QLdPh6f0zBjTbx7h
         gue8qY2gKipCHu1VPQ51y1TfJ2GX1V587PlYrOKyMWzOoMp57mZQe6ecMfTAKfmSr4m+
         IYQpYNQoCX0aOhasXmiSt+jUQtW20wGmjHk+aLB1oacnkUYFsMLSdDsTBTuhPZLt8Woj
         KdtyyvlTSB2JzXuvUzxZWAR/PD9tHy/bpxNokxWv8jkJEIFZgnsdmCEcD3nKQMCAJAjJ
         zHpA==
X-Gm-Message-State: ABy/qLYI6J7z4XPv9LS79wUvsr9kkhkqwzuqsZuUTBrx/LgNuvFnDWX4
	QkuOxVC1s1BLj5AG1FWROODmxxjuTjYpchoCH5Q=
X-Google-Smtp-Source: APBJJlHPLdB8mm16uJwVkBQ55MHw2IrHPYeh95izzUq9s5HwktzFlGMk6pf0CJWsAhuGcMq7IFuRRw==
X-Received: by 2002:a0c:e14d:0:b0:62d:ef41:b847 with SMTP id c13-20020a0ce14d000000b0062def41b847mr12015345qvl.14.1689037869972;
        Mon, 10 Jul 2023 18:11:09 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id h22-20020a05620a13f600b00767765561afsm427936qkl.106.2023.07.10.18.11.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 18:11:08 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 2/3] python3-dtschema: upgrade 2023.4 -> 2023.6.1
Date: Mon, 10 Jul 2023 21:11:03 -0400
Message-ID: <20230711011104.2807078-2-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230711011104.2807078-1-tgamblin@baylibre.com>
References: <20230711011104.2807078-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jul 2023 01:11:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184110

No changelog provided. Diff between versions:

08ab41a (tag: v2023.06.1, origin/master) Fix undocumented compatible check
90ce246 (tag: v2023.06) Revert "Partially Revert "dtschema: add nanoamp unit""
a4fe59b schemas: Allow 'fail' value for 'status'
1ea798a schemas: Allow 'status' for node names
2945ab5 schemas: Allow node names starting with number
33cbf96 schemas: Allow '/' in compatible strings
470b522 fixups: Handle 'multipleOf' keyword in schemas
6fc2e30 meta-schemas: Ensure "enum" contains only strings or integers
bd525a4 meta-schemas: Disallow 'binding' or 'schema' in schema 'title'
822ce6a schemas: cpu: Add some missing common properties
e3dfc1e schemas: Use 'oneOf' rather than if/then for *-supply properties
26b0e53 dtschema: Use format strings for printing
bc164f9 Split DTValidator class into 2 classes
4ddf315 meta-schemas: Ensure DT property names contain either an object or boolean
3db9af1 meta-schemas: add $defs schema checking
85e967f schemas: iio: add label
31cc52a dtschema: Move fixups to separate file
9e4dd3b dtschema: Drop unnecessary quote checking
41e1192 dtb: Drop unused pprint import

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...{python3-dtschema_2023.4.bb => python3-dtschema_2023.6.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dtschema_2023.4.bb => python3-dtschema_2023.6.1.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-dtschema_2023.4.bb b/meta/recipes-devtools/python/python3-dtschema_2023.6.1.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-dtschema_2023.4.bb
rename to meta/recipes-devtools/python/python3-dtschema_2023.6.1.bb
index f87563facd..38ff2714f2 100644
--- a/meta/recipes-devtools/python/python3-dtschema_2023.4.bb
+++ b/meta/recipes-devtools/python/python3-dtschema_2023.6.1.bb
@@ -7,7 +7,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "dtschema"
 
-SRC_URI[sha256sum] = "6daefb8f54403b4d82961b3346571200571747ab01950fd36c1f69950fa7a8cf"
+SRC_URI[sha256sum] = "d9dc11cea6a46ae2ee5ac4a5a1c7da7cb3704417cb390881820460f7c61eb784"
 
 DEPENDS += "python3-setuptools-scm-native"
 RDEPENDS:${PN} += "python3-ruamel-yaml python3-jsonschema python3-rfc3987"
-- 
2.41.0


