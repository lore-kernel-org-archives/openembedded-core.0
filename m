Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB477C3527E
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 20:36:08 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web09.1081.1649350841593522687
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Apr 2022 10:00:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kSsTPPTN;
 spf=pass (domain: gmail.com, ip: 209.85.218.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id bg10so12196492ejb.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Apr 2022 10:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qtAb7ISg2kHM2AmqexV86rx0mgbG8gKIgPSeJjju3hU=;
        b=kSsTPPTNmEg9Pf7s/Kpj+ozsic4wNAEkktrnVyCxsH6Rc3xi9IT7+sa5sBW7ihBBak
         iY92KQDffcOyBX8GjUEBR/qgdEjmeoxR5tUqu73oC7DOHWmTx8ctuGksTZVVun6uxW5m
         Zlj/srj+HsTj6qJX3b/WiFWPbq5wHMm7mi8Oj5dTx1ekYoPu4DkOgyRh81rd+Y0jCYCP
         ajjURIFf7y/e82eRrpudNculEHW2OO2SsLw6nTpO56a+WAaBNHszKotVogjOMPR/9b0c
         PVT9TcS2NCuFkLDYLPc27+ZzZkHlYY2iG4Vw43Bq8DYsmZjHhXezF9sazgmch20flgys
         TsuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qtAb7ISg2kHM2AmqexV86rx0mgbG8gKIgPSeJjju3hU=;
        b=nhZBH578A/SVB0VusScccnk8dR+SLjjSFurfqdmQO1Gi+ZTFffxamifPq1awOQwjPs
         HgH22+FvGoHOMzpFItQwtYhIAoHK8nTS/69nfwOdSaviOJu//R2grZbQyeOh1xZkZ0oJ
         4S989Yl/o8JnTdBEmFsdVSOJQK0dZe9HICI3z5BGaJag4Z5ZGOgzSJD//Ci5FdrjzuLZ
         fmRWqaWIoyOssC2tQ6jhtH2I+Y9DOZJvPTj45pK2UhHBuu1Kln6+VYboitiBxWtOaFhN
         cfYW92aorthaLaRwwD0epr/WK/xf3fqluCJzkh1amyv3KLWcVdec8YQKji1/J01wYa0k
         IXDA==
X-Gm-Message-State: AOAM5314kFFW1oqzNbXbiM8deP8d6GJsgWoQgZB/wGNwKLT2UNl/VX5N
	+lFN9U0NIu3tuhrfIsZEWyiaDu1N9lA=
X-Google-Smtp-Source: 
 ABdhPJzK5lyDdcPY53ifOjpN/X5rT0Dx2Brri+9wW11zHcRbp5Le3GkVt0dIUd0p1uWrow2gS8QtOw==
X-Received: by 2002:a17:907:6d9e:b0:6df:bb09:10eb with SMTP id
 sb30-20020a1709076d9e00b006dfbb0910ebmr14048969ejc.409.1649350839942;
        Thu, 07 Apr 2022 10:00:39 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 gt34-20020a1709072da200b006df6bb3db69sm7796879ejc.158.2022.04.07.10.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 10:00:38 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 01/17] connman-conf: ignore eth0 in qemu in a way that is not
 sysvinit-specific
Date: Thu,  7 Apr 2022 19:00:13 +0200
Message-Id: <20220407170029.3500874-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Apr 2022 20:36:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164117

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-connectivity/connman/connman-conf.bb        | 7 +++++--
 meta/recipes-connectivity/connman/connman-conf/main.conf | 2 ++
 2 files changed, 7 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-connectivity/connman/connman-conf/main.conf

diff --git a/meta/recipes-connectivity/connman/connman-conf.bb b/meta/recipes-connectivity/connman/connman-conf.bb
index 6b9207c4cb..7959ed8e50 100644
--- a/meta/recipes-connectivity/connman/connman-conf.bb
+++ b/meta/recipes-connectivity/connman/connman-conf.bb
@@ -6,6 +6,9 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0-only;m
 
 PR = "r2"
 
+SRC_URI = "file://main.conf \
+          "
+
 S = "${WORKDIR}"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -14,6 +17,6 @@ FILES:${PN} = "${sysconfdir}/*"
 
 # Kernel IP-Config is perfectly capable of setting up networking passed in via ip=
 do_install:append:qemuall() {
-    mkdir -p ${D}${sysconfdir}/default
-    echo "export EXTRA_PARAM=\"-I eth0\"" > ${D}${sysconfdir}/default/connman
+    mkdir -p ${D}${sysconfdir}/connman
+    cp ${S}/main.conf ${D}${sysconfdir}/connman/main.conf
 }
diff --git a/meta/recipes-connectivity/connman/connman-conf/main.conf b/meta/recipes-connectivity/connman/connman-conf/main.conf
new file mode 100644
index 0000000000..a394e8f25b
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman-conf/main.conf
@@ -0,0 +1,2 @@
+[General]
+NetworkInterfaceBlacklist = eth0
-- 
2.30.2


