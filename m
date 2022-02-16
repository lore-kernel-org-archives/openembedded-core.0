Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDD41C433F5
	for <webhook@archiver.kernel.org>; Wed, 16 Feb 2022 23:27:02 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.908.1645054021916641530
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Feb 2022 15:27:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=d4y+Tsif;
 spf=pass (domain: gmail.com, ip: 209.85.128.51,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id
 x3-20020a05600c21c300b0037c01ad715bso2732562wmj.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Feb 2022 15:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m8kJi2Z9fdvlexfo/zUbQN45lfNRW+UlkLOVa8ipWig=;
        b=d4y+TsifQeiVAZeigl2P0SviEDHLC+VzW4RVqMq1rA8YQqVVGpqKa60K+1Vzc6EgHb
         Z1HsotTPZE+Jl5uZh1wp14idPI8F3Nn4ojCrgnagHA87gWpYRQrJkktO3kq4V8794IyE
         cEm3PuZm1aieQx9JQ8CVTHPrRj/orBMdsdGEX5eu8oBtH/0+BSiptNCd/S/46Eln1y9B
         AS7RY+ivO+87olotq+iQDnp+D42LDkYQrK5nXMe/ZWwYtBnL6nObuJGEXffOQly/ZyFO
         HKqkvnz6/r+tIfMHq355P5bPAh4SQ/8vip06Xq29KB+aICJnulEsNBP/GQi5TM7mkHao
         NS0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m8kJi2Z9fdvlexfo/zUbQN45lfNRW+UlkLOVa8ipWig=;
        b=09CCIm0AK65GZAknBOGcsJ8SW/mctNBsLjqXILcqP24WnBTTXk0+7oZg/nS7HVwGsc
         Ipn6QM3kFGIf//lN0iHMsZeWWgSPIS/sQ3LBPyQ9cYn81eKr5+V7AlH86mPn74KxjDVx
         e3AmcGGRZbHhLw1ULPYoYOWeWMSRmvyLKdkLLRDdnlLt8ssUEy2djupNF2p+t5cRotVD
         xU/gzExghggCEWDmxe56p8qARSjo0NOGd2IJTZCGiEZQT1jIGFaziIVqmCsmQiYajmsR
         aEhLdToPVYHgpKMwrAxfsGxGGm3ijo/90twXvmvZELiYR36MNRVV0pXANg60KfGa42AK
         JSXw==
X-Gm-Message-State: AOAM532mFQZucQdMXemCAEj8QdtjLHWShlOxl70XWOC7jtHBJL7787i3
	6ysXB8CkyB4pkmKHBj/aVeBOyF1RaBU=
X-Google-Smtp-Source: 
 ABdhPJy9ZghxyIk21aScdui8odlNgeNYC9tDyuM0l0z36hkckmONwsYE1s4AgBkslx2gFNXxSW6lPQ==
X-Received: by 2002:a7b:c0d2:0:b0:37b:e9e6:75d6 with SMTP id
 s18-20020a7bc0d2000000b0037be9e675d6mr3477614wmh.39.1645054020041;
        Wed, 16 Feb 2022 15:27:00 -0800 (PST)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 c3sm16720008wri.109.2022.02.16.15.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Feb 2022 15:26:59 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH] icecc.bbclass: enable networking in all tasks
Date: Wed, 16 Feb 2022 23:26:54 +0000
Message-Id: <20220216232654.1868016-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Feb 2022 23:27:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161785

The icecc.bbclass needs network access to work properly.

Currently I build with icecc inside a container with network isolation and
my icecc daemon runs outside of the build container in my host.
The only thing I need to do for using the icecc inside my build container is
mounting the unix socket /var/run/icecc/iceccd.socket inside the container.

I think we need something like this mount functionality to have access to
some sockets connections inside the tasks that runs on the new namespace
created with unshare system call.

This patch is not a the real solution for the problem and is more like
an hack so we can use the icecc.bbclass again.

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/classes/icecc.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index 3bbd2645af..68415b04c7 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -428,18 +428,22 @@ set_icecc_env() {
     bbnote "Using icecc tarball: $ICECC_VERSION"
 }
 
+do_configure[network] = "1"
 do_configure:prepend() {
     set_icecc_env
 }
 
+do_compile[network] = "1"
 do_compile:prepend() {
     set_icecc_env
 }
 
+do_compile_kernelmodules[network] = "1"
 do_compile_kernelmodules:prepend() {
     set_icecc_env
 }
 
+do_install[network] = "1"
 do_install:prepend() {
     set_icecc_env
 }
-- 
2.35.1


