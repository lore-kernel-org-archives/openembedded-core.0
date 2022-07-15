Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94D8CC433EF
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 11:19:05 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web09.5310.1657883943283706689
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 04:19:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jDA371lB;
 spf=pass (domain: gmail.com, ip: 209.85.167.44,
 mailfrom: liu.ming50@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id bf9so7257915lfb.13
        for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 04:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=42ajR6xbszHi2o8t7B9S5Y+DHCUgnYkyrIKMweDja8M=;
        b=jDA371lBM8WTUtEYIuJqPODaJx3ovV201BuVqwWDFr9nPyMswhfOl4zXlX+KNC1E+8
         jVPZ4HMnudVgsQP9Unky/MUsgDiblXdgB5OIKEGbb3I3sLoFQU1R8F+GoitnANQdxf0y
         FijqPGhAOu9XQBHGF0eVg6MOra7Ui1pHTT1iZ6qW6yFePY5TqdWKAWU/sjw+gl2vYNOC
         5hp5aE48jH2l25Qi25JgkEL8sOd3ZTEdaCngUxE6PNRZU00yBNUE8XcaMnWY8cmksHgj
         sG5W5P1M3Hwjpqvwcgp0PsZlO5HzJBC1oFiOBpO65nMYl6kGwl9YX/qmL7LMYKFKRuM9
         xmrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=42ajR6xbszHi2o8t7B9S5Y+DHCUgnYkyrIKMweDja8M=;
        b=I/GNQI0YIeEnU7flVobx4kR6jpdVqU406SSqhNNcEckAsU6MUnIjLVVV8iDZcxiYyi
         4fV3m/KbrDOLq9urxD0t37mbQ4QT9d5rXJp1+QvVfA4Yo63pZ7wKqrxvJ0z3qthSF8tD
         bEgFtktT0GGNvpjOLrB+x/Bd5T0JwWvCfJD+CIPq+Q3pJWBx1ffHPVFP6fVMXGKDWfr5
         d3hpHwPg4jAAv/zuFEAmip827JUyzvPNnQHIAb/ALvCUIwU3DCukCbacxr+jQPYRO1VM
         MmfN7TM5FdcVgKj+SipKSePbcy6Q4xwd0jrSfvhvBIC7QIa2yX6GnZZudW2ZORBBv2SC
         kauA==
X-Gm-Message-State: AJIora/I02suqdVQ2CfigrtGgw10SbEb6XnXkSusOf/X030ssRm7VcsH
	FUMEvDSmcaIQ5i0U2L6Bdd7WSoPtAIc=
X-Google-Smtp-Source: 
 AGRyM1sGZjOyMIIVDW1z7BQpoz6MtsPQTM8KdqqJjZGasMlnpsQ/8TwlMrGaW1SdeamuO9CE+eviBQ==
X-Received: by 2002:a05:6512:ea2:b0:486:1dbb:653b with SMTP id
 bi34-20020a0565120ea200b004861dbb653bmr8014710lfb.328.1657883940905;
        Fri, 15 Jul 2022 04:19:00 -0700 (PDT)
Received: from peterliu-Precision-7530.emea.group.atlascopco.com
 ([2a00:801:236:2d61:a9d8:35da:a486:ad06])
        by smtp.gmail.com with ESMTPSA id
 x10-20020a056512078a00b0047255d21107sm857048lfr.54.2022.07.15.04.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jul 2022 04:19:00 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH] rootfs-postcommands.bbclass: move
 host-user-contaminated.txt to ${S}
Date: Fri, 15 Jul 2022 13:18:57 +0200
Message-Id: <20220715111857.1311644-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Jul 2022 11:19:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168058

From: Ming Liu <liu.ming50@gmail.com>

This is to ensure host-user-contaminated.txt would be removed before
do_rootfs runs, since ${S} is in cleandirs of do_rootfs, otherwise, a
host-user-contaminated.txt file that generated from previous builds
could be used which is wrong.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/classes/rootfs-postcommands.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index 452b87f9b3..a8a952f31d 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -305,7 +305,7 @@ rootfs_trim_schemas () {
 }
 
 rootfs_check_host_user_contaminated () {
-	contaminated="${WORKDIR}/host-user-contaminated.txt"
+	contaminated="${S}/host-user-contaminated.txt"
 	HOST_USER_UID="$(PSEUDO_UNLOAD=1 id -u)"
 	HOST_USER_GID="$(PSEUDO_UNLOAD=1 id -g)"
 
-- 
2.25.1


