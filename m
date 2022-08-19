Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0A5DC32773
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 07:28:18 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.461.1660894080054950175
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:28:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=d8EnVrOx;
 spf=pass (domain: gmail.com, ip: 209.85.221.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ba1so4175042wrb.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=p14RJv6iOlGSP9e/9HJLOt2o4sEYqlUpkMYOwCVLcro=;
        b=d8EnVrOxtXrdVCTrM0Hm4JMuEfr3+415nPorLdVlKGiOttkj2/PC/xLOiC/BMg+H5d
         FgA5W1h/dQmgIgHXGWjLJpIXmpx3HH8D0YG1Q6hnYXx1UHVHSub2Ami65rQpJfPVXzlJ
         /4V5p2hQAJCI5Oy3f0Q1GSwrTaDxcXgt/FHbU19ONmAbugM+Oc5NkWCR2pT/rf0x0EiT
         PL8dejy/BApHmvPYbWnkKejvT0v/Xdr5LYl9xmd6KkQG8riDUir0W0tgYpz2oG+NcCVI
         gCUXsmGlXL8DEK1dtDUMXm95zAtj4ga8FW5/F8jwoaDKQgjZZByUjs9fhQ06FJUrkMWN
         p9LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=p14RJv6iOlGSP9e/9HJLOt2o4sEYqlUpkMYOwCVLcro=;
        b=JP+rves8oB19nSlIk7dGTxOADKFs+sRRbtG4pgYhVgmfXtIL34PpCvu0rqjNCbWiyh
         nh6Y0DXyNQpwKQBK/hkmVTmaiKb65URCx3GjiE55Nb+nTmTzdfv/yj7+kIDoVvHn0VYw
         UnnrsCUpwLAyDB2ZfQ3HqWfHntdSA8jS1NuLQ5I1VmZhnRjnhrBjju/iJhUVTRBTdLPr
         9tMz7CuM4gXeapCSvP/RAK6RRiROqa6dBLwHGk0zXoh6ffcvFbnJxQPbUmhDksHcIOuQ
         kd0H3Dqeasv0d95bZnfbuWafJmlRoeOWAInnq8+A71ikGbzj7vKgGQo78gcT3iul/45E
         RvkA==
X-Gm-Message-State: ACgBeo0ZLw9L94J0OZg94dgPgP7NdoM0XLA049rUIQXyDxZjqpHWL8oI
	2xoytz8t2geBIkB33ekwGFmTU29oEMY=
X-Google-Smtp-Source: 
 AA6agR5puaPRDivA0Rz2fGD28veVFfOkbvo1CIVwPFQcm9tLV0sKStAzUAq9t5hOGBKHM11oRojkBw==
X-Received: by 2002:adf:aa81:0:b0:225:2f16:177f with SMTP id
 h1-20020adfaa81000000b002252f16177fmr3393103wrc.433.1660894093970;
        Fri, 19 Aug 2022 00:28:13 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 ay15-20020a05600c1e0f00b003a604a29a34sm4650739wmb.35.2022.08.19.00.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 00:28:13 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 31/42] python3-pbr: upgrade 5.9.0 -> 5.10.0
Date: Fri, 19 Aug 2022 09:27:16 +0200
Message-Id: <20220819072727.2236928-31-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220819072727.2236928-1-alex@linutronix.de>
References: <20220819072727.2236928-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 07:28:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169602

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/python/python3-pbr_5.10.0.bb | 4 ++++
 meta/recipes-devtools/python/python3-pbr_5.9.0.bb  | 4 ----
 2 files changed, 4 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3-pbr_5.10.0.bb
 delete mode 100644 meta/recipes-devtools/python/python3-pbr_5.9.0.bb

diff --git a/meta/recipes-devtools/python/python3-pbr_5.10.0.bb b/meta/recipes-devtools/python/python3-pbr_5.10.0.bb
new file mode 100644
index 0000000000..022f834901
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pbr_5.10.0.bb
@@ -0,0 +1,4 @@
+inherit setuptools3
+require python-pbr.inc
+
+SRC_URI[sha256sum] = "cfcc4ff8e698256fc17ea3ff796478b050852585aa5bae79ecd05b2ab7b39b9a"
diff --git a/meta/recipes-devtools/python/python3-pbr_5.9.0.bb b/meta/recipes-devtools/python/python3-pbr_5.9.0.bb
deleted file mode 100644
index c93b71dbd3..0000000000
--- a/meta/recipes-devtools/python/python3-pbr_5.9.0.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-inherit setuptools3
-require python-pbr.inc
-
-SRC_URI[sha256sum] = "e8dca2f4b43560edef58813969f52a56cef023146cbb8931626db80e6c1c4308"
-- 
2.30.2


