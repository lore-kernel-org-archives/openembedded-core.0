Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C83F8C43219
	for <webhook@archiver.kernel.org>; Sat, 19 Mar 2022 07:16:24 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web08.4948.1647674183908041655
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Mar 2022 00:16:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ahFladkU;
 spf=pass (domain: gmail.com, ip: 209.85.221.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id j10so1283813wrb.13
        for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Mar 2022 00:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hwPt0nN6aWzU6mIS3xX4VL/Tkg+iQI3SZjzsETehmjc=;
        b=ahFladkUGBSNEOaPJ6WhCperhhFyqWiugWVu0+rK1bdM8vsG5q4qvnKobOX3ql/ZTB
         CiAL6cZkCVE0IVEJXhxdxRw8+qztbVUlv3fOXuF3b/2czMHxI9SyzHzDoQz7u+Gr5CSn
         Tbsrmpobn3FtvRzFbrNRFp5ssz/tq1UZsOOWlkZhOaO6RXZeHA0/QAwZ6h+YAycrgHy8
         wAhcWd8DyrdfLRw/pfYwx7OQAw1zS6i/CVSEKe6RNY5g67zGEnLiM8NZqc0AqV0yD8lk
         N67ZGOwx6n0nCIgbBIloBbfMkVfryv6WfL94esg5GCGIg4InehdVW4a7njPlzNIjaGBc
         a0qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hwPt0nN6aWzU6mIS3xX4VL/Tkg+iQI3SZjzsETehmjc=;
        b=CcVp8uXE3+5nfxNMxtBq+s0IpMDRbTjg3+H9jUA5dNDyCUMy46r6ZjC1UN9b/ho0vC
         5swkRsZs8dLYwn8alR8Ong8O2ccEkBh4WQS+H5M3HMkGOTjM84GAr2U44B0hbP9/JeK+
         zqDzrnaJf9h4b9HBo8I5TTSYJU7pNRwp3pYWjRsQ1q0MjOPp1wu53mwPap/xNteiLeTN
         YqP2Co2uwnN0zkpwgmFzbnHssC7stvp9BoCW23Lt77yyj1F9pc+t37sV1rVAMV716CBH
         PVSuMXac0Sx34tRmi9+wXGTgShF4ZHRIgcHdLA5LjQIH+srPn066pGdhOB7U++oqyopT
         xv8A==
X-Gm-Message-State: AOAM533UnwfWYIQ7yqmEYnWaMyRstQaTQ17KrUu1l5Yep2Hdfy/MZGTv
	+CM5oPU8ZdAOuLcTXlV/aWNjosZYZRc=
X-Google-Smtp-Source: 
 ABdhPJwXY8fy3UNM+ep5bzVNKumzBealcGi7fMvhHMIX/SwRdFuncfWnnLDTH4d8MwCT/kGJ5GIiVg==
X-Received: by 2002:a5d:498b:0:b0:203:e5d5:622c with SMTP id
 r11-20020a5d498b000000b00203e5d5622cmr10884163wrq.153.1647674182534;
        Sat, 19 Mar 2022 00:16:22 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 i15-20020a05600011cf00b001edc2966dd4sm7656999wrx.47.2022.03.19.00.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Mar 2022 00:16:22 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 11/11] sqlite3: upgrade 3.38.0 -> 3.38.1
Date: Sat, 19 Mar 2022 08:16:05 +0100
Message-Id: <20220319071605.152904-11-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220319071605.152904-1-alex@linutronix.de>
References: <20220319071605.152904-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Mar 2022 07:16:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163467

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../sqlite/{sqlite3_3.38.0.bb => sqlite3_3.38.1.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.38.0.bb => sqlite3_3.38.1.bb} (86%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.38.0.bb b/meta/recipes-support/sqlite/sqlite3_3.38.1.bb
similarity index 86%
rename from meta/recipes-support/sqlite/sqlite3_3.38.0.bb
rename to meta/recipes-support/sqlite/sqlite3_3.38.1.bb
index a797679f12..54b04d620e 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.38.0.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.38.1.bb
@@ -4,7 +4,7 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
 SRC_URI = "http://www.sqlite.org/2022/sqlite-autoconf-${SQLITE_PV}.tar.gz"
-SRC_URI[sha256sum] = "1c76e25dc63d9f3935e0f406aec520a33ee77cf54ea5147dffe1fae8369eff68"
+SRC_URI[sha256sum] = "8e3a8ceb9794d968399590d2ddf9d5c044a97dd83d38b9613364a245ec8a2fc4"
 
 # -19242 is only an issue in specific development branch commits
 CVE_CHECK_IGNORE += "CVE-2019-19242"
-- 
2.30.2


