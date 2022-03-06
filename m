Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 573C3C433EF
	for <webhook@archiver.kernel.org>; Sun,  6 Mar 2022 21:08:31 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.19305.1646600909876810835
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Mar 2022 13:08:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Kb6wRiXm;
 spf=pass (domain: gmail.com, ip: 209.85.128.42,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id
 7-20020a05600c228700b00385fd860f49so7347568wmf.0
        for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Mar 2022 13:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZpaNVYnymWF5NnFLcGAMilvf+f1dahVZW3WktnbPacM=;
        b=Kb6wRiXmekXS84bYBMC3HKq3TUvSOJM3dW60BVia2IbZ6tsgSbT3uSKXSX/xq77QdC
         YT+T5vtMPn9UPH+zKFgwht5IDsoJ2auLAC6LZ/a9a5J6egcsFKqFt9ebXOSRdaR/7v/b
         MvnsR457i/pEYZn0jWKsMtt+3oGtH/n0WMzx+PgMR4iw9ijOSZa5kaPIz1wkNxxzpni/
         vCjCXRllL03rIDJHwEILPVzht5UnPLciFx1HF2oprQ6sQYLgacplaAXOi2QX/nbEvDNS
         K2BtXC2RYwz1tOXaBoAxdMJhk4RknQaP01qbR8AG0o3n4KQrHtJPlOUGhJO/XOJYYOqF
         RF8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZpaNVYnymWF5NnFLcGAMilvf+f1dahVZW3WktnbPacM=;
        b=Z2JO+QHU+do3hCZAGGIwJVD+YTP52dc89yDYPcUgUtGB5AHmLK8SQSP9kZ9RZQGRoJ
         wMdw7E2/OH88MAyUq9TNBMBEL0JPvEnOZeefqyFiRdSjPFn2ak7MCFNriRhiDpmr8uN/
         dm3mLbqIzxybMsEjDThe6x/LKLFFfULoXs5kDZ0QiTaf1kR/7dDERmlELjLDwimRFLPN
         B49t+pU/5ovlak0K71uKRl/vgQnUZrZTYc6iO7w2ruL1bNe06Vsx6jUDJir+FD1TkExA
         TV72jbwnSFaxxmwj51vWxLDSf/8fVYAIgeio6Tr7pLk9tbhWm2LScft7C/WwtPiMhfcx
         snSg==
X-Gm-Message-State: AOAM532UMFwwyvaAGFEonXf1suPaDmH75jyltQ4fzIsTfvbF4aOMIABQ
	96CDUEgJkiy8kLmnfU0HGKuQ7vesn0U=
X-Google-Smtp-Source: 
 ABdhPJx1hrBC6BT7R5S+m2pM9Ni12kQj0NivGU3R7PqimW5HhQrPKOI3R6tTK1hEW9Kd466cMLVJUw==
X-Received: by 2002:a7b:c042:0:b0:389:7336:158b with SMTP id
 u2-20020a7bc042000000b003897336158bmr6850558wmc.15.1646600907902;
        Sun, 06 Mar 2022 13:08:27 -0800 (PST)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 f17-20020adffcd1000000b001edbf438d83sm9449883wrs.32.2022.03.06.13.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Mar 2022 13:08:27 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH] sstate: inside the threadedpool don't write to the shared
 localdata
Date: Sun,  6 Mar 2022 21:08:23 +0000
Message-Id: <20220306210823.53177-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Mar 2022 21:08:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162790

When inside the threadedpool we make a copy of the localdata
to avoid some race condition, so we need to use this new
localdata2 and stop write the shared localdata.

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/classes/sstate.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index dc9a2c085b..7aca415159 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -988,7 +988,7 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
 
             localdata2 = bb.data.createCopy(localdata)
             srcuri = "file://" + sstatefile
-            localdata.setVar('SRC_URI', srcuri)
+            localdata2.setVar('SRC_URI', srcuri)
             bb.debug(2, "SState: Attempting to fetch %s" % srcuri)
 
             import traceback
-- 
2.35.1


