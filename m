Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBDDAC07E8F
	for <webhook@archiver.kernel.org>; Fri, 19 Apr 2024 12:20:01 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.19153.1713529196346520034
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Apr 2024 05:19:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jISKwXEV;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-571d7b39c30so398243a12.0
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Apr 2024 05:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713529195; x=1714133995; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BKO5m7qEsLsvtrBK6MGvZC0NnRc2kLQGCqB0ZLYoyCU=;
        b=jISKwXEV2l+VtwLc43rFzd4Gyt7weagr9S2saFK4xaAgCQLw8vF4nxl20Ts78+sNwZ
         QoxeJIC8PYSpUrMKhPvxTMdI4Ue3GvIiJPSvEGaDKhsoJvrSsX3aICEaN2UnXK9bOeKQ
         wfWRZri/D3UiRar6zOLPfYrQ4Q9xJoHIxr1en/CJ+CSMu2yEYlWQ/Ztm4846F8zY88YE
         2UCcgytq7to+n404Fz3JswFjWtPNtNs1urJmqn9XDVTatg3omJEFmxF63VvW6YJxStUf
         g3V9C42/gbbLpNaysh/pf4OUgw8o+6NeLXMM3reZqr+eigYhcEFRD4EKJF4ny3Uq9jKr
         sELQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713529195; x=1714133995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BKO5m7qEsLsvtrBK6MGvZC0NnRc2kLQGCqB0ZLYoyCU=;
        b=ofNM7Y4C+e00Xc6SBLrK3tahpU4SXaOY84GZfOHWLgf6eJeOdzvqvYGrEFUPO4KANB
         xWNDKINEgCtMspWFqaebe5vF32whmzfhfm5hUgetsbkEIVzIc5rCWYxWO7YGsSWqfLJH
         Z+rAH6Ny+i5BaZSxFpHa9vKlU5OB0Z/CHFryWQB9fqptgeL64t9lRNhtJ3r32Wap2gMN
         jkFtXVwxzlvb7AydcMjLjhfzrLqwAcmpsunt1NuAaariqeONod4h0F+FRUZnL/F/XC9T
         V3Jr+L5n2ez1mYTYNSNS/q4xXOS9Tul9fgtE6jhLSvIn7hUnNs3gcDJyLGvSkA6sV2J3
         JSpw==
X-Gm-Message-State: AOJu0Yyz6SMNF+hYnpWjPzKjvzYyKbE1f8/Cu8iYizkXrOVHITKXkrtT
	H3s70wnk3gPpACot2WHsK0gs4VWGkr1Gz1FfjQVvtlrwKXR/o5pukNWqWw==
X-Google-Smtp-Source: AGHT+IHMGz7eMiaQ62dxUcQzdN8sdphSEHezJME/uSh7MjOB2v6XayvGMQPHsbJoPHEUvxkJ8EfeNw==
X-Received: by 2002:a50:f696:0:b0:56d:fa24:8ab3 with SMTP id d22-20020a50f696000000b0056dfa248ab3mr1942412edn.13.1713529194650;
        Fri, 19 Apr 2024 05:19:54 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id w22-20020aa7cb56000000b00571c1070edfsm1608415edt.17.2024.04.19.05.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 05:19:54 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 09/19] busybox: submit CVE-2022-28391 patches upstream
Date: Fri, 19 Apr 2024 14:19:35 +0200
Message-Id: <20240419121945.1920944-9-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240419121945.1920944-1-alex@linutronix.de>
References: <20240419121945.1920944-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Apr 2024 12:20:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198537

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...1-libbb-sockaddr2str-ensure-only-printable-characters-.patch | 2 +-
 ...2-nslookup-sanitize-all-printed-strings-with-printable.patch | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox/0001-libbb-sockaddr2str-ensure-only-printable-characters-.patch b/meta/recipes-core/busybox/busybox/0001-libbb-sockaddr2str-ensure-only-printable-characters-.patch
index 46352501707..ceb3ad7250f 100644
--- a/meta/recipes-core/busybox/busybox/0001-libbb-sockaddr2str-ensure-only-printable-characters-.patch
+++ b/meta/recipes-core/busybox/busybox/0001-libbb-sockaddr2str-ensure-only-printable-characters-.patch
@@ -5,7 +5,7 @@ Subject: [PATCH 1/2] libbb: sockaddr2str: ensure only printable characters are
  returned for the hostname part
 
 CVE: CVE-2022-28391
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://bugs.busybox.net/show_bug.cgi?id=15001]
 Signed-off-by: Ariadne Conill <ariadne@dereferenced.org>
 Signed-off-by: Steve Sakoman <steve@sakoman.com>
 ---
diff --git a/meta/recipes-core/busybox/busybox/0002-nslookup-sanitize-all-printed-strings-with-printable.patch b/meta/recipes-core/busybox/busybox/0002-nslookup-sanitize-all-printed-strings-with-printable.patch
index 0d7409ddc3c..1dbc3388a46 100644
--- a/meta/recipes-core/busybox/busybox/0002-nslookup-sanitize-all-printed-strings-with-printable.patch
+++ b/meta/recipes-core/busybox/busybox/0002-nslookup-sanitize-all-printed-strings-with-printable.patch
@@ -8,7 +8,7 @@ Otherwise, terminal sequences can be injected, which enables various terminal in
 attacks from DNS results.
 
 CVE: CVE-2022-28391
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://bugs.busybox.net/show_bug.cgi?id=15001]
 Signed-off-by: Ariadne Conill <ariadne@dereferenced.org>
 Signed-off-by: Steve Sakoman <steve@sakoman.com>
 ---
-- 
2.39.2


