Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B788CD98D2
	for <webhook@archiver.kernel.org>; Sun, 14 Jun 2026 08:04:11 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.105053.1781424247358351527
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2026 01:04:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CyC20VZd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-45ef4223be7so1226616f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 01:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781424246; x=1782029046; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kGpdbmnGW/MWUl3OFs6KEv/EGdRzPXPvWAUUjq2hUYc=;
        b=CyC20VZdTCiOL+by8+tADatcQUCZU+n4emjywbeIi8M1wdAroaC+EMH6XxkoUbaCKW
         gwyxdXVlVdt05gXRnQYFA6R9qGW7ozxngmA8kafPq1kz67hrkqxr7Wqbm9OA7jPokl/P
         iDT21vkVVzM1mVBA2z4IMufXAJpdOUSRfe7GM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781424246; x=1782029046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kGpdbmnGW/MWUl3OFs6KEv/EGdRzPXPvWAUUjq2hUYc=;
        b=H9WZquA6By+cqhwmri/+24ZAqx8e0ynRhzWg71z9AYxZJTIPYWAoeV6+FaLOw2Z1CO
         rsYyx1qrcNqNuxlb5ckZ3lARsbE2gYB8Ol7sUd2/QzIqbzHSdiOe/+GE/4ZEBGQls1nt
         UeXmS0I+VK9dI0fKVo5t/H0Vn9pUmA6VTqIoRpttQV6/ZG7u1dzitUmdJgZG+bXWQUtX
         fTEjximJpnUswmk/Q3fWGOMjBVYx8lYUIfb9UkxjP1Q7eDXR4c3y894u0kpQJa75j/kV
         PLNP1MYMj0/3Spnv5tAty7X5QsqgX3DeEdz/2Me/2/F8haq6KTHMku7CtRsV6RrIWV4L
         IXTQ==
X-Gm-Message-State: AOJu0Yy6UpZ6F854uO+hngQOOWlpjhkQVyK5QUshwldNn2kBQ8hR2NzF
	uvv5x2MN7U3PTd7vlYdwyafO3w73esRZW7sba/DQPgNvsFw4+7qOQaWLtbtPUiJSdl9sAaIVYJ4
	bMBgv
X-Gm-Gg: Acq92OG/4mdNHI02ElZIov3JgCeCk+Oz17qI6XBpOLI/ej7hkc6zzguuh3gpssJ6+iL
	Q1Hbkii16MR4q3U3TY1RkldxJWw1kqQrMxvEhZYp66APiogsDbAIWp4efTnshVDE/DGKmqQK3hW
	Q/FFFzymCE6qyjmHrGZ2G4MRubFTe6sg9vKgUqQ0bEGRUka4JCsIY+31mhCWr4QmIMbxwsXIWTl
	bJc+TnaKvozS/M+ktkYj8KM2ZTZTnz0uFKP+/6hTU/XK2Q1rgoaPq/lwJBIHuPh8h554sbPRv/Q
	4Tk8c1+B2bkao3bnT1vsbjyoEmuRIblZzHaXgXFAGdzsyZvnoYNWPjMyJxOPZcBLLObvHb2fgff
	pv82ErXWrKH8e2gvI887vbXVqCAsrQ2B/rTlap4uuKpbgJGNSSAQRMxUgluS033tMuAakwfWdKU
	ul5RIbPt98iLiazHrWPymsJZqDnTqK8qCO/ohIXwOq0QF8WJJax/U8WOVioNO/fOg=
X-Received: by 2002:a7b:cbc3:0:b0:48a:5565:ec3d with SMTP id 5b1f17b1804b1-490ec502d01mr83188405e9.22.1781424245551;
        Sun, 14 Jun 2026 01:04:05 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b23b:4f5a:d2e8:6789])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202edf89sm149999065e9.1.2026.06.14.01.04.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 01:04:04 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 36/56] python3-pdm: upgrade 2.26.8 -> 2.27.0
Date: Sun, 14 Jun 2026 09:02:47 +0100
Message-ID: <20260614080307.4017177-36-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
References: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 08:04:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238720

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/{python3-pdm_2.26.8.bb => python3-pdm_2.27.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pdm_2.26.8.bb => python3-pdm_2.27.0.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-pdm_2.26.8.bb b/meta/recipes-devtools/python/python3-pdm_2.27.0.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-pdm_2.26.8.bb
rename to meta/recipes-devtools/python/python3-pdm_2.27.0.bb
index 91fcc6a5af8..f378e1edda6 100644
--- a/meta/recipes-devtools/python/python3-pdm_2.26.8.bb
+++ b/meta/recipes-devtools/python/python3-pdm_2.27.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2eb31a2cc1a758c34b499f287dd04ef2"
 
-SRC_URI[sha256sum] = "f53a20b4b6beaa88da577a7413ebbb51bee534441339b006dba2260edbc81757"
+SRC_URI[sha256sum] = "dbfbc484065d0150fa5b29484ead908354313d8699cf74c099d4531826bd04de"
 
 inherit pypi python_pdm
 

