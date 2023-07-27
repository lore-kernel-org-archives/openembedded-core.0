Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 969BAC3DA41
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 14:36:40 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.9064.1690468594208320206
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 07:36:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=fPoUvWaZ;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-99bd1d0cf2fso138682566b.3
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 07:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690468592; x=1691073392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eJJrOS9qE6G4CRiNh0hwME02KBhw0nzK2SikzUJSYtA=;
        b=fPoUvWaZnI1LvuSMPNvJKedOa6++czsqHhN0fc8VwS2A86azV4mPc7Tr1TKWohf6bZ
         uND7z2MVrXMQ7kpCLndFMDjd3mC0f73Pbhod5Fl1/zu7hryok4BAAfgE3M1u8MkVbbG+
         1Ize8xCjVaABTgNERcPwStTPziMQfK4jYXdaYuKykBnB2FJ3QDkfwrJDjEFzlmvZXqpl
         N1fiBzSHS4FLn5OF9m0R6KagPih7SzTajCCY15pSMfyROIII6hN2TQ/S3EOrvCt2oK2w
         vVDHzwsHkQl8Fv9YeajpC95KcD0OBi3XwU0dctIeGoHHp9DHBWRJpaTYMaZqW8JgCq0V
         pn/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690468592; x=1691073392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eJJrOS9qE6G4CRiNh0hwME02KBhw0nzK2SikzUJSYtA=;
        b=Ec2YDz0m57LhS2SBPvSEGyUPGsmfQ57YH6c59s6fk7z4IKYhytRZHz2QAdkOENEXdS
         xg0zlPqIJ4PvpQM4yvrR8/yTHHQEglVaXsLv4fIXkpcuMlpjkASop8MzE+BusVTmghrN
         mYXE749Jq70/ZfpfpSFrHyzd32m4HiMcrhOnN8b56jCOFhUqICRkpB/M8XI2RZLWmvnT
         T9WNhen4mdH4PaxcPjHJzn5US5rUVzjirgtWM4c1yMSHw8BlSXD0RZfYXeBglzOqC7IR
         PLcxpZmHwYWh7T/3l98DzXQHh/wUNfQq4m/a8kxEpTAZygDwnZ7tq7fN2luMqBd1Uvar
         RWwA==
X-Gm-Message-State: ABy/qLbRuvaXwlOExjYFQATGRBqWDWL3A4ecK0BSNbngGQ/qsa53uQP7
	LSZPjyQG525FNR3+8TOjDlclB/7K8pQ=
X-Google-Smtp-Source: APBJJlGFURsITEkWuLC+NIrNpW/Tqrz/8PIPOosclj7uk+ylthUy6g4K5J/g4TpvbgZKfgG8/nnf9Q==
X-Received: by 2002:a17:906:8443:b0:99b:da50:9ddc with SMTP id e3-20020a170906844300b0099bda509ddcmr1610286ejy.55.1690468592604;
        Thu, 27 Jul 2023 07:36:32 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m10-20020a17090607ca00b0099bcf9c2ec6sm846725ejc.75.2023.07.27.07.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 07:36:32 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 05/21] insane.bbclass: add a RECIPE_MAINTAINER check (oe-core recipes only)
Date: Thu, 27 Jul 2023 16:36:11 +0200
Message-Id: <20230727143627.3718496-5-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230727143627.3718496-1-alex@linutronix.de>
References: <20230727143627.3718496-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 14:36:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184945

Absent maintainer entries are as well a frequent source of friction, as they are checked
only in selftest, and so aren't revealed until autobuilder runs.

The selftest is retained as it also checks for obsolete entries in maintainers.inc
(not possible to do in insane class).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-global/insane.bbclass | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index 78506c30b1e..960dfc8924a 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -50,7 +50,7 @@ ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
 # Add usrmerge QA check based on distro feature
 ERROR_QA:append = "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', ' usrmerge', '', d)}"
 ERROR_QA:append:layer-core = " patch-status"
-WARN_QA:append:layer-core = " missing-metadata"
+WARN_QA:append:layer-core = " missing-metadata missing-maintainer"
 
 FAKEROOT_QA = "host-user-contaminated"
 FAKEROOT_QA[doc] = "QA tests which need to run under fakeroot. If any \
@@ -1485,7 +1485,16 @@ python do_recipe_qa() {
             else:
                 oe.qa.handle_error("missing-metadata", "Recipe {} in {} does not contain a HOMEPAGE. Please add an entry.".format(pn, fn), d)
 
+    def test_missing_maintainer(d):
+        fn = d.getVar("FILE")
+        pn = d.getVar("PN")
+        if pn.endswith("-native") or pn.startswith("nativesdk-") or "packagegroup-" in pn or "core-image-ptest-" in pn:
+            return
+        if not d.getVar('RECIPE_MAINTAINER'):
+            oe.qa.handle_error("missing-maintainer", "Recipe {} in {} does not have an assigned maintainer. Please add an entry into meta/conf/distro/include/maintainers.inc.".format(pn, fn), d)
+
     test_missing_metadata(d)
+    test_missing_maintainer(d)
     oe.qa.exit_if_errors(d)
 }
 
-- 
2.30.2


