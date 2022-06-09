Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA801C433EF
	for <webhook@archiver.kernel.org>; Thu,  9 Jun 2022 16:42:33 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.15921.1654792944993664223
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jun 2022 09:42:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Vg1JfMWW;
 spf=pass (domain: gmail.com, ip: 209.85.221.53,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id q15so25137720wrc.11
        for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jun 2022 09:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1X4xM3JOlAhDfNSOTET4P13PKW2y3f1ofOXxxgYyYlo=;
        b=Vg1JfMWWsIV2N2R83i2hcfR/oEEfAm/FAG1JDuS9TPkfbOhFkszbCpxaJpVBcNV3e9
         yWSpHkFtvO/6BofgJqbxidQaa17jRSVYo+qu3ZNbe5JGt2vgZXt6XI2yVf1z8Gcb2poT
         JXfERxMFT1b0tS8nc4XgjJIVBIhK+lFbDdvpNGTMgqwfv9Ncgi99ioeTIX0mPu3Q0tYn
         nat0G+GXuERcPKCRSBTPyMpIQTLfT8jMFRaRahKGTNoaTTVKdn2Lhqutvy3WsbZ7myVx
         q5iMtmIMJc04i4moM+DYwDPRVsWIce69ntEWdtxS+/c7rAXy9jf7DgVlJ+rT3aAOhpAR
         F0lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1X4xM3JOlAhDfNSOTET4P13PKW2y3f1ofOXxxgYyYlo=;
        b=od2ZwfboLp7FCLLPki2uV8vBrHEmKAxKbCIoNrIDfQkXKpcSOM3kMXokvKZGbV0P63
         EYTBzqdQ7DfssN4smEj8xs9x9GNyR7/4cJLV5baSL2nfnIgMcRXCLIdeer9AJpzHdxTA
         ic6/dXiuTkDTdO++7Jq58QHBQ1FyP2sosMrkyjC6zFdMraYi6R41rjctdiTQgdfz6sTr
         a468llPYpSCuoiZETelANeCYtTCWuwhC8ek/tyO51TAbdBLHokp0Kq4/Z3vMENeO9MO2
         iRh503AkPjT+Ph+2CNcK5HK8pLkYvooQKGYK0rJsaRiZx5Y5jXdqK/Z1ybXPU+HgaCM1
         F8QQ==
X-Gm-Message-State: AOAM532cG4Oz+iETDfXa3g0DXq8zmrrS5k1KpANNpXLu4CfBzcOfgeWN
	FHMbKQzaqQ5fAAh/t/De0VQo4DWSr+c=
X-Google-Smtp-Source: 
 ABdhPJw7CcbsUvKK4Ts/Wsy3w33b2g85gIEjYPR6YaVeOO4hn4snez9CO6y3DvNkCafnVWBlzaMjbQ==
X-Received: by 2002:a05:6000:716:b0:213:b7d1:adeb with SMTP id
 bs22-20020a056000071600b00213b7d1adebmr34813095wrb.337.1654792943255;
        Thu, 09 Jun 2022 09:42:23 -0700 (PDT)
Received: from fio.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 o17-20020a5d6711000000b00218453adaefsm10931799wru.101.2022.06.09.09.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 09:42:22 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [PATCH] archiver: use bb.note instead of echo
Date: Thu,  9 Jun 2022 17:42:07 +0100
Message-Id: <20220609164207.40515-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jun 2022 16:42:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166785

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/classes/archiver.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index b1d7aa0247..938f8ffa00 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -580,7 +580,7 @@ python do_dumpdata () {
 
 SSTATETASKS += "do_deploy_archives"
 do_deploy_archives () {
-    echo "Deploying source archive files from ${ARCHIVER_TOPDIR} to ${DEPLOY_DIR_SRC}."
+    bbnote "Deploying source archive files from ${ARCHIVER_TOPDIR} to ${DEPLOY_DIR_SRC}."
 }
 python do_deploy_archives_setscene () {
     sstate_setscene(d)
-- 
2.36.1


