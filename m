Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8597E7716A
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 22:38:58 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web11.797.1733265531264474892
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Dec 2024 14:38:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GiDuIaVV;
 spf=pass (domain: gmail.com, ip: 209.85.167.173, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3ea4acd3ed2so2628077b6e.2
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 14:38:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733265530; x=1733870330; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HBo96RKAXFpe64WRH7IgooHsh5COz2x3ZSimq01BDZs=;
        b=GiDuIaVV/ABMVDhRRHF3oPPVxCAb/4ihoZWeaavVNx0d2j01YmtImiwjLpYcxXVKhe
         LGApREhWKDfKgOiKIka9OBBUsvOfcShHkPNJsvZqIZcT3ZsHawgfuYM1e0bG30Ui8qLd
         wJZUHFmf04V9uqk4zyRwcBBdMvK407CpuBwSztHci4io7sZxTPsiOuQb8lYzJ2inN2CZ
         0SYOHGCn5wJtXC5sxj7I51h8T2quVid2w4C84OvGDMi8ZYXNW4DFiI+4t74/c2+2wIMT
         uvRSXe2jz/TVyVhNHt7bP4pRwHaDk19lixc0td+N1/E8PoLUeEiOMJJ5jYCzJSYtI4C6
         OCyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733265530; x=1733870330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HBo96RKAXFpe64WRH7IgooHsh5COz2x3ZSimq01BDZs=;
        b=WlYAz3yIE1ZmbCFneDbYni8wCbPoYGBGaNLqXyJKXmwA024xY3/qhCtH87vgS6YTq7
         GbjaUcoqr7eRHQns9jDNr4uajh+uxbW1ggSfVcvSSu029yRustTzK2HZx7MJvt5EwzTe
         1UcPq/pzJ7YOpsDRz2gSaHn88Dmfhual7QZh0pahcalxi/EEnVsIMqNH+11b3EEAkW9l
         0ImL+BujG9HA1abb3Hd3+L/fKfjA5whusIezavWsRymnRcMGoi8bwgHevWq3SNOalMH8
         lOvzVv5EoIB7rZ3UbX2IW4O9BxBkWYJZKpMWZatQxfSqj67vWpxHt4SLphkJmbB1JYlr
         Ia5g==
X-Gm-Message-State: AOJu0YzYai+S9IAUZH1LB3QUc7Hhe7caVxyaiEqgU1yOSQyrfu+guh4S
	0a5SoaDEqRcGDRdATNxhSxhg0jGsDBPU62MIXVe63juD3vJyOBe91DhYtw==
X-Gm-Gg: ASbGncvhhzPLl0srOOFgm33++/ynZ+G0+qu6CQXZJrciX8Vw0A/Xwq9ivpzSI9yWEzH
	atRhgVnYJM0cPwQpCzs+Q7mK9nDBR1Esfoab6Y1kQmvpbSjSgyOY9osTZxLP2CfjApGK3mFMmpY
	VnPAdibW4iEhaiNRx3A1pDWWm7HmnXIwOD1+I6OPmzWPX2nTONnYyZJCxCVFd5L+8iBr8FozPZX
	ZZKNspNvLl8LmrSilqO3Qq5O5WPn/FCjd29OfMHlIy8j8tZ
X-Google-Smtp-Source: AGHT+IGqeIge3UT+HJwAn7VnwZZC6bSKJCuS4GrfRMbTIWeXdaEKZVMUkSZ+aikXuZtMrPeLoANBUg==
X-Received: by 2002:a05:6808:2dc8:b0:3ea:4792:42f3 with SMTP id 5614622812f47-3eaf02706d1mr1403333b6e.17.1733265529868;
        Tue, 03 Dec 2024 14:38:49 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4300:19e0::dc1a])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-29de928c9b7sm4037836fac.22.2024.12.03.14.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 14:38:48 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 1/5] lib: sbom30: Fix import handling
Date: Tue,  3 Dec 2024 15:37:06 -0700
Message-ID: <20241203223844.2689172-2-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241203223844.2689172-1-JPEWhacker@gmail.com>
References: <20241203223844.2689172-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 22:38:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208222

Fixes a bug in the way that imports where being handled, due to a
misspelled variable

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/sbom30.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
index 0a7b4c05fbe..ea70f6fb69d 100644
--- a/meta/lib/oe/sbom30.py
+++ b/meta/lib/oe/sbom30.py
@@ -364,7 +364,7 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
         if not spdxid:
             bb.fatal(f"{key} is not a valid SPDX_IMPORTS key")
 
-        for i in self.docs.import_:
+        for i in self.doc.import_:
             if i.externalSpdxId == spdxid:
                 # Already imported
                 return spdxid
-- 
2.47.1


