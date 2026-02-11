Return-Path: <colinmca242@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E75CECD6DA
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 18:51:59 +0000 (UTC)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26541.1770835913246475907
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Feb 2026 10:51:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ePUWzYC8;
 spf=pass (domain: gmail.com, ip: 209.85.161.51, mailfrom: colinmca242@gmail.com)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6726f320b54so1125018eaf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 10:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770835912; x=1771440712; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4ntJGFM98VxqF0eKo1dOQ3PWk6T42QCyOJANj6mJSgo=;
        b=ePUWzYC8M359Y+KndOgWptUr2y6yPkNT2lmGfuRYGV1V0BuXlyGQ/kAT0OIjED6FmT
         HiiTmXDquEfu45pmHJhAtUNLAnrcsOObb1ZMwX3hQcXr//vNLn80Mi3HbbO8y5w0qxZd
         ki1hnfrNkZ5H0omuDlfGeCIGcHE6aK6987sTItyR01/JM84y6P0V21GltKhLW/Obvq1q
         NJAxPvSjxR3kB9GTf+suQkK6ufuNiaxsGCyCoQP4XXRiNw9H/s0qkVKS54MOLuhIg5fM
         gMUaWZP3+tBAYu63K8zTC45P6/B5y0PTBtqCCAS/CWzefkhEnRtvn7PzR5uWIHcIglk4
         OTfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770835912; x=1771440712;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ntJGFM98VxqF0eKo1dOQ3PWk6T42QCyOJANj6mJSgo=;
        b=gp/lvPFKJp7FnHqUB0JiaYKFuCnEWIUFcLQJsBCjeWsaAzUGJpoZvJrHaPCH+EC7Q8
         GqQZ70ft+bY92mzSos1KQesJupJyiWPEd0ljEopv2WE9JIa4SvSzmc22tVWhDFHZ6epS
         7mW46bIi740bVviXsjEsX+4PM0XxKgX+0yINkmzqjuZ7A47k3iN0U0UmMQDS7xx777gH
         /rlVXwjzxE80Eqsmlpt6tvh/TGSrkFRTNEpEMk4KRBtZoQHnjDsF+cD2VvmXZ5yiI279
         Ih/CQGbNjkE7bur48M4yAmD7P/Zrla/hcCjdUhBikhCRo2ipRG3dWrQqJjluTH3SNbNZ
         iQPQ==
X-Gm-Message-State: AOJu0Yykdiqp3Mkc8s+5XAT3ePeA1QnEZRlhRm6Yowpvb4F5akCu+77G
	IFuEbvlullYRc2CKyWjxTCOl/iql4dzVCmXPn2Uo8ivs50W8sNSC+7dPFxmdOw==
X-Gm-Gg: AZuq6aLjlAFJZ2U8KFUy15Yl61y3sAfAEa84J9ndDODZRS5qLHjcxR3b1y8DFSTo/Ya
	x9/fysqit3XKTQ7+9JZkS8OWmqoozeHlEBeTADz71xK0FOWaLWZW5g1ffb+tDXGPjnzjS+vJH2i
	4QCy4aPdp0KVgnbTSahZkTuJVmKExr0AKnBjxYHFj+iMLIsEfSvCq8VKffepsUoolM3wX1Icw69
	MPeajDn+JPxI+WEAeBgQxnyP6oPEAPHF5U34uP6uROnoYYmddA+62sjlmKJAKoNtxHAj1mkXJzd
	ffCnd1NCS8E9+0yprt1GSJS/3wAcKkIraDk5EAKdizbROUUGJWU+F21h8Z2oK+G4KZfC1Wo+xEo
	CfDs/kPaJXxpzsyPQs2LTPOCFCqUKTe9i36nSjqEaxlBfdHqz2Xe9B4vZ1P05aHjpS97mqy+iMK
	XDImrWF9ltOQfmrjN3g7KCMBSZ0NCBsA==
X-Received: by 2002:a05:6820:1c9e:b0:662:f997:8445 with SMTP id 006d021491bc7-6759be8a323mr102831eaf.78.1770835911838;
        Wed, 11 Feb 2026 10:51:51 -0800 (PST)
Received: from fedora ([136.37.200.217])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-67475fbc91bsm1356092eaf.15.2026.02.11.10.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 10:51:51 -0800 (PST)
From: Colin Pinnell McAllister <colinmca242@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Colin Pinnell McAllister <colinmca242@gmail.com>
Subject: [PATCH 0/3] Disable OpenSSL and Python3-cryptography legacy features by default
Date: Wed, 11 Feb 2026 12:49:14 -0600
Message-ID: <20260211184917.1045939-1-colinmca242@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 18:51:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230997

TLS 1.0 and 1.1 have been deprecated by the IETF since 2021, and
OpenSSL's legacy module contains deprecated and unmaintained components.
This series disables legacy support by default in both OpenSSL and
python3-cryptography, requiring users to explicitly opt-in if needed.

The first two patches add packageconfig options to control legacy TLS
protocol support and the legacy OpenSSL module. The final patch aligns
python3-cryptography with the new OpenSSL defaults.

Note that the TLS 1.0/1.1 changes replace the existing "no-tls1" and
"no-tls1_1" packageconfig options with affirmative "tls1" and "tls1_1"
options that are disabled by default. While less disruptive to enable
the "no-*" options by default, using affirmative options provides
consistency with the new "legacy" option and is clearer than having
default-enabled "no-*" options.

Testing performed:
* Verified both recipes build successfully with and without the new
  options
* Ran OpenSSL ptests with legacy enabled/disabled and TLS 1.0/1.1
  disabled
* Ran python3-cryptography ptests with legacy-openssl disabled
* Confirmed ptests correctly skip tests for disabled legacy features

Colin Pinnell McAllister (3):
  openssl: Disable TLS 1.x by default
  openssl: Add legacy packageconfig option
  python3-cryptography: Disable legacy-openssl by default

 meta/recipes-connectivity/openssl/openssl_3.5.5.bb | 14 +++++++++-----
 .../python/python3-cryptography.bb                 |  2 +-
 2 files changed, 10 insertions(+), 6 deletions(-)

-- 
2.53.0


