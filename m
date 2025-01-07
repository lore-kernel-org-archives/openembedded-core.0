Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FDD9E7719A
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 13:31:48 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.20209.1736256703515936665
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jan 2025 05:31:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=O4OKPqaa;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2166022c5caso201115785ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 05:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1736256703; x=1736861503; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gT8/pXjWIGaOEtjzH571QsIerGxHuzBbmxA+DxXysrQ=;
        b=O4OKPqaaDT8H1uzIWcn1rtkFC6Ke1eTP16RR2v8uywuN+8om7+ffok6YETzo63vQGw
         CyZTMz0XT4XnBjuPwxkD07RPVtqRaZVNgTJAsT2ciRSP52gjge+sJa2keyGAFZFAPq5V
         ov8LrzyDROpoDlmh+epE3Qv8pjITBo/DdClnm6PCvPlyl6Be931Y6fAWjo1b75HuF7M5
         sQpzbKCtRJpDsNonY++0RppO7N+lJTzSBMHv/PDfxP5uoIUyBVua4hEAH00v+i8Otb5V
         bCv2OKqsx6kjdr2kx6tlsOElf7lmBU7YJuAYkVA7Eb5KC/vCxhGkLwnzFrDs0gW7hKrh
         C0KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736256703; x=1736861503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gT8/pXjWIGaOEtjzH571QsIerGxHuzBbmxA+DxXysrQ=;
        b=c0PuMXqQ6oJppfoaGX3q+Ev4teq2gtlfUfwlkJZDHsfWLr2NyqrHdTbI5Q4a/bbl10
         mVVmiahfOG+zfa7/arISn/ktoTtquTIKYos9DoTv1q5P1vbqdPiuA3NbOrM9KeMPeCD1
         njcoQdYvTdZN+SXvm8Oe5oTIvamTuYKB2pDfA3TWVOLXH3ON1iU5IoMPslws8p0leOJq
         UNlBgLk6oW7oO+/D2enmFrgCib584LzCgwQV9QUhlYg5h+NQk52zlz8gfcJALgHelSq2
         CUNPI/2/8M7WXWGTLBJNfSM5PABzz3TciNlIKczvmJztKyYtYd6hedMsBKsAZOpv9X/m
         Aezg==
X-Gm-Message-State: AOJu0YzJMNktEX/svor1nWlg1wB/s4O8Vj6HuqpoqxrXWuYbkp0PD6AC
	996jiaxazO3XC19vM1iQmUhvgnRXLQv9cbfns6Y1WpTOEc7b3puIIu9TBw2QJ/ecNnT1n24cShJ
	5
X-Gm-Gg: ASbGncuwe8wPaVZPeSdQl4UNaRslJs4dAmCXfgh/IHo0jZn9btFV5o/sg0bissA2nDp
	e7wjNt8OxBeQv44Z/DhVQfhUuQk6qECTE4a17Tjzm4+H5Sn67c7MIJMfnpcRjO4+DfaESFNX12b
	10O+fEp/X1Pe5xNfypq9505+SrwiNEYnYaBCLhJKuwg9RlUoG9Knn3NMCw04dXzV2W0By6WkuvX
	Z3QezEffUpwoOFXRry60SKC0q+IukoFBCZ4lwQfGwbQow==
X-Google-Smtp-Source: AGHT+IGlBR2yceXYBFofx5bVw36LaRflga5Rmu0l/fs5hlku/ZcoMZYE6xOz92tEOPZLignlys6GUA==
X-Received: by 2002:a05:6a00:889:b0:71d:eb7d:20d5 with SMTP id d2e1a72fcca58-72abdd7b8fdmr107874852b3a.8.1736256702720;
        Tue, 07 Jan 2025 05:31:42 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8dbae4sm33340197b3a.96.2025.01.07.05.31.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 05:31:42 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/13] python3: upgrade 3.10.15 -> 3.10.16
Date: Tue,  7 Jan 2025 05:31:16 -0800
Message-ID: <5a611fbbdb3e373d379f922ffc5606ff70279831.1736256495.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1736256495.git.steve@sakoman.com>
References: <cover.1736256495.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 13:31:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209465

From: Peter Marko <peter.marko@siemens.com>

Handles CVE-2024-50602, CVE-2024-11168 and CVE-2024-9287.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../0001-Don-t-search-system-for-headers-libraries.patch        | 2 +-
 .../python/{python3_3.10.15.bb => python3_3.10.16.bb}           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3_3.10.15.bb => python3_3.10.16.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch b/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
index 5485020eb4..0086b1a0d6 100644
--- a/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
+++ b/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
@@ -14,7 +14,7 @@ diff --git a/setup.py b/setup.py
 index c190002..5ef368d 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -854,8 +854,8 @@ class PyBuildExt(build_ext):
+@@ -856,8 +856,8 @@ class PyBuildExt(build_ext):
              add_dir_to_list(self.compiler.include_dirs,
                              sysconfig.get_config_var("INCLUDEDIR"))
  
diff --git a/meta/recipes-devtools/python/python3_3.10.15.bb b/meta/recipes-devtools/python/python3_3.10.16.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.10.15.bb
rename to meta/recipes-devtools/python/python3_3.10.16.bb
index 0eb619dfa2..19a85a8770 100644
--- a/meta/recipes-devtools/python/python3_3.10.15.bb
+++ b/meta/recipes-devtools/python/python3_3.10.16.bb
@@ -44,7 +44,7 @@ SRC_URI:append:class-native = " \
            file://12-distutils-prefix-is-inside-staging-area.patch \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
-SRC_URI[sha256sum] = "aab0950817735172601879872d937c1e4928a57c409ae02369ec3d91dccebe79"
+SRC_URI[sha256sum] = "bfb249609990220491a1b92850a07135ed0831e41738cf681d63cf01b2a8fbd1"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.43.0


