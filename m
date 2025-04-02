Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04E0CC28B20
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 07:12:08 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.2172.1743577919547019997
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 00:11:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ayn2iiJu;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cf680d351so2622345e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 00:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743577917; x=1744182717; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gGyM5m3VrAgjfQhGblVAKWvGBDDqD59aM9a1vozj9xc=;
        b=ayn2iiJuZGX6f2k3ditlYA5YVBojinlAryKj+CLbcdL0pSlpX2E32dzJnMEg6hBVqh
         yZpJ1pIRPsjzsgCqMK/xQOtxm5m4CsRoa8urv5BEz2FaCg4XoX0RJShokUAgmdkGHgkM
         P4Rs/F9gUPrTc2CV5bxuQLqv3hlYUCzOVnIb8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743577917; x=1744182717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gGyM5m3VrAgjfQhGblVAKWvGBDDqD59aM9a1vozj9xc=;
        b=ou13S/Ycmmp2lkgpw9SuVOWDeNUCf0bJ2Gs7LwjYuilwtzBdxaxSKRsHqW95tCyKkt
         SoM2Up5+lKrqMpFHylDnF861EvPyw+pC4fCfmxzaAiXT6aqJBIO3Tcbfun9R3BI5HkaF
         8lUvG3boT91AZwkWjaoRQNp6iRJSZDw7FfSbmP1mbL9pCqx7TzGM0w05sGeyA4ISoT2r
         HGqlktsl1D0R6EGz+cRzpIWdZZfyzHNAL6cfKsXiN/Yg37Ek/EQYTtUtrg2PwkBmFr/h
         FEi4uU+uz2R99bTPw+Y5AcCCiggTj/httI0s94Gv5TXXwDsf0omFt/vDJCRsyRqxbXzi
         hVdA==
X-Gm-Message-State: AOJu0YwCZqZghnfc2Gx3snOSSu06v6Zr8HLvysCt0tVb/zSHh7DLF2I8
	QnlKH59puFNxnc4WvVY3oCWdY8jkXsgsmxxlLOdCwreIlq0ZswVxl09dOXHVMTMOwIMAlCiFQ5h
	z
X-Gm-Gg: ASbGncss4kOVzCj7zEhXtmMHa4/XmSyyf8PRrDw2rjQ4/LmxYK6JS/r3NFacu4hQPrC
	P5WN9PM4g9StttULkQF1B2aIkgWL/uWnRCpxhPR8soP7d2ylUZsdL+eiegAPMNczoiJR3VUw6WQ
	NgA+IMPlSeY9Mb1uMhuOygRA5oI8SxGI6DGWgVy4h9znwLpEj5o33bA0dPaohtIxUsc02MyxWRY
	Oj2YjDCnmyfbCepwW63wMP8gueaqly+DOQXjZ9nIjQM/948Ss/dMkTDCCqg7vL/3s2YwbjT3OWM
	aQN58KFfKDlCShlqiQmHLVgukwwRby73PM6c3Aoxt+tcr2tnecqkA39e4p/KKURNg9OPENDiVA=
	=
X-Google-Smtp-Source: AGHT+IGcVjBZCBxcxI6IEqU9LBs/JDvSnp60qKH6b0qNlMPRt0qEhG7mpowGhv9sJSqvCjz174zv2w==
X-Received: by 2002:a05:600c:4f01:b0:439:8878:5029 with SMTP id 5b1f17b1804b1-43eb71557f7mr7192665e9.2.1743577917487;
        Wed, 02 Apr 2025 00:11:57 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:24b8:b374:749c:8558])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb6103a07sm11344385e9.29.2025.04.02.00.11.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 00:11:56 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 38/48] python3-setuptools-scm: upgrade 8.2.0 -> 8.2.1
Date: Wed,  2 Apr 2025 08:10:07 +0100
Message-ID: <20250402071017.2157620-38-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
References: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 07:12:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214211

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...-setuptools-scm_8.2.0.bb => python3-setuptools-scm_8.2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-setuptools-scm_8.2.0.bb => python3-setuptools-scm_8.2.1.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-setuptools-scm_8.2.0.bb b/meta/recipes-devtools/python/python3-setuptools-scm_8.2.1.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-setuptools-scm_8.2.0.bb
rename to meta/recipes-devtools/python/python3-setuptools-scm_8.2.1.bb
index ecb79afe47b..e35ef7c25e4 100644
--- a/meta/recipes-devtools/python/python3-setuptools-scm_8.2.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-scm_8.2.1.bb
@@ -6,7 +6,7 @@ argument or in a SCM managed file."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=838c366f69b72c5df05c96dff79b35f2"
 
-SRC_URI[sha256sum] = "a18396a1bc0219c974d1a74612b11f9dce0d5bd8b1dc55c65f6ac7fd609e8c28"
+SRC_URI[sha256sum] = "51cfdd1deefc9b8c08d1a61e940a59c4dec39eb6c285d33fa2f1b4be26c7874d"
 
 PYPI_PACKAGE = "setuptools_scm"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"

