Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A22CC4828D
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 15:47:27 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.24769.1707234447045522775
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Feb 2024 07:47:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=LyG8K9vy;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-295c8b795e2so4275107a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 07:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1707234446; x=1707839246; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7poiYhPVC6IIRFUEfbX2hme4ATBdpM0UtjfYXvUficM=;
        b=LyG8K9vy6pZhuK7Sxt4y8esB/0rVi4AUIc9ARJfAZ8qG/xdIJ+EKEjnhC1E1oE/Swe
         nAegRKedn2b0k6SOtZQWmOVUWrXjTJa31IcU9J7O2ggtxjeztwbhTwJf0AB9qiVEGGkq
         4/P8acTmdEg+s6fyKC0fdvyhlyGRJnii+vFMbG2D+Lxg+lHJS0Y1t4fGnhvMuHCYVab8
         eMysIjRgWcIuGmxtul7WUsdSFiysic3kqSRMX7sz7CHgOGVMONm/CBk6Pj8NTqO/h716
         YZvgfheVdPy+h3j2kOtcMn7Cdz43e+i/YXkAAJZPerPQhBV2Len0nqKzMKDa8TO/NGW1
         omsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707234446; x=1707839246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7poiYhPVC6IIRFUEfbX2hme4ATBdpM0UtjfYXvUficM=;
        b=A0Qzw035NV0E+WOmQRbljoF2biWKLvPnUmXx4a0iCz2b8DzxaRywAObEwWGY4lJdN2
         OuxQJBjh5/re6IrFUqvdqxe6gAFC+toN5KhnYzA9faZ5rlVIemKRQLmYmZDKYAPxwE+4
         IpF1lU7v141qHtOxr+W9yQ+pU/XJUBzpOhK+dEtMbwDAck+96zTgqE0tzDxUR7xN8Zp4
         fiyeC5zNNiuESdr9/TiYWiTE5pLkPdGKOnKZ+Mem/6Eb62F7G4B18XkWnnnK743w2jjK
         ljKDh4rhwQ98dmhBViCuA1PTPDRsQ07EpnsdISdm9SbJkMKarrMhrGEljKbLDzJRxT9x
         APzw==
X-Gm-Message-State: AOJu0YwCRJBEJV3FrsH/BDI/S0Cn4TJDn2yBYBsl+V2zOwr7rytzNyhH
	pRjFaxGG1rGk1KFPC9eUkfFn+Q+mnz3vKlfY8a5VyR86MKKeGcj6F/8S9kPx7HRUAu9h6OHRaRe
	xKvs=
X-Google-Smtp-Source: AGHT+IGaX6KfhuDVQKIkgRuFgi1DJ0ycGki683sxV1mhPJuCLvTvlAzkznHsN3yMP1kkU9AHxLeq6Q==
X-Received: by 2002:a17:90b:3ec9:b0:296:c695:4962 with SMTP id rm9-20020a17090b3ec900b00296c6954962mr2076351pjb.41.1707234446228;
        Tue, 06 Feb 2024 07:47:26 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id kx18-20020a17090b229200b0029454cca5c3sm1811452pjb.39.2024.02.06.07.47.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 07:47:25 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 6/7] gcc-shared-source: ignore CVE-2023-4039
Date: Tue,  6 Feb 2024 05:45:24 -1000
Message-Id: <04511734c6dc8c7dda3a943b385cd273d012d8c7.1707234215.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1707234215.git.steve@sakoman.com>
References: <cover.1707234215.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 15:47:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195005

From: Peter Marko <peter.marko@siemens.com>

Concept of gcc-source prevents cve-check to detect existing
CVE patch file.
So ignore this CVE in all recipes using gcc-source via this
include file.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/gcc/gcc-shared-source.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-shared-source.inc b/meta/recipes-devtools/gcc/gcc-shared-source.inc
index 03f520b093..7aa1c22bf0 100644
--- a/meta/recipes-devtools/gcc/gcc-shared-source.inc
+++ b/meta/recipes-devtools/gcc/gcc-shared-source.inc
@@ -19,3 +19,6 @@ do_deploy_source_date_epoch () {
 	cp -p $(dirname ${S})/$sde_file ${SDE_DEPLOYDIR}
 	cp -p $(dirname ${S})/$sde_file ${SDE_FILE}
 }
+
+# patch is available via gcc-source recipe
+CVE_CHECK_IGNORE += "CVE-2023-4039"
-- 
2.34.1


