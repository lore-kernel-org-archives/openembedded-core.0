Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7D6FCA0FF7
	for <webhook@archiver.kernel.org>; Wed, 27 Aug 2025 21:30:59 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.6622.1756330253142661124
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Aug 2025 14:30:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=g4xsFWLL;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-327a27e0d6eso347716a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 14:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756330252; x=1756935052; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=65g7QfRwoMNeoDR7USXzYAqii/ACTYRfwBvXmqNjqrA=;
        b=g4xsFWLLI+Y8nT4euXuowtxJe5wrIGh4ZgS/WuYZmFfw5cbk75CxPPW5yQN3g5GenI
         teiA0MPiKP9msa4qrGIAgp4ZPzSuDurEJU5roTKamMkoaMuLh3XmT+Et9sn8dJY3QnQs
         wU0EHXUTld+kbKMS8TeLLFg4J9XfnnqbUyROA0u5eWocvOXJ4NJfoTsxiLHKQVBTbg3Q
         Gbz4x+UxDkv6LKdruczvlRYowtTnZW0NS/x52npt3n3Avk3TeCAQ+FSkY/+wOUns/C4E
         cXnl6yP0HYuCoL9HZraDxqlMoDTIYQJ1rk39tf+VEN35XFy5i/ASFepTqFx/ecMu+3eR
         m/tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756330252; x=1756935052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=65g7QfRwoMNeoDR7USXzYAqii/ACTYRfwBvXmqNjqrA=;
        b=wkaQ9jjbx+/zjMH8HzUV0pt10ftmQGHAdb0PD+2cGx4grRE2L0K3Ou7yeUrgU6qjun
         vc5CxbS6F2X/55VsQgQvOSRN6A2RkxsfS5ngkA8J3+Cvsb6wlX9/0pRDyhv7pHk3Oa7z
         WKos7Z1VEf7sa3y9yp+CA+9Wx1NLkD+mnlRYto7bGdUY9npwNYu8+HMD5GGrFMsu6Gvg
         ETHYs86qN3e+rlB1eq2afNupqRphJqN8HvRgIdJ1dYKUxu/NsTVW+MwiSl337xMd15KJ
         cGX+l45nTFJTZHdKwLJcVrJbFHpKVneKV9U55N1YA/TwyMr82V2mTFis42a/JpUABU/B
         Cyww==
X-Gm-Message-State: AOJu0YytODewrWS+X5mTX90Sfw2a9nhpcJ3MRWw0vOHmMk4PI35YCdTd
	Bb7vsghgU+Ns+Bqxn7Mba+2nKjponhBIRZqztXubEN1ma+ZcRysFyIq4+0SNtLoSurkwcIghzAD
	AcvoA
X-Gm-Gg: ASbGncvoCH1R71zHsmLlpvovTcONm/xEwV+zvDGaCc7QPoV0TBA5Sl1GmOyiVl7c7Dx
	S4ZzGPilOSfMeGuE9MsfDOre2RFVXHKCOWpSbG+4Cm8H18GTKjAejnAHK+j30XypnGkUyY5/0Rg
	ux2EhS7qEcL3eH4IVqCcHb8cY5WtJhjchbuD5Xoo77gnlAkagT1NzW3p0cxri9cQeG5PGaLkMNZ
	KBqnRYvRarwxmtDqAk+VgEGz2xdrVRbFw/IVBI4+yZW2EJxTs//YYvpMY5UOnuG8hMsQvbccMdc
	7mU2ZtFDNIGPowocEjpbV2AYRIbMPw9OjJ6e9W0wP1hgVEOq/VMiJ+UnsZw6UsJm+V8+G4hXcci
	S/QWIZz54HSaZutt/tD6xsXtl
X-Google-Smtp-Source: AGHT+IFpJh8sexeXoBEscyloT/0Jg/0Eq9oG2KDUFKrLPQtcKGUN2BLIGou+84d4+wwHDtjWFDLqkQ==
X-Received: by 2002:a17:90b:1642:b0:31f:104f:e4b1 with SMTP id 98e67ed59e1d1-32515e3c8f4mr26427533a91.7.1756330252325;
        Wed, 27 Aug 2025 14:30:52 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:d0c9:1052:20fd:8423])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fce1f30sm2905857a91.23.2025.08.27.14.30.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 14:30:51 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 33/33] sudo: remove devtool FIXME comment
Date: Wed, 27 Aug 2025 14:29:40 -0700
Message-ID: <a19afb7db1b9995ce433f8bfeb5406c9fd1fdc19.1756329972.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756329972.git.steve@sakoman.com>
References: <cover.1756329972.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 21:30:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222541

From: Peter Marko <peter.marko@siemens.com>

This comment should not have been merged.
It shows that the license did not change.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/sudo/sudo_1.9.17p1.bb | 52 ---------------------
 1 file changed, 52 deletions(-)

diff --git a/meta/recipes-extended/sudo/sudo_1.9.17p1.bb b/meta/recipes-extended/sudo/sudo_1.9.17p1.bb
index c5d57da9f0..5b9d73b33b 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.17p1.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.17p1.bb
@@ -1,55 +1,3 @@
-# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
-# The following is the difference between the old and the new license text.
-# Please update the LICENSE value if needed, and summarize the changes in
-# the commit message via 'License-Update:' tag.
-# (example: 'License-Update: copyright years updated.')
-#
-# The changes:
-#
-# --- LICENSE.md
-# +++ LICENSE.md
-# @@ -1,6 +1,6 @@
-#  Sudo is distributed under the following license:
-#
-# -    Copyright (c) 1994-1996, 1998-2023
-# +    Copyright (c) 1994-1996, 1998-2025
-#          Todd C. Miller <Todd.Miller@sudo.ws>
-#
-#      Permission to use, copy, modify, and distribute this software for any
-# @@ -247,9 +247,9 @@
-#
-#  The file arc4random.c bears the following license:
-#
-# -    Copyright (c) 1996, David Mazieres <dm@uun.org>
-# -    Copyright (c) 2008, Damien Miller <djm@openbsd.org>
-# -    Copyright (c) 2013, Markus Friedl <markus@openbsd.org>
-# +    Copyright (c) 1996, David Mazieres <dm@uun.org>
-# +    Copyright (c) 2008, Damien Miller <djm@openbsd.org>
-# +    Copyright (c) 2013, Markus Friedl <markus@openbsd.org>
-#      Copyright (c) 2014, Theo de Raadt <deraadt@openbsd.org>
-#
-#      Permission to use, copy, modify, and distribute this software for any
-# @@ -282,7 +282,7 @@
-#
-#  The file getentropy.c bears the following license:
-#
-# -    Copyright (c) 2014 Theo de Raadt <deraadt@openbsd.org>
-# +    Copyright (c) 2014 Theo de Raadt <deraadt@openbsd.org>
-#      Copyright (c) 2014 Bob Beck <beck@obtuse.com>
-#
-#      Permission to use, copy, modify, and distribute this software for any
-# @@ -299,7 +299,7 @@
-#
-#  The embedded copy of zlib bears the following license:
-#
-# -    Copyright (C) 1995-2022 Jean-loup Gailly and Mark Adler
-# +    Copyright (C) 1995-2024 Jean-loup Gailly and Mark Adler
-#
-#      This software is provided 'as-is', without any express or implied
-#      warranty.  In no event will the authors be held liable for any damages
-#
-#
-
 require sudo.inc
 
 SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
-- 
2.43.0


