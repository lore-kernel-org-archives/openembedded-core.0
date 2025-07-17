Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82CA1C83F34
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 02:59:31 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.40270.1752721165736698640
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jul 2025 19:59:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=1LIsAej6;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-313a001d781so485659a91.3
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 19:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752721165; x=1753325965; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w9IodKLqpRkrJg/ZNb3m3p+uAwc1Cndhf8UZgrXzPog=;
        b=1LIsAej6YdNT4eMEmw9J7BoWi94k6QZjEj3qFxNU+oiB5LGI6eVCKuNPZx40Fa1OeX
         MuJjNaPsyMwjvsXEU7vwWMphSOpg8G6n+ODtEHmdyz4WPy2FuQ4YRlwy4gt8TiF0yqPc
         9j4BpYArv67z40pUeXfSp0Bw280Vxl5/zuW2OiSP8L/G844hf/cO3uhJGyFkKriXUqVc
         svL5aLdXm53Wid7Y7SPC6bQbr6ZsJfHZarRaIPKnSzD8oNLKiuVll+QFCjeY9S8pf+jn
         YlWkfBBlbQFt4YtEU/DZeR9IPSo8163HHffc+KlHF9zjgFe2a1yyc2MKqNA59VCUN9+l
         jhlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752721165; x=1753325965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w9IodKLqpRkrJg/ZNb3m3p+uAwc1Cndhf8UZgrXzPog=;
        b=VAmf5Ec1ZKUJVJrfa2GuMt+Lw51qV8H/wKuJlqJp8KW6on0W9kTsnHAp24Tr2ek3zv
         4lWp9Eo0QHMh9T9OMlsArenA8s70/uZetYG1Ju9Bmh/qqnYqPBhNC6CW7oIJywtFNc6l
         yc0bfwHrR03L5xUS0vsbrl9frDI6oCViPugS3aIrTSRuhiTHpIozR9idM8veoYLznUq+
         W2oWRPVCRlFZizEx05QBDaii1bmtjOC3HLqq3QYE+t/iQ+eM3ANn2au0uPLto5QU4YDM
         /4ZTR58IsaPh3Q0mohdV6DQMuI4ApT6EJE6pzDtPQMiynVv1U+RAKiT8ULFVzhq6YJ+j
         Eujw==
X-Gm-Message-State: AOJu0Yz7eyro74L0YqFqXr4S4/57oRStiSspPObPc8XiyhsHYj0JElns
	xwTRKjsT/yLQLk/1k4SAENGmHOl9yBtGj3+wjqNOaow94S+Lp3UOqo0vCG64ftSDgXp9zcuUSby
	zZXL7
X-Gm-Gg: ASbGncttebjeysFyIQqnIJFLbzV1fAGmf9hcsIT0gsnqw3l1bDnqzqnycg1mIJ/U8MS
	Bhxg3rotfwaBz8G2pKZM3f2EGDmNrJv1rZzKjvO1Tc+YZYwVkL8/P8fwOr0Ga46VjaryFMNzxBq
	8sNvoJ9cuXwERSfLJFRcCBSGSMqudlEvuGQ7UMbvVHyWYNzzFrk+5MNBUJx7RddmtiDmYCY+HZK
	ygBPCszuPuPAEyezswRM4czTjkeYG6iVaoVTl4WsFsnfV5ZzD1Q2dmM6IS8RE7l+wJTIOme7DxH
	ZsdBnjxnIImflNje2DyBo4hhathFvmT9JOlY9kZiJasr26x/MSJ70EulPE/SHH7EU+52bo59JzV
	SnxY4K3VeAy3vFQ==
X-Google-Smtp-Source: AGHT+IH21nVzGywXPhIY5H8mtPX4WmKVqyDELbcH+Tz6OsRmAbJlWdUaNaM5PjJNvG7emgA3pF70tQ==
X-Received: by 2002:a17:90b:4985:b0:313:2e69:8002 with SMTP id 98e67ed59e1d1-31c9f42eb2dmr7004591a91.20.1752721164648;
        Wed, 16 Jul 2025 19:59:24 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:3bfc:8fec:7e35:e96a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c9f29e313sm2204547a91.35.2025.07.16.19.59.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 19:59:24 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 10/12] kea: set correct permissions for /var/run/kea
Date: Wed, 16 Jul 2025 19:58:58 -0700
Message-ID: <5b709e2c165bf46f4f35e1783ab7ec54fabd2ec3.1752721028.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752721028.git.steve@sakoman.com>
References: <cover.1752721028.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 02:59:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220510

From: Yi Zhao <yi.zhao@windriver.com>

Set the permissions of /var/run/kea to 750 to fix kea server startup
error:

ERROR [kea-dhcp4.dhcp4/445.140718820303936] DHCP4_INIT_FAIL failed to
initialize Kea server: configuration error using file
'/etc/kea/kea-dhcp4.conf': 'socket-name' is invalid: socket
path:/var/run/kea does not exist or does not have permssions = 750

This permission check was introduced by commit[1] in kea 2.4.2.

[1] https://gitlab.isc.org/isc-projects/kea/-/commit/f7061c4e9711f395fbc940b0cf0ddbde87e0fc13

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/kea/files/kea-dhcp-ddns.service | 1 +
 meta/recipes-connectivity/kea/files/kea-dhcp4.service     | 1 +
 meta/recipes-connectivity/kea/files/kea-dhcp6.service     | 1 +
 3 files changed, 3 insertions(+)

diff --git a/meta/recipes-connectivity/kea/files/kea-dhcp-ddns.service b/meta/recipes-connectivity/kea/files/kea-dhcp-ddns.service
index f6059d73cb..aec6446f0e 100644
--- a/meta/recipes-connectivity/kea/files/kea-dhcp-ddns.service
+++ b/meta/recipes-connectivity/kea/files/kea-dhcp-ddns.service
@@ -6,6 +6,7 @@ After=time-sync.target
 
 [Service]
 ExecStartPre=@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/run/kea/
+ExecStartPre=@BASE_BINDIR@/chmod 750 @LOCALSTATEDIR@/run/kea/
 ExecStart=@SBINDIR@/kea-dhcp-ddns -c @SYSCONFDIR@/kea/kea-dhcp-ddns.conf
 
 [Install]
diff --git a/meta/recipes-connectivity/kea/files/kea-dhcp4.service b/meta/recipes-connectivity/kea/files/kea-dhcp4.service
index b851ea71c5..a2ed4edb59 100644
--- a/meta/recipes-connectivity/kea/files/kea-dhcp4.service
+++ b/meta/recipes-connectivity/kea/files/kea-dhcp4.service
@@ -6,6 +6,7 @@ After=time-sync.target
 
 [Service]
 ExecStartPre=@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/run/kea/
+ExecStartPre=@BASE_BINDIR@/chmod 750 @LOCALSTATEDIR@/run/kea/
 ExecStartPre=@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/lib/kea
 ExecStart=@SBINDIR@/kea-dhcp4 -c @SYSCONFDIR@/kea/kea-dhcp4.conf
 
diff --git a/meta/recipes-connectivity/kea/files/kea-dhcp6.service b/meta/recipes-connectivity/kea/files/kea-dhcp6.service
index 0f9f0ef8d9..ed6e017d0c 100644
--- a/meta/recipes-connectivity/kea/files/kea-dhcp6.service
+++ b/meta/recipes-connectivity/kea/files/kea-dhcp6.service
@@ -6,6 +6,7 @@ After=time-sync.target
 
 [Service]
 ExecStartPre=@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/run/kea/
+ExecStartPre=@BASE_BINDIR@/chmod 750 @LOCALSTATEDIR@/run/kea/
 ExecStartPre=@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/lib/kea
 ExecStart=@SBINDIR@/kea-dhcp6 -c @SYSCONFDIR@/kea/kea-dhcp6.conf
 
-- 
2.43.0


