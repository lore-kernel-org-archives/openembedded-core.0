Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1ED7C5B572
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 15:22:33 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21787.1786634549692475349
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2026 08:22:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=IoYltndv;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47f59f25ec4so912186f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 08:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1786634548; x=1787239348; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UB5Pur79hQfzK7YDWe0et3T6YYOBlHReF0O5fw3/OY8=;
        b=IoYltndvcfC9b1/Dq1TqNIhNqMqqTlW4Y4AepoTnsMjy2aQqdPQXpHNy/rDcC9XnF2
         WyARnaR+UF3EAJL5VrNBdD8XJDX4mHmAJ70zXBZZDguXvyEZ8XBh8j8i7Si8Z5d+O72i
         aBAZ3vXXtj0A5vBjQIxFwRLtcwWPH2vNUF/JI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786634548; x=1787239348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=UB5Pur79hQfzK7YDWe0et3T6YYOBlHReF0O5fw3/OY8=;
        b=E8h5hUrdRYW/c7k64ng1M8m1Y9NmdMRudSWWCf7Qsjor/m5eH60Gz9ZS4e/UJsF6Kr
         eLVixLk+IjOLXkcQBoE9ai0Bli9mKcf52ZtM67q5/Tm9z2Y/qyZYaUsXY/KgAimdq/5g
         sqNErLzmHS3tyCOe4n7vaUMEBvUnX9jBNo3zI0NeU0k/Sdci29Hj/zA7DxWthuuqg8jE
         Ql12aqsmd/3+xlYOAlwAW6luLybLHPH3HZgqhSyUcWZMy88a/AvFYAE+rmO2/DK50ubE
         TC+phmnX6UVlYZevdKUh5RhVxJLo4ynH5rLm7TRKL0HFP7ei1C7Y7wq+3xew+yDri0qb
         eUVg==
X-Gm-Message-State: AOJu0YwJY/B1feNaBUOtYnl43ZUlM9zTe5UFbOevC+sFb/6VqY5O/fLM
	dtnGIcwdlJHcuEAfCFVlnxzH2huUideITs755R9TnZf349lzm3TPZHEQDOhrQ/m7eCzGDtugTk5
	xSq/fLQs2SA==
X-Gm-Gg: AR+sD10EBR2bj9HSE6ylwwS6MZe8WRQBKGSYzGBD88KbIiDKMDAgf6g6gerqI2m+ZH7
	KJlcz/KI5CPDF58yOkn3rHF+cIL0xT+e3Wc8L1QnVoHvCCBtFaL3uq4k3ISY5wMVimGGHbAfWn0
	ukbS7JzUqcSsLEx+nFn9q8rcKxd8RYraACglY1tAHSJIKolA9iju3EKlDZ6T1OKKtk9UwOJDJy/
	Rvp6h9XKbM4HDVes9neDyhik6Udvq5A3KUoK7PR8aN4AitDqMbdvX/WMhuC6lQrIHjOyFgixQY/
	J/nBx/nufL2AgvPu1BGxilt7r/ERHKVJTKhY8wg4rjqpTzVPdF4K6e4UAH5Y9XH6YfUGYPNVSRS
	9Gy7TPOUFMm46NaJjWRFNzrpaQLWYaAGFKPK5It6r95jV5y5fmh7sm9rVlJ8/RWabEQj8Ve/qpi
	QZue9wZyMmPozd58hCwaDuZ3oLWdLiYzYrJtKIwN4p+hbvGBAT01D0hZJ96TYfhrDxkzJjLDtEZ
	ZZcv0+U+djGIFvCEYxnVastwE87fOxCvEeVxwO5fCDJu0eR9C8wix2+8R4cPJ/uyEfB8Gahc2+n
	qVXdaJAHygQ4+ChBYVne8rIEbNTwQKjKnYgFu2QqTrs9kkEdsfrLazUzseitPfw=
X-Received: by 2002:a05:6000:61a:b0:480:d9:ee6d with SMTP id ffacd0b85a97d-48159eea176mr10359901f8f.19.1786634547811;
        Thu, 13 Aug 2026 08:22:27 -0700 (PDT)
Received: from FRSMI25-GIGUE (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f21a068sm110450f8f.12.2026.08.13.08.22.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 08:22:27 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 07/17] python3-certifi: set CVE_PRODUCT
Date: Thu, 13 Aug 2026 17:21:57 +0200
Message-ID: <6d00f679f22dd61a5414369ac21db016fe31d495.1786633048.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1786633048.git.fabien.thomas@smile.fr>
References: <cover.1786633048.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 15:22:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243364

From: "mark.yang" <mark.yang@lge.com>

NVD tracks certifi as certifi:certifi, so the default python:certifi
vendor prefix never matches and its CVEs are not evaluated at all.
Use the exact vendor:product pair.

All three existing CVEs (CVE-2022-23491, CVE-2023-37920,
CVE-2024-39689) are fixed before 2024.7.4. The wrynose recipe version
is 2026.2.25, so it is outside the affected ranges and these CVEs
resolve as not affected.

Signed-off-by: mark.yang <mark.yang@lge.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 26c49743ec431a3cc39803664eec8851be75756e)
Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 meta/recipes-devtools/python/python3-certifi_2026.2.25.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb b/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb
index 7034f7a6f1..0425f3544f 100644
--- a/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb
@@ -11,6 +11,8 @@ SRC_URI[sha256sum] = "e887ab5cee78ea814d3472169153c2d12cd43b14bd03329a39a9c6e2e8
 
 inherit pypi python_setuptools_build_meta
 
+CVE_PRODUCT = "certifi:certifi"
+
 BBCLASSEXTEND = "native nativesdk"
 
 RDEPENDS:${PN} += "python3-io"

