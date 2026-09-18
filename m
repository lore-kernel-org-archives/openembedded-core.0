Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 076EAC982D8
	for <webhook@archiver.kernel.org>; Fri, 18 Sep 2026 17:29:33 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16212.1789752570919333655
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Sep 2026 10:29:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=C1rT4agI;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.141, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d37b6so5076225e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2026 10:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1789752569; x=1790357369; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1kRjghf7Bno5CUxX+NtNFuK/QeQt832SsHHDuNAgnzo=;
        b=C1rT4agIdGCBJ0beSQ+w+mB/b5Ld2Sqi74QDEl02IolT0jfFzY7C037xd1h5BV1sPP
         pcGziSka2ktVBDIkBcIiZtcmfiITMO1ogIIovYwar8bBBHac0skxhdL57AMM4AaVNs9Q
         ZiQyz8Bpadn2Kfa2HePw0PLB7uiaQeyIAi3Jk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789752569; x=1790357369;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1kRjghf7Bno5CUxX+NtNFuK/QeQt832SsHHDuNAgnzo=;
        b=m/RkbX0rpfkPHexgi7XkqxM5zwTopH4aK2s+WHQYs+tCaYcLtJeLWEyg1OK3Z+9Yyk
         9/3VTNXiXz6OHwznjOLldhZ2DoHLzGWcZOfpPNH+LaV0Zc4ctxU49LUmJx7fdGko/bMt
         UFBcXhaJ9/NOxv1Kb+25zL7tG7Rjuqj0pLuHuEfRRh+vd6y6QU0QImv5vL/ngO6mbemS
         Q0W+E2u/pXMrWrLyywxKGJOc8kKRtao/TeJjFPk+G+f0VZknmK3BrtO9SWOawhzGIUm0
         aA+pcauZvM1uoihE3htwWiQJ/S6OYEpIILXkSp1ju3YRdEIRphAMk+hhlwJ5KQfUzgi/
         TREw==
X-Gm-Message-State: AFuF++ktlER2r6ZmNQHjnbC8V8eVAF+Y7fdeDivQCSWXJUtmxFh4yFH4
	ruGAaXDYhzAzfjOspgDwOz3ndgU7NETYi081b4JJZv/fO0dpgUDYUthN82huufs3yGW7XTNwZi4
	KrPrz3Po=
X-Gm-Gg: AYBFou3qPyzA8KHxVROeLtDAlNPyLU9fyJuH+0ZrJQ1wwaJwyDDlo8G5dznNceqI9O5
	kGuxniaHiWCFywwyFOVBrPcgE0pKEetXV7c5I7ywolAE66YWB++GsRAlRAeWTHBsyUS5kCRf3Kc
	JXt8xrRCVqw/aj28Q1NuABJEfINyAIUhN0CSJ9yIZZB7paCA98puRw7p5MN0LpBTxZFiR8dxwYL
	nBbzCdv63BL1FFS/Eprm7V/0ZTObfgypUqsGglDzm02iGZOpEgDLo5CyDAKzr1PA3+dSPSgiE5T
	E9QdoSznYamvXZZdytbU/r3KKt8+KMJFVPv/3SabpiSXS8Mp6QJQmdojBTG4i30oBS5aSnGGcG1
	LMF13WqxMhZnC+Ics7cJpdYd7vbrv2tdWvst83RwlqByV5fwJFMkXmqH59j0PS9kqjkBqL2tTFo
	kFNwZlmROL8dsuKIaoeouLW+K7k7oFX8qp5UFdvj0OCqtC1CaTtRWE13EOvHymyB/yiuM+a1URM
	oZc/75YgFn7NuNW/1QN9ouE7kA=
X-Received: by 2002:a05:600c:5489:b0:49c:dca4:94c with SMTP id 5b1f17b1804b1-49fc573579amr91941025e9.13.1789752569008;
        Fri, 18 Sep 2026 10:29:29 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:22f8:9184:5b80:7430])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724593f5asm85760f8f.28.2026.09.18.10.29.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 10:29:28 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] lib/oe/__init__: Fix typo
Date: Fri, 18 Sep 2026 18:29:27 +0100
Message-ID: <20260918172927.2904454-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2026 17:29:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246223

This should reference visitorcode in qa.py (spoted by Peter Kjellerstedt,
thanks).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/__init__.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/__init__.py b/meta/lib/oe/__init__.py
index 7357a71f27e..1e47934e6f7 100644
--- a/meta/lib/oe/__init__.py
+++ b/meta/lib/oe/__init__.py
@@ -7,7 +7,7 @@
 from pkgutil import extend_path
 __path__ = extend_path(__path__, __name__)
 
-# Modules with vistorcode need to go first else anything depending on them won't be
+# Modules with visitorcode need to go first else anything depending on them won't be
 # processed correctly (e.g. qa)
 BBIMPORTS = ["qa", "data", "path", "utils", "types", "package", "packagedata", \
              "packagegroup", "sstatesig", "lsb", "cachedpath", "license", "qemu", \

