Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEE75C6FA82
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 07:21:51 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.9307.1662016896890988787
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 00:21:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=R6p0hRId;
 spf=pass (domain: gmail.com, ip: 209.85.128.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id
 m3-20020a05600c3b0300b003a5e0557150so2752487wms.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 00:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=7CNRfijPYsFdm+ZnMThsdbhCmeJLzg8wJl+fkAMdjA4=;
        b=R6p0hRIdYS8RGnqrUZ1nIfzUqnvNo818O247zMDabVXBFyqBuZuxWO02e86DzRy0KP
         m3oy3VEyGM8zMBCMiyLrO1d8Tli40kadkqFCqxMnr3I/m/EaUxHmK/EBQhAh1LaUulE5
         7JP34A/VQ+aSrMipxpb+tnCsGF9lNw+DzWm2tAD8VWVlKuDx4d2k1dfpia6Le+Z4rUvf
         X3l7ROw4x/5QMNLqOsrdXAQCJbYbPqZwgzqEx1pib07tafz7mUhr9bof9RP+lRLN28wZ
         tUOai0NG5BJO9KiQf8Zuly3Kj0oQV8qN1iLoYXnHckuVLIgKddrtZktHEUh5gPGDt+s8
         tLbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=7CNRfijPYsFdm+ZnMThsdbhCmeJLzg8wJl+fkAMdjA4=;
        b=JUfUKTyNrTAqOXAnEencnZyDJEq+1xETQqHkC7yV+A2CHZRO4Gg0FlIf/2M0EEq7gu
         tB6rdLDTLZO++9iIMflqS3fUswW3ubMVPezgGTSZaQZarm+gpoy8hRi4qgJCaBZmcqZU
         Lr9r7+Zb8Dp/InjIwXuE3TiJRIsrghehYhd34JWN7SK7B60EE6JOmTI4QEBoPa0Ojm4F
         dhz0JAv3Iqli77Agz3HGOUzyd4Mj8vK7FuorqGJ8e1MzAoah/vazZ6Wn4THd+QfyA8et
         SqgMgKOrvrVWJJljmIIK0k5VTc9FtlT1iT1oC6dbw+6kEOnQDiHE9JtgAEQKCu8EEHTh
         7ATQ==
X-Gm-Message-State: ACgBeo0rgaOcRVK04Bo0QJMz5VVegsvYQNRRgp0Xe7XBYvnYLjOiOL73
	d6WVIl8YuzqgX+xg+HjNdnIeUub8nfA=
X-Google-Smtp-Source: 
 AA6agR5p3PCA/p8kHdMX6ZruBbYbF7EHw56YHQS2RknIWjzKXhYYj3Y+Xa0dCSWSLxtSna2cPfIOfg==
X-Received: by 2002:a05:600c:26d2:b0:3a6:280c:24a with SMTP id
 18-20020a05600c26d200b003a6280c024amr4111213wmv.130.1662016905194;
        Thu, 01 Sep 2022 00:21:45 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 c18-20020adffb52000000b00225239d9265sm14022982wrs.74.2022.09.01.00.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 00:21:44 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 10/14] valgrind: (re)send ppc instructions patch upstream
Date: Thu,  1 Sep 2022 09:21:21 +0200
Message-Id: <20220901072125.3366367-10-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220901072125.3366367-1-alex@linutronix.de>
References: <20220901072125.3366367-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Sep 2022 07:21:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170151

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...Added-support-for-PPC-instructions-mfatbu-mfatbl.patch | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind/Added-support-for-PPC-instructions-mfatbu-mfatbl.patch b/meta/recipes-devtools/valgrind/valgrind/Added-support-for-PPC-instructions-mfatbu-mfatbl.patch
index 07774f38a9..51cd3532d3 100644
--- a/meta/recipes-devtools/valgrind/valgrind/Added-support-for-PPC-instructions-mfatbu-mfatbl.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/Added-support-for-PPC-instructions-mfatbu-mfatbl.patch
@@ -3,14 +3,14 @@ From: Aneesh Bansal <aneesh.bansal@freescale.com>
 Date: Mon, 21 Nov 2011 17:31:39 +0530
 Subject: [PATCH] Added support for PPC instructions mfatbu, mfatbl.
 
-Upstream-Status: Pending
-
-Signed-off-by: Aneesh Bansal <aneesh.bansal@freescale.com>
----
 Currently Valgrind 3.7.0 does not have support for PPC instructions mfatbu and mfatbl. When we run a USDPAA application with VALGRIND, the following error is given by valgrind :
 dis_proc_ctl(ppc)(mfspr,SPR)(0x20F)
 disInstr(ppc): unhandled instruction: 0x7C0F82A6
 
+Upstream-Status: Submitted [https://bugs.kde.org/show_bug.cgi?id=289836]
+
+Signed-off-by: Aneesh Bansal <aneesh.bansal@freescale.com>
+---
 
  VEX/priv/guest_ppc_defs.h    |    2 ++
  VEX/priv/guest_ppc_helpers.c |   18 ++++++++++++++++++
-- 
2.30.2


