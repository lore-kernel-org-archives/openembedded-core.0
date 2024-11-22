Return-Path: <aleksandar.nikolic010@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94A3FD75E30
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 11:48:55 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.22118.1732276130632978552
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Nov 2024 03:48:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RNiZYDow;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: aleksandar.nikolic010@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a9ed49edd41so338518666b.0
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 03:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732276129; x=1732880929; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DHGk1JCrOcBfFgTQwIIbov9nkzM4We1YPfS2bbJSGus=;
        b=RNiZYDowIMvMxyoSH4l2ZKIE8u0zlGSKO9rgYpf8w5KOZkoSLNJvznv9jR5DShLOYf
         qbKgoYnJPKZT1bmi9bbcVn+L8gieZdmdXTyrcnSWlHIMDrzaVnvnt1qWtudSJvqStfXn
         YvGnwSQ+IBubJPvJprx03wxgRRLN0m/GuSDyFlsoHA9pfC6AEIfL8rv8kcbV/v4vAh1s
         h1mi3gFoPhCbmCCgDmM5y5q3pBazUhAs6jl4BgXaFRAD7a1MbkWWYZqCo/tALZmCOuaM
         pygMIq/a0lELEcIHLTQQdihza0RYKUdVhRQ7CEChLqr4+dSnGFRk2zgC41BpL9ywFWHN
         zYUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732276129; x=1732880929;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DHGk1JCrOcBfFgTQwIIbov9nkzM4We1YPfS2bbJSGus=;
        b=XRE/ZfG3cZAaL7jNjlZryFHLVGi/V9SaGkEX3IyzPZrtsFrbfijsfw0nwGaouaiUDR
         LbrnELlTSyYeOMbTPwAMbfpD0J/Ap2ljJtRBtMt2VOfVDN4/fqaxqaJkb3EJUnsget2l
         zFOuQHQYekaZ5V3iSPJs1edx4YiryhzC60921dwQ2CpakaOTF0CdKI9YYL2ipfLTuIai
         wra8oZXkK7DnIalMpkuKXGAXB0ehYley3JjlyfAyu5PtFO+7f6UGm5r8D8mC56csCKnb
         nX6I0qKFiIuzKil5pOvSUtpfjoA4EBM82QziUAYDLrw0UlgvqqVAluBuSeI4HbqJALNX
         lvcA==
X-Gm-Message-State: AOJu0YxpJTsLwousJ05cjZV90JS92D1LP7kICX+Wt/GDUMtjMI7aub6+
	2MEY92oD2nLvnlwSblBTNOO4BHB8izHzKMTDiaACLISsHY0m71pgGAuz6A==
X-Gm-Gg: ASbGnctipr4aABfoVFdJOmGo+0hEC6s3pQdT04wPa+54Tm3nUohjeLqkih9swWqtBKU
	uS8BBvazDHeg4txFNHq9f0qdXZ235lub5scTh3B1Cy6qS+1an92uezaojdBtDwd1AJJLTJM16GM
	kHABditiE2Qx0ao4F+6Ig0ttT2fI0o9HIKNCvyVotRF0Dk/D1zJprJ6jwHvg73uwlqYqIy9EyBS
	77MdVel89YqN5ZpM4ZpJHGNyCilcPEWzthA+TtSTzPZq1XQ
X-Google-Smtp-Source: AGHT+IHQlmUaWj85l68bIBxHbl8GegrsiN74YvB78DlY+SAX0fXwjn85F5Rp/SDkVlFVPmJA/r5rdA==
X-Received: by 2002:a17:907:7ba2:b0:aa4:c721:fac0 with SMTP id a640c23a62f3a-aa509d3fb60mr272658866b.40.1732276128797;
        Fri, 22 Nov 2024 03:48:48 -0800 (PST)
Received: from acert-swift3.. ([2a02:810d:640:1648:6dc:bcdc:d29d:d478])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa50b5b88basm89680166b.184.2024.11.22.03.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 03:48:48 -0800 (PST)
From: Aleksandar Nikolic <aleksandar.nikolic010@gmail.com>
X-Google-Original-From: Aleksandar Nikolic <an010@live.com>
To: openembedded-core@lists.openembedded.org
Cc: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Subject: [PATCH] scripts/install-buildtools: Update to 5.1
Date: Fri, 22 Nov 2024 12:48:47 +0100
Message-ID: <20241122114847.71756-1-an010@live.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 11:48:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207607

From: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>

Update to the 5.1 release of the 5.1 series for buildtools.

Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 92a4c9dfb1..6387287ade 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-5.0.3'
-DEFAULT_INSTALLER_VERSION = '5.0.3'
+DEFAULT_RELEASE = 'yocto-5.1'
+DEFAULT_INSTALLER_VERSION = '5.1'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check
-- 
2.25.1


