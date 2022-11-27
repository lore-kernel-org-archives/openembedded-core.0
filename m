Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42C40C4332F
	for <webhook@archiver.kernel.org>; Sun, 27 Nov 2022 13:55:43 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.91877.1669557334757723293
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Nov 2022 05:55:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=LmEHXYZg;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id g10so7850271plo.11
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 05:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rTmqsx20sT1AU2FviNz8aj647xRmvXWWcr0iCdLhXuM=;
        b=LmEHXYZgFHp7p8IatcibX35ADijJqxNtcTMKeWQPxg2JJOhElN7A/iJXR0v186C+bF
         LYTc8ovsPhx93RwDuxxNYFbBepC9iQfZWlIbFurrYuTor836XaA34mlhqJm2rnBWQ6ur
         7wiRhY80HCEiUKFKlpM4kMDPx+gxl7o9BxtSOp+mrxox7dF5YHxu9Ce2qOv8gc1ZmaXc
         Lf/AZxYjm3NbtyLjfd+ISB4FyJ91hjEDW//jiRzwuPmNrIPkU0CQA44NBeVmEKbb4eHr
         mt2crMOALHoRXsU5K//nl7wVWwAgzukBx04KakUprUpLKA/tjmFG95N9Vey7DFN9xFCV
         BogQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rTmqsx20sT1AU2FviNz8aj647xRmvXWWcr0iCdLhXuM=;
        b=RLf4XLRpCO4ibehKPDu9CRWTUUSxdyiU47zctrwxLT3Xso/gnaAWSrsepY0IYN9Q1m
         pJmt34Ri38VJdyEEdvTWIKlf6vagQHMRazJu5q74fIMrM4h9sA186UggREoBvb1ZWdm0
         Ri8KVRlSzFUA89VKKXRHfGWmy7OHyRNjzq7Y34P39DnG8nx9FdWJGYdX4jYqWO04KoV4
         U30mRM2dB3AC0q/yP4kFu4uai6Qkt/RS0Pd8bd/D9U+P5jV67hdKdO2SD4hpZ6hQbrmw
         9Gklj9EpSqU6ZAUpfJ7vpVHfRnjdLCuEePdFRhY4elZ3g/Hul7kOJxhVjachEcMNR8pt
         rSbw==
X-Gm-Message-State: ANoB5pkEJV14jOjNgndowEkmDsl8G1HEYoHA2F9f3dGSFPeWBANkoWOA
	ejWqMPFbPKKlJEfUd0Ikhdqx88/I76s/9jFKvGY=
X-Google-Smtp-Source: AA0mqf5+rwkKiIPEoCYFsEDf7gYub9RMBLbOpkQ2zXYzdNr2gobize8HFFiFFZnKhAWbSUC92BCt9A==
X-Received: by 2002:a17:90a:7d0e:b0:218:7c5c:44b with SMTP id g14-20020a17090a7d0e00b002187c5c044bmr46635698pjl.23.1669557333683;
        Sun, 27 Nov 2022 05:55:33 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id c15-20020a170902d48f00b001868bf6a7b8sm6910544plg.146.2022.11.27.05.55.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 05:55:33 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/31] bash: backport patch to fix CVE-2022-3715
Date: Sun, 27 Nov 2022 03:54:48 -1000
Message-Id: <69a52a564f45dafeb65a93a45d3db9c1d178526a.1669557026.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669557026.git.steve@sakoman.com>
References: <cover.1669557026.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 13:55:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173847

From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>

CVE Reference: https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2022-3715

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../bash/bash/CVE-2022-3715.patch             | 33 +++++++++++++++++++
 meta/recipes-extended/bash/bash_5.1.16.bb     |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-extended/bash/bash/CVE-2022-3715.patch

diff --git a/meta/recipes-extended/bash/bash/CVE-2022-3715.patch b/meta/recipes-extended/bash/bash/CVE-2022-3715.patch
new file mode 100644
index 0000000000..44f4d91949
--- /dev/null
+++ b/meta/recipes-extended/bash/bash/CVE-2022-3715.patch
@@ -0,0 +1,33 @@
+From 15d2428d5d3df8dd826008baf51579ab7750d8b2 Mon Sep 17 00:00:00 2001
+From: Xiangyu Chen <xiangyu.chen@windriver.com>
+Date: Wed, 23 Nov 2022 11:17:01 +0800
+Subject: [OE-Core][kirkstone][PATCH] bash: heap-buffer-overflow in
+ valid_parameter_transform CVE-2022-3715
+
+Reference:https://bugzilla.redhat.com/show_bug.cgi?id=2126720
+
+CVE: CVE-2022-3715
+Upstream-Status: Backport from
+[https://git.savannah.gnu.org/cgit/bash.git/diff/subst.c?h=bash-5.2-testing&id=9cef6d01181525de119832d2b6a925899cdec08e]
+
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ subst.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/subst.c b/subst.c
+index 2b76256..38ee9ac 100644
+--- a/subst.c
++++ b/subst.c
+@@ -7962,7 +7962,7 @@ parameter_brace_transform (varname, value, ind, xform, rtype, quoted, pflags, fl
+       return ((char *)NULL);
+     }
+ 
+-  if (valid_parameter_transform (xform) == 0)
++  if (xform[0] == 0 || valid_parameter_transform (xform) == 0)
+     {
+       this_command_name = oname;
+ #if 0 /* TAG: bash-5.2 Martin Schulte <gnu@schrader-schulte.de> 10/2020 */
+-- 
+2.34.1
+
diff --git a/meta/recipes-extended/bash/bash_5.1.16.bb b/meta/recipes-extended/bash/bash_5.1.16.bb
index d046faa4e5..11c2314fbf 100644
--- a/meta/recipes-extended/bash/bash_5.1.16.bb
+++ b/meta/recipes-extended/bash/bash_5.1.16.bb
@@ -15,6 +15,7 @@ SRC_URI = "${GNU_MIRROR}/bash/${BP}.tar.gz;name=tarball \
            file://use_aclocal.patch \
            file://makerace.patch \
            file://makerace2.patch \
+           file://CVE-2022-3715.patch \
            "
 
 SRC_URI[tarball.sha256sum] = "5bac17218d3911834520dad13cd1f85ab944e1c09ae1aba55906be1f8192f558"
-- 
2.25.1


