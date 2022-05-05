Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDB9CC433FE
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 05:06:33 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.7359.1651727163245965653
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dOG3WI79;
 spf=pass (domain: gmail.com, ip: 209.85.208.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id z19so3886434edx.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iuzIFtfTn3SSM+EwP4/PYyn1xjUqf1SLDOsK4LKA4dg=;
        b=dOG3WI79pKgLj76lfHj/ZjVhyfuFfdErcSbxZvXPa+Q/PCtn1JAQBkr+VeGbpqIkPM
         KrPO6+fJSFVAt8W4pnUdkVtTalHAFlBAea96eY0KAsFv5YTad69L9niX33zii3BlNjnS
         PXRUiqJ0NBmAiYsLaJPq24Z4LSIzhNPGtb10oZ38E2VP+nV6NV4J+vt4TaaHRHA7SfG1
         fsi1I0vy43fQq2AmezLjkWuXqxb4G9U9RdOBcMh20jZQucZao3UcbtVQmfnbV4MZrFa4
         KhwR5dUMDLp+24V+QEBM5HscyE1hQgDMjtpYkBbAoaeQNQtU+MDjRpKGrx8T5q9yRfdc
         9o8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iuzIFtfTn3SSM+EwP4/PYyn1xjUqf1SLDOsK4LKA4dg=;
        b=nM/Ck2AGEpy8ctTuB+SEm+n28YhWIU/85KUFcVj+YNp/mT9nCeWhmuOL8zFIXnY+4n
         uunMVY+3rjkPBcJluzGu9dxM3CAKbcSGwvuPYmPhDPIWEoDAz6eOrir/EnhFMCNBAPVT
         9zsdy77Z9PFqhTM43yQ7e+uzu33CWv9cLULXX1YtNSfemQfwQKYDgRM3RTywnXMXR5Fc
         NALFNve9gCHBc4ayiWWz9xET2r8uI3JWx476s2rEQjiMCGTvYHMUn0kcfsRDjirJytkn
         N4OVU6q1LSJNR9QaTl4ynGUMRONe1Wk+4TrYF9uvmM/gU9Rji1dDRGPnDqKpdg+/i20g
         z7aQ==
X-Gm-Message-State: AOAM5302rImZtHngEUkRIPMljr7TqKxUfjRfHWhDDUlQcIDxKcStptfH
	gYcvG/wXJyOuWPbPbv2nZykCszklgl4=
X-Google-Smtp-Source: 
 ABdhPJxTWwQ7eJ2lV2ah6urP+PzzaUZ5MeHVrQ0xVEkDrNdRMjS/rUvQ6FaHEay75uWeAGsx75mnzg==
X-Received: by 2002:a05:6402:26d6:b0:428:c30:3a45 with SMTP id
 x22-20020a05640226d600b004280c303a45mr8714520edd.210.1651727191894;
        Wed, 04 May 2022 22:06:31 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 gg19-20020a170906899300b006f3ef214dfbsm313386ejc.97.2022.05.04.22.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 22:06:31 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 56/61] lsof: update 4.94.0 -> 4.95.0
Date: Thu,  5 May 2022 07:05:39 +0200
Message-Id: <20220505050544.651895-56-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220505050544.651895-1-alex@linutronix.de>
References: <20220505050544.651895-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 May 2022 05:06:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165285

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../lsof/files/lsof-remove-host-information.patch    | 12 +++++-------
 .../lsof/{lsof_4.94.0.bb => lsof_4.95.0.bb}          |  2 +-
 2 files changed, 6 insertions(+), 8 deletions(-)
 rename meta/recipes-extended/lsof/{lsof_4.94.0.bb => lsof_4.95.0.bb} (96%)

diff --git a/meta/recipes-extended/lsof/files/lsof-remove-host-information.patch b/meta/recipes-extended/lsof/files/lsof-remove-host-information.patch
index 70155f9a1d..08f083cf83 100644
--- a/meta/recipes-extended/lsof/files/lsof-remove-host-information.patch
+++ b/meta/recipes-extended/lsof/files/lsof-remove-host-information.patch
@@ -1,4 +1,4 @@
-From 95b8a13c1ea4274f58304bf5c4f7ca3d036b10f3 Mon Sep 17 00:00:00 2001
+From 4233b5ac1629c225a7a80f33efc0eff527a95851 Mon Sep 17 00:00:00 2001
 From: Li Wang <li.wang@windriver.com>
 Date: Wed, 30 Aug 2017 15:05:16 +0800
 Subject: [PATCH] Remove host information from version.h
@@ -10,24 +10,22 @@ Upstream-Status: Inappropriate [embedded specific]
 Signed-off-by: Li Wang <li.wang@windriver.com>
 
 ---
- dialects/linux/Makefile | 50 ++++++++---------------------------------
- 1 file changed, 9 insertions(+), 41 deletions(-)
+ dialects/linux/Makefile | 48 +++++++----------------------------------
+ 1 file changed, 8 insertions(+), 40 deletions(-)
 
 diff --git a/dialects/linux/Makefile b/dialects/linux/Makefile
-index 61e8643..5458a0a 100644
+index 46c83c2..50f03cc 100644
 --- a/dialects/linux/Makefile
 +++ b/dialects/linux/Makefile
-@@ -95,48 +95,16 @@ version.h:	FRC
+@@ -84,47 +84,15 @@ version.h:	FRC
  	@echo Constructing version.h
  	@rm -f version.h
  	@echo '#define	LSOF_BLDCMT	"${LSOF_BLDCMT}"' > version.h;
 -	@echo '#define	LSOF_CC		"${CC}"' >> version.h
 -	@echo '#define	LSOF_CCV	"${CCV}"' >> version.h
--	@echo '#define	LSOF_CCDATE	"$(BUILD_DATE)"' >> version.h
 -	@echo '#define	LSOF_CCFLAGS	"'`echo ${CFLAGS} | sed 's/\\\\(/\\(/g' | sed 's/\\\\)/\\)/g' | sed 's/"/\\\\"/g'`'"' >> version.h
 +	@echo '#define	LSOF_CC		""' >> version.h
 +	@echo '#define	LSOF_CCV	""' >> version.h
-+	@echo '#define	LSOF_CCDATE	""' >> version.h
 +	@echo '#define	LSOF_CCFLAGS	""' >> version.h
  	@echo '#define	LSOF_CINFO	"${CINFO}"' >> version.h
 -	@if [ "X${LSOF_HOST}" = "X" ]; then \
diff --git a/meta/recipes-extended/lsof/lsof_4.94.0.bb b/meta/recipes-extended/lsof/lsof_4.95.0.bb
similarity index 96%
rename from meta/recipes-extended/lsof/lsof_4.94.0.bb
rename to meta/recipes-extended/lsof/lsof_4.95.0.bb
index c2b8bc839b..f380de0b6b 100644
--- a/meta/recipes-extended/lsof/lsof_4.94.0.bb
+++ b/meta/recipes-extended/lsof/lsof_4.95.0.bb
@@ -15,7 +15,7 @@ SRC_URI = "git://github.com/lsof-org/lsof;branch=master;protocol=https \
            file://lsof-remove-host-information.patch \
           "
 
-SRCREV = "005e014e1abdadb2493d8b3ce87b37a2c0a2351d"
+SRCREV = "67d8c828e7bdc01ba93f8ff79765dd424da0c9d7"
 
 S = "${WORKDIR}/git"
 
-- 
2.30.2


