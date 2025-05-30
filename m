Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91BF9C5AD49
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 17:39:29 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.1271.1748626767251696678
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 May 2025 10:39:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=c2kyLZdh;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-234e48b736aso29019825ad.3
        for <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 10:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1748626766; x=1749231566; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ScJsZSKFNkRHaeaSEgIgWPJIn6KunGJimdMFycjfaT0=;
        b=c2kyLZdh0gp45lrCezIlwlaUhL+ehmuzxxtIGXQuAJThokMXYG+1hhlHyzMTP2Lmhy
         QRPlQAZqoX7RVTsBv080TmgW8RXzMv1vawZUM7DvQCgSiVbAl2eUNGq9VczTspmUmEvm
         pPc4tpzDm8zvV7ri3bklaXTwqu5nmZrJqONAOczV7e/S9VXdgQSysONTyvSaJBmisImi
         ervRSYUUH2ApDQIWWAGZyemHOZ0YUxzc38t6rJUmza+ntGFsmj9l1mx0qF3an2moMXPC
         iS4XqfW6ZpxUOlPodldlPl1ZhfRHYzb1NwRKntV4E5s/YxgBrvYKXs6vPUtVys2heOu3
         1ZAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748626766; x=1749231566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ScJsZSKFNkRHaeaSEgIgWPJIn6KunGJimdMFycjfaT0=;
        b=AcPWhGa055g+CA2JNUnJ7xxbAG77vbCOGso+LhonflOU7fKSQ1jEZAKV/b75rnyfFa
         0NhO3oj0QiBU2QaAuJOXgj2YrVdFFM9hGRlS/kRPGAX5VJeDwb2X27crEXjTeA59ZI3r
         2tcUmkQgVK3jyTwWHT1TM1PiYiVRp7gVbmg2W2Ttpn6ioETKrCoJMpprxTgPmJlkYF1u
         EN8JvASejcexQV1LJHdF8Sj5Cvq8VSvctOLDbyQjeAzzKDVIP+l2u1PiqlGSUgt75H+K
         8dyqlt53k0PdwGuq4h9DBn+gKDDGywHggUcpjebvV2j/Do72r5ukxChKnYcMyhD0VsCH
         D9iw==
X-Gm-Message-State: AOJu0YxfUQrXMgTLg/5v6ZcpC8j80GpHeo0Ph1zFNukTMbcYpLeO5Mxr
	kvz1SprePcfVAZjOZzF2jBHjYquGIzqc0tbslPIALc9+6zmnZHqNLEjeELm+lqNQ81eKe57kdw/
	Lm3FM
X-Gm-Gg: ASbGnctMatkBEL9OmJqcs2GZcTvZopFa+zGpTSGP5xqqprEpn7sR2ySpnU76ss3YcGf
	ofX/IVF8si/tJgX8GeK/XJZhmR4diYvfJnH/ZJ7qfQD85LFv5Wqt5s4qJSNsKei+95OF3DkM9ZV
	JYFMhO7AWRd42TCp5lIjlIjwLYf8QIas7bOccoBBjbVKE7Gtqh+U1j76SXm7IvsRgkQYAVzbnau
	g3oqPSaQNneu9W6GumnelJUZLTKflk9aNmWJfME/oz+8TVPqB7rMY6DDFNHQE17eWNrEKbM1fAa
	BQZnvOZndOY2G8gFnLh3sih4mrGI58Ka1yFgUZiGUZ0=
X-Google-Smtp-Source: AGHT+IFIHBpraFjoO71FpaVqG8gDxSxG74GOydpLHrpchb4koMqZYqFEeNp4QV5nmg3vJna05RSHbA==
X-Received: by 2002:a17:902:dacb:b0:234:8c3d:2912 with SMTP id d9443c01a7336-235289fdbabmr67913595ad.11.1748626766535;
        Fri, 30 May 2025 10:39:26 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:c9d8:e2d0:bfbc:3a26])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2ecebb5f40sm1554314a12.67.2025.05.30.10.39.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 10:39:26 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 12/12] sstatetests: Switch to new CDN
Date: Fri, 30 May 2025 10:38:59 -0700
Message-ID: <a7322472e41c3cac922e29d867ae3f2f74318279.1748626640.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1748626640.git.steve@sakoman.com>
References: <cover.1748626640.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 17:39:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217535

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The project is switching the way handle our CDN provision of sstate objects,
update the URL accordingly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fea96974f1ee6ae6dceb39e3ca8157797d81586c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/sstatetests.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index 681a57f4db..487995acc3 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -972,7 +972,7 @@ class SStateMirrors(SStateCheckObjectPresence):
             self.append_config("""
 MACHINE = "{}"
 BB_HASHSERVE_UPSTREAM = "hashserv.yoctoproject.org:8686"
-SSTATE_MIRRORS ?= "file://.* http://cdn.jsdelivr.net/yocto/sstate/all/PATH;downloadfilename=PATH"
+SSTATE_MIRRORS ?= "file://.* http://sstate.yoctoproject.org/all/PATH;downloadfilename=PATH"
 """.format(machine))
         else:
             self.append_config("""
-- 
2.43.0


