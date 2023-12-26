Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAB90C46CD4
	for <webhook@archiver.kernel.org>; Tue, 26 Dec 2023 05:14:09 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.74931.1703567648353119302
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Dec 2023 21:14:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=NllZy851;
 spf=pass (domain: mvista.com, ip: 209.85.214.180, mailfrom: hprajapati@mvista.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1d4006b251aso34391355ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Dec 2023 21:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1703567647; x=1704172447; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JPNpLxMcQi7xmT3WKArO+tynL0m9fL1V1j3EnuIg048=;
        b=NllZy851Xi5As7QwCiqyynlWsBNvD8u9dsowfuUyHcrDFCJwjmxRp+ScNhYmOzzArR
         be7+FcCdGv7m9Gbzf6LIiyi+EvEgCTd+JLcjYrQveQCoz8a0gjPCZgzcx189gbWnuTD0
         nA36uQOMEFtMLX/BiQHdwIdP+vft0+9pJnirU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703567647; x=1704172447;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JPNpLxMcQi7xmT3WKArO+tynL0m9fL1V1j3EnuIg048=;
        b=gcxAp0b2Zbuq9q7WMupC00akKn+T5ajMFHE869HnKu8AG6o3yxAR7ipXbpVN5Tm8IL
         8vTM9l8r561xS+DmPNoYVD55H/wTMCir6iHcDW//kV2pzHH1nZkbeaculIezcwhhJfsO
         W2+sgtco0sNZ04BTSV8YtuwnTGJdvTk5hZ44/4UtmqpXqyQuukcqr9HAauojIE2KkVDH
         6NwgHDS3gLN6X7LYaeY4+t7o1fhKEGDYrif2c2Movkk6nnu7MJGXREuYWXwS7+RW/gLd
         KRcdLxhI8FxGRerEdZkR0sIOwZNEsQbQJ3myQoXGn8MkiqTr8pDesZtGae+aIMRkwmxh
         iPMw==
X-Gm-Message-State: AOJu0YzjIJSbude1f14WvoLkKaUNziU/iOPTFLWAvpgta83EDOmj6qHu
	bPzeeNFlrTRutMcRb/N+hrrM6wasY9T7aVFq12pnG8x6ETM=
X-Google-Smtp-Source: AGHT+IG4F0gth0nbUTBudl9I0uxkpdnXJvW4fPbN5RxAvdjOViYY7SYFfetn3X522XGF5OwrWj4Igw==
X-Received: by 2002:a17:902:7ed0:b0:1d4:691e:817f with SMTP id p16-20020a1709027ed000b001d4691e817fmr1043833plb.126.1703567647465;
        Mon, 25 Dec 2023 21:14:07 -0800 (PST)
Received: from MVIN00016.mvista.com ([152.58.38.156])
        by smtp.gmail.com with ESMTPSA id im15-20020a170902bb0f00b001d3c23a6862sm9321144plb.25.2023.12.25.21.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Dec 2023 21:14:07 -0800 (PST)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [dunfell][PATCH] bluez5: fix CVE-2023-45866
Date: Tue, 26 Dec 2023 10:41:58 +0530
Message-Id: <20231226051158.21936-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Dec 2023 05:14:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192907

Upstream-Status: Backport from https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=25a471a83e02e1effb15d5a488b3f0085eaeb675

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
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
2.25.1


