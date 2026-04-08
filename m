Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 368BD10FC44B
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 21:45:17 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.117926.1775684716120511194
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2026 14:45:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ehwPqvNy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso2180735e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 14:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1775684714; x=1776289514; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=vu63C4/cOvK2kafco9rS4JYepZPQjiOZ9Gc8P4xX21M=;
        b=ehwPqvNyOWmNVl1z0UpFWEqkLdyKoPYVatO/xxxvjCaweChfap5ynIJsxF3CVc5dsa
         q5wkf89U3Y5bdGakkAihwsya+PZ1NYepqsQj+aLFV1CK8bbEENoFEBekk9rQ43rgu7uj
         YiGFhbTQwHyd+xxvn9fkV2LZibvlwt/EcqlvE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775684714; x=1776289514;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vu63C4/cOvK2kafco9rS4JYepZPQjiOZ9Gc8P4xX21M=;
        b=T7BD++jix9St+OlMvAccKxOp51rbHAYBziRi4oZxwb8Bp3XSCs8Vfg1EdwNnQ6PVbn
         HMigICyXhamHWZKmOuU39WggOQo5Q4G7CIoy6mJG0lyLhU/KVTZSyw3WJw6QATCucV46
         06uFg/o/W7OSvQDTdeAIsF2PNS0qiq3Ev4M5F5ByT0TUpSY2k2nm6xkzAn+hNMTk5sR1
         BS583A4yonZLZEsJ3v8c0R8Q5pH8U2Z8AgmKp4QB4Mwm7LIUv6doPiy3+QVzVQxdUrQK
         GrcyXpDTVsR7mcmEBP63VQVJo2YZGWYceUxYN//nxgaJncGAgRBoN8rz6mUmSkEUgdLi
         ie3w==
X-Gm-Message-State: AOJu0YwZXp0G4KbyEhXxeW64mCbK0Vbiqd8BxCB3s9G6HzSVkhVBWZbl
	hAt3E/qns/shtXXUy9imdpaNsAOx8Z5I6tGE8E+7y9axAg2pAmJkdYFG6tVCNgTH9rkoD4lj8Ae
	k+12MvBI=
X-Gm-Gg: AeBDievW3MhrgWi0g3HcmJiQkdL14lA2v3luy+z9jd9dOTeMXCmVyza4aCLLQyDEaq+
	fkLP609m5GEgL3aPOA0Z4xpyESclql3tAZsIDZrr4zBjCs9vCyfYbfERWjJfZ+083HAXAhNM66b
	8pvTciQ9Buuc9YWshIp0Qs2z01nCXXFLUy0X2EFdzKg8i5nMysazweYP5DixavzsM6G1ArLYjyt
	YOwrQl9xcx8XE+kwJ596QrrDVVv2dN23UXKAMUiJWW80Ri1Fy6EHBbhtl/BLcvg9kgF5QnLjMNK
	bzR2tDNTr4T+YHyXcYanLwaZU3nEnjtwVSBpmsASisu4kbnLvHKNOpVt8SycudJVQv7NIuuuOh/
	nnxNMZX5cxgweuSnpJmOtXkFifO+FxBdABBthsEdt/cnC/UFE4fVOlSRjmAZitVajjDnMFHS1wt
	JtNCnwPPC6iPGUT9d+1qfq4GibAFgcqoCX+YXgBi/vQ7O1LSh0bHw=
X-Received: by 2002:a05:600c:1d21:b0:488:c6e9:1e0c with SMTP id 5b1f17b1804b1-488cd5282demr13350865e9.5.1775684713953;
        Wed, 08 Apr 2026 14:45:13 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:530:d4f8:22df:8c0d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488cd19ea6fsm20415035e9.2.2026.04.08.14.45.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 14:45:13 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] recipetool: Recognise https://git. as git urls
Date: Wed,  8 Apr 2026 22:45:12 +0100
Message-ID: <20260408214512.2072618-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 21:45:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234865

If a url has git. in it, assume it is likely to be a git cloneable url
and should be treated as such.

This allows us to switch from https://git.yoctoproject.org/git/XXX urls to
the preferred https://git.yoctoproject.org/XXX form.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/lib/recipetool/create.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index ef0ba974a99..adafaba47e5 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -368,7 +368,7 @@ def supports_srcrev(uri):
 def reformat_git_uri(uri):
     '''Convert any http[s]://....git URI into git://...;protocol=http[s]'''
     checkuri = uri.split(';', 1)[0]
-    if checkuri.endswith('.git') or '/git/' in checkuri or re.match('https?://git(hub|lab).com/[^/]+/[^/]+/?$', checkuri):
+    if checkuri.endswith('.git') or '/git/' in checkuri or re.match('https?://git(hub|lab).com/[^/]+/[^/]+/?$', checkuri) or re.match(r'https?://git\..*', checkuri):
         # Appends scheme if the scheme is missing
         if not '://' in uri:
             uri = 'git://' + uri

