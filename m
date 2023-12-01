Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A78B0C10F05
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 18:34:09 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.427.1701455644660234775
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Dec 2023 10:34:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C7jwFOF7;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6cdd9c53270so2104571b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 10:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701455644; x=1702060444; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SWH3FUU5+EFDOKoOe81RYuyHXn+fzM9gtLRweIqrBoo=;
        b=C7jwFOF7U59YnBoCn7fcNnnX4eAm6y6z74At02by1tAjy4wwGESz9lfXwlsc6jAYoU
         3p4SsB1Cv57ptKJj2NmspndymQkMwIMh+C2gBYi6PuPOTRcq3P3vL5AtBgzmZckfVodQ
         R74GwMi4636SqpHn2K7+th0I8h2fqedHC9jVM+p+4/LSNA5taFFuGhMOqTo4s458EUCr
         MfMxEJ1MJZua61s0nyL0cxaWGBNMnagqHwzWQRx2s9nT6EFKKNDI4p1W1YwEBo96shrX
         l60cEVd8mPfatoS2FQkn2TbuYa2N9NaEzmRacXsWGq/Vna+7XAlcQ+4LC1vAb/eBCYrP
         Ow0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701455644; x=1702060444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SWH3FUU5+EFDOKoOe81RYuyHXn+fzM9gtLRweIqrBoo=;
        b=o7caCX6rAYAc6dM1fT/uvcrX/LrEAU6ofzrLu18MJkZuZFrsH62lBexZ6erzay0wgC
         FK8BHQj1YGTwyAbJFCmFEEHyu9Bclvm6RpAErZrIMsEEy6r/CuJaIoS/aF/4EJBCv0uH
         r36VqP0KMk7YBG9mBBuaAK4g+RqEXiD3Wq+WzcqyJaTePS+SIZrpqujBqVBJsl131+Of
         lXXAN/Ll6uponM35Q8PJtp6XU8njItpII6JmWdGJI+1Z0qH/Mc9VjzFXLfFBRZf7hbge
         nXhMi+TfK/R6L4Jwr3a0Ls+0BgpxXh5CQzX+5+FIKNtI5wo+HfyikxALf0gPMA7LDvVX
         OyZQ==
X-Gm-Message-State: AOJu0YwGqCwpWMIYx+uJXVmQvvIDqz/f/Pvv7m7+37ltU/V06T1RmFxv
	QqGIvMxsm0MjiMMlBgJhB4QyEV5RRWY=
X-Google-Smtp-Source: AGHT+IH+fCTeqQ83lRPW/oSKRQuQGTP+W46TG6ivrm5T1uAl6Vd2j6sTK2RSHIXog71vNgHv/98Cuw==
X-Received: by 2002:a05:6a20:da9a:b0:180:f0ed:2992 with SMTP id iy26-20020a056a20da9a00b00180f0ed2992mr33488628pzb.51.1701455643764;
        Fri, 01 Dec 2023 10:34:03 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id g24-20020a056a00079800b006cde7dd80cbsm3297126pfu.191.2023.12.01.10.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 10:34:03 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 4/6] rust-common.bbclass: Define rust arch for x32 platforms
Date: Fri,  1 Dec 2023 10:33:52 -0800
Message-ID: <20231201183356.311137-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231201183356.311137-1-raj.khem@gmail.com>
References: <20231201183356.311137-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 18:34:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191680

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes-recipe/rust-common.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes-recipe/rust-common.bbclass b/meta/classes-recipe/rust-common.bbclass
index 3d73a370ec8..5bdaf0c7a69 100644
--- a/meta/classes-recipe/rust-common.bbclass
+++ b/meta/classes-recipe/rust-common.bbclass
@@ -63,6 +63,8 @@ def rust_base_triple(d, thing):
     # This catches ARM targets and appends the necessary hard float bits
     if os == "linux-gnueabi" or os == "linux-musleabi":
         libc = bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', 'hf', '', d)
+    if os == "linux-gnux32" or os == "linux-muslx32":
+        libc = ""
     elif "musl" in os:
         libc = "-musl"
         os = "linux"
-- 
2.43.0


