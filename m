Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7681C369C1
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 17:00:25 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.25165.1744822824721578624
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Apr 2025 10:00:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N7aHS4k4;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-225df540edcso11302015ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 10:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744822824; x=1745427624; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wxoy0OWiTmwPs55g1EojcSbJRuQVhYg31B1Ry+WsjNQ=;
        b=N7aHS4k41fPLdPUFVuODrRoXCUimD/cu3Qma67dnI6IL0aSDRADvN46d8k95uzEHWr
         gUSOlodBtPFSnFHEpkBTls7k330G0HWpoFU4IscsNlpoLFwCc1bDgNanzBQvGKvEpnbZ
         myq1gtaqZXLEp6LNcOUDEULqnquA0X52IHsPrDcEzcPPGPHxftQDFzwVOWMEWn6MzYjb
         ewqhjoiBvYfGTJvwF14oVQKoDPAOfTbDY2bQeDsBxEPQ0jWITW7IFzWwOApvSFbZP9Au
         7K3oEFGwwOixKoEzlfD+u7KdzHJxg7yxuDFnMXjvAcfh2fqPz2xS2hoe0xtYb/bOAvur
         Hg/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744822824; x=1745427624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wxoy0OWiTmwPs55g1EojcSbJRuQVhYg31B1Ry+WsjNQ=;
        b=EVRH5QOB1XVKz/8G+ZFRY8pgGeIFHe4wo+wjmfeoTI2SCWWAqlKe9wHQWxE9GDKcew
         kHs3ns6G+coPFJVGVDOhG7iYuaopGivuH5tlbkmsNmHqaMXLjua9IsYx9NPkB7iErxD1
         iHjWKj8L22d9e3bUcnxfS67xqHxgxCTRA3RWL6uhujFMsHQAHgfsegpn2RCbwBXVL2ZT
         vF6IHgou6n/CJFAAALpUv/CZSCfgVzPCK0F5sgIIOag4qhCXlbZNwMthDANUmnHr7UJ6
         GXtN3JuDJA8eUjaqkgbEq4FgzmRikQkeTo96WmrbA4sKO4b4EhRbNJ0rE3scQpRUVL2s
         hh3Q==
X-Gm-Message-State: AOJu0YyZAf7dU0NtTTqMD13n+EDJ3mpaNr3Jr/Y+Mga+mjCKBBT8Vz6U
	tjwyW3ck0E5FzPbWdNoBkSBi9y37wM8gbN5xwaXmkeM8dfYYgNgtyymv40lD
X-Gm-Gg: ASbGncvZaUGRzYNrEZyGFkPQ/L06h3kRX10WazgKbPCwUuFT10Njtqx80nyrkR8QXg6
	0y1P4dAgOICKHvq7SerttGPV/8TJ1JH7trb82wFAVTDKljJvI8soab7GZYFw3WOEcuCWWk6chK+
	4DwZnH8aKHNeN5ABKy6vLCY32fu1cYRWWN0BTGt+xF/qbjjqL5q9YiEz2iQpGsqlZ5Es4SQ5hDp
	rBCQZpSWuDtgfEeewhj9r/e5h0nX8vI8iXd4XVPatVpYSc7YGFMahBQTj1QSQV0EXV8dOpxcV1a
	6hy8S4j7FK0EYqBfWvcrlPCi83UT+gnz
X-Google-Smtp-Source: AGHT+IEvZgMkzJa0GESlsiU35d/8Bq5BKAE9vwLS1X6w1RsdJnBjGwqiUrSbqNByMuF/nsDq+sxS5g==
X-Received: by 2002:a17:903:3b8c:b0:223:807f:7f92 with SMTP id d9443c01a7336-22c403a2d8amr3360265ad.20.1744822823800;
        Wed, 16 Apr 2025 10:00:23 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::c043])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd2199535sm11015613b3a.14.2025.04.16.10.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 10:00:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] python3-pdm-backend: upgrade 2.4.3 -> 2.4.4
Date: Wed, 16 Apr 2025 10:00:20 -0700
Message-ID: <20250416170020.2259697-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250416170020.2259697-1-raj.khem@gmail.com>
References: <20250416170020.2259697-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 17:00:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215004

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ython3-pdm-backend_2.4.3.bb => python3-pdm-backend_2.4.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pdm-backend_2.4.3.bb => python3-pdm-backend_2.4.4.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-pdm-backend_2.4.3.bb b/meta/recipes-devtools/python/python3-pdm-backend_2.4.4.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-pdm-backend_2.4.3.bb
rename to meta/recipes-devtools/python/python3-pdm-backend_2.4.4.bb
index 46440c9d5d9..71275f3ee84 100644
--- a/meta/recipes-devtools/python/python3-pdm-backend_2.4.3.bb
+++ b/meta/recipes-devtools/python/python3-pdm-backend_2.4.4.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4a564297b3c5b629a528b92fd8ff61ea"
 
-SRC_URI[sha256sum] = "dbd9047a7ac10d11a5227e97163b617ad5d665050476ff63867d971758200728"
+SRC_URI[sha256sum] = "f72551eeb319f74ca25856c24fb4026684eeb0dddd9df68482901ab0dc481258"
 
 inherit pypi python_setuptools_build_meta
 

