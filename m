Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0997EC54E71
	for <webhook@archiver.kernel.org>; Fri, 22 Mar 2024 03:34:08 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.5074.1711078442453264741
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Mar 2024 20:34:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=K6vFeMJw;
 spf=pass (domain: mvista.com, ip: 209.85.210.171, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6e6b3dc3564so1193435b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Mar 2024 20:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1711078441; x=1711683241; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V72UyKrTyxBRu04F3od4+UCL4141TawrnZwKPGTlErY=;
        b=K6vFeMJwOtRYIeJ2sD3VJ69dgI+8Jmne7Git8bUskJBUSKzH5EiVN9bintnDySUdqc
         slLgICRZNBpZr8rgKFYyw+QQN2+ej0X3XydFKEw+SYcyMdmHBSNhNVXMOd7CoCHypOX6
         m4GoqwgS9QAVGP+4B0rql1BMjI4AsbOhl+ZKU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711078441; x=1711683241;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V72UyKrTyxBRu04F3od4+UCL4141TawrnZwKPGTlErY=;
        b=QQFyHH0pFH41gANmpjEGeCpVtoa6Oqvqt9j1uYxAm9QWwcdS9NLWydjs4Hng+tPybI
         TcgPicfUbIY9eoIsSeqpd0aDSbX5AV9tGqov46UIX5eH+cPqeB50EKUCKypjAxayDXpW
         Nm7oGJe1uEhkeKOiQr5o5+tcmqNA/0Zp0icbIEJHn6bBqQgXtGKNwVJ4qGbtix0KZ9oY
         HMkU/Dgo0CGMSmdrPY47Nc17cTT6o3zsrMaweKNc0tPM0fVAVZZK1EovFUBSmjH9AfW7
         ViELvfZBrh//nKqwaPXZztFqoL1vi5ETLq0QnS9IH9eeTqyXJkIUH3v5nJ0n0y2CYnLd
         U0Hg==
X-Gm-Message-State: AOJu0Yx86kpIYppIeNmnIte52uqKVDlR2h6c32uw0xn2d0FGTFMO7BDu
	JXHCLuB3WJk+dgz6Co9aW6ejCluAbHkseF17FxPSooioki5AB7lQf+8ULlRflYFgXTxcTdWmt8a
	t
X-Google-Smtp-Source: AGHT+IGCCd2p63K57vcR+Xj5QjTOpNQwQprSGoWYb7eZJDxLaLcE/8wY8O1exRII0ZEaR2ceHyGqbA==
X-Received: by 2002:a05:6a00:802:b0:6e4:76b5:7dd3 with SMTP id m2-20020a056a00080200b006e476b57dd3mr1717566pfk.26.1711078440791;
        Thu, 21 Mar 2024 20:34:00 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.207.197.57])
        by smtp.gmail.com with ESMTPSA id p12-20020aa7860c000000b006e697bd5285sm600932pfn.203.2024.03.21.20.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 20:34:00 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][dunfell][PATCH] qemu: Ignore multiple CVEs
Date: Fri, 22 Mar 2024 09:03:44 +0530
Message-Id: <20240322033344.421681-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Mar 2024 03:34:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197433

From: Vijay Anusuri <vanusuri@mvista.com>

* CVE-2023-6683: not affected, introduced in v6.1.0-rc0
* CVE-2023-6693: not affected, introduced in v5.1.0-rc0
* CVE-2023-42467: not affected, introduced in v7.1.0-rc0 & v7.1.0-rc2
* CVE-2024-24474: not affected, introduced in v6.0.0-rc0
* CVE-2024-26328: not affected, introduced in v7.0.0-rc0

Ref: https://security-tracker.debian.org/tracker/CVE-2023-6683
     https://security-tracker.debian.org/tracker/CVE-2023-6693
     https://security-tracker.debian.org/tracker/CVE-2023-42467
     https://security-tracker.debian.org/tracker/CVE-2024-24474
     https://security-tracker.debian.org/tracker/CVE-2024-26328

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 59ff69d51d..829c347fe3 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -176,6 +176,21 @@ CVE_CHECK_WHITELIST += "CVE-2023-2680"
 # Affected only `qemu-kvm` shipped with Red Hat Enterprise Linux 8.3 release.
 CVE_CHECK_WHITELIST += "CVE-2021-20295"
 
+# the issue introduced in v6.1.0-rc0
+CVE_CHECK_WHITELIST += "CVE-2023-6683"
+
+# the issue introduced in v5.1.0-rc0
+CVE_CHECK_WHITELIST += "CVE-2023-6693"
+
+# the issue introduced in v7.1.0-rc0 & v7.1.0-rc2
+CVE_CHECK_WHITELIST += "CVE-2023-42467"
+
+# the issue introduced in v6.0.0-rc0
+CVE_CHECK_WHITELIST += "CVE-2024-24474"
+
+# the issue introduced in v7.0.0-rc0
+CVE_CHECK_WHITELIST += "CVE-2024-26328"
+
 COMPATIBLE_HOST_mipsarchn32 = "null"
 COMPATIBLE_HOST_mipsarchn64 = "null"
 
-- 
2.25.1


