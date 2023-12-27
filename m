Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED3A0C46CD3
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 02:30:45 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.94599.1703644237053260256
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Dec 2023 18:30:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=AIHVuo8o;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-28bc7155755so1804453a91.2
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Dec 2023 18:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1703644235; x=1704249035; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1gaP3Az0ZqUTVcZ1oSRqCGDaVHCBzbPWfPCtOseKsEM=;
        b=AIHVuo8owCAEUdZ3P0yPT0m7cSNw7usbXdGJFPIb10pv+xtjdQ7JNhMkyAsjr5M18t
         vRh5mWYyGvE41vTSysl3feMcJr3pqC+8pAkSrFRqj1owSwfvoNA24OJ4HAgQycHNoAJs
         auSbM5CfinDfFgc2500zCHYUUotQVOepAc9NLeiJuqahrE849M6UYHuKRpgT0sTkjY+P
         HXX92P8e4tzcB8tVLlU5KnrwOL2tzGGkUZ8O9ETbqU0jtLZYr7JqRUQxqxqgOBTduOLV
         lObJdiuzEEw8boq0XLTLpFf+wSOBzo9vZjXjH0A+ERIslvD81M00B6okqv43vQnQmFdn
         Dcww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703644235; x=1704249035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1gaP3Az0ZqUTVcZ1oSRqCGDaVHCBzbPWfPCtOseKsEM=;
        b=wKNUPCF0hOrMHM/iFXkKHMC0QCq1BVCmE+Rr+pjdPlwmXV/m+mN+2PEyK3hJN0Felk
         2lY9SXJsTw0alBjiqgPVqEOjrzXdBDBNqeshwMYFdNL8UwJk6k8645xu4IYDutzL4wrt
         XJqrRpO9r6rY3thxxEe1OrqAF5FYaOYhWxElSfRMiQTI39tmUGzso7WIxcbD84JpHkrc
         Y4HKBT1Vdy5SHctd6Cp18ldaVDWZIZcp1n6c14FWh46Mo1vmSZrlfdvVaZPptsECLuNz
         dVxW54vpBYtRjSJNA0mH8SxR5tLSwnSgxvjMu7+Thg5wqUiLZBJWKGcQj2M3uZYET5QK
         R1dQ==
X-Gm-Message-State: AOJu0YwbTd8iRkZhirLeQj6z2MRC5eyGk36QHcyYBLDRPPhGjfAzjWKz
	n7E7XcVxBFa+618y3ivagZCUAvi4gBTcOInXc6aoCkc0h7wBvg==
X-Google-Smtp-Source: AGHT+IEQOz1MxwNLcU/mKY9/GQBxaDHHtajFtZjkzLvhZuWqGcvvJjZ9y2uvEXUBFa1vQEp3qGjBng==
X-Received: by 2002:a05:6a00:ce:b0:6d9:aa18:291c with SMTP id e14-20020a056a0000ce00b006d9aa18291cmr1613999pfj.8.1703644235614;
        Tue, 26 Dec 2023 18:30:35 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id z188-20020a6265c5000000b006d095553f2asm10982400pfb.81.2023.12.26.18.30.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Dec 2023 18:30:35 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 5/6] bluez5: fix CVE-2023-45866
Date: Tue, 26 Dec 2023 16:30:20 -1000
Message-Id: <1df2bdf370346dac70451159adf1ae85d1a2dacd.1703644078.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1703644078.git.steve@sakoman.com>
References: <cover.1703644078.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 02:30:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192920

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport from https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=25a471a83e02e1effb15d5a488b3f0085eaeb675

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
 .../bluez5/bluez5/CVE-2023-45866.patch        | 54 +++++++++++++++++++
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/CVE-2023-45866.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index a71d339928..74fd344170 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -59,6 +59,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            file://CVE-2022-0204.patch \
            file://CVE-2022-39176.patch \
            file://CVE-2022-3637.patch \
+           file://CVE-2023-45866.patch \
            "
 S = "${WORKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/CVE-2023-45866.patch b/meta/recipes-connectivity/bluez5/bluez5/CVE-2023-45866.patch
new file mode 100644
index 0000000000..43670ab2b3
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/CVE-2023-45866.patch
@@ -0,0 +1,54 @@
+From 25a471a83e02e1effb15d5a488b3f0085eaeb675 Mon Sep 17 00:00:00 2001
+From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
+Date: Tue, 10 Oct 2023 13:03:12 -0700
+Subject: input.conf: Change default of ClassicBondedOnly
+
+This changes the default of ClassicBondedOnly since defaulting to false
+is not inline with HID specification which mandates the of Security Mode
+4:
+
+BLUETOOTH SPECIFICATION Page 84 of 123
+Human Interface Device (HID) Profile:
+
+5.4.3.4.2 Security Modes
+Bluetooth HID Hosts shall use Security Mode 4 when interoperating with
+Bluetooth HID devices that are compliant to the Bluetooth Core
+Specification v2.1+EDR[6].
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=25a471a83e02e1effb15d5a488b3f0085eaeb675]
+CVE: CVE-2023-45866
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ profiles/input/device.c   | 2 +-
+ profiles/input/input.conf | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/profiles/input/device.c b/profiles/input/device.c
+index 375314e..0236488 100644
+--- a/profiles/input/device.c
++++ b/profiles/input/device.c
+@@ -93,7 +93,7 @@ struct input_device {
+ 
+ static int idle_timeout = 0;
+ static bool uhid_enabled = false;
+-static bool classic_bonded_only = false;
++static bool classic_bonded_only = true;
+ 
+ void input_set_idle_timeout(int timeout)
+ {
+diff --git a/profiles/input/input.conf b/profiles/input/input.conf
+index 4c70bc5..d8645f3 100644
+--- a/profiles/input/input.conf
++++ b/profiles/input/input.conf
+@@ -17,7 +17,7 @@
+ # platforms may want to make sure that input connections only come from bonded
+ # device connections. Several older mice have been known for not supporting
+ # pairing/encryption.
+-# Defaults to false to maximize device compatibility.
++# Defaults to true for security.
+ #ClassicBondedOnly=true
+ 
+ # LE upgrade security
+-- 
+2.25.1
+
-- 
2.34.1


