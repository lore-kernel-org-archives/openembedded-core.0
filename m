Return-Path: <corentin.guillevic@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A43ED77897
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 17:26:19 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.700.1769189178007973811
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jan 2026 09:26:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=m4V50hUp;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: corentin.guillevic@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4359108fd24so1538199f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 09:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1769189176; x=1769793976; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7QYEFXynZ6z2giDTXuSACF5RTGmP+FMi5dV2Dcg+oGY=;
        b=m4V50hUpc7YPc09vq0KYvATtTUKzPoYWzZRNu7RTnH5dMA9Q6DYBWXQX3O7OsnoADG
         AjSauEQrf1SgF3jkvAZoScwA/JORWQyMfN88WGJA6LjiS62r0otAQVSVS2iMerzMKRbf
         kmeekD0UFI0wInjcOTSZnFPQXq7yHR/w8e+5Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769189176; x=1769793976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7QYEFXynZ6z2giDTXuSACF5RTGmP+FMi5dV2Dcg+oGY=;
        b=kdF+afBAg7IiioHUbJ9VJK/rpsodvlMnVufO1btHyFe+A+uomhxddApTfpqFdrVg3a
         m2m3nfi9oSw5VlL/p78W/nj0uM7pIP9vnIw8SDWb7h/oJ52bHpdL7TvRcFf+3VKlnEGv
         l2tG1mQOTdCMLY/6BOMcC7NhbDBo7HerfJVoJ7Q2EcJXbAYh9t0zsJI1jiI9CIlf9kM1
         jFsvkCEjj1al9CLtq+vwVQppch05xlhpfqUKJnD9pIqiuD+Expj84rGqRUl8pK8lYA9l
         XN+fhRN3kGMX6EUT8G8i8LhkiGF+/edyl4Wt39SMWK7HbXWl27e/4Wiyh4MbMBV7wvRV
         gMiQ==
X-Gm-Message-State: AOJu0YxTu+zc2De7x0RmoffOPe+HoOXccLEaHKzjgjtLVP7/duF/nZ4j
	MkoH9j+W7FzqEITaWduar+T/DcGBb1H2idWbvAvoy789eY0wHnVdwreLyNWTQWkIUq/w706GoTs
	zZcojd88=
X-Gm-Gg: AZuq6aIctxqCK08GtlWOoGCse83pqJp01iwXT8zm3RKK3tSg6ARw/0nVpwvYPIA2mEH
	79rxGLATRJwEn3I3Sx9x/wQ1PvJwoHyYWPwwIYS175N07nFCGGB7ooWDgScIHVX/yC1euYRb/L0
	uj7PjcQAYbZSfDd0ipjQqG69iTGBQNHp2A9lYgGl08aNL67opYXLlPIF2Ks/ojrnllbZ7BY2cn0
	YKmUnC8CHqCTyKEOsAGtc+WihI74pSdY1ZHrD7Y/209p5QAUCeDJy8FopF3P6lvJpN6U0aFYC0G
	WVGOacXjGc3XWqkqFuH8hN7ScD8KNMQGFVHx5thz9z7u1sSJaqCyWWv0X5T/MYUfR+aDkZt6FG0
	3i4n2mN12FKpcameHU0gh8+I3TkYJyZNbW0bAj14e+rm4wCmFOb9DZmqN3OlyROT+fOILVkY+PT
	Zzx8Ub6ezgLovQ/BHxuYATS56TbnHtYwAVp8yLYBURIpuagCGHEd+y33oHPFue3jA8qMtW+RkpJ
	pBTTBRDdAb8+3ACduaF
X-Received: by 2002:a05:6000:40da:b0:435:a370:2d7a with SMTP id ffacd0b85a97d-435b9658cfemr3706484f8f.36.1769189176383;
        Fri, 23 Jan 2026 09:26:16 -0800 (PST)
Received: from heaven.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1f74b15sm8477017f8f.35.2026.01.23.09.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 09:26:16 -0800 (PST)
From: Corentin Guillevic <corentin.guillevic@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Corentin Guillevic <corentin.guillevic@smile.fr>
Subject: [PATCH v5 2/2] meta/files/layers.schema.json: use URI shortcut for some remotes
Date: Fri, 23 Jan 2026 18:26:13 +0100
Message-ID: <20260123172613.3305069-2-corentin.guillevic@smile.fr>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260123172613.3305069-1-corentin.guillevic@smile.fr>
References: <20260123172613.3305069-1-corentin.guillevic@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 17:26:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229902

Among the three sources, only two have a single remote. So we can replace
their entire structure 'remote' -> 'origin' -> 'uri' with a shorter one
(property 'uri' only).

Signed-off-by: Corentin Guillevic <corentin.guillevic@smile.fr>
---
 meta/files/layers.example.json | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/meta/files/layers.example.json b/meta/files/layers.example.json
index f3b6522083..d990502205 100644
--- a/meta/files/layers.example.json
+++ b/meta/files/layers.example.json
@@ -5,11 +5,7 @@
             "git-remote": {
                 "branch": "master",
                 "describe": "",
-                "remotes": {
-                    "remote-alex": {
-                        "uri": "https://github.com/kanavin/meta-alex"
-                    }
-                },
+                "uri": "https://github.com/kanavin/meta-alex",
                 "rev": "05b25605fb8b2399e4706d7323828676bf0da0b5"
             },
             "path": "meta-alex"
@@ -18,11 +14,7 @@
             "git-remote": {
                 "branch": "master",
                 "describe": "15.0-hardknott-3.3-310-g0a96edae",
-                "remotes": {
-                    "origin": {
-                        "uri": "git://git.yoctoproject.org/meta-intel"
-                    }
-                },
+                "uri": "git://git.yoctoproject.org/meta-intel",
                 "rev": "0a96edae609a3f48befac36af82cf1eed6786b4a"
             }
         },
-- 
2.51.0


