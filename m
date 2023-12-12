Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0652C4167D
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 22:40:36 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web11.9986.1702420834557487771
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Dec 2023 14:40:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=csHqcVPa;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.172, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3b9ef61b6b8so3639266b6e.3
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 14:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1702420833; x=1703025633; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n2otXZpcWYzuQNHcvUD/t71z8HfyaYYISLJL6Xn32oE=;
        b=csHqcVPaCqclHFPInvCQV+proaFW4E8qi8t7vBrkkaGjK508Hq6CN0uYDlhkhEzd6P
         5CFfaZoi77HF73zEtd/afecUyM0e91MU6nhqmS+FLmqhidUZrOETnVLoVq7FRXbOdReN
         uRic2A7VH0OeHAxa/hKZBT6o3WMJ5k4Pp5tQ1z39Be3uyE1+3C9x39UKdfHb5NXG6d9B
         e/5mDcR6IKg2PidB7OL6F/3KtTf8tetucpa3GmIb30Jl2zTaVqUnbUzn0NKWau002wqD
         Ez342Bwsn2FEF9H2n3iAJiedG4dbJKk2kr7hn8SUH6Zo1zOtLqAGqzWH+YHkhlcE73PV
         eltg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702420833; x=1703025633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n2otXZpcWYzuQNHcvUD/t71z8HfyaYYISLJL6Xn32oE=;
        b=nZKUqsU/f2k3XZR7qklHYy+EqtHI2pMamYWJaHiQAnmRusv1HvRbqPocGYQU1kZGmc
         VcztAHt9xL8l1oiQrxUvbyAmpt8Bbh1hVU1dyx9ZgnYYbT4Rrw52a5robaKRtifRVz4+
         qEH4Q4vp14ULszPGH5RaylqKoodv+bACSJ1CiLaF7QRpd9OVHldZns0GFpFZN72ypMWz
         UBXDARXhxRcIBHQ1zDwWN2dF+7t5Pkd0hiqYLxOtSA1WHi74Az2jwIYNgEr2DvXy9Evo
         zcLYJjB6ZQ5JUH0zXUqdKo0tNIDGPfPeUcFZkHTO0qTKlwbjzjwXy/XB9moLy8wcHjhP
         MMNQ==
X-Gm-Message-State: AOJu0Yzv/cmcd05yyu4/ISkCQJt01vXcYvM5CkiRtQhfNV6FjlbIdCTo
	P+aIvSZvbxXB+xBpQ+S95WSW/fZcCXLzTDDSKdM=
X-Google-Smtp-Source: AGHT+IEEHDAmRDiLlBwXLSi7L5oAmt6t8VvojkuiTUy0fPEUPmF0ldLGEPsetBGlYm+d/NrGKs4RWA==
X-Received: by 2002:a05:6808:14d5:b0:3b9:e3d7:1271 with SMTP id f21-20020a05680814d500b003b9e3d71271mr9395816oiw.9.1702420833121;
        Tue, 12 Dec 2023 14:40:33 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id g25-20020aa78759000000b006d0951e74cbsm3847974pfo.178.2023.12.12.14.40.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 14:40:32 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 2/5] bluez5: fix CVE-2023-45866
Date: Tue, 12 Dec 2023 12:40:17 -1000
Message-Id: <0d62a7279dc14f4d2c1a57320381ca2d6cee7cff.1702420654.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702420654.git.steve@sakoman.com>
References: <cover.1702420654.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 22:40:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192248

From: Archana Polampalli <archana.polampalli@windriver.com>

Bluetooth HID Hosts in BlueZ may permit an unauthenticated Peripheral role
HID Device to initiate and establish an encrypted connection, and accept HID
keyboard reports,potentially permitting injection of HID messages when no user
interaction has occurred in the Central role to authorize such access. An example
affected package is bluez 5.64-0ubuntu1 in Ubuntu 22.04LTS. NOTE: in some cases,
a CVE-2020-0556 mitigation would have already addressed this Bluetooth HID Hosts issue.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-45866

Upstream patches:
https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/profiles/input?id=25a471a83e02e1effb15d5a488b3f0085eaeb675

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
 .../bluez5/bluez5/CVE-2023-45866.patch        | 56 +++++++++++++++++++
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/CVE-2023-45866.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index a8eaba1dd6..7786b65670 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -54,6 +54,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', 'file://0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch', d)} \
            file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
            file://0001-test-gatt-Fix-hung-issue.patch \
+	   file://CVE-2023-45866.patch \
            "
 S = "${WORKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/CVE-2023-45866.patch b/meta/recipes-connectivity/bluez5/bluez5/CVE-2023-45866.patch
new file mode 100644
index 0000000000..5bb31d866a
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/CVE-2023-45866.patch
@@ -0,0 +1,56 @@
+From 25a471a83e02e1effb15d5a488b3f0085eaeb675 Mon Sep 17 00:00:00 2001
+From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
+Date: Tue, 10 Oct 2023 13:03:12 -0700
+Subject: [PATCH] input.conf: Change default of ClassicBondedOnly
+
+This changes the default of ClassicBondedOnly since defaulting to false
+is not inline with HID specification which mandates the of Security Mode
+4:
+
+BLUETOOTH SPECIFICATION Page 84 of 123
+Human Interface Device (HID) Profile:
+
+  5.4.3.4.2 Security Modes
+  Bluetooth HID Hosts shall use Security Mode 4 when interoperating with
+  Bluetooth HID devices that are compliant to the Bluetooth Core
+  Specification v2.1+EDR[6].
+
+Upstream-Status: Backport
+[https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/profiles/input?id=25a471a83e02e1effb15d5a488b3f0085eaeb675]
+
+CVE: CVE-2023-45866
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ profiles/input/device.c   | 2 +-
+ profiles/input/input.conf | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/profiles/input/device.c b/profiles/input/device.c
+index 4a50ea9..4310dd1 100644
+--- a/profiles/input/device.c
++++ b/profiles/input/device.c
+@@ -81,7 +81,7 @@ struct input_device {
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
+2.40.0
-- 
2.34.1


