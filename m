Return-Path: <elmehdi.younes@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C265CCFA04
	for <webhook@archiver.kernel.org>; Tue,  4 Nov 2025 17:16:03 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1226.1762276558360808563
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Nov 2025 09:15:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=K2mV+uVa;
 spf=pass (domain: smile.fr, ip: 209.85.167.41, mailfrom: elmehdi.younes@smile.fr)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-59310014b8eso5627000e87.3
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Nov 2025 09:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1762276556; x=1762881356; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=es/QSD8s3G7OHbdYf8KfSIjM/G23suOPEdBsro6e8Wo=;
        b=K2mV+uVa2H0BQCd9E18Sls3WONnL33ucmJg6rhgTvX86wCfetPWYmvRskDPmRavAtQ
         i9grvR1+5QLVR4yD6ugSivCo/a8YG/JcpgTtRFsGO+eBpr9DuBvGkWoJYmH4Rhnv6q8I
         NT5kuMqd1dGRwk3miOclPRyA3reSVlwdui34E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762276556; x=1762881356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=es/QSD8s3G7OHbdYf8KfSIjM/G23suOPEdBsro6e8Wo=;
        b=PoiuneKpVIuFrVrvyD4RbBcXIvcGqVzbEV7uj3gce6eA2Ar062f5LdWmxw6X+6wNfZ
         dSRQdwaO/3mu8jpwf6Ba0Bi3alVs5pGSBhH9CIyGBpTUwEIdyipnZojyGbxlGbsUzXPw
         3NqZVIuhbZZH8sw6V7SNTlLd1OcrMQ4MsEcKrPOjgn8BiryBdzueek7dMWJv4/ONO1HG
         tiVWkhK7a8Fno5p/hDJOND+qiwIwARA5oOMsnVHfKFDOa0o1cN81cG/arVnS/Wq/nRtH
         NPcOZl8qdb3Id0BT0RHI+IwpTBJ681ypJF5LH69F8cQ1seWwowRcl2BhHasr/18dh5jK
         iLgg==
X-Gm-Message-State: AOJu0YxZy8XwwAEDqzWbf3SJwPaMbdjSMi7w8zMONQmSjcnOQr/Bzxik
	UvOAaPUNqkMY/Eri/tcUARhBy0d6BMo6PXYC4CIEX3xC34jnbNErrSlS9rtBbcXTywDFQ83h5Vg
	6VacN664=
X-Gm-Gg: ASbGncsZnBUslbfYJI+Whw3AzDVgPRG7DPKh39whS1eH5Zo6dIejJJ5YHd1CpufFGMa
	/NLQe6bkExboU4RHyVmdG1aydxOjZByP7cWSgCk29DfP17/OcxMl5RVuWJHaG52I5TbC5LDiFQw
	hKdChPURz/fk7hrhhZZsK5VZMM/7mzG1GNGccG2uMV2g6oPEvP94XbJvGqC8m3GVe2JM1/0sIB8
	BorSL1vvJoYSPVN38/DHOHTn6Ahm64O0YX+6P91ci43vDVAH5ogdfzE7tSHUzL/0d3cMcE2zw5q
	5MQJ3ZYgxMq83EG6rociRVyBM3pYLgWzgSI/ExF7E0LHI7pgrropeiLYir7267eRACD+8c1SnU5
	yNlHVF1D1dn6VrlLmuzYVS+Lm9tdFH7VyjpJkf8RoZjfrZoKA1xTOANtULI1bp+iY0vlgg+Yrej
	yBTNlc6e2ZDvfHH5RpFB+fux8de8NokLc9QYLQ8DG0A5C47x4zr5WTYHprKXWdiCXg+tgFyA==
X-Google-Smtp-Source: AGHT+IERbiDCYTPkpQ8UbMsLr3lN47EEz46FIo2j+5XXwEUZCtG3NnzpaWOsWGjf2kEhvyJOYAhL6w==
X-Received: by 2002:a05:6512:3e1a:b0:594:2710:d719 with SMTP id 2adb3069b0e04-5942710d75amr3484424e87.41.1762276556071;
        Tue, 04 Nov 2025 09:15:56 -0800 (PST)
Received: from FRSMI25-BOLET.. (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5943437efd1sm914407e87.4.2025.11.04.09.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 09:15:55 -0800 (PST)
From: El Mehdi YOUNES <elmehdi.younes@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr,
	El Mehdi YOUNES <elmehdi.younes@smile.fr>
Subject: [RFC PATCH 2/4] linux-yocto.inc: Conditionally add rust.scc kernel feature
Date: Tue,  4 Nov 2025 18:16:09 +0100
Message-ID: <20251104171611.2227798-3-elmehdi.younes@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251104171611.2227798-1-elmehdi.younes@smile.fr>
References: <20251104171611.2227798-1-elmehdi.younes@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Nov 2025 17:16:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225738

This adds the mechanism to enable the Rust for Linux kernel feature
via a DISTRO_FEATURE.

When 'rust-kernel' is present in DISTRO_FEATURES, the 'rust.scc'
kernel feature is appended to the KERNEL_FEATURES list.

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
---
 meta/recipes-kernel/linux/linux-yocto.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 4d0a726bb6..40e5bf214b 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -95,3 +95,7 @@ do_devshell:prepend() {
     d.setVarFlag("PKG_CONFIG_SYSROOT_DIR", "unexport", "1")
     d.appendVar("OE_TERMINAL_EXPORTS", " PKG_CONFIG_DIR PKG_CONFIG_PATH PKG_CONFIG_LIBDIR PKG_CONFIG_SYSROOT_DIR")
 }
+
+KERNEL_FEATURES:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', ' rust.scc', '', d)}"
+# TODO: Kernel rust code compilation breaks under ccache, disable it for now
+CCACHE_DISABLE = "${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', '1', '', d)}"

