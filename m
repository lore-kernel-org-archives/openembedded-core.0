Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5B08CD5BB0
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 08:21:12 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7376.1779265264550334687
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2026 01:21:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ek0iWVcc;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48d146705b4so50172395e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 01:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1779265262; x=1779870062; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ia8IB6RhZk851K4c3evKW/zVI9exDn8lRffxNwGdUmM=;
        b=ek0iWVccZncPYuDx/zMpBug78R7sBb11QHTJhk/wutkgfV5h5e69/jZO1sWoCFHeTf
         j06kUg1gBmhUwIvc+cOkkelF29Xe4PtwqFfcekIbng/8o/tmxY/uELG5MCPcDuhn5xGv
         jjRg/y13XG6A8BoZdkr2YozoAH1Ku0hq7o0vM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779265262; x=1779870062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ia8IB6RhZk851K4c3evKW/zVI9exDn8lRffxNwGdUmM=;
        b=d3zFxiAW7sUOgqG7/nGCs+ksBJ+KwPLDrQKm7nDsIU3W8XISsYHcMlXRsdamBglIhW
         NyeqLuoCWGT2mn46aPuqPRJpvIbsEfXzan24Hvwyg14rwApKmb7cmu3/9cny4ud5k0r2
         CNBcP8oDqUhl7A7p1fI2QwD6fxaFiSvibLSiOe4/RoDyTb4kP0z4Q5hfnRkTQVtnCmiZ
         zp3HE9pOYCQpavx+z05VDMHCEGDaJ/Q7cAlfc9AhUrJ7B7ff125SfiYQiw32c1acpn1N
         +D7s+2nxY0GddXyGKO5aAbTgkf7OFjWj6VyiFD83LYQrW54fEZ4Aax1RYUJT3gPBZiHT
         cGJg==
X-Gm-Message-State: AOJu0YyT2SCfnvGNI349NhhDkkmVpFfKTlpwvX2OfhJLwuvDFtKKQCZr
	+OYKJoS4cuDqDm14qRrmJ/cYpdqTSBOaP7bWImqpLCPUj/bN/V0ZmTw2R3QYbOznjhaDgFRaZQZ
	quS5+
X-Gm-Gg: Acq92OEHwDgRCcRBU6QArgIfCxAjQvfFeJWwFkMFy/+Rdfb+fWP1w/wnfCTO30Vpb4J
	0rQqd3MQZ7ZHIu49O4srYDUP7sC8XOhFueHnq+CsL36oDAQfbofsqxeGibiDrxCdJME0FoCDt5U
	vwdLUHSokqjA+DlCdGukg7bt8ihiq5bmjCHLN8Rjn4N6AC463XnosVIQC5LcfQrRPukGZEQxBOi
	0dFPJt6JBlCfBpGcv/DNlFgyRpXVtx0YEoqLZ6Uk7x+R59QaT/I5Y/1zJSaORix3Cpsx6CojTXF
	pId8PFPvQtrZhhnQcWKCYbmbjFZKCvrD7O6navz5QnGNAWEud2IAg42irSRs2LwkSftWXfm3fEY
	mfhy1rAAHVhk4V0ujAKTdKtmpyUYKL18/Zk8NVmHhrZPNbV0u9XZi7o/8dC7Jyv/VasDhY0uMOT
	mAwm9pCradD7pjrsCqMKSAnrUO3tTGvrsuIosEw/1KmRSWI5NK388/KCk4zAHs/bpSDp0gmn+rU
	FZ5FFTIAM73kUixFlELZqZ52ftJ
X-Received: by 2002:a05:600d:b:b0:48e:8741:fd42 with SMTP id 5b1f17b1804b1-48fe60ee64amr270380325e9.12.1779265262346;
        Wed, 20 May 2026 01:21:02 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-250c-63aa-0256-2b9f-d16e-d784.rev.sfr.net. [2a02:8440:250c:63aa:256:2b9f:d16e:d784])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec39ff1sm56350642f8f.10.2026.05.20.01.21.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 01:21:01 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose v2 09/28] busybox: fix CVE-2026-29004
Date: Wed, 20 May 2026 10:20:10 +0200
Message-ID: <1de69f93fd9e3473119d65fb4ea72a308fb0f92f.1779264709.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779264709.git.yoann.congal@smile.fr>
References: <cover.1779264709.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 08:21:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237408

From: Chen Qi <Qi.Chen@windriver.com>

Backport two patches to fix CVE-2026-29004.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-29004

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../busybox/busybox/CVE-2026-29004-01.patch   | 42 +++++++++++++++++
 .../busybox/busybox/CVE-2026-29004-02.patch   | 47 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.37.0.bb   |  2 +
 3 files changed, 91 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2026-29004-01.patch
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2026-29004-02.patch

diff --git a/meta/recipes-core/busybox/busybox/CVE-2026-29004-01.patch b/meta/recipes-core/busybox/busybox/CVE-2026-29004-01.patch
new file mode 100644
index 00000000000..8ce4858adc0
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2026-29004-01.patch
@@ -0,0 +1,42 @@
+From d9a718cc17535c31d38f31fccb904a30e823166d Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Thu, 12 Mar 2026 07:25:38 +0100
+Subject: [PATCH 1/2] udhcpc6: fix buffer overflow
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+
+CVE: CVE-2026-29004
+
+Upstream-Status: Backport [https://github.com/vda-linux/busybox_mirror/commit/42202bfb1e6ac51fa995beda8be4d7b654aeee2a]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ networking/udhcp/d6_dhcpc.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/networking/udhcp/d6_dhcpc.c b/networking/udhcp/d6_dhcpc.c
+index 79cef1999..d13b05829 100644
+--- a/networking/udhcp/d6_dhcpc.c
++++ b/networking/udhcp/d6_dhcpc.c
+@@ -351,15 +351,15 @@ static void option_to_env(const uint8_t *option, const uint8_t *option_end)
+ 			addrs = option[3] >> 4;
+ 
+ 			/* Setup environment variable */
+-			*new_env() = dlist = xmalloc(4 + addrs * 40 - 1);
++			*new_env() = dlist = xmalloc(4 + addrs * 40 + 1);
+ 			dlist = stpcpy(dlist, "dns=");
+ 			option_offset = 0;
+ 
+-			while (addrs--) {
++			while (addrs-- != 0) {
+ 				sprint_nip6(dlist, option + 4 + option_offset);
+ 				dlist += 39;
+ 				option_offset += 16;
+-				if (addrs)
++				if (addrs != 0)
+ 					*dlist++ = ' ';
+ 			}
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/busybox/busybox/CVE-2026-29004-02.patch b/meta/recipes-core/busybox/busybox/CVE-2026-29004-02.patch
new file mode 100644
index 00000000000..734f0bbbdba
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2026-29004-02.patch
@@ -0,0 +1,47 @@
+From 1e14c5c577a7bd46f42315e9bc445419770041a7 Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Thu, 12 Mar 2026 13:23:48 +0100
+Subject: [PATCH 2/2] udhcpc6: check the size of D6_OPT_IAPREFIX option
+
+function                                             old     new   delta
+option_to_env                                        694     711     +17
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+
+CVE: CVE-2026-29004
+
+Upstream-Status: Backport [https://github.com/vda-linux/busybox_mirror/commit/d368f3f7836d1c2484c8f839316e5c93e76d4409]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ networking/udhcp/d6_dhcpc.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/networking/udhcp/d6_dhcpc.c b/networking/udhcp/d6_dhcpc.c
+index d13b05829..1851cee2a 100644
+--- a/networking/udhcp/d6_dhcpc.c
++++ b/networking/udhcp/d6_dhcpc.c
+@@ -287,8 +287,8 @@ static void option_to_env(const uint8_t *option, const uint8_t *option_end)
+  * |                        valid-lifetime                         |
+  * +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
+  */
+-			/* Make sure payload contains an address */
+-			if (option[3] < 24)
++			/* Make sure payload exists */
++			if (option[3] < (16 + 4 + 4))
+ 				break;
+ 
+ 			sprint_nip6(ipv6str, option + 4);
+@@ -332,6 +332,9 @@ static void option_to_env(const uint8_t *option, const uint8_t *option_end)
+  * |               |
+  * +-+-+-+-+-+-+-+-+
+  */
++			/* Make sure payload exists */
++			if (option[3] < (4 + 4 + 1 + 16))
++				break;
+ 			move_from_unaligned32(v32, option + 4 + 4);
+ 			v32 = ntohl(v32);
+ 			*new_env() = xasprintf("ipv6prefix_lease=%u", (unsigned)v32);
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/busybox/busybox_1.37.0.bb b/meta/recipes-core/busybox/busybox_1.37.0.bb
index 47908996843..a6abfa25984 100644
--- a/meta/recipes-core/busybox/busybox_1.37.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.37.0.bb
@@ -64,6 +64,8 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0001-tar-strip-unsafe-hardlink-components-GNU-tar-does-th.patch \
            file://0002-tar-only-strip-unsafe-components-from-hardlinks-not-.patch \
            file://CVE-2024-58251.patch \
+           file://CVE-2026-29004-01.patch \
+           file://CVE-2026-29004-02.patch \
            "
 SRC_URI:append:libc-musl = " file://musl.cfg"
 SRC_URI:append:x86-64 = " file://sha_accel.cfg"

