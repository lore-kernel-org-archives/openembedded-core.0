Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FE1CC02192
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 17:37:12 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.94314.1738604222186055032
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 09:37:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SSc0P7fO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4363ae65100so55734295e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 09:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738604220; x=1739209020; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vfwlh6fVY6VI7RNcZxMui0eHJ2PLoM+W565CMzrtw28=;
        b=SSc0P7fOh09zDKTySy08VruS4cjZFFPdtuuteCKecb5pyd+xMZ7Twma4vGUY1GU2+5
         Sb2nKXFbwqneQmF6dgJC1LpzBML1F7fjTg59qlcEFOsEoehMImTdusIaCQqOJfxxXif+
         hMm3FqSKGqLMxd3iBxvDbmXBTseweUcivqc/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738604220; x=1739209020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vfwlh6fVY6VI7RNcZxMui0eHJ2PLoM+W565CMzrtw28=;
        b=KMOe4i4mS5CniizXursr01/xsaxJVKujPYXlnb25e5m+cJlUuqCOYV1twyPLiT3K6Z
         ZmnKSG4oGr2weQBJMudXit4Monrua6hmWb0TLMwBblIYgc2cEt7VuzXK2VAG5/gvcJIC
         vnGcZsFKRH5ppn1Bg7WEHeCigcFl3y1pSLd3MfeScqvWrySREvObSLd3VYEhwBwzuNMd
         dAsx4AS2YfBVh6SwWvNRsY+eQyPYgBFgEBd53WfzW+SboFTeIp3s+pvDZC8i0b1iBYm9
         kZzR+waule8GxiP4qnHLf6tw6HMXO0HFhg4+a5x0ww+BBHRkiZt1TIhhSWE0gDSrPA+H
         yqRg==
X-Gm-Message-State: AOJu0YyiBsv0PlTmzzdl7JB7behkg6d1nziCQtrgxMGUyiG66aU3QylR
	WfZKQtuBtQVJKEz+N+QGPSulToZKHg3wKqfmVNEX0BsQXX+TOhkhCV4yKTWG7vKqN7cYoshFPpf
	F
X-Gm-Gg: ASbGncuAsg7rqu0vvtW1Im8BeYbuMJG2OH8kilSlZpzEdqW+MBKpCw1NK5Nb1nHNc7G
	86FduQQH16eumtqeoDwXXVX+s07hH72vVOwsahxfzJAv52p3UmGE3WYaM1jVcoSEbqRW75UPqfz
	7K6m0oi0Q8ccFMsuD1plsIVOJb0qj+9gmprtr/1xSGalGdylTxurIoZ1b4Tx6jcIp5lr/DvM/4b
	eeLSbtS5Nz76GvM/fc8Utx8cmNyDQZuPPSSyOeYvHinccXcnahgKGSwtsxHR89uP5PrjcFITUpH
	EMyEEWvSjzpb3RKz9Vi/ZSeKMIO2827uipGikbAZWiCz
X-Google-Smtp-Source: AGHT+IExUL7LpJu57eO3EdwUSnhr67bx2sXf7RgEXBqkr9mr9RbEYnPx6zq7wxaCVlkxoCa046rakA==
X-Received: by 2002:a05:600c:3b94:b0:434:ff45:cbbe with SMTP id 5b1f17b1804b1-438dc3cba35mr239349005e9.18.1738604220216;
        Mon, 03 Feb 2025 09:37:00 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:41c1:3919:865f:692c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e244f403sm161056515e9.25.2025.02.03.09.36.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 09:36:59 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] libpng: upgrade 1.6.44 -> 1.6.45
Date: Mon,  3 Feb 2025 17:36:54 +0000
Message-ID: <20250203173656.3412275-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250203173656.3412275-1-richard.purdie@linuxfoundation.org>
References: <20250203173656.3412275-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 17:37:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210722

License-Update: copyright years updated.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../libpng/{libpng_1.6.44.bb => libpng_1.6.45.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.44.bb => libpng_1.6.45.bb} (87%)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.44.bb b/meta/recipes-multimedia/libpng/libpng_1.6.45.bb
similarity index 87%
rename from meta/recipes-multimedia/libpng/libpng_1.6.44.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.45.bb
index dce4fadc476..11b56319ce9 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.44.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.45.bb
@@ -5,13 +5,13 @@ library for use in applications that read, create, and manipulate PNG \
 HOMEPAGE = "http://www.libpng.org/"
 SECTION = "libs"
 LICENSE = "Libpng"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=0fdbfbe10fc294a6fca24dc76134222a"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5516d77a3cf75f55a0d37254e3e65a20"
 DEPENDS = "zlib"
 
 LIBV = "16"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "60c4da1d5b7f0aa8d158da48e8f8afa9773c1c8baa5d21974df61f1886b8ce8e"
+SRC_URI[sha256sum] = "926485350139ffb51ef69760db35f78846c805fef3d59bfdcb2fba704663f370"
 
 MIRRORS += "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/ ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/older-releases/"
 

