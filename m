Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E872C83F34
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 02:59:21 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.40265.1752721152888300277
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jul 2025 19:59:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ga7yOcn8;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-234c5b57557so3863875ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 19:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752721152; x=1753325952; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tTPLk5n5EB58ugzVcCBOhg0ueuX60io1ftZwLH041/c=;
        b=ga7yOcn8Ngrh3MoOjxfzv8WJ08bayFDxtCAFVGXjO8l2sNhVXxEnb0louqPvATrVAS
         +2GMmgxshFoJzmdZrwW3TVVe6nYCJsWfQEFzFptwA+w9GB2sItElTCEG0IKs8fSEpVW9
         PHjRcIjxLbrCmnJy0zvGr3ZChNZ9ccWRJDZ/3KZphWucNLF8UboNYxh5GSc42ocmJ0Z9
         62onf+h8GRUoanSJW8grgpECpPVMQ3C0ffw0R56q0kkOL1Hv/hbItuvzxRn/7N9blIJE
         FBIGdH47LAyTC4A6qHMPpz22q0TvcV4ok9X3Pu2JukLc2pXeZbt7p7MHlf9IPAnclnor
         jrnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752721152; x=1753325952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tTPLk5n5EB58ugzVcCBOhg0ueuX60io1ftZwLH041/c=;
        b=IbB54WxtSj4Xkbbt8shxYB7t6u7eZkOz5uaAYQstKQDGkakHuEaASnrVXUpInHCAS9
         ygZ3U3MtyIWtlit3qrKn/pwOts6DWSPOV9pa9juIGvrPyXeZnbb/owE6zlzRST5ieV9r
         NQ58w/ByPCl5cEZ+4UcAwN86NgfEoOPXbIfvlhqQXec7AcDERofrcr/J2LKI8Xjjxv8F
         y8tMWjTJfnT4+Hu1BXYF4gk0R9culQmp0fxsTFIneSTrxUOyd7GLRrY4RqwCbnLxfBZV
         /48UgO2dMx0hJAUepknef9k0e/Pk90/NVcpE9N+9B9nlipzBVpmYxfW2NpYqE+/t/y9S
         oGrg==
X-Gm-Message-State: AOJu0Yz56y+0d7PgcdOO6oltX6eCyJlGo1QMjtYz8P+jVmXDUW5Uin8e
	G7PioJSKvjaf2Z1BKlfDzA4gWvfXlYkBN4PApMgfCyqJQN11NWWlxJcKwDYP7wdBVoTanynjDQF
	ZWoKu
X-Gm-Gg: ASbGncupNsH6TPguL093lxA+EJeU/ewDGYkwmaZLxUgBhLDa8XpVcnIjVAqFdnOiAmT
	upy17W6uE8aRA61u1GzwwQopABzWIiwUW5a1ePObh0Mn07mRjX3EIVDzG7gTxVYsMIrkOMsFKAm
	H3HL0+m/ZCXSMWo0oCYu6QWLLe6K2bdZjx/67ak8+JdcYqrYwzIRxALTgzuCQcxEYIG8MkQw7TY
	LBb8aJpjjMtFnExX/UpKF1U9FaIudlV3mIJ7H84NtU3RZPJzQK+mnQAGYw8gCOR+IkHMSpuTLW8
	ymvakBV+At+cBA3XpkBgegcl7h+OHNnEQCxP50pXBzPhjBBVhUpQJU8k9nEG3Y4GuQw5LYGZ4TS
	/xC5S0jqlqm+0HQ==
X-Google-Smtp-Source: AGHT+IH5R69ZG5d8mtj181zB0iyRmWISeqvptm8onG/jCrJFbxYDk6PGjoZT/p5PFNhM9wX35w+d1A==
X-Received: by 2002:a17:903:228d:b0:235:ed02:288b with SMTP id d9443c01a7336-23e25730152mr74482335ad.30.1752721152067;
        Wed, 16 Jul 2025 19:59:12 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:3bfc:8fec:7e35:e96a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c9f29e313sm2204547a91.35.2025.07.16.19.59.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 19:59:11 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 02/12] python3: update CVE product
Date: Wed, 16 Jul 2025 19:58:50 -0700
Message-ID: <72369cd66f78a371608c3fff205e0e96c248f2b3.1752721028.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752721028.git.steve@sakoman.com>
References: <cover.1752721028.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 02:59:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220502

From: Peter Marko <peter.marko@siemens.com>

There are two "new" CVEs reported for python3, their CPEs are:
* CVE-2020-1171: cpe:2.3:a:microsoft:python:*:*:*:*:*:visual_studio_code:*:* (< 2020.5.0)
* CVE-2020-1192: cpe:2.3:a:microsoft:python:*:*:*:*:*:visual_studio_code:*:* (< 2020.5.0)
These are for "Visual Studio Code Python extension".

Solve this by addding CVE vendor to python CVE product to avoid
confusion with Microsoft as vendor.

Examining CVE DB for historical python entries shows:
sqlite> select vendor, product, count(*) from products where product = 'python' or product = 'cpython'
   ...> or product like 'python%3' group by vendor, product;
microsoft|python|2
python|python|1054
python_software_foundation|python|2

Note that this already shows that cpython product is not used, so
CVE-2023-33595 mentioned in 62598e1138f21a16d8b1cdd1cfe902aeed854c5c
was updated.
But let's keep it for future in case new CVE starts with that again.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/python/python3_3.12.11.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3_3.12.11.bb b/meta/recipes-devtools/python/python3_3.12.11.bb
index 706dabb5cd..84c4f74158 100644
--- a/meta/recipes-devtools/python/python3_3.12.11.bb
+++ b/meta/recipes-devtools/python/python3_3.12.11.bb
@@ -45,7 +45,7 @@ SRC_URI[sha256sum] = "c30bb24b7f1e9a19b11b55a546434f74e739bb4c271a3e3a80ff4380d4
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
 
-CVE_PRODUCT = "python cpython"
+CVE_PRODUCT = "python:python python_software_foundation:python cpython"
 
 CVE_STATUS[CVE-2007-4559] = "disputed: Upstream consider this expected behaviour"
 CVE_STATUS[CVE-2019-18348] = "not-applicable-config: This is not exploitable when glibc has CVE-2016-10739 fixed"
-- 
2.43.0


