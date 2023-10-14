Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58C1DCDB465
	for <webhook@archiver.kernel.org>; Sat, 14 Oct 2023 21:45:31 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.75720.1697319929108908750
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Oct 2023 14:45:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=hoIHeoW9;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1c9a1762b43so26787055ad.1
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Oct 2023 14:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697319928; x=1697924728; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uMxgojyWLv+9ZKnY0PRUZCfuG3omo3KlvQa2ARPGFo0=;
        b=hoIHeoW9emPFg7MrWOtdDQw0VD2Akf/Nz23pHrYQFQ8w8OiRF3dfR0M+qnEk9a4gqh
         BUsUax12vUPAET0bxwKnPqKNbipKW8aU7kKK6jOXFctgVQEX0OmNHDf51VSz/Qw6XR/y
         wTL4Ea+zWdhTdCHOyBZ3U96O8c3rRUXbulYaoMfIzl1kEcmJvXQDIqcp4gQjzdj1jnVj
         1PpvBeMCoixSHlBqSlAGPjHrQj1YMp2vA9Itjo7h8V8G9T09c8WXcJKTrpK6c3BsS5yr
         LEuOkHawKgCh0yQlNWnoiA0+CP5H/31AsgEtZKd9EYsBPQr7XienGpj4NRIA+BLTlNQF
         f8JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697319928; x=1697924728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uMxgojyWLv+9ZKnY0PRUZCfuG3omo3KlvQa2ARPGFo0=;
        b=GLAna/VVu9kcuUnAKwPe5fQwbd8jO/edSQamCWtot59AyJlwwMkBOtKsmVZzoOHt/X
         uaGt/gnsWx2eYM1c+yMOmfKjQtXzvPTQJ5p2XMc5jPkEYWlKeNlc8NpIBfUjADYnZJtc
         GWyJ0lHcJSaqU/PoTsKgA53Nyvrre9dY7CXtYACi6GEcGaUITMMk5FlGuMbs4Ke4NlPA
         4ocOMjXLZTCYARv9USunz4m8jyJ/HAQcdVmErJjBAcWBJ6oibNzAwQ7xaLk9Fdq3XyB8
         GuMq324VV8u/fycIa6p7eeHAf5CWSR/NhAhNLaKg3GBn/+fRQDM3mfwaEYJoeVp823Cj
         MmMA==
X-Gm-Message-State: AOJu0YzUbh4+yfqnHxbReZwvo6Vutw1XI+OamUFCoWt+XNuOfu/IU7I8
	IhZG1o9RmVb+ldSVBwFQs26Ht6FvaMZEzY4DxO8=
X-Google-Smtp-Source: AGHT+IGT0/gRtTsBmE0eAfEt5u/heTs1HXsbmFII+JX8thsyiJDx5goipej+9mAwIELV6KIElLOVIg==
X-Received: by 2002:a17:902:ecc5:b0:1c9:d940:78ea with SMTP id a5-20020a170902ecc500b001c9d94078eamr12566292plh.22.1697319928260;
        Sat, 14 Oct 2023 14:45:28 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jf9-20020a170903268900b001c898328289sm5943411plb.158.2023.10.14.14.45.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Oct 2023 14:45:27 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/13] python3-urllib3: upgrade 1.26.10 -> 1.26.11
Date: Sat, 14 Oct 2023 11:44:52 -1000
Message-Id: <d83b4afc17839b6c11b540aabf056647ddacb587.1697319777.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697319777.git.steve@sakoman.com>
References: <cover.1697319777.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Oct 2023 21:45:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189131

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit dbe07ff87e2cb1a8276e69a43c7cdbb9ae6e5493)
Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{python3-urllib3_1.26.10.bb => python3-urllib3_1.26.11.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-urllib3_1.26.10.bb => python3-urllib3_1.26.11.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-urllib3_1.26.10.bb b/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-urllib3_1.26.10.bb
rename to meta/recipes-devtools/python/python3-urllib3_1.26.11.bb
index a8e2073d71..a8d47de0f4 100644
--- a/meta/recipes-devtools/python/python3-urllib3_1.26.10.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/shazow/urllib3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c2823cb995439c984fd62a973d79815c"
 
-SRC_URI[sha256sum] = "879ba4d1e89654d9769ce13121e0f94310ea32e8d2f8cf587b77c08bbcdb30d6"
+SRC_URI[sha256sum] = "ea6e8fb210b19d950fab93b60c9009226c63a28808bc8386e05301e25883ac0a"
 
 inherit pypi setuptools3
 
-- 
2.34.1


