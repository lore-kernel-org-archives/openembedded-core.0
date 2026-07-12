Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E8D2C44501
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 05:51:37 +0000 (UTC)
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9497.1783835490524843662
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Jul 2026 22:51:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=HR47PJbL;
 spf=pass (domain: underview.tech, ip: 74.125.224.49, mailfrom: vince@underview.tech)
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-66780d9d901so3044612d50.0
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2026 22:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783835489; x=1784440289; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uDLR3PUR7Nx3u2Gz9Ars8iLhnguYzTWYiuFtpwfrkso=;
        b=HR47PJbLIclsnF0YoJ5xfGZFLOjWLUy7wDAPq3TTjGsguERThCCkwnxZvTkpWIyNVz
         mb2U+yV4HNppNN27u4oYacUvwNnRY/NthXBlKiX8uLjdcLT/oc1LZ6L6VmfUIp2nHfcN
         qSq+SW4w+rmKvVddF7jmESVYqRmFZGCALzNM6BvdjXkXyawneQpFQvg9bDpnzbGwn/PI
         KJK06GGWZcRbEtdAbCDlZdFW2+RI/AxXsn9XM/Kp99QfYcOoqel5mA9zAYuz3DfHOz97
         YAq/4G6gki9lAClF6XFhdGy8Tsr4xoML5R5yGERnmPvebMow3Qf85CrVWva4KjPakmY/
         Pzng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783835489; x=1784440289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uDLR3PUR7Nx3u2Gz9Ars8iLhnguYzTWYiuFtpwfrkso=;
        b=iwaP0wfLUwUF6yIGolAGeybGXwcXF18fsU8Up36S6F/w8MF49wiyq7TAItojwJBbb2
         KV8hAT1ZdAAcmQKFszQ8uttcI80mQkh4gRWzzvE/dGu480xFdVzY+VGtX9iiJa42X+fC
         K6KwkC4nXZ/51VR/iMrVezow16AG9MOyPjf1/EOXqQKmBUunDlxg0DsNAS/kVn2SJ+TS
         1/nGtrfJDY+jVZu/XEOArMFAygEpCsZaOyJ9/JosoDzlgUftffedBsGw7BJDPBbLAOb/
         YaqQj/mJNhmp5bKpw7C+4/ywmblXTOrO4v2yLuFQZ1k2DiY2Sh9MxAu2QbohBZ5Q7+VW
         y0Uw==
X-Gm-Message-State: AOJu0YwWXm9GoiiHhRhvA53JAB+HueJasxtK4LFPkjT07LPWVw8YcMaW
	SGCPR3DTHZ7B7D9NofpDjzcmwcw9lsZQPSg6JepUY9GICyo37hRoQ4cj3Yqf2hd7/vmDTJelnLR
	7jWHvxco=
X-Gm-Gg: AfdE7ckk2ZhZFeWkbIY74SNRJf2clzUZPjJUdvloUVentN/rKjGXq6IdgwJYognclWw
	UcGtB+XWxgZD89vJ7xZaSrCBbGoXEXSGGYG41ayN9ts6jpDgcnwuhiB4tk8LuISog0FzLc2kXNO
	PJCsV2RIvtEHRPgYbkjm5tv/g7mOMQDAo3QMqeb/QbQjNjj3mkySAB6zpAYekwWofnNU19upmiv
	hR9CgiWpq4K9BhfUJp16QwiZpkorF0Nl6qLbSQk1gb+h06LKNwFIzkWf7A/KVSrrjdQaQCU2ahi
	bpKKqMdtPdfzjLevWN+Z9fiUntn4hRNAp7bBh/7vSvjTK+4GCbDc36J0Vd+kn/eD2085LH73O3q
	px5D+aC3gMxRC97DgXvmrZ101OSeTRKbk1AMUT8m6mtvMf4PsFohcldqnChUVP9935ZclTzYdcm
	GgMbxebuPW9S3aWw==
X-Received: by 2002:a05:690e:1447:b0:666:80dc:aa51 with SMTP id 956f58d0204a3-667d7ac1db3mr3693810d50.23.1783835489614;
        Sat, 11 Jul 2026 22:51:29 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6678779e37fsm10764901d50.5.2026.07.11.22.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 22:51:27 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v2 04/26] kernel: remove setting of KERNEL_PACKAGE_NAME
Date: Sun, 12 Jul 2026 01:49:32 -0400
Message-ID: <20260712054954.4063745-4-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712054954.4063745-1-vince@underview.tech>
References: <20260712054954.4063745-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 05:51:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240729

Must always be globally defined to maintain
uniformity with builds if KERNEL_PACKAGE_NAME
variable were to change.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/classes-recipe/kernel.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 5fc5f3e31b..449c7a7576 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -107,7 +107,10 @@ python __anonymous () {
 
         d.setVar('KERNEL_IMAGETYPE_FOR_MAKE', ' '.join(sorted(typeformake)))
 
-    kname = d.getVar('KERNEL_PACKAGE_NAME') or "kernel"
+    kname = d.getVar('KERNEL_PACKAGE_NAME')
+    if not kname:
+        bb.error("KERNEL_PACKAGE_NAME is somehow not defined.")
+
     imagedest = d.getVar('KERNEL_IMAGEDEST')
 
     for type in types.split():
-- 
2.43.0


