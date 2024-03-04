Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D552C54E55
	for <webhook@archiver.kernel.org>; Mon,  4 Mar 2024 15:23:30 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.101494.1709565806481296267
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Mar 2024 07:23:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=imIjtmeh;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-29aa8c4710bso3321440a91.1
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Mar 2024 07:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1709565806; x=1710170606; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MsO+jZ1esW/vi28f+tIstnzjeXoJCE+eqLwSGuEZXVk=;
        b=imIjtmeh0JqzVCHgU8uqNnuzaqXtkcUuQcFpBymEQ4CBRo8NPMmaxzQAWaBOQEVQfX
         vmdQcNeLRbF4htr/t+XiJX9XHrsro1HxZ9LfC5IqzTEpLkCnHV9wHdC2SbXAZs7nyO//
         DLqUlnEvljKBItcRvjcqT/ECYN1mcr5EWizX0Qj1ks6KcKLpu8/yj/VawOIOuH8k+5SR
         KG65cBr8+2uamNg+pOEK8tWzbrTg5l9InbSYkl9G5LGioQRRvoOi8jvGyh74Yq55D3mP
         kSUeM7kIVoHYPbQsb0owdOaqDF6PqGNfmhKro7SOBqKMICu0I5Rz89W3Mxv3WqocfJND
         nwEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709565806; x=1710170606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MsO+jZ1esW/vi28f+tIstnzjeXoJCE+eqLwSGuEZXVk=;
        b=UGnmxNcsFfHCcrAQ3XPmImZBNQmwN+AMPjW7hdaRVUhm7X5gaa/NJSTW5GkNUe+XGZ
         JKhAyVU5wUcBDXRLPWGztpF+Gpef6NnEYg/3P4e2QgV3xJE1n0UrMWnOVC8uXYOKuD6a
         qyiMr4uAJLoV74DXZP5SiPgAlMHVdPWfPd/sS39rQ+OLjyju4OyxvguIhsQiAiSizvad
         sXKOkhXs1SxybMDNzaqlHeXqb4z3IEECnvjFQXUf0W8BTkH0Drh2e7xB4GZHvh562eHs
         V2/2wll2mZPtfA3liHa148KQyBpTNndFe2/k6OpOQX9NvatFnAWQJ6kOqGnddem7DF57
         19VQ==
X-Gm-Message-State: AOJu0YwzuJtpnrawZYkxOgVMDLjhlbVur8awmPMLujNruJTEVP8GeQvV
	D82pJQw9iP77v2nxo7LK/rRCDActWQD5iZAnF9K2X85IfUaQcgXCV249Jk+34v0Nia/6O7jEWlu
	v5xk=
X-Google-Smtp-Source: AGHT+IEh8yQEXcsN43AUd+As4qoxclcLez/1j8s2z7FgNoAgB6HwkjpHMVL3eln3cAbS9cqsN8h+kA==
X-Received: by 2002:a17:90b:50e:b0:29a:9dd1:d45b with SMTP id r14-20020a17090b050e00b0029a9dd1d45bmr11989556pjz.3.1709565805779;
        Mon, 04 Mar 2024 07:23:25 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id 1-20020a17090a0f0100b0029981c0d5c5sm8898968pjy.19.2024.03.04.07.23.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 07:23:25 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/11] glibc: ignore CVE-2023-0687
Date: Mon,  4 Mar 2024 05:23:07 -1000
Message-Id: <c8b30db7fcecc726fae87c8c49d4c01f0feeb2ab.1709565668.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1709565668.git.steve@sakoman.com>
References: <cover.1709565668.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Mar 2024 15:23:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196600

From: Peter Marko <peter.marko@siemens.com>

This CVE was backported to glibc 2.35 branch 9 months ago.
NVD recently updated CPE and it appeared in kirkstone cve reports.

https://sourceware.org/git/?p=glibc.git;a=log;h=refs/heads/release/2.35/master
gmon: Fix allocated buffer overflow (bug 29444)
https://sourceware.org/git/?p=glibc.git;a=commit;h=f2820e478c68a73a38f81512cc38beeee220212a

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glibc/glibc_2.35.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/glibc/glibc_2.35.bb
index 21cd99dfdd..3ec6610d01 100644
--- a/meta/recipes-core/glibc/glibc_2.35.bb
+++ b/meta/recipes-core/glibc/glibc_2.35.bb
@@ -24,7 +24,7 @@ CVE_CHECK_IGNORE += "CVE-2019-1010025"
 CVE_CHECK_IGNORE += "CVE-2023-4527"
 
 # To avoid these in cve-check reports since the recipe version did not change
-CVE_CHECK_IGNORE += "CVE-2023-4813 CVE-2023-4806 CVE-2023-4911 CVE-2023-5156"
+CVE_CHECK_IGNORE += "CVE-2023-0687 CVE-2023-4813 CVE-2023-4806 CVE-2023-4911 CVE-2023-5156"
 
 DEPENDS += "gperf-native bison-native"
 
-- 
2.34.1


