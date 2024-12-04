Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68636E77175
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 17:54:45 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.21203.1733334885106681093
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 09:54:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=gePQivXI;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-7fd10cd5b1aso46468a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 09:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733334884; x=1733939684; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=odbSBHJr73ogjhiGW8IBVPsVNe4jPZnBnI3grSXL+/o=;
        b=gePQivXImoQChvZwYwPREApVgqOicdZ6CjYHO+6940g1+l8ixRj9mWsy7L+35w5qPf
         vxz6lSVsPxf/Lzs2FlVDZTeaO6RY/hQXKzTc/uiUS55HWmh0nQFmj80DOssu/vxXS7p1
         EAzxPeSOEL0jXw7lMymWD6+NyPnsfcWOPJVeZjBTmySWFsFtGKl4IaHRZL7whO2U0zqZ
         ggGcHl3Xi+AVRXgt1LFBukjyQK6/O6LxNhhnnoMwLlURYqaXFyKz2mGfmxh8FkyK7jj3
         hNDjWdhC6VK/VlZXnDItkCWCpkSm9x+ET0r4QOLlNyUIcpEp1TmmbmP9mRJoPLYvF00X
         FmNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733334884; x=1733939684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=odbSBHJr73ogjhiGW8IBVPsVNe4jPZnBnI3grSXL+/o=;
        b=JF7ABQD4YeAS2OYl+MY8o0lwihtYjP9eqla5yjZsPdxomWJyREmhe7PA8mzpf5m9LY
         lwsPLWwmUChAbnNrIVVIZUy/vUuB0MyOHd+ArR/CzqZEPjYOahOz1pl4MhtDZG7zJ4zj
         OaZmuLiGeskrTzCiYdYN3D63gIsuXciI2ebwU/SlwWNLRT1uk1HGyeyMrz8L3ROWx1Zr
         9LGc1y//j9raHGJ9oVUaseBWVMq9egUMIucWxJ67JjAOcfSEtTen+NOV4+3nQQzBP9Zb
         hdBh3yYQAWbI2PI29moKEg4oPZIA0L3ER3ZiKLP5GuKnwghGvUNtW8Gad85H8YIYUI0k
         nZKg==
X-Gm-Message-State: AOJu0YzlWFTWWKuNx8Ap6FoTf+3rx55/y5BVtod3yB2Iv3oHvs9aKWuk
	MTeVl28x5JurIhDmAULsCpPvxkhpq6W3Ble8bm7Q8liMf7UX+ekyleUnI+9+iR6u4jy29T/Nu35
	o
X-Gm-Gg: ASbGncvoxXhEfQBDSdkUHrKDudMjXK2bW21DKnGsSv3Z4ntA4Le6UULpaP+Ju7MdCtW
	C9EqjMpOzx9zNFvvb0djyqKX5vPXQ8GuXZyCoxo9571F66PuWE3vu4phvtbBfNOAvueQHK9X1yO
	xcPYkHKa5uEQ5h41dznrMqXI/Gzfc5/i61VB/VPXjV7+D0e9ok0Y/0R1SF67gl4nRm5DVNg3I3B
	IHfy38nl6Vz560Z9geafC/A4SQuUHBziVG7Lpg=
X-Google-Smtp-Source: AGHT+IHlqAO2pWG7T1K61GbMutaQe3bFW+Tqp6P6TsdvYfF29LAwBjvdGusxFW7NcsNcU+OVSikTow==
X-Received: by 2002:a05:6a20:7f8f:b0:1e0:d32f:24e2 with SMTP id adf61e73a8af0-1e16bef1948mr9549421637.38.1733334884375;
        Wed, 04 Dec 2024 09:54:44 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fc9c2d5af1sm11727765a12.16.2024.12.04.09.54.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 09:54:43 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 17/38] cpio: ignore CVE-2023-7216
Date: Wed,  4 Dec 2024 09:53:44 -0800
Message-Id: <50d8a653104abb9b5cd8a708a7bd97446e894bcf.1733334655.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733334655.git.steve@sakoman.com>
References: <cover.1733334655.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 17:54:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208300

From: Peter Marko <peter.marko@siemens.com>

Same was done in newer Yocto releases.
See commit See commit 0f2cd2bbaddba3b8c80d71db274bbcd941d0e60e

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/cpio/cpio_2.14.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/cpio/cpio_2.14.bb b/meta/recipes-extended/cpio/cpio_2.14.bb
index c0b97ee166..0fbab82cca 100644
--- a/meta/recipes-extended/cpio/cpio_2.14.bb
+++ b/meta/recipes-extended/cpio/cpio_2.14.bb
@@ -16,6 +16,8 @@ inherit autotools gettext texinfo
 
 # Issue applies to use of cpio in SUSE/OBS, doesn't apply to us
 CVE_CHECK_IGNORE += "CVE-2010-4226"
+# disputed: intended behaviour, see https://lists.gnu.org/archive/html/bug-cpio/2024-03/msg00000.html
+CVE_CHECK_IGNORE += "CVE-2023-7216"
 
 EXTRA_OECONF += "DEFAULT_RMT_DIR=${sbindir}"
 
-- 
2.34.1


