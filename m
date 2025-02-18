Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E602EC021AA
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 15:22:31 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.21896.1739892150049653101
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Feb 2025 07:22:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BEqWVU+a;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43998deed24so3010415e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 07:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1739892148; x=1740496948; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mzt+ysTt/YPP4z7YErmAsDr8bJLdVDw5vrZUVVvhbSI=;
        b=BEqWVU+aDtQufPttsp1k0KkYqUu8A2oUE+MTUyA/sgJUiJAjuMC4eKUKs1i6TB9Stz
         C6OO822JAzQTZUFp4NCTunwXTpCDCqDSiz2T6IW0SwQq2NVRlsnyQV1nk9daLHJBEqTa
         LZTFyUwY9PM4YDSxDHzIq1pbZSlFHbEIk0zUo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739892148; x=1740496948;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mzt+ysTt/YPP4z7YErmAsDr8bJLdVDw5vrZUVVvhbSI=;
        b=HMzOjkkeskwpUzC74MrGsI8Kr1GpkizZ77mCZEeR1U6QkbtO4V8xe7+Ev2MbxQQDIZ
         BUU3h9dIq80FMO10++EruMnu5pZd0gbjXRxgpzZBNQTxiPQOBYd1ru44kF1/Md/p638T
         mu98k2z3J1UDlySXMAbW8eoXBEKQhyNRvitZk5SYyTsg1i6KO1csycU6IfpO+EBHrYZZ
         jBVxnx2hMIhNbgoQjPV1BGUUlDAsElAwV8vqRleUkiFACc6rN3SsQSJpup/4V60SUBnh
         iV4BCnTZWTAqXapqeCncWMuapTQNXAigQN8CiiuNVXY6LEXq3v/t04BINq0k0h/9/AnU
         lNaA==
X-Gm-Message-State: AOJu0YxFHQF1Wx7SHLLB8bTTrt+5S4ugC4q66JuIl5QXCpOHZBxayYos
	ZZLrhAwXhlQWjc8+xo3M71DCPqApSZ8av2LuJSNx+cfbhCcR5ylybkWC9dJRDK0xsCtZ6qkCRTa
	1
X-Gm-Gg: ASbGncvKfHuAPfKnib/DEhSXlcjQDDo2ZwNjwym+x+Z6XKmMuqstnnbZpB9rG0h9HiS
	Gcm70lohQqCqP4Gyp7uL3IjEAjfgn1FfZPnoPLl2xE35JXG2zcBSLPC64mMi5VaCuIjOCw6zsl+
	AiaSWc0spHBNUlZOdvze1fJdmBB1oaD56iznkrLXq20kcHGe+uaDFP6sMn01DWsL9n+UzgLQbC4
	211QvmiMuzSeb8N2ilUf7V2rvmbz4QFFpyTmcA1lMg4zIi0+KyAIXfPmGDBeuLxd/3VhmHqGsnd
	MaVlGfJeWQyjknmNJGKM534vSZPMmFhudPzyZTz0qg==
X-Google-Smtp-Source: AGHT+IF7qe0rZqR1n7ghZnbn8uHi5gd/2AmmrnUNZdLuOR6+9S6QR1lWieZZHWLHS9GqNK79MJwETg==
X-Received: by 2002:a05:6000:1f87:b0:38f:2c10:da07 with SMTP id ffacd0b85a97d-38f340735d8mr14283433f8f.45.1739892147887;
        Tue, 18 Feb 2025 07:22:27 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:a6c8:42:fd4f:69d2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439963099b0sm16532385e9.27.2025.02.18.07.22.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 07:22:27 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] base: Fix PACKAGECONFIG handling for cross recipes
Date: Tue, 18 Feb 2025 15:22:25 +0000
Message-ID: <20250218152226.1410852-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 15:22:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211628

We don't have many cross recipes that use PACKAGECONFIG but gdb-cross does,
so correctly remap dependencies for that case allowing the gdb recipe to be
simplified.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
index 924f319999e..8215969c7bb 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -464,7 +464,7 @@ python () {
             if "DEPENDS" in varname or varname.startswith("RRECOMMENDS"):
                 if bb.data.inherits_class('nativesdk', d) or bb.data.inherits_class('cross-canadian', d) :
                     appends = expandFilter(appends, "", "nativesdk-")
-                elif bb.data.inherits_class('native', d):
+                elif bb.data.inherits_class('native', d) or bb.data.inherits_class('cross', d):
                     appends = expandFilter(appends, "-native", "")
                 elif mlprefix:
                     appends = expandFilter(appends, "", mlprefix)

