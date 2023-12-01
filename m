Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11176C46CA3
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 15:19:50 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web11.2055.1701443983424980301
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Dec 2023 07:19:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nWRiL+HC;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-1fae23895c9so334376fac.3
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 07:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701443982; x=1702048782; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S6LSJR1w/L5K+w63xVRz1k1jMb93K+gaNVSWnWBgDrE=;
        b=nWRiL+HCXi0wdVcbi1s0rkWcgNXWhSmUQjHiA57pZSUNoeZO3G0ax+4vgCTQXsqbo1
         +JLbRsP6eQpFW/2GSB5nI/ggZy/cvcGuj/opjkUxGrgy0s/l5cMoNWp3RqgdaeO0Cqb+
         yC6y38S5yK8gqVjQtZNpHYzlHiHvZykrCfnbB50YQOi6Y//I78ay/OEVMJdS7PMa4wgF
         kwVARLGacLTlesmbP/0RfSUGAvCqQzPS1USOJHklukZ+tlTlbu7DPDeas4zrbWxnJ0k5
         R/HPncL143WymANRbHI7V7lLx8W8+2CACQtUbp4EM+HFImA+NJNqi/AjXet+buTCU7Z2
         m0JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701443982; x=1702048782;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S6LSJR1w/L5K+w63xVRz1k1jMb93K+gaNVSWnWBgDrE=;
        b=rT34S00ByLy1mzOsiWPmvgJ4Med7illhAHqCpNvm4qVc8RIqg2tYc0xfQOK4G60aFC
         7HP7KERhqhdqUckwtLUTzOz7nv/wx84hFfTaNHd4A8yMNp+OBrHganlZ2pWfdVcLw9sZ
         AgFtt5+6i/9ASfFkbFM7vRATTA7/LM/n7FXgiDN9H0e7RDWjtN1KyNtkVEj3ueNWhDHB
         eGnnTGCnU5LKTJqAeimTRmEIQ7nFP1B7R3Mf2aRtz6sbZv3UKP2SnVAccdDjVdZ+roPI
         8SQUJGBXQYFG88fcqFFJ9JQZgkK2YTp/oTjk3I1npgDFqn3mR9FBWsiQW5K9eBf7gjuQ
         7LrA==
X-Gm-Message-State: AOJu0Yy8LrhNceJSecMGmlGhmiVaNMS9EnE93N0adsgzTwypqcwBL6nG
	J9+lQyMKC2Mg/dACx0FtN1C7h4VJlG4=
X-Google-Smtp-Source: AGHT+IGVb2qT42kDoWSckA4dzpusEZ9f8Va9CCusauk+Avx1BxF68qbCqUFQCiomaoDFljaZta/e9A==
X-Received: by 2002:a05:6871:88c:b0:1fa:fcd5:9ba2 with SMTP id r12-20020a056871088c00b001fafcd59ba2mr751769oaq.35.1701443982104;
        Fri, 01 Dec 2023 07:19:42 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4300:19e0::2176])
        by smtp.gmail.com with ESMTPSA id pk28-20020a0568704c1c00b001fafc32e808sm95317oab.0.2023.12.01.07.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 07:19:41 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com,
	richard.purdie@linuxfoundation.org,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] classes-global/insane: Skip sstate creation for do_image_qa
Date: Fri,  1 Dec 2023 08:19:24 -0700
Message-Id: <20231201151924.874316-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 15:19:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191671

do_image_qa doens't produce any actual sstate output, so it should skip
the sstate creation (similar to do_image_qa)

[YOCTO #15289]

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes-global/insane.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index b78bb6f445d..5ce4216f3e0 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -1556,6 +1556,7 @@ python do_recipe_qa() {
 addtask do_recipe_qa before do_fetch do_package_qa do_build
 
 SSTATETASKS += "do_recipe_qa"
+SSTATE_SKIP_CREATION:task-recipe-qa = '1'
 do_recipe_qa[sstate-inputdirs] = ""
 do_recipe_qa[sstate-outputdirs] = ""
 python do_recipe_qa_setscene () {
-- 
2.34.1


