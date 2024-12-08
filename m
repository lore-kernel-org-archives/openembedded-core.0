Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D15C1E7717F
	for <webhook@archiver.kernel.org>; Sun,  8 Dec 2024 13:06:54 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.78125.1733663209689004514
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Dec 2024 05:06:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jOuhfZp5;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-434f09d18e2so8532815e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Dec 2024 05:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733663207; x=1734268007; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fu4gje2/JYtT/lrjCb6f8lPM4OFIgOqUXnYNMEKBPf4=;
        b=jOuhfZp5GccHtLkEcovXFSlk2c9Szgx20qi93uMUUKyDNflOzW2fYl61kb2UkZZCHy
         t9s2CDRD2moJtg/F21F/MfhgfSdY3A3AWQbzYKi9azfM9PO4q15zFDsqiYNYhkvEznKt
         1xcQt/1es+VM6JQHRG51mKhUqLz8DZ0fAe7LonV1brtY5C6llxW/LhhAfCtMl5iUCw1P
         2F6nXvIRzf3ZOtoINVax/ywomDLCSxRsO3NCQRLDxcOZ7t7wzGu4rr044t0R0Y5fSy+N
         H/jmeji41ufwUCefAyStS3691YaL6Ir6ui7t4j27c/YELAhQoQAeRC5FVmnU2+Nvjis4
         JoHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733663207; x=1734268007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fu4gje2/JYtT/lrjCb6f8lPM4OFIgOqUXnYNMEKBPf4=;
        b=myQQI1bQ/8OMXXh9oO0JCTSZYGWap3WjdM93m8pY4TbN/aCQsHyPEuR9eV5Q1du4rH
         juB0dgrdLBabIFEg/ET4ylm8FhVBa8lOU7t2jztz0YH3tHw3AeL9LV1bby9RC89zPiBD
         3nUIdFTpTCY0sR8Qqsq4CrP9vD+WKkJBRcNmvcyj27GME9kZh3RLvmmhFiu8TL5QW6k9
         lTpQrGbLgeqsWrVPpQ5l3oLuYLx7/pq/Jk35x/SU+AO3nrl+aO0s+sPt7V1FObRbWqxb
         MAsOsnYcRdN9PfeKCasUgQvFfHfd+qT4K/KQJBKJFn/9W72p10ghTza5aTmiGXOd+McT
         FvYw==
X-Gm-Message-State: AOJu0YxnLr0suh+D0HgTNTyNA1ZQDPdM45vUlfivXc0Cpzk0GJGNA6Lb
	MHARrqZ3o++vG56oIWA0QpwEpot14EbUg1wIIOHyjKPp1v4azpRMvLFjkMOg
X-Gm-Gg: ASbGnctsPjSmlvRb7EbbzzS8zpEMKr0kHcOH+1P3PkEDL1jIZ4Zy6DY6QDwGYPLz48r
	nn9JMA/DlbaozyN+oZ6J2bl8a1+pLjScMxcGnFe7tOvkius0HfD5nAs3/Yp/xbhsaeFX3e1ExfK
	1gYj51uzMg/2g2IWSMZWvFDNhqZH50gl4hlYU/fsDYbiUC7nsXLzGYsYXNGa2YxVIti1Bn/2FnH
	W3k3AapIwiASOoIkjplK2AaZppwpYH0bqKa8PvyBZeKpyWyQ5jPo5IJCPTNYJB5b4GXLNuzv7c=
X-Google-Smtp-Source: AGHT+IE3ZLR8+zpNCFcb/LbElqOF1jN6Dw75R+cSaafqwwr7uJvd/Rdvkc2gtOyU9A5Wsfu1bzvcrQ==
X-Received: by 2002:a5d:588f:0:b0:385:e37a:2a56 with SMTP id ffacd0b85a97d-3862b3e63efmr5540600f8f.52.1733663207082;
        Sun, 08 Dec 2024 05:06:47 -0800 (PST)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-386257de681sm9745476f8f.30.2024.12.08.05.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 05:06:46 -0800 (PST)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 3/4] python3-poetry-core: drop python3-six from RDEPENDS
Date: Sun,  8 Dec 2024 13:06:16 +0000
Message-ID: <20241208130617.4032-4-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241208130617.4032-1-gudni.m.g@gmail.com>
References: <20241208130617.4032-1-gudni.m.g@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Dec 2024 13:06:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208452

Looking at the history, python3-six was removed as a dependency
in the poetry.lock file in v1.5.2

Even before v1.5.2 and until now (v1.9.1) there is no code in
the package which imports the six module. So it can be safely
dropped from the recipe.

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/python/python3-poetry-core_1.9.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-poetry-core_1.9.0.bb b/meta/recipes-devtools/python/python3-poetry-core_1.9.0.bb
index 540fdffaed..d1a8b939c0 100644
--- a/meta/recipes-devtools/python/python3-poetry-core_1.9.0.bb
+++ b/meta/recipes-devtools/python/python3-poetry-core_1.9.0.bb
@@ -36,7 +36,6 @@ RDEPENDS:${PN}:append:class-target = "\
 
 RDEPENDS:${PN} += "\
     python3-pip \
-    python3-six \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


