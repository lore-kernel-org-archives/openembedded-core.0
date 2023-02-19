Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FA59C678DB
	for <webhook@archiver.kernel.org>; Sun, 19 Feb 2023 19:31:30 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.3837.1676835066214117063
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Feb 2023 11:31:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=p0JnKKBg;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id t6so1030881wrz.7
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 11:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NW1UNLWkdYKs24Dff0nhA0vLnzpRvUICmVGvtpEX9lA=;
        b=p0JnKKBg6+sYuPmEyLG8XiurLNomXVgzIKPqa4AM3F1DJF/gVVLvEPo+wyoyc68f29
         9Wwv3vNIytBU6UKRJPPWjoGZRSYFWbbnzyMUbRToWgwYpv62FvKT/4tO6eyTVOBSwivJ
         4cusFRr3vwTFLthNQG55sZciWNP+Eawaq9zlbnq6hEq05aXERKvfgK+fXR5GH4UsNOwr
         z71j74Gx+m5LWE9FddWdil90jSKzWDpm39pdV85MOU6IEt/n0hb8YK+Y7a0UEy03/buu
         vHlEp8oHXgUgi8tgx8RbDTnaoh0c91dM15+IpPJth24LdRR3iNpvrKDthdwa2i/GwULo
         YfJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NW1UNLWkdYKs24Dff0nhA0vLnzpRvUICmVGvtpEX9lA=;
        b=Sa0JXO3NLja5WQuL+TPVuKwwd0Sq3Lp6mailnRFZoBrYqrlUeYzXNOJ4veNHB3uPgS
         eFStWikrk14camMJBwJlAXd1nS1aHW4yWmjS77e6ir85caOFWLv2j5xgIWvo0jfBzlCo
         noSs28uFgqxxTtc/ENf8c+Z2whczeec7wkRN7e+Zv/RtjaYHtbDHfXa7IVCWCDiXyVXX
         I/XmYwUMVz7T8rXsu8no5PNgMhMU12cMSawWKCWdefLDD8vulyrme5yrOUH0a0/iIr+e
         P6m/5Cl/S+i2siVu6/bJqLFV5PbaeBurhuypt9zP0btWbjugFOKiQ9Xoy940CankrvsW
         6iQA==
X-Gm-Message-State: AO0yUKVf2sK5pNbk/ixGECiH7rOxIQaHH7ihEM0Dv3pdpkIt0Da1KW7a
	4KV/kUKznhQhZ/6ZBlHqqPEpv8k2GIM=
X-Google-Smtp-Source: AK7set+x9mvX1sUi7WM1xedGhE2dy0zT/hh9lYEtiEtOnKhNoprCzGBT8Fo45IPL7RlmEl1KXCTA3g==
X-Received: by 2002:a5d:4f11:0:b0:2c5:817f:848c with SMTP id c17-20020a5d4f11000000b002c5817f848cmr1511490wru.67.1676835084766;
        Sun, 19 Feb 2023 11:31:24 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d10-20020adffbca000000b002c54c8e70b1sm3347478wrs.9.2023.02.19.11.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Feb 2023 11:31:24 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 30/39] mmc-utils: upgrade to latest revision
Date: Sun, 19 Feb 2023 20:30:52 +0100
Message-Id: <20230219193101.338397-30-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230219193101.338397-1-alex@linutronix.de>
References: <20230219193101.338397-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 19:31:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177373

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/mmc/mmc-utils_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb b/meta/recipes-devtools/mmc/mmc-utils_git.bb
index d9625473f5..8c41b77fe1 100644
--- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
+++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://mmc.c;beginline=1;endline=20;md5=fae32792e20f4d27ade1c5a762d16b7d"
 
 SRCBRANCH ?= "master"
-SRCREV = "c62dd8e415b12cc7f9a362db23cd384caf77ff03"
+SRCREV = "d4c2910981ff99b983734426dfa99632fb81ac6b"
 
 PV = "0.1+git${SRCPV}"
 
-- 
2.30.2


