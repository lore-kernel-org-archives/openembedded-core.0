Return-Path: <luca.boccassi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B51FC433EF
	for <webhook@archiver.kernel.org>; Fri, 19 Nov 2021 11:35:01 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web08.7636.1637321698991376870
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Nov 2021 03:34:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NgUzuBIf;
 spf=pass (domain: gmail.com, ip: 209.85.208.43,
 mailfrom: luca.boccassi@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id g14so41459176edb.8
        for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Nov 2021 03:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iOc4RNjW2wcCOTAccUCzkprimeFmuSaXmp6jLzy3D0Q=;
        b=NgUzuBIf+y5q9p3RQ5VizoHHSFsJxYeF88BMYebN66Xgo3SY08mN7wK7MK6+F80iG6
         FdfKjF9wJ2JA7kJQFvBhGTxGatRh9kq3swscfRP4PdanaXbi9RBMRiF/CdzmilhSHNRl
         MwAHTwT5AKJ+juwrvNpvNHxcmDSc//GK0a+EL/06043hPr0qqrFEIFA4HKHu0bb5AJ8b
         WZ2+Sk639ymvE8HD1akqs0nPM3P1owc5Tkw1FFYsyI8W2mvJlO+gMaECevRSihgJb2O4
         Qn3lftV9rByd6gleJTji59KsGNEa8zf8oWIC7e+oYTYRWG2ag/H0jRu6fIp7jaosT23g
         u1PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iOc4RNjW2wcCOTAccUCzkprimeFmuSaXmp6jLzy3D0Q=;
        b=pBERuSOCsHkT02gWN6ZZFOasCc+47G4JtlzEGVaPw1qk7nkspOjzKOy4hA/WacMhFv
         3R4Lek+aSwnMZYXm/GDcd9TVStVahHjSuyiH84CdgMgL5g2ilp2s3FI9YZL2ioycH/pX
         +Yrf/IcCJVh+zKIjbkpmrnzq0P+WTLjZdmAjDpO9LIjWCpD4hRWtRYEqzLYRBl84mvqW
         niibnb+vu/ykA6ZSt1MwC56LEMom3kZJUB9kdowR90WLRv9LkRapFMJOiCRQrcmlgGGk
         WAWVu+F2dzzmB8mDFZpT26JYqb/tB6KP0ulMvBKZ6XwkROljfAVofhf2xsNivEHEpEZV
         GG4A==
X-Gm-Message-State: AOAM530XpQhoVqlstjmJhyMz1jx76tjbsXG6uaOQXeOKqcfXqEe8r0cj
	GLoL09zaC+Oc/EOI6pNdtYZgZrFKz0xC9g==
X-Google-Smtp-Source: 
 ABdhPJwmiWVrUKaRnmvlDk3O6XO/pGdNlMrGWYDGT2E3dAONAfi00v2+lkPuFhrz9gBZEkcjpzYTdg==
X-Received: by 2002:a05:6402:254f:: with SMTP id
 l15mr23976483edb.12.1637321697331;
        Fri, 19 Nov 2021 03:34:57 -0800 (PST)
Received: from localhost ([137.220.125.106])
        by smtp.gmail.com with ESMTPSA id
 ht7sm1103817ejc.27.2021.11.19.03.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 03:34:56 -0800 (PST)
From: luca.boccassi@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: paul.eggleton@microsoft.com
Subject: [PATCH v2 7/7] systemd: add nativesdk
Date: Fri, 19 Nov 2021 11:34:29 +0000
Message-Id: <20211119113429.502652-7-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211119113429.502652-1-luca.boccassi@gmail.com>
References: <20211117123201.111905-1-luca.boccassi@gmail.com>
 <20211119113429.502652-1-luca.boccassi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Nov 2021 11:35:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158513

From: Luca Boccassi <luca.boccassi@microsoft.com>

Allows using tools like systemd-analyze at build time and in
CI systems

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
 meta/recipes-core/systemd/systemd-conf_1.0.bb    | 2 ++
 meta/recipes-core/systemd/systemd-serialgetty.bb | 2 ++
 meta/recipes-core/systemd/systemd_249.5.bb       | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd-conf_1.0.bb b/meta/recipes-core/systemd/systemd-conf_1.0.bb
index 61ce7939d3..84de4d17cf 100644
--- a/meta/recipes-core/systemd/systemd-conf_1.0.bb
+++ b/meta/recipes-core/systemd/systemd-conf_1.0.bb
@@ -41,3 +41,5 @@ FILES:${PN} = "\
     ${systemd_unitdir}/system.conf.d/ \
     ${systemd_unitdir}/network/ \
 "
+
+BBCLASSEXTEND = "nativesdk"
diff --git a/meta/recipes-core/systemd/systemd-serialgetty.bb b/meta/recipes-core/systemd/systemd-serialgetty.bb
index 7ca951cdbd..f877e6ad18 100644
--- a/meta/recipes-core/systemd/systemd-serialgetty.bb
+++ b/meta/recipes-core/systemd/systemd-serialgetty.bb
@@ -50,3 +50,5 @@ FILES:${PN} = "${systemd_system_unitdir}/*.service ${sysconfdir}"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 ALLOW_EMPTY:${PN} = "1"
+
+BBCLASSEXTEND = "nativesdk"
diff --git a/meta/recipes-core/systemd/systemd_249.5.bb b/meta/recipes-core/systemd/systemd_249.5.bb
index 2928a85c93..445a50b1e3 100644
--- a/meta/recipes-core/systemd/systemd_249.5.bb
+++ b/meta/recipes-core/systemd/systemd_249.5.bb
@@ -773,6 +773,8 @@ ALTERNATIVE_TARGET[runlevel] = "${base_bindir}/systemctl"
 ALTERNATIVE_LINK_NAME[runlevel] = "${base_sbindir}/runlevel"
 ALTERNATIVE_PRIORITY[runlevel] ?= "300"
 
+BBCLASSEXTEND = "nativesdk"
+
 # Nothing picks up /var in the nativesdk case
 do_install_append_class-nativesdk () {
 	rm -rf ${D}/var
-- 
2.30.2


