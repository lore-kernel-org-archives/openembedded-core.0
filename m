Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 312F7C47DA2
	for <webhook@archiver.kernel.org>; Wed, 17 Jan 2024 16:00:10 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.6469.1705507204143249680
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jan 2024 08:00:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Gy3R6tKX;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1d5f1e0e32eso11181505ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 08:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1705507203; x=1706112003; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UB3OHOMyMWs3ErD09wquzaBRRtxvdmeOzCJNS1rsTjg=;
        b=Gy3R6tKXRyPGAUvELKmdj4ReM9LAyNHSfe1XfqbGu1aPiLCz9M3L4aGWLizHkEQBDD
         14NvEvSRL8JTI/7M2QdoP1/H8Y++BIyySvstKC/nzu9uStyJbZ9lqcLPTl7JvehGaGKB
         0q72ahelE6Ev9z8fVg3gdbpwwaxNWhqj18ijOxovgrtyqQx0Z4WBORzAZ7pMZX08uJIM
         zu4GurroCsTHfhrzOAxXKDdK1CrGFvawDrcfsQbMjMcBaMDoLasDV5Yo6ikhVeKX5Oul
         jZhz9SQEApMuJf2K0jZqfC9rVsPEXxbQ+WRQKacnMHF8+NF0oEZEJeRYy6u+r5+9ELWV
         8p0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705507203; x=1706112003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UB3OHOMyMWs3ErD09wquzaBRRtxvdmeOzCJNS1rsTjg=;
        b=LAy6xfT/WJKGZLbNAXug6YERYcZxDAll37RYBzPxR7j71ulhpHaH5AUWJvIJR4GoNR
         Q6DiNGo3Hf0h2pOgBdxXOQX+vhiNagNr7YM1BkVAAo2Z1f73lAW300RB/Ur15ZcNl3nt
         CZM3XSmGqTj/YCuMnPNcZLV63tW8smnBSDrzDm7snrBOVY5uXr4uEOjmpBZJXVLD2HWv
         7g3KcURS7VDTJNsNJF90VIpdnRVY8ejZ28EGQc3OXWJtKXi+EaspjP1BL4nRd+axVboL
         QAxvRq623ARoa0lciHOehwsmwkm2ssKe0OwnLMixBuRd2dK2q0mSMi3EluzWJE5KzIQB
         fuZw==
X-Gm-Message-State: AOJu0YxpNeFyDUx/zKxWlXTftlo9kpkZIq5FOmMIEfFTQEn2YNFsd0QB
	PbKPMsUQ51mqUFeEdXV8Vfqm7s5a8ptiPxWJdGflL7VsANd1+Q==
X-Google-Smtp-Source: AGHT+IGnO1mx6wrO+EPHz2mrjdjwQioyup2hv1nFW0jaT5ou2CFiSMlQK7OrqQ9v724K0p7VKrIcgw==
X-Received: by 2002:a17:902:d4c6:b0:1d4:35ad:41cb with SMTP id o6-20020a170902d4c600b001d435ad41cbmr6189106plg.49.1705507202783;
        Wed, 17 Jan 2024 08:00:02 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id s4-20020a170902ea0400b001d425d495c9sm11117999plg.190.2024.01.17.08.00.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 08:00:02 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 5/7] systemd: fix CVE-2023-7008
Date: Wed, 17 Jan 2024 05:58:58 -1000
Message-Id: <545fc081f16a63e5b012d4636deee98a788753bb.1705505890.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1705505890.git.steve@sakoman.com>
References: <cover.1705505890.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 16:00:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193929

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport from https://github.com/systemd/systemd/commit/3b4cc1437b51fcc0b08da8cc3f5d1175eed25eb1

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


