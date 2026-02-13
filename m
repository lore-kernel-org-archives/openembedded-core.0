Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9428EF99C4
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 18:01:14 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.78149.1771005672795417270
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Feb 2026 10:01:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dPvbRA7B;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48379a42f76so667255e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 10:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1771005671; x=1771610471; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=rSqoZYRVjh1goycvaSvlodKlHQjbovm82bVmpRGBkbw=;
        b=dPvbRA7BLIaILEkBeIaXV1/Ya8w5nw2amr56j1dLnVTkUFZOjc6WDVP41ElHxrO0KN
         9x2TGjn0etA97zxkrPmLCDAHgJIR1hovHJmJqFQgBl4TCy7VYnJ/42p7VLlZImQ9/Szh
         hZZLwwJ4Omo3g234tUYXlmoUvSINZdxYREolQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771005671; x=1771610471;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rSqoZYRVjh1goycvaSvlodKlHQjbovm82bVmpRGBkbw=;
        b=VzO2SU3qEbFoBDgi7qSfW2GnQLvQ8H1g19Rl8LI0ivWwxqeiMm6c+Z9S1JZLmlaKjU
         dZQR28USvUKOxEaPzj8VimCLY7tyZzsaNzy6YVWdfq0z3obCHE/Zr9iMl9tnvBJxY+KQ
         McfPKCs4CO2a3kCmBUXre+bqWRcG7Romxu/4euJehds0Jh1fol8TILGcvcUwD8mxYxM4
         U2SF1Ds5ER0lrS4D12AbA7u+ZqiBPk4fFwb6SR5q2pc+K/lYrwJt6x47DX3gSJor/EC/
         EBQGApcZOD8caUgLZIk1FOSMTUPSf6wQL066BgAXcIps9Uq5zn7JJiTEikeqVDvzoJpI
         I+nQ==
X-Gm-Message-State: AOJu0YzW6LmWPYSfdJTcVPJw1DSnYfXm6JcBlwq5tA+4dufafgMsfOp2
	/m+DwWCfLKGdifOKkBOUZgoHYJ1abZaYurFAB9a73Ys1kzyiuIN5ayXKwlWkhb92D5FbpsPqcI/
	pS9IoHS4=
X-Gm-Gg: AZuq6aJhDJKtbgreJnLPWCuLWfWzjNz/sOpjHGpmWQ9b8r/0s7/QtrUTKDoE8LCSFfy
	oGwnfLTqMMkABs5b3giB6ja8LqPhKUyKwpTYeEu3dFScot9elnMWDU0Deik+mg/9j8UaFDhGxQ+
	5nRJK88ubbHxIbE7AuLCraA5aAULbpmLwFgbBTh7mzG8DownfkpgtfJmRJYoA65iizezKzoiWt+
	MH3zY+OMl/+PCy/MXJl5KxoUsRyued3AenLBPRgh760EHuINt7vPTkrViorBgNc+NRDk3SrYWeS
	DbxgZ/J1XA2tX5wdIsQvzpS8jLtFX39FcDqYzX2dyWotmYLWPpq6Krr8NXGS9D1dK3V0E//2kmt
	G0xiBFoxG2h/H653M8s7PmcO3AW0zWW7jrXD30rcgjZ0HQGTNetyP4bAc8IcXYJdnX8V3jpVzmd
	Nx0EL67ExlI7+la2EiJROOixohnNSDSwywUGU7JtQ3ZthSXpa1tcOHDBcB2KV06g==
X-Received: by 2002:a05:600c:8b84:b0:483:4bbc:89ea with SMTP id 5b1f17b1804b1-48379c42db1mr1264615e9.37.1771005670580;
        Fri, 13 Feb 2026 10:01:10 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:e20e:afdc:37ec:38d1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835d99e194sm164246035e9.8.2026.02.13.10.01.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 10:01:09 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] own-mirrors: Drop obsolete fetcher mapping
Date: Fri, 13 Feb 2026 18:01:09 +0000
Message-ID: <20260213180109.1803841-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 18:01:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231135

These fetchers are being dropped from bitbake. Clean up the PREMIRRORS to
match.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/own-mirrors.bbclass | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/classes/own-mirrors.bbclass b/meta/classes/own-mirrors.bbclass
index 36c7f8e3f3d..817bbac0448 100644
--- a/meta/classes/own-mirrors.bbclass
+++ b/meta/classes/own-mirrors.bbclass
@@ -5,14 +5,11 @@
 #
 
 PREMIRRORS:prepend = " \
-cvs://.*/.*     ${SOURCE_MIRROR_URL} \
 svn://.*/.*     ${SOURCE_MIRROR_URL} \
 git://.*/.*     ${SOURCE_MIRROR_URL} \
 gitsm://.*/.*   ${SOURCE_MIRROR_URL} \
 hg://.*/.*      ${SOURCE_MIRROR_URL} \
-bzr://.*/.*     ${SOURCE_MIRROR_URL} \
 p4://.*/.*      ${SOURCE_MIRROR_URL} \
-osc://.*/.*     ${SOURCE_MIRROR_URL} \
 https?://.*/.*  ${SOURCE_MIRROR_URL} \
 ftp://.*/.*     ${SOURCE_MIRROR_URL} \
 npm://.*/?.*    ${SOURCE_MIRROR_URL} \

