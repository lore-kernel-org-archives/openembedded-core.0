Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59A1FF01806
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 07:23:10 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.64467.1772781782965613637
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 23:23:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=kq70++97;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4806ce0f97bso77949505e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 23:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772781781; x=1773386581; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zdaMzEodhNxK4FzPXn5r1stqGhDppxkJrKueAaSt3rc=;
        b=kq70++972qXgofO49qEtVQ/yjYAXy6R3QkeQIGyltwcBoUcYhboIEvLXKpZZZXPIj6
         Pw3gVf+vf2ydVPQFIwYPvXOE4TIzRDFlF0uSsnKmSSEDDPjP1SbQTKoBhblDOH/iyCzY
         pmm7WZ5etBNyBfuC9eL3zc2e8rdMcNBmLm8Y8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772781781; x=1773386581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zdaMzEodhNxK4FzPXn5r1stqGhDppxkJrKueAaSt3rc=;
        b=pulbXq5vCxaX8o2sU0aB5UvCao1qSky5UOdZsaGz0s8YMEEmVbYisiDDxFVFURTFnO
         2/wvzWNOGwZoXvidcq3sktNJTd5N0KsdMqUidBQ16Q0b4N1No0bec3591PlXLkweL0uI
         3a4ur1un91TwyWOy2D851G+0xlPcCQb1ehdIHtVoCmlwMGudqVZRYhhHtO27FLZs/lQc
         n8ObrhkcSOGUp21y579HMJouWLChY7syjrANRVnSThIQ1b5QMhmb0kaIDk/QxtmogzoX
         uTz3/IRwhPHi4eKsttvsrApc74qyyPO3sHYch2L4nWXn3anWqAnkZSl5tLucc9GS4csg
         agTg==
X-Gm-Message-State: AOJu0YyaDKmCj4bUCenBfwdebenCHqaKvqkaMUSZ/+ZJGNWADe7XYUdg
	mimoonz6lNbg/6zys4ePM3cKTGyRFPlxuQWYcKBVC/yRDxBMRUTbqqv0ItLWFw1+I7w0jZYyRHG
	Xe4N0
X-Gm-Gg: ATEYQzxKiL3SNnKfhaxxOFPk/rHd3Z1VjFxKKJJ6z1tQWHOHdQl2Cro/Px/5r2UnZPN
	+6Jt+s/xLpA83u9CqNa63ISDIQGjPjqIQfg3R/sfZDeZ/ZTgxjdweKuSUGBEQg7biCgx9aeBJel
	BLGwTBC5ApRsl0hHfI2Bj5ezlH3b5d9E4C5aCpIu2gzYFHzjQdxBImY+bReJgqCMJ443q+g2MNu
	43yiK9iL2BRatOGYC7PafEHmhD2swLT1kmTRNpyT9aHaZK+2HBm5GwF0EqT5gsRvvUxSyOcqbqq
	bgLzndYN0Ohyqg5FQdb77+OtqiI+juDaER1lbFTWn+4csZyuXdHFKosKT5dnhe/GuUlLkFBCjkw
	J9kwRWLlwziaC69EDGz3m4g/PJvX66xR+rmMo6uiwtrhQXNHLRxtGqSHan7sXE/8YTAuPSRgFwq
	KuNHBrdG0ZuIchEDzTC0OyitB8rJlnyoclfxmoT0qWmvlhHr8o+am2YKZpAEmkXtZhPdHey/cop
	On6dnoouvYATjwV3/zts3muNCdfnD07B9rbxsY=
X-Received: by 2002:a05:600c:4752:b0:483:b505:9db7 with SMTP id 5b1f17b1804b1-48526976a4cmr13060635e9.32.1772781781068;
        Thu, 05 Mar 2026 23:23:01 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00bdeac353f6fa5aa8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bdea:c353:f6fa:5aa8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485276b09casm23106445e9.11.2026.03.05.23.23.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 23:23:00 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 04/16] linux-yocto: apply cve-exclusions also to rt and tiny recipe variants
Date: Fri,  6 Mar 2026 08:22:04 +0100
Message-ID: <b601ac4e4ec910633a9f5168d1a21fadef32d9ba.1772780989.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772780989.git.yoann.congal@smile.fr>
References: <cover.1772780989.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 07:23:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232543

From: Peter Marko <peter.marko@siemens.com>

Version is the same as base kernel, only configuration differs.
There is no reason to not apply the exclusions to all variants.

This commit is equivalent of master commit
77fb0331ecc0cb9eff6a711c2a7889f2f6bdda92

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb   | 1 +
 meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb   | 1 +
 meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb | 1 +
 meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb | 1 +
 4 files changed, 4 insertions(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index e720629b14d..5816902a7ff 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -3,6 +3,7 @@ KBRANCH ?= "v6.12/standard/preempt-rt/base"
 require recipes-kernel/linux/linux-yocto.inc
 
 # CVE exclusions
+include recipes-kernel/linux/cve-exclusion.inc
 include recipes-kernel/linux/cve-exclusion_6.12.inc
 
 # Skip processing of this recipe if it is not explicitly specified as the
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb
index d1f7e76501d..2b54315670b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb
@@ -3,6 +3,7 @@ KBRANCH ?= "v6.16/standard/preempt-rt/base"
 require recipes-kernel/linux/linux-yocto.inc
 
 # CVE exclusions
+include recipes-kernel/linux/cve-exclusion.inc
 include recipes-kernel/linux/cve-exclusion_6.16.inc
 
 # Skip processing of this recipe if it is not explicitly specified as the
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index 164557eaa0a..5828ff986bd 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -6,6 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 require recipes-kernel/linux/linux-yocto.inc
 
 # CVE exclusions
+include recipes-kernel/linux/cve-exclusion.inc
 include recipes-kernel/linux/cve-exclusion_6.12.inc
 
 LINUX_VERSION ?= "6.12.69"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb
index ef904adad48..92c26d42e3d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb
@@ -6,6 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 require recipes-kernel/linux/linux-yocto.inc
 
 # CVE exclusions
+include recipes-kernel/linux/cve-exclusion.inc
 include recipes-kernel/linux/cve-exclusion_6.16.inc
 
 LINUX_VERSION ?= "6.16.11"

