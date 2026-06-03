Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E835ECD6E57
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 17:27:18 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25538.1780507628408180102
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2026 10:27:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XgM//yOX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490a765d410so44316685e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2026 10:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1780507627; x=1781112427; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xhi1vvJRcoPs6g8OmADO67ZIqxVk+bfg5QQyJuFGGCs=;
        b=XgM//yOXZotfz+OIaMQgXj//mLNRGNUJNZ3FRpoXt+IV0Rw14KRJ3NIm3hIoBGjamI
         2h9opBXYuJAIBmxOvLZA+qD12h68pPATKBl9k6mB3MscWg4b/9zMuN97gYXWQ8h88ngc
         dbAGw9MwTNaIm7eyXMDWPkLa0RK4nRmt3SvEs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780507627; x=1781112427;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xhi1vvJRcoPs6g8OmADO67ZIqxVk+bfg5QQyJuFGGCs=;
        b=FAw5aAZKILDgb1cMlrRB+pu5kviRmHwnjfOornNJ6pi9mwLv0NCSjLQzu119V0V77c
         bQY+Tr+fxUjqTZcztQDUs2YqNNikNnNdovwxlJhuvWto2bGqjmnvzBLM/X8mLm7ld/3e
         1YrfhKsTFcgnZRtZcfiaTlLoBqb1rshL1a5cuIGlAN5lpHK4unsOYB/avHxSMOqi3+qT
         CIkLWzwcQPMoubw/14rKfUYcUBP2XVkVWfNkG1TxDtmqIglqh0VMbtRKUR1JHHwmg7El
         0S0EFkTVyq44jtMW65I80/kzsSBirEaGoajGW6/TRfPP7A805k57Lh+iRe1g48smJpRU
         Sxcw==
X-Gm-Message-State: AOJu0YxILWkJ4iGKGQO65N3N85McYci2jLE/NeRcArGEkwTKvMO4Yn6U
	M3vSVlWyESVZYaEip6hZfD7Wh+6O9baOgwvJcrJUiFh5JG6HiHC9ISMPFAm58en6tB3zwCujRF/
	tWZ1L
X-Gm-Gg: Acq92OH6OvNgRO62yuSiNvCtdn40pzrKA85oxTXO1ULp4xkAjSUrrQ1AjkwlpHhV1fg
	fzoW5uJ36QZ1sT1G4w3nWDmADnk0bYgWW7OhKwcDH7NGlNwPCxXP0Biq+jOvS+HvBWTeuALtcDY
	O5ql4Yd3ybOa6QoDbUTNO5hVjNHxvlp87mV7zTRYfzJo+SDNomW444aXjjMgsUb/6mwkI+x5rGH
	nEk5qBUbU7n2I2z6ci13ixvf/iAmZBIIfnCLlo7p8JMdiVEjONeot9fg+bCnQGliBzaBCmZmE9K
	MHZocghwoPe3LnA03UoptFxph9rmlomAuarT4Ze1wvV4tPqc3XzchCiE9HZWZ47rRKCo7AFcojd
	aN2z1BwVUv/NXUjk6c70jCIEvkIGnq998oMVSjZ9AnA972Fj9qH0Leb7yO90XUy3J2aN2ACEtKf
	gW+5lPnsGH80Cr5KRIxbKquXBVV060xkb7Re0722tkpF6hGnHo/rCc6yr/hPLhhg==
X-Received: by 2002:a05:600c:4e87:b0:490:b58b:a8cc with SMTP id 5b1f17b1804b1-490b5ed0535mr73271915e9.29.1780507626588;
        Wed, 03 Jun 2026 10:27:06 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:202c:df88:9261:8b8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f35fb24sm9677690f8f.34.2026.06.03.10.27.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 10:27:06 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3-pycryptodome: Update LICENSE PD -> Unlicense
Date: Wed,  3 Jun 2026 18:27:05 +0100
Message-ID: <20260603172705.1495285-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2026 17:27:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238108

The "public domain" license in the code matches the SPDX Unlicense
license, update accordinly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/python/python-pycryptodome.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python-pycryptodome.inc b/meta/recipes-devtools/python/python-pycryptodome.inc
index ec9241e6d5d..466da553e75 100644
--- a/meta/recipes-devtools/python/python-pycryptodome.inc
+++ b/meta/recipes-devtools/python/python-pycryptodome.inc
@@ -2,7 +2,7 @@ SUMMARY = "Cryptographic library for Python"
 DESCRIPTION = "PyCryptodome is a self-contained Python package of low-level\
  cryptographic primitives."
 HOMEPAGE = "http://www.pycryptodome.org"
-LICENSE = "PD & BSD-2-Clause"
+LICENSE = "Unlicense & BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=29242a70410a4eeff488a28164e7ab93"
 
 inherit pypi

