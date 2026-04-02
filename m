Return-Path: <adam.blank.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A462DCC6B02
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 14:55:15 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17664.1775141707751669035
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Apr 2026 07:55:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=EWp36fNQ;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: adam.blank.g@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4888375f735so8305105e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 07:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775141706; x=1775746506; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R1UkAF/wrDsew2MBVtrBkr23AEUmEwMP9hDgEZ4qb4A=;
        b=EWp36fNQYvXCuWEQmg46YHB8ideHneHiI0zaLtURK7yotBcjAgoaR6hdMOQ/hA+mTD
         2Lq/LULBy1mgRkDGP2norK8Iqa5CLVXzcQm2g8PhEQnGXOUqwDvnhIewiOuSGswES4kc
         kCN4EKMmReH0l/JsHkVLvkEvX9LAVrIu/HWkLRVEFJgiR8ylNNeMq2jZmkct2AQF7PHA
         RLik/JIXE+j5N+fyRKeFg+Z4/cV25rYkhsQNyz59cOZYHoLLfTcy75ZyWkVbIOQhOkQy
         DaJGgXnp53YWkZYXgv3dUx8UGEKy81AD5PIoG6A8pmuRgiSqyX7GhMUq7zhRMsfeYvW9
         OUgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775141706; x=1775746506;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R1UkAF/wrDsew2MBVtrBkr23AEUmEwMP9hDgEZ4qb4A=;
        b=OKbSiloS7oe5CU2L6/6dT9shOLnY9Sb1YUpkJSonZt6aAR66RP2QMhqdJDqjT0b/bP
         gGCpUPHqQZQDq7n/cZEl5VmMXbpLySU/pRAXVCM53e1lJLqJRSQSyjnebf4TbpqZwvHy
         zj6WoA8QSogbHoNi8HMEXQsE+5b+LV6AxjdxbBltFshgStkCShLLZcPgGkOS5unDWZQ+
         0BDu4pw8QHPumbAhejGp0F4oY7N4O86YNtqILt0vZ/Ekf0lENi/MoT19E4TQ7o9vw3s2
         CwgaPj294ZWmmCJc4fQYqnDc2zDe0G62REus9mkOAMNSsVODb4ELv1D3lyj7Iug+K0DS
         AXHg==
X-Gm-Message-State: AOJu0YyEpN8FTqHhjeczLMgt6Gol6seRdGujNYLWI8AgB6lJuYKltIQO
	dE10OsVEARXNdPEvHbA67o99OB8OellJlmVOa+b/gmzL9tnzXbQiVC1PFGr3mQ==
X-Gm-Gg: ATEYQzwaviftlqb8Q+Md0P2BmktRCEjXwkCxFx1hFn45FVmUF5IM3umOBk/R1iWPOWI
	Q0QmIsk/YWeBMiuKyZ/8XXwYudmIO4h1TZDeVZUKUuvFkca/YgKjyh2GtXBrFhzy+9Np8wADy21
	pSznsFxXOjG+CmY9FqrgMBQskl0hV7os8UFmIOZrn9IjI+t40sNO0Kb2HRxyrzchUAE7YvfI3GS
	Zigw3CPihZ1xAzH/YN3nctCrmUXHjiJ6/H/OL4QoYqZw2TJkkhD/wdKtJStpRhz45bRprEtyTEr
	oTnFJQxQtzyn2hNByJaO9vU5ORPjiGXflFuCCYH8dtclne0uuYRcSHt6xul7gtARvvrutKLTjPi
	tB39DJ39batjI+GpQwtiGT9bWBHrY6C5vS/IJXj5Uo3bx7henYraKd2GI2BUeeM94wtMftTdWog
	innkAx0ujo8aW5r8AnEhz16PnhZq5kEQ==
X-Received: by 2002:a05:600c:34c1:b0:486:fbe1:2499 with SMTP id 5b1f17b1804b1-4888359dc6bmr123090305e9.22.1775141705884;
        Thu, 02 Apr 2026 07:55:05 -0700 (PDT)
Received: from [127.0.1.1] ([2a02:a312:c8a8:7a00:5efb:8aef:32b2:ddfa])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4888a7162cesm98841235e9.13.2026.04.02.07.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 07:55:05 -0700 (PDT)
From: Adam Blank <adam.blank.g@gmail.com>
Date: Thu, 02 Apr 2026 16:54:58 +0200
Subject: [PATCH 1/4] lib/packagedata.py: slight improvement to code
 readability
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-dead_code_and_unification-v1-1-5a3906b6340d@gmail.com>
References: <20260402-dead_code_and_unification-v1-0-5a3906b6340d@gmail.com>
In-Reply-To: <20260402-dead_code_and_unification-v1-0-5a3906b6340d@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Blank <adam.blank.g@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775141702; l=844;
 i=adam.blank.g@gmail.com; s=20251027; h=from:subject:message-id;
 bh=mv9MFNuQ8Ux/HNUumCsiHHzQXncmQNPOqSgyEEmC7Ps=;
 b=fNjxGU/snEhK40B+OVHFT3WsqLBGE6/jeM3n0/PV3s8i3rjJBPTHNoAeuZRD1Ak/rT9juxMZL
 c//8zHVrZHXATCk//UggFtqn/By9CpQwmOiSZRlB1Exk9cLDD1Pkpee
X-Developer-Key: i=adam.blank.g@gmail.com; a=ed25519;
 pk=5t8u8IPKPL1CUykIX2JYa+1iHdXRdN5MqI7ik/fbvEM=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 14:55:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234533

Make use of an existing variable rather than creating a new one
when collecting files of a package.

Signed-off-by: Adam Blank <adam.blank.g@gmail.com>
---
 meta/lib/oe/packagedata.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/lib/oe/packagedata.py b/meta/lib/oe/packagedata.py
index b6a10a930a..65092261f6 100644
--- a/meta/lib/oe/packagedata.py
+++ b/meta/lib/oe/packagedata.py
@@ -340,8 +340,7 @@ fi
         allow_empty = d.getVar('ALLOW_EMPTY:%s' % pkg)
         if not allow_empty:
             allow_empty = d.getVar('ALLOW_EMPTY')
-        root = "%s/%s" % (pkgdest, pkg)
-        os.chdir(root)
+        os.chdir(pkgdestpkg)
         g = glob('*')
         if g or allow_empty == "1":
             # Symlinks needed for reverse lookups (from the final package name)

-- 
2.43.0


