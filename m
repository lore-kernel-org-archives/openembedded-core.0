Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CB25C47077
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 04:46:32 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web10.4778.1705380385245101265
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 20:46:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=VuxM33j9;
 spf=pass (domain: mvista.com, ip: 209.85.128.177, mailfrom: hprajapati@mvista.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-5ff4b02a187so5398127b3.1
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 20:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1705380384; x=1705985184; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cKsLCVh/NmGJAIlk7kfdLgdDZXmMhfoK1oZ3vw1AG6Q=;
        b=VuxM33j9FTY51ypqE6uKiPJE6kunrkGkvenxmMOdLUxsWvUtXhVa04vuDnkD/4dlm4
         Ne/BMjsgBi0Y/ot3duSwTqmjFDm8LWN8n2UKBFr+FZcbL66KxFw0MqguQD/q8cB/DM7R
         3gzARs2DNycKR6Tz8a6KxsT7f1a9ZBzU9gNBs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705380384; x=1705985184;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cKsLCVh/NmGJAIlk7kfdLgdDZXmMhfoK1oZ3vw1AG6Q=;
        b=qWBB7bgEujBJWSmjJp+0LpTFlVuSfxDNsc4r5nvr3CFdPYX4s3hVxdHRT7AthpuI68
         8LNUwjfbBcXhzgt0wgTzBcVzrVm/uOlVi33uxa26OK+3gVO+KgFROTInvqGZ1gHdvxL6
         7u3X7Kc7nJqrUqSicMDPjNK9ra9K4HYWhY5e6EqoUwuig6YA5TvNcgm1lN1pNRddBzK5
         3/IqFE774/SG1yU0F0wLmv9ppuwgXPoAj0FJGDtYaqwQ6drxzEgj0syIozMGiSOQokNm
         TuPlgWDkc+NQZSptfX89aFdCA369k3wqNVfA4PWLu9/1TUf3RrvSI8yAbzd05ywrkLGu
         zAHA==
X-Gm-Message-State: AOJu0Yz+Mt1JbfTg8vxmzdKimIjMnV+8QM3QuuwIk2OdLKqy+nPslJYx
	hSkR2DHQsGJd0lYKQHVArWSjWoOHOzb/zGoch9AUHAOnaAw=
X-Google-Smtp-Source: AGHT+IEc1ZYy1TeHk7UZBw1RQ6QGDhikcsgGF2s85CsU4sLk/alq79xVpNH97yyjqNU8Q5qQG7/neg==
X-Received: by 2002:a81:e348:0:b0:5f6:dcf5:becf with SMTP id w8-20020a81e348000000b005f6dcf5becfmr4272712ywl.31.1705380384214;
        Mon, 15 Jan 2024 20:46:24 -0800 (PST)
Received: from MVIN00016.mvista.com ([27.121.101.81])
        by smtp.gmail.com with ESMTPSA id b4-20020a170902b60400b001d3e2578e66sm8370980pls.243.2024.01.15.20.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 20:46:23 -0800 (PST)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCH] systemd: fix CVE-2023-7008
Date: Tue, 16 Jan 2024 10:16:18 +0530
Message-Id: <20240116044618.5485-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 04:46:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193817

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


