Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82C07C43219
	for <webhook@archiver.kernel.org>; Sun, 20 Nov 2022 14:16:40 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.13229.1668953790562462287
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Nov 2022 06:16:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=ZhVortgc;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id c203so9102592pfc.11
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 06:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aSpmwPFJC+Iz4YOhDkfiVcQhALe+ZyuvspVEH3w6lKU=;
        b=ZhVortgcDU2Dcw5ML0eYfRDz7BNrtvkEYJwhLVFAs/XzFcq3aG6hW1JynMtVXYRlog
         gAJcYL0DvokgQRflAHC7HFHpjvW0YGRNxwN4x9RVTihnCIZ21G179FXu35dJVt1Qu/f8
         dEDWg5gTlZ/E1XGrz38fMPpAPYmVflWvjxYgTwuDkWbzov+GQkN4wyGGMLWgt/gUcqc5
         ZLd5vn8Njr5ZKpfE+oLsOVGtB6PLLu33o44lGutCt/65WyCo+8FOWzUKxaHFvnIYDKny
         S82pEMBYCoilhDN592Xl+Cu8yJOzOHKCWonpN2vdeyU8yp5q/ybNIbfzWYZilwHqt0Ar
         wfdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aSpmwPFJC+Iz4YOhDkfiVcQhALe+ZyuvspVEH3w6lKU=;
        b=0zz0hRBnP2IN9i7YjHWWd5YOclWblFoo9rNKVTWyCLC5FT5XpliISwT1/DCH/3wVgT
         PknKrDopmL1g0BP+Cy1wB6Pg8ED8woyjzXnmuRbEqEKrK606Sub15D3wg6tkFEgG81GP
         qXH1XrXgADGkFf75Q4vTbowPT3m7cC2ctqmkmvZtKuWRUx4JkuM/ftIQORAB3FLYvWl4
         trQQDkZFLmIOnZ5b4n3b7FlkIC7BoSqiBQWQz+bIdcIh+ZI6EVVejvM/apcCIdYNjcYM
         6s+R+8pHCGCXXfmo6pIXqAR+MvZVsnc9ezNqUXLnE3pGigiucEsV1a4pDh3EFyq+9AZS
         +DSQ==
X-Gm-Message-State: ANoB5pmVY/JmkivbtlEpCqtH0hhXhDULJwd4aunMq6DQEmI5yQxs9Jye
	ukMuZcqi7e7t1rA+f++X1AysKYXTrHKrrH95LFw=
X-Google-Smtp-Source: AA0mqf4WyB90FM+qnKrP5tCqXlAgxe3srIwmr1fXAPllxZVP9lJkuyA3X3MuQhCWFWMY7+7U/M2Eiw==
X-Received: by 2002:aa7:95b7:0:b0:548:4e65:348d with SMTP id a23-20020aa795b7000000b005484e65348dmr15987691pfk.56.1668953797402;
        Sun, 20 Nov 2022 06:16:37 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id x15-20020aa78f0f000000b0056be4dbd4besm6721379pfr.111.2022.11.20.06.16.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 06:16:37 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 32/35] gcc-source: Fix gengtypes race
Date: Sun, 20 Nov 2022 04:15:21 -1000
Message-Id: <ac7d5ea832c880002fd466360294ffb357e9c56c.1668952942.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668952942.git.steve@sakoman.com>
References: <cover.1668952942.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 14:16:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173632

From: Richard Purdie <richard.purdie@linuxfoundation.org>

gcc renamed .c files to .cc files:

https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=5c69acb32329d49e58c26fa41ae74229a52b9106

but we didn't fix this reference which meant we re-introduced a race around
gengtypes-lex.c. This lead to the race reappearing on the autobuilder. Fix
the naming to avoid the problem again.

[YOCTO #14953]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit dbca40ed399405b663dbc3894e35596a2615f47d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/gcc/gcc-source.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-source.inc b/meta/recipes-devtools/gcc/gcc-source.inc
index 224b7778ef..03837f4381 100644
--- a/meta/recipes-devtools/gcc/gcc-source.inc
+++ b/meta/recipes-devtools/gcc/gcc-source.inc
@@ -26,7 +26,7 @@ python do_preconfigure () {
     cmd = d.expand('cd ${S} && PATH=${PATH} gnu-configize')
     subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
     # See 0044-gengtypes.patch, we need to regenerate this file
-    bb.utils.remove(d.expand("${S}/gcc/gengtype-lex.c"))
+    bb.utils.remove(d.expand("${S}/gcc/gengtype-lex.cc"))
     cmd = d.expand("sed -i 's/BUILD_INFO=info/BUILD_INFO=/' ${S}/gcc/configure")
     subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
 
-- 
2.25.1


