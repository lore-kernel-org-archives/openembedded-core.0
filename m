Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B9ADC02198
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 16:42:11 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.92679.1738600929110657664
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 08:42:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AThJl2Uz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43625c4a50dso32327805e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 08:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738600927; x=1739205727; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aKiaH2w4ElNAo1rov8qn6nGD4973/Hr8bW3OZz5u60Q=;
        b=AThJl2UzztYvQw0pxXCyYfIx/WIRiGwzBIoaM2ftIHFWD6d50hVmj505WN1tjSd5JC
         pujiaR+jfSOfXAb7Mwv5tY2nZjv+zsHCv1G0JCjnsreGpSQjzZPq4svpoSzGoWycqXwX
         igkg7EICEh1w/3fCRrI3GZZDa9wON3BLogncE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738600927; x=1739205727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aKiaH2w4ElNAo1rov8qn6nGD4973/Hr8bW3OZz5u60Q=;
        b=e3mNn4peGoH2YDBC6evjVqr6j5fcg4USKVRL+iyvqDbuqKuLuXsANSKkVeDCOSQaIu
         EL6N7XFwGisbVwTb6w7HAqAM/kAFZmTRGNEH7q1o6GWa0E8pMiyIFB5H61hpCHfRuE08
         k9ZjD0QI2UFaS/QnPow+144+PIxTqM8p2ulx+e9/B2NwVS3jFAWQM4ylzq7qB4+kNQbP
         DQRA3vUWweSoFhL1SMn6/Tjuv9GfCIyxVhPk1CzoB/wMt3SUDaCck6wUwRQ3AbUD2bvL
         uE14Iv/9f1s+daXUROkpcRHAMWIku+07anejrvAZOV8tqP3MDOEd7w8DoMGPQcWyqTdR
         m1xw==
X-Gm-Message-State: AOJu0YwG5/hEXiDqb9SGbW3fquzHcmsIBZAbw28QhBP01rAImDoBW8+o
	GCpodrOhk7IDEZTQZZgKmkXwtszXZSHtnf4V8c7K5YmOpbt5OLQA655+pZUtaaFLZuXKphaMLRU
	K
X-Gm-Gg: ASbGncsu2qwgfMzdZ1PPXHaWW3jpFg/MrDI4t+o9K37sOf2+J+YL4bi/TPAHWc50KXJ
	5beSW1bCQgthvCSALKv2bgU6voenMDxH0xbefuwBlEPlIerqfD49bAIGkpiIx8UJj/LGWminEjR
	B+B5W5xy2PgKon3A8JgE1Hk5seveuZgq6yGFvz1WV/TyX4axgWBPUrInwHfjSRiuopQ5ImqJw8M
	4jqrAxMuq7aZ3vnmijzdNmXmZjzAwNM9G4YryF1tBqg8ML53vnlO9C3c5+fmMyTQQUwyd6X4+bb
	LgDVm5z08hR419exNlXvVL9QKp4qWPkRq3bg7QaN92XJ
X-Google-Smtp-Source: AGHT+IFiFTYOurvV8zPUmk0e+8sAjkmigKLi+EM1mx5f3PKmrIDEJX1nJOI8wXZZMN4b9iMdwIuxNA==
X-Received: by 2002:a05:600c:a45:b0:434:f7e3:bfbd with SMTP id 5b1f17b1804b1-438dc40cf15mr180387765e9.23.1738600927145;
        Mon, 03 Feb 2025 08:42:07 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:41c1:3919:865f:692c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ec886sm13122395f8f.1.2025.02.03.08.42.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 08:42:06 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 34/46] python3-pygments: upgrade 2.19.0 -> 2.19.1
Date: Mon,  3 Feb 2025 16:41:18 +0000
Message-ID: <20250203164130.3403325-34-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
References: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 16:42:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210707

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{python3-pygments_2.19.0.bb => python3-pygments_2.19.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pygments_2.19.0.bb => python3-pygments_2.19.1.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-pygments_2.19.0.bb b/meta/recipes-devtools/python/python3-pygments_2.19.1.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-pygments_2.19.0.bb
rename to meta/recipes-devtools/python/python3-pygments_2.19.1.bb
index f1bc8456623..de24ed3f11c 100644
--- a/meta/recipes-devtools/python/python3-pygments_2.19.0.bb
+++ b/meta/recipes-devtools/python/python3-pygments_2.19.1.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=36a13c90514e2899f1eba7f41c3ee592"
 
 inherit python_hatchling
-SRC_URI[sha256sum] = "afc4146269910d4bdfabcd27c24923137a74d562a23a320a41a55ad303e19783"
+SRC_URI[sha256sum] = "61c16d2a8576dc0649d9f39e089b5f02bcd27fba10d8fb4dcc28173f7a45151f"
 
 inherit pypi
 

