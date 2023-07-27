Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A43CBC3DA42
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 14:36:40 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.9061.1690468592848035025
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 07:36:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=sTd0sZhg;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-98e011f45ffso132156366b.3
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 07:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690468591; x=1691073391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BOSQwhR7pUYNEBFWcpkyv2T0SdUBUhKD2YR3I0FnxFY=;
        b=sTd0sZhgjnnzy/ZZ0JaiBYhkk99+8m3xVRRVIsVBrvb5LNrZOSRaj/wQ/AIDp/ESt+
         DsI55Wnsx/cM3ZADbnIdhY+/Hx5qb0391rgYhnx4tJELUj8T7xQN+jREOwxDv0e223eq
         IuNi/ypexL76iW07EylniHCPAf9WWLqi7CGD8XaVAtGEiv04NrgMCtDIgzmuoVs9+dJ9
         ZekGjMDTqpnUY95nCTMmkVdPtKj45Ce6bkYF3/T3PbTS/GeiFSUZ7/3gABoeaa7EQsPe
         fxbhKlEAD1n/v6u5AeI7sYILefc6kou2SreUGs7qrICVAbA2F0DEfV98Vputkqt7Fwtz
         Lfeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690468591; x=1691073391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BOSQwhR7pUYNEBFWcpkyv2T0SdUBUhKD2YR3I0FnxFY=;
        b=KEYH6gwUYKseJ2yzLgGU8EYs/MD8psc3Ew0Dx18ZjCfgMdf5N60yCKtxnCN5EW9eeZ
         wI5XRtjQ8ALOMjeJOVvVXXnh/i3ZsbowUA7aBranBsxn9Epk51yMk7qhLBsmfCfv96rN
         pHR0luRsZhH3I0VZLOCEiG6+ZIDnPYqccv6NyQTbSIwys+3+khT+iF+m7UwdDiXF3SOj
         6Hqi3/npuLsO9b2DKqWQc/eKuP+aF/kdnfWqrz2hhlf9emGr88zbk8wD376sn0OHBjQn
         NsdaDItNaTUYVOm+GA3A/hcpmuq8TFyPWZI1RowNRxBZvTtyFwhMp4sEByku8BnjSA5q
         WMXg==
X-Gm-Message-State: ABy/qLbubYUELoQ2ELZ0MhWZZJR3Db8Tiw6zAMyD0A/whdYEzxXQ6Hha
	cNQXjIxBW2hAvD18og7lOwIY5/7qA80=
X-Google-Smtp-Source: APBJJlFQm2rN1DQoutYZdCvFEImDc17Nm27LbGkcXtRWOAHB6US/R5nGeF0QapiylUHz//I28Q6LMw==
X-Received: by 2002:a17:907:7703:b0:994:2fa9:7446 with SMTP id kw3-20020a170907770300b009942fa97446mr1887780ejc.46.1690468591047;
        Thu, 27 Jul 2023 07:36:31 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m10-20020a17090607ca00b0099bcf9c2ec6sm846725ejc.75.2023.07.27.07.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 07:36:30 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 02/21] insane.bbclass: add do_recipe_qa task
Date: Thu, 27 Jul 2023 16:36:08 +0200
Message-Id: <20230727143627.3718496-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230727143627.3718496-1-alex@linutronix.de>
References: <20230727143627.3718496-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 14:36:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184942

There is a need to run QA checks that can operate entirely from
recipe metadata and do not need any of the build artefacts or
source code. After some deliberation it was concluded that such
checks are best collected in their own task that runs as early as possible,
and so this commit adds the task.

Like package_qa, the task is sstate enabled, but doesn't (yet)
register the qa results into sstate.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-global/insane.bbclass | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index 114781c7803..148ae4b7ad5 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -1469,6 +1469,20 @@ python do_qa_unpack() {
     unpack_check_src_uri(d.getVar('PN'), d)
 }
 
+python do_recipe_qa() {
+    oe.qa.exit_if_errors(d)
+}
+
+addtask do_recipe_qa before do_fetch do_package_qa do_build
+
+SSTATETASKS += "do_recipe_qa"
+do_recipe_qa[sstate-inputdirs] = ""
+do_recipe_qa[sstate-outputdirs] = ""
+python do_recipe_qa_setscene () {
+    sstate_setscene(d)
+}
+addtask do_recipe_qa_setscene
+
 # Check for patch fuzz
 do_patch[postfuncs] += "do_qa_patch "
 
-- 
2.30.2


