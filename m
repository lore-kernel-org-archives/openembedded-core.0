Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FC15C88E4D
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 22:15:48 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50971.1789164946266791435
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Sep 2026 15:15:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=y+BtR1bx;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d097b4939so1471735e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 15:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789164944; x=1789769744; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yaopoIeE/hIwqJaTaQEE0BPVMa5mcd1EYCSb+HLhDNQ=;
        b=y+BtR1bxcdNIjcO2r67p9hx7MKe8Csf2WNCPfahQNtGfwBLX5W7QeRuyQbHZIJcmzo
         F0kTMjv9OCAociOwOAaCdbZOGmBoDGgHXk9kvTAPP7+h/cySHUekjMG+zxR8ihksrqb7
         XLyW33C0FNJhC177UDz92meceJoqidBuf2rp8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789164944; x=1789769744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=yaopoIeE/hIwqJaTaQEE0BPVMa5mcd1EYCSb+HLhDNQ=;
        b=Nce9hATXVjX99t1mXlEG26Yuh9GkMgvMYPZ632nsrxkEvuSDHSr9AfGwRR9Sp6MfxO
         +qDnUCKHbkKOO4XjkpK5qUBSDXyDB3TswbcG9CDv6twac/g+CP3/t50zYC8XaVmjdEv1
         QmYz7RqkW8ph+veYFKxIcgcB4QSzo8wz3C7CG9TpO4eLmwtvpTNvzJUDMkbJamnpvQbY
         Wsyfgk3E5TEoaag/uFthOcAov7K+sloiVXhI+I54pFcUWzrFbpB2xT+h/LdkyLlcZGG8
         IhI7cazlKx2tqZjukJRSyKPHGMns9VI99KminvjrZLyXQHXeVcSZ2VpGyPrJmTECwCU6
         yelg==
X-Gm-Message-State: AFuF++mYfdCws1H4tYCa7tkWiRl+Z321fFlrI2Mktl9aUBAlzUSf+EK/
	8CbNaRQg2yilfY9EG78GkJYZBxYivXz+iHVAPCjzVVG10sWkfMivTd967DRN5OXlSY6B40JjrPY
	m9RX6OAg=
X-Gm-Gg: AYBFou2OfBZJFLU8GHemFrii1CKFX9jHEzpiw7QQaMkydmGL4Dra9y8EA8nwfJ+Rvih
	0ovye9tPF3Ogkt7vpm4vDKXhWLQsu1lL+7gG1fr1Lv4KsJ3BQqGGmgg++U9o2MZzbZlTdVWzNmb
	CE49nUpx9enMEEFLR3FE5t1RVSz1HrFSCYNO6TMLG2dB+pzyAYJ16QzHlhzc4+S7VDO2apXliV+
	A6DJS8Rp5T5NflCEfOU/2fEdYqWO4qqhJCc7yRhS2J5l2eFvTKCBIRYiU/vrzdRu4cp4FXaQD8u
	geePLzydMKmqB1KOH5+7Z8VLCsaGIigBC0peTGtqbOl2lH0K0zd89TvS4RU2AVXPhUH0aBYyhEK
	nwLDwI1uwyVDqgrHVtWBJ5yBStFKa6+lYvtoXUbGf/M2eoee+UbSWnHPG9Cvl5y9OOomNMIF1Vc
	yu+nK3TYSHfheCvMebeu11jub7A9qFfJvVqOJNLcFfB3Fpe3KSSE05si8rCJClZwP0dUp9W2BPE
	EVPZe5Rx4Fn72zzRSjGkqjG9iocSG3GN5zl0RAA3lzm7oRhRXhx0y4VJfXdAMT1U0mzBsmCB6IX
	471j7xlDyA==
X-Received: by 2002:a05:600d:8646:20b0:49d:1fd8:b874 with SMTP id 5b1f17b1804b1-49e619c079cmr51882855e9.19.1789164944545;
        Fri, 11 Sep 2026 15:15:44 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm8434045e9.11.2026.09.11.15.15.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 15:15:44 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 02/13] p11-kit: Fix CVE-2026-18938
Date: Sat, 12 Sep 2026 00:14:56 +0200
Message-ID: <65db9618c3e80ca3fb6d87bea1153de554144165.1789163914.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789163914.git.yoann.congal@smile.fr>
References: <cover.1789163914.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 22:15:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245671

From: Vijay Anusuri <vanusuri@mvista.com>

Pick patch according to [2]

[1] https://nvd.nist.gov/vuln/detail/cve-2026-18938
[2] https://ubuntu.com/security/CVE-2026-18938

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../p11-kit/files/CVE-2026-18938.patch        | 52 +++++++++++++++++++
 .../recipes-support/p11-kit/p11-kit_0.25.3.bb |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-support/p11-kit/files/CVE-2026-18938.patch

diff --git a/meta/recipes-support/p11-kit/files/CVE-2026-18938.patch b/meta/recipes-support/p11-kit/files/CVE-2026-18938.patch
new file mode 100644
index 00000000000..9439a4da318
--- /dev/null
+++ b/meta/recipes-support/p11-kit/files/CVE-2026-18938.patch
@@ -0,0 +1,52 @@
+From 3e64244e538550c6a7fcf826fa8c50a4604416dc Mon Sep 17 00:00:00 2001
+From: Zoltan Fridrich <zfridric@redhat.com>
+Date: Thu, 6 Aug 2026 11:39:22 +0200
+Subject: [PATCH] rpc: guard against overflow when decoding nested attributes
+ (CVE-2026-18938)
+
+A local attacker, or one with equivalent access to a reachable RPC channel,
+could exploit an integer overflow vulnerability. By sending specially crafted
+messages, the attacker can cause the system to miscalculate memory allocation
+for nested attributes. This leads to a memory corruption issue, specifically
+a heap out-of-bounds write, which can crash the p11-kit RPC parsing process,
+resulting in a Denial of Service (DoS). This vulnerability is only exploitable
+on 32 bit systems.
+
+Signed-off-by: Zoltan Fridrich <zfridric@redhat.com>
+
+Upstream-Status: Backport [https://github.com/p11-glue/p11-kit/commit/3e64244e538550c6a7fcf826fa8c50a4604416dc]
+CVE: CVE-2026-18938
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ p11-kit/rpc-message.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/p11-kit/rpc-message.c b/p11-kit/rpc-message.c
+index d6f0aad..105a4f1 100644
+--- a/p11-kit/rpc-message.c
++++ b/p11-kit/rpc-message.c
+@@ -1160,6 +1160,10 @@ p11_rpc_buffer_get_attribute_array_value (p11_buffer *buffer,
+ 	if (!p11_rpc_buffer_get_uint32 (buffer, offset, &count))
+ 		return false;
+ 
++	/* Guard against overflow */
++	if (count != 0 && (SIZE_MAX / count) < sizeof (CK_ATTRIBUTE))
++		return false;
++
+ 	if (!value) {
+ 		memset (&temp, 0, sizeof (CK_ATTRIBUTE));
+ 		attr = &temp;
+@@ -1191,6 +1195,10 @@ p11_rpc_buffer_get_mechanism_type_array_value (p11_buffer *buffer,
+ 	if (!p11_rpc_buffer_get_uint32 (buffer, offset, &count))
+ 		return false;
+ 
++	/* Guard against overflow */
++	if (count != 0 && (SIZE_MAX / count) < sizeof (CK_MECHANISM_TYPE))
++		return false;
++
+ 	if (!value) {
+ 		memset (&temp, 0, sizeof (CK_MECHANISM_TYPE));
+ 		mech = &temp;
+-- 
+2.43.0
+
diff --git a/meta/recipes-support/p11-kit/p11-kit_0.25.3.bb b/meta/recipes-support/p11-kit/p11-kit_0.25.3.bb
index 6c5b82e6bc9..ca10bbc6acf 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.25.3.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.25.3.bb
@@ -13,6 +13,7 @@ DEPENDS:append = "${@' glib-2.0' if d.getVar('GTKDOC_ENABLED') == 'True' else ''
 SRC_URI = "gitsm://github.com/p11-glue/p11-kit;branch=master;protocol=https \
            file://fix-parallel-build-failures.patch \
            file://CVE-2026-13757.patch \
+           file://CVE-2026-18938.patch \
            "
 SRCREV = "917e02a3211dabbdea4b079cb598581dce84fda1"
 S = "${WORKDIR}/git"

