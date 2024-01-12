Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54705C4707C
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 04:12:21 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.492.1705032733909250148
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jan 2024 20:12:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=SVIWNDju;
 spf=pass (domain: mvista.com, ip: 209.85.215.182, mailfrom: hprajapati@mvista.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-5bdbe2de25fso4650344a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Jan 2024 20:12:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1705032733; x=1705637533; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cKsLCVh/NmGJAIlk7kfdLgdDZXmMhfoK1oZ3vw1AG6Q=;
        b=SVIWNDju7B3OWMCnE16EAiYfuu0IRTcHqieeUKDqnYxI3h/0IB5K9OmbDTZs3+K6Ra
         0MiiQt1pWVTWps+68xL3mMoHwNDPLklSMNHidQxt6h0Ci44IkH8idg8HOW9OXv1gYssL
         jpliNR8QN7LRRNJy4czF3xQDM99oS8+dMt3No=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705032733; x=1705637533;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cKsLCVh/NmGJAIlk7kfdLgdDZXmMhfoK1oZ3vw1AG6Q=;
        b=nCn1JipuFUpVldgR2kk2oyrQ2Py4ufS9uSLJLF2RbVh+LX6/eZ8Ipk3+TD9oL1rPwp
         +eZPlY/yjpoha5hsbuRWSOPUVMW3QEErkjgHmvXtl3HnkDHwcG1kKVdxeReyAPC15o5Z
         L7mH9WziBp05DKp3SzqyS+Sgs3j2ns0cy/giuxQrDxO9OAc7lSXztFJUtVeM2O97+gfw
         GC6mfkBPR6izdW4ugAVDjAjb8d7hs78MYsx2t18ZkfAeT+GMo4Kr1g01gsLLooUtKcjf
         vk1FVK/UOhlvX6ldUtT7qdrKfKx2yvceZM12Hxv2KaJSsMpyDLGo7+Msk5FXjOIyywnr
         26cg==
X-Gm-Message-State: AOJu0YyC9nB3kSqvn/rU4KUW77o79tdXCypaK4qLvdThRXTwX0oJINgy
	j00rR1EBuC0orPorm3atweTbXcwPa4EhxgRf2NqbzoPf36E=
X-Google-Smtp-Source: AGHT+IEQFBFe0LXs18LXOkRsXDUCQEQfncmjNc/jFWmd8B58N77EsiS8whpE1QfIAYCWKEU8q7GD/Q==
X-Received: by 2002:a05:6a20:f392:b0:199:7850:8d24 with SMTP id qr18-20020a056a20f39200b0019978508d24mr463202pzb.124.1705032733118;
        Thu, 11 Jan 2024 20:12:13 -0800 (PST)
Received: from MVIN00016.mvista.com ([27.121.101.109])
        by smtp.gmail.com with ESMTPSA id in20-20020a17090b439400b0028d08a472a0sm2649904pjb.57.2024.01.11.20.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 20:12:12 -0800 (PST)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [dunfell][PATCH] systemd: fix CVE-2023-7008
Date: Fri, 12 Jan 2024 09:42:06 +0530
Message-Id: <20240112041206.4901-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jan 2024 04:12:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193569

Upstream-Status: Backport from https://github.com/systemd/systemd/commit/3b4cc1437b51fcc0b08da8cc3f5d1175eed25eb1

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../systemd/systemd/CVE-2023-7008.patch       | 40 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_250.5.bb    |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2023-7008.patch

diff --git a/meta/recipes-core/systemd/systemd/CVE-2023-7008.patch b/meta/recipes-core/systemd/systemd/CVE-2023-7008.patch
new file mode 100644
index 0000000000..e2296abc49
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/CVE-2023-7008.patch
@@ -0,0 +1,40 @@
+From 3b4cc1437b51fcc0b08da8cc3f5d1175eed25eb1 Mon Sep 17 00:00:00 2001
+From: Michal Sekletar <msekleta@redhat.com>
+Date: Wed, 20 Dec 2023 16:44:14 +0100
+Subject: [PATCH] resolved: actually check authenticated flag of SOA
+ transaction
+
+Fixes #25676
+
+Upstream-Status: Backport [https://github.com/systemd/systemd/commit/3b4cc1437b51fcc0b08da8cc3f5d1175eed25eb1]
+CVE: CVE-2023-7008
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/resolve/resolved-dns-transaction.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/resolve/resolved-dns-transaction.c b/src/resolve/resolved-dns-transaction.c
+index f937f9f7b5..7deb598400 100644
+--- a/src/resolve/resolved-dns-transaction.c
++++ b/src/resolve/resolved-dns-transaction.c
+@@ -2761,7 +2761,7 @@ static int dns_transaction_requires_rrsig(DnsTransaction *t, DnsResourceRecord *
+                         if (r == 0)
+                                 continue;
+ 
+-                        return FLAGS_SET(t->answer_query_flags, SD_RESOLVED_AUTHENTICATED);
++                        return FLAGS_SET(dt->answer_query_flags, SD_RESOLVED_AUTHENTICATED);
+                 }
+ 
+                 return true;
+@@ -2788,7 +2788,7 @@ static int dns_transaction_requires_rrsig(DnsTransaction *t, DnsResourceRecord *
+                         /* We found the transaction that was supposed to find the SOA RR for us. It was
+                          * successful, but found no RR for us. This means we are not at a zone cut. In this
+                          * case, we require authentication if the SOA lookup was authenticated too. */
+-                        return FLAGS_SET(t->answer_query_flags, SD_RESOLVED_AUTHENTICATED);
++                        return FLAGS_SET(dt->answer_query_flags, SD_RESOLVED_AUTHENTICATED);
+                 }
+ 
+                 return true;
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/systemd/systemd_250.5.bb b/meta/recipes-core/systemd/systemd_250.5.bb
index c35557471a..889473ee1f 100644
--- a/meta/recipes-core/systemd/systemd_250.5.bb
+++ b/meta/recipes-core/systemd/systemd_250.5.bb
@@ -32,6 +32,7 @@ SRC_URI += "file://touchscreen.rules \
            file://CVE-2022-4415-2.patch \
            file://0001-network-remove-only-managed-configs-on-reconfigure-o.patch \
            file://0001-nspawn-make-sure-host-root-can-write-to-the-uidmappe.patch \
+           file://CVE-2023-7008.patch \
            "
 
 # patches needed by musl
-- 
2.25.1


