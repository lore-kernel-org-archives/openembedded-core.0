Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FF1BC4321E
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 21:16:29 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.30963.1668892583352748482
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Nov 2022 13:16:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=m3WGOBSK;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id a1-20020a17090abe0100b00218a7df7789so184303pjs.5
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 13:16:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aSpmwPFJC+Iz4YOhDkfiVcQhALe+ZyuvspVEH3w6lKU=;
        b=m3WGOBSKEnqhA1wrUmt8voYyPdgraDtU4Qf47WsDMW5PnWp2Vhh6dib4dWksLkxQmQ
         TtEUzf9GCmp1Fpo0IjsrloHdJm4AV5pU0jVWF6vaB6zaCC8ffyyeS6uZ4pnvq+tNJvnQ
         XQB/Xwp+PfyNdcU+lOwGSoHpzyGfmbiJuf//T/PE9PYoLWhhCuPxf8YuzgkBfVIh+pta
         iM5T8erHSciam1moezzu8LMS+pL0FAx8Vm0WKmB9jrPhlr+2+Z8Ry1wd2uRjpaW7p7u5
         f1Bd49g6Tx5lJwfm+1SfucM3nKsmRSeNeuq+5OiM8sm19M5VhbgEdu9U3wfASiM/I8L4
         HIHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aSpmwPFJC+Iz4YOhDkfiVcQhALe+ZyuvspVEH3w6lKU=;
        b=auVXNsJhn8/eOeKhVJ2lO2uw7BQrLAWPzN//dKVL3+RKjmVV66GPCmayf4pGJnwvMN
         Ep1VBpYYOgQbwo88LixLbYBQV2rDHnOD1yStCyE0XQ/z9AJpCTKynjnCsUGhcKnIiHwE
         vWdCwwiDGo0yobccW9Vpohwv1Ve2U9tskrVd+jS7M93jwaNIPJIDh90sf8o4232AvwGD
         vFsUh7+88ewO6fOvYcXnWHhs6Eu7ttp4u/U/AxQ60dNfusAEYpy8B+OhFW/yv3N2XAAQ
         Gjv1M8MU+yDn0rb9A7gf5wKFdH8MK9+cEMtBUKCPdE2Miiya+ryZCptMi6YtViwK5ah8
         99YA==
X-Gm-Message-State: ANoB5pn6xEPfIvh4ezVl2hqsiEQ2Mx/4NMycUPdMhTC9Uy355mtNRBd2
	3e7H/8PjJ0p3rc1n8+lNLyq7YON/1sXCnjWXDU0=
X-Google-Smtp-Source: AA0mqf5LjT5qBTC4R/5czypV17pBV57suXbUm9rqW3CJJthnYh+muf4FbhSnxG/x2yTDTTKVWEy3xw==
X-Received: by 2002:a17:90a:930f:b0:218:9107:381b with SMTP id p15-20020a17090a930f00b002189107381bmr6663640pjo.75.1668892582369;
        Sat, 19 Nov 2022 13:16:22 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id s16-20020a170902a51000b001869f2120a5sm6197735plq.34.2022.11.19.13.16.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 13:16:21 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 32/35] gcc-source: Fix gengtypes race
Date: Sat, 19 Nov 2022 11:15:11 -1000
Message-Id: <a431f45ad4900aba1e45ed9c055a4032bce7609c.1668892398.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668892398.git.steve@sakoman.com>
References: <cover.1668892398.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 21:16:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173572

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


