Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48BF7D5C0D2
	for <webhook@archiver.kernel.org>; Fri,  8 Nov 2024 14:54:15 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.14265.1731077654716044826
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Nov 2024 06:54:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LIpjbOXL;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4314b316495so18597375e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Nov 2024 06:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731077653; x=1731682453; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xJv471NP7x3kRm7xRYoNtyDCWev9c2ujfaT+UuVXKpA=;
        b=LIpjbOXLJbJCTLFflzXw+KnZiLKAxYXKuvIpTbtvlOjVLGI6eh1uQVKS0nB6SsByBp
         fVG53PFMStJgMNLQ64a5TktD/cahtFTsAfGUyBBrd/SsR/qGMlYeOsuiZE3W/Xq1kVAl
         zqGYWx3I3gzM8B4BAdM+UFMXSkyPy2eauQcHHWSKSkmoNATbQbrAHjgvMZAWtj/QpZZc
         VvZ1ayDiiacvi5lSE/luklO3yA/l5Q32pYTywgiaU2X3ZLCAb28hnYeb7XooAmXZ1Hqc
         5rvdUX4pjbSlnCggztkcaxhLqT4wgW3xQU2lL2gcVgG2L+NWEqqOOFnJkBPF1/3yAvuu
         +Dtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731077653; x=1731682453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xJv471NP7x3kRm7xRYoNtyDCWev9c2ujfaT+UuVXKpA=;
        b=BHTPL8OJuYh/ILNGU27eRo2Dt4wm6kZDxRKPSflHZWBgX0i4NS1hcspTLq/aDENWWO
         sOlhfhPVlKaYOTdmwXnPCKeV4nmff8vdxZhVN663FTM4j/KSdEOA222ZPygWpGhlOpIq
         NQgXAXeqzZoDi/ll5uDGs0+Z77rQxCC+20ShGKLeSz3Cl/F0dMxxW7oYWOxkzOD8cdQ3
         3vSCm+Qppl+2kaxMv3O7nrzDAwkwtIwr58Szik2uC8qlvPBaRmO8aRu/wXXGjaw+hGjF
         TIHDS109+IwzOnRBE3j4V7kZW2Pg9Go4RjuceA4d54nBtAO+/nGgCWWiaiXO5YVTeHNO
         8UEw==
X-Gm-Message-State: AOJu0YzI/tBSZEWDB1tfEExPu3IUiEKRCxQKezZWV/aBe4DVzFgjeNyV
	oO1I5QHjeEqei2PfmFjoK+snzuzw28/7PAdgkHFUlBvP5KEVlkIr9OPidg==
X-Google-Smtp-Source: AGHT+IEYlpOrUUw13c051k2T7zC/jVQa00s+EuHbgIBZ9XE8IvuxRF+vIvFYSDRnWBjEruYFn8jvvg==
X-Received: by 2002:a05:600c:4f04:b0:431:5194:1687 with SMTP id 5b1f17b1804b1-432b7509722mr27194015e9.18.1731077652988;
        Fri, 08 Nov 2024 06:54:12 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432aa6c1298sm106622835e9.24.2024.11.08.06.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 06:54:12 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [kirkstone][PATCH 09/12] pseudo: Update to pull in python 3.12+ fix
Date: Fri,  8 Nov 2024 15:53:33 +0100
Message-ID: <20241108145336.224466-9-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241108145336.224466-1-martin.jansa@gmail.com>
References: <20241108145336.224466-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Nov 2024 14:54:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206883

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Pull in a fix which avoids syntax warnings with python 3.12.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 5a7ccb5761..50c3b59975 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -14,7 +14,7 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "0d292df61aeb886ae8ca33d9edc3b6d0ff5c0f0f"
+SRCREV = "e11ae91da7d0711f5e33ea9dfbf1875dde3c1734"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.47.0


