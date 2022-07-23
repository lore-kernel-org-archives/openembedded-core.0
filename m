Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4857DC43334
	for <webhook@archiver.kernel.org>; Sat, 23 Jul 2022 14:54:24 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.6957.1658588061615849532
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Jul 2022 07:54:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=O2z89G7h;
 spf=pass (domain: gmail.com, ip: 209.85.214.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id c6so2735708plc.5
        for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Jul 2022 07:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Vm9c4eUwLhccwwMZrMx4mgHFE0ijz6Ih0idJI8g2Nio=;
        b=O2z89G7h5+YJln9N8Ptn9+SLPokruu5zpOK0suP9FBGxAWJwjjWCo2ibwoIxfidxnN
         GCN+/MkRFJ4vMFkqdzizTz0zKVM79AO7kvyuZLAiaSqzdTSlQ1LwM8KeyfY81iYRv2LB
         zLAKVQzpdjGb7eGAPq1Vmf7YK/JGPF2FpgqpaPNAI2kSh/+xybTBL77bn0iMBxEouJPD
         /6oqkSqL5mh8oK19oy2w79qqy5KVkKG+3Tnfkt5mBnIYOswQZKLcuZCljLdNQ40TMpOU
         dxVOKK9hRPjSpmLMre3Ey02PhbiWgeJPWwIfR5LYlVXqGyulgGHbjr2azxsBSthypYF8
         nZgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Vm9c4eUwLhccwwMZrMx4mgHFE0ijz6Ih0idJI8g2Nio=;
        b=Ql3OiE/gC0MkG2DM6EeANpWvkQN5Q/1nLP+sB8/NPkQPnyJTOQHnqYsEJhuP9+43gm
         eEe1+ozslp1Y/4hXBPriGY45dr9idBikVGo2YIjwPhK1N8XhGNraeRlYDDlceAh2awT0
         BPEKDonHFZPuw/PGqNzF+DnmUhugzZLVjrucxeSUluUIo42s5ODZEHa79pa/nxSSRjI9
         kdVC4BhQQQDAun9UMLjf5c74tTcKQWRFfoF15240yplO3ORBb2jnQ7s+S1IEsxmyFZfo
         olfMROv4RRc1/5bkYzvl44XBuKGy3ZTdY6ELSCTTV3k2ljZZ86Vzp4x/w81TDF0uP+E/
         5UeA==
X-Gm-Message-State: AJIora+eBTDADjiS1sWTQIM8CD0PCXBGO/7LQZRudYNIvP4PljWr71f6
	gtliIqdIrmGiVvnHqyX0OmxhX5CJ//Thlg==
X-Google-Smtp-Source: 
 AGRyM1tltP7FeSEQ3IB+bUMrm5vph7umQwXRKmygnJ5oQNs/uryqnv9eSX+sWe0LBXhLYsy2E5ZdBw==
X-Received: by 2002:a17:902:c203:b0:16d:47f3:976d with SMTP id
 3-20020a170902c20300b0016d47f3976dmr5025770pll.131.1658588060554;
        Sat, 23 Jul 2022 07:54:20 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a78c])
        by smtp.gmail.com with ESMTPSA id
 b2-20020a1709027e0200b0016191b843e2sm5771533plm.235.2022.07.23.07.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Jul 2022 07:54:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/3] gcc-runtime: Use static dummy libstdc++
Date: Sat, 23 Jul 2022 07:54:15 -0700
Message-Id: <20220723145416.1374755-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220723145416.1374755-1-raj.khem@gmail.com>
References: <20220723145416.1374755-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Jul 2022 14:54:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168441

some standalone targets e.g. riscv64-elf disable shared linking for
baremetal ELF ABI in ld, therefore lets make it a static library

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index b63280ab3a4..15f4175214b 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -54,7 +54,7 @@ do_configure () {
 	# libstdc++ isn't built yet so CXX would error not able to find it which breaks stdc++'s configure
 	# tests. Create a dummy empty lib for the purposes of configure.
 	mkdir -p ${WORKDIR}/dummylib
-	${CC} -x c /dev/null -nostartfiles -shared -o ${WORKDIR}/dummylib/libstdc++.so
+	${CC} -x c /dev/null -nostartfiles -nostdlib -nostdinc -static -o ${WORKDIR}/dummylib/libstdc++.a
 	for d in libgcc ${RUNTIMETARGET}; do
 		echo "Configuring $d"
 		rm -rf ${B}/${TARGET_SYS}/$d/
-- 
2.37.1


