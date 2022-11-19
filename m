Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B722C433FE
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 21:16:29 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.30690.1668892586516966670
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Nov 2022 13:16:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=3uBtcR6i;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d20so7414011plr.10
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 13:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1xkM+lzYlgi6quiuVRxeBs++ouehiqW/eTRoygC8a14=;
        b=3uBtcR6iTSh1ZtFl2LiHnEyNEJJkM6rtA4xSnwTL+Elg/1JYtOBxuSfMin8OvZntDS
         An5UprBqqUSa5qhtnHBdCLsyjgPLiiVvJLGLCJwKue3xuaDwblmWFFBe5U8WLNfLeHRK
         fWiQECOFSeVaR6Fgynt244Tu2403mzxO3QeaKjupC75bz+XVFMI9NAuDDkLJLl4nJIME
         WLwIjSfYjPlFrnSYXrpCLj4M1TiRxDjRmrdL/eIHFjJgz5j7GDSyhZ4bHNyasjasCRsS
         PnEnRcQ2InQ5sdNmay7lNtxuw8aQ3THRADKM8X0CBXQ4EV0QFxHM8rSTN8puS0KXsHR3
         kCdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1xkM+lzYlgi6quiuVRxeBs++ouehiqW/eTRoygC8a14=;
        b=0xPuT24QLSnrZmB7cGP9NaMcLhaZ+XJ1eSLMaUa58i5FgrGQNhol36lQT+VvQ8bOpa
         HW8HCrjSO4Y1BBTjhXe3qZ5+cpAa9BlFr+U3C6RihWhzm3aGRjvhfaWiW3V+DDZvxLft
         SDuye0tyOE/bbLmTLoVa3jAuuVYIzecNTrL8hMcqg08OJXY+7MjymUL4HbCDZLhDIr0B
         tyochS2G+lkmZUwXFTwH7zmLepBozoO/kdRLRgALxAN9vG3Hj31MPOQRL7Je2OePFxt/
         PWYXFQyflovOLhEII8rXPkKloSrtbTmGGwU+YL/mQzqywp0kT8bMtYFL9WcuEeBbcnNg
         IFxg==
X-Gm-Message-State: ANoB5pkVUxAIB8TUP4YuCO8VF0pkutZEsqKwwLB2gdIoUeumBdAO9tGk
	ClqpNV5Pty2o613SY5X+l8PAMELMen5ZSpSGbJ4=
X-Google-Smtp-Source: AA0mqf5zmlD40uAH3kuyYsXlLnUoOGVPJrq/mzLEixdaLSK1Z44q810p7Fp9vR9H0sHCHiYRHUYVsg==
X-Received: by 2002:a17:903:41c8:b0:187:3932:6422 with SMTP id u8-20020a17090341c800b0018739326422mr5178950ple.135.1668892585577;
        Sat, 19 Nov 2022 13:16:25 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id s16-20020a170902a51000b001869f2120a5sm6197735plq.34.2022.11.19.13.16.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 13:16:25 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 33/35] gcc-source: Drop gengtype manipulation
Date: Sat, 19 Nov 2022 11:15:12 -1000
Message-Id: <bce5a6269dfed4baa893b70ada71d266b95c9a0b.1668892398.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668892398.git.steve@sakoman.com>
References: <cover.1668892398.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 21:16:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173573

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Whilst we patch gengtype.cc, we don't patch gengtype-lex.cc which would
be the file which would trigger regeneration of files.

The real bug that was likely the cause for this fix is probably SDE issues
with gcc shared workdir so this code can now be dropped.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 7ab82b5db2a737c2a0266280b15d343a27c0e1d5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/gcc/gcc-source.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-source.inc b/meta/recipes-devtools/gcc/gcc-source.inc
index 03837f4381..bf33a4b31f 100644
--- a/meta/recipes-devtools/gcc/gcc-source.inc
+++ b/meta/recipes-devtools/gcc/gcc-source.inc
@@ -25,8 +25,6 @@ python do_preconfigure () {
     import subprocess
     cmd = d.expand('cd ${S} && PATH=${PATH} gnu-configize')
     subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
-    # See 0044-gengtypes.patch, we need to regenerate this file
-    bb.utils.remove(d.expand("${S}/gcc/gengtype-lex.cc"))
     cmd = d.expand("sed -i 's/BUILD_INFO=info/BUILD_INFO=/' ${S}/gcc/configure")
     subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
 
-- 
2.25.1


