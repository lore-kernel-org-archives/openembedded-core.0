Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD046C35FF7
	for <webhook@archiver.kernel.org>; Sun, 16 Mar 2025 16:12:42 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.31721.1742141560377756082
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Mar 2025 09:12:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BRX4D4oX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cf034d4abso15232595e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 09:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742141558; x=1742746358; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9o1CoL/7wSzniB4can/XP6nQ3Mglas9xSkLxm7Ctgmo=;
        b=BRX4D4oXGt9BY3mFY2UJTH+0jjoKcKiaCkO2qLML7Naoe7PTq7E6bBk8/2N9j8Vz+2
         7akrumUM67Qx1RhlzyUVitRNTGENQ0AtAWUHL95Nrw0IwGf7zsUTwGkO4/C3LcT8cQIz
         11zg9PVsXFRy+Z4F3GD9V046p+ulIaPhn5JMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742141558; x=1742746358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9o1CoL/7wSzniB4can/XP6nQ3Mglas9xSkLxm7Ctgmo=;
        b=Jks/rZh82ikcWj65Pv1sERrkifMjRNAgjTEmfbhQVX6PtODwZ0PPTgj/YPwruRrWLv
         tJLyA5QcYVQe4ziz/9ZgovshjIskFv0mbTb/5clWlsKUMxfhcW+xfOr+98i9vklHABQb
         bmiWgwSDV1AQCz7OHOc1I/X6KF1s1tFs7RqNfr1m78MsODI74mrVKAM3+RN0Qa04oeXX
         93F5Tl21h7CeUvOsVtmA2xP4uS7zZD/O8bjaTM9zqFmi0B3x5UGDJ/P6om1vIC0feJx6
         8xHs1PTKzkwNnnqFul6QaAxKA9EV06Tprh+J1+qrxhoqapZtufqxH6AWclkhVLweQCUR
         /0FA==
X-Gm-Message-State: AOJu0Yyq23/r4k2xSAf8jWwb5+2l/chpmg4LYV7fPdyrIbHd+NcOZEo/
	AZC6ewKR878NthpDUcqPZi/f7VeTKASqlSgbiLxoYuzPOp6LGypIHkSARsPdw4z3TZbRLhAAUj1
	v
X-Gm-Gg: ASbGncs2Aza2kUtsATxo84Lz9Bba4bP7x22n61pzemRgOwPTpSTMUY2X6oZbIOBOmTf
	gKg/WDG+vgSYr451z80Q9YylRLGRX0REtIEQmZS9c5+Jg9PnFJv0xFL/XijVs0L+DfZ7W1lz5ra
	mCIfpocHyMlPzpAygNLxeNtGLUqao31HknHbEDPZgNcIcjAJek0kumrI07Ffzm9G1ovZACl41b3
	NCsn268/K4yE4C1dto0zYbvLwEm7D+/HDBTPTeSm49TMCiec9mf5kdcSomJntaQ3CvY532AVkjJ
	Z5n7d34yDHbpkXCZ2W3EIRgI18fJ+e4r+k6eTZa7fXQbc53P61xsWC9Ik0WcBIg4e+IR5m85IA=
	=
X-Google-Smtp-Source: AGHT+IGlv3w0YrhvzZsaLpaBBrMXahmSUGuWGCoSGfhK6OgWofdm9Q6XMrWdkIY3/nORA3ec+vCHbg==
X-Received: by 2002:a05:600c:4f41:b0:43c:e7a7:aea0 with SMTP id 5b1f17b1804b1-43d1ecd94b6mr94734345e9.26.1742141558225;
        Sun, 16 Mar 2025 09:12:38 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:bead:7cef:d139:9ec0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d200faebbsm80252225e9.30.2025.03.16.09.12.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 09:12:37 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 19/43] python3-attrs: upgrade 25.1.0 -> 25.3.0
Date: Sun, 16 Mar 2025 16:11:45 +0000
Message-ID: <20250316161209.3629986-19-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
References: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 16:12:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213022

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/{python3-attrs_25.1.0.bb => python3-attrs_25.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-attrs_25.1.0.bb => python3-attrs_25.3.0.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-attrs_25.1.0.bb b/meta/recipes-devtools/python/python3-attrs_25.3.0.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-attrs_25.1.0.bb
rename to meta/recipes-devtools/python/python3-attrs_25.3.0.bb
index 852c546bb32..bed26a5184b 100644
--- a/meta/recipes-devtools/python/python3-attrs_25.1.0.bb
+++ b/meta/recipes-devtools/python/python3-attrs_25.3.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.attrs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5e55731824cf9205cfabeab9a0600887"
 
-SRC_URI[sha256sum] = "1c97078a80c814273a76b2a298a932eb681c87415c11dee0a6921de7f1b02c3e"
+SRC_URI[sha256sum] = "75d7cefc7fb576747b2c81b4442d4d4a1ce0900973527c011d1030fd3bf4af1b"
 
 inherit pypi ptest-python-pytest python_hatchling
 

