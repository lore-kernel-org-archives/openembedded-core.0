Return-Path: <maxin.john@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D167FE77188
	for <webhook@archiver.kernel.org>; Tue, 31 Dec 2024 09:44:27 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.80017.1735638261286559415
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Dec 2024 01:44:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gj17GBL/;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: maxin.john@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54021daa6cbso10394624e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Dec 2024 01:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735638259; x=1736243059; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=xWOFgxqdlADXg4uqM/jL7Eq5AAksp9kjKi9NH5PWyEU=;
        b=gj17GBL/S+/noTs6o6C9plX/A4OwcaQAJeMAPywngcBXjAgkKQgguRi6skmC9BVTQY
         Eh2pHarmkRBAq6ZzgL2wx/VUCK6SUU4xVZJjI9xEToNeXMEOxtbotFodMSGpeb6Awk77
         RvvPNij0aUaypDXxI8+qsx2NSstvLXOKFkmVLiMrBzFFAG2QAnZhnl09annzQSGzzQ8l
         kiDLWQY6qoeUNZAM3iTLlGRRtgigVBxY8ukwFQAWEjpO7uxWQUE1BRzZ3ygNSdWGrdsc
         xcpz1zG+Vpy7e1xdqaX/J8Jj4+oVJ7gL4G84kQokR0yRIrI2tBqsMiTKm6nDTUYpAuYx
         dhwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735638259; x=1736243059;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xWOFgxqdlADXg4uqM/jL7Eq5AAksp9kjKi9NH5PWyEU=;
        b=NS23Lu3CHgXuvsfydRddCNOIWVRX+UJ68X0qEEp9Nq/s0gFq3gVWTHKhiOsxLnhUK9
         aEPLZuXYQYqlpKBgO1skorxtW0LVi2vzMx0En1EvByUh+9MB4D4cSdZ/LYO5E4hYv+Ot
         u4XoHfSTNptauA4yPIP4m/IO6CS3662HrPPLksGBT2YcgCYqOlEXueBUaNgcPj4FtMct
         EoZbVHmd2CghsK7HIkcfziz0r4/Zywi0M7tjF5uw1eD2x6VVp80Q+Ic2IJM6euu5u3Wz
         W2zyn8W1yEQr3+rRWY/rBy41ksQCI5u3qS57U4pPMwHJmFj2FoL9AzeUJwdzZ4HWozgc
         bCig==
X-Gm-Message-State: AOJu0YyREb59egxXlVmi9DdRiQeAPxlGA+VEo2kQCEyXmMJoZlH9uzcJ
	pp5I8aU0t08DybKR4Y0rsNYwx8UQZoa3tmi5qUxzVLAhpBmA/Wn4iQwBkg==
X-Gm-Gg: ASbGncsgwI0dMK2fYpjQiLOB7UfkvCLFOnamHfQPzaBlAZx1KmhYcY8XfIDvqVIdoqD
	IDLt/55m/aE4xs1l97H99Nljo8QYzPfiJUorEqg8+FyU+ZEs71Ff/QfRHe0UgPOz7CqQnQjvfRR
	oBzkyqRJz4RmtYVzFwN+JvHA9HXo0MQX0Ei/yZqghHXwNSOU73GtMx0bO+sY70RDLSVtQxCaT3C
	yvXrqcDImoG7tMDbvvfWeMpuNzm1vryl+sPV4+jNzqlsYpyx5EFNwq5P3F/SjJMOtil8DyiwL7C
	dqyAd67b20g=
X-Google-Smtp-Source: AGHT+IFJZLk8vwCu/8u1zWD+CJl9ErJKNwNR50Cy/tflvZxP2jC1/7tO9w/tlHGYdJOnhreI4e+0rw==
X-Received: by 2002:a05:6512:1055:b0:53e:39e6:a1c1 with SMTP id 2adb3069b0e04-54229560360mr13135488e87.43.1735638259118;
        Tue, 31 Dec 2024 01:44:19 -0800 (PST)
Received: from Thor.lan (81-197-125-5.elisa-laajakaista.fi. [81.197.125.5])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542238135basm3363234e87.130.2024.12.31.01.44.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2024 01:44:18 -0800 (PST)
From: Maxin John <maxin.john@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] formfactor: add support for qemuriscv64 and qemuriscv32
Date: Tue, 31 Dec 2024 11:44:18 +0200
Message-Id: <20241231094418.30840-1-maxin.john@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Dec 2024 09:44:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209183

Add machine config files for qemuriscv64 and qemuriscv32.

Fixes [YOCTO #15427].

Signed-off-by: Maxin John <maxin.john@gmail.com>
---
 .../formfactor/files/qemuriscv32/machconfig            | 10 ++++++++++
 .../formfactor/files/qemuriscv64/machconfig            | 10 ++++++++++
 2 files changed, 20 insertions(+)
 create mode 100755 meta/recipes-bsp/formfactor/files/qemuriscv32/machconfig
 create mode 100755 meta/recipes-bsp/formfactor/files/qemuriscv64/machconfig

diff --git a/meta/recipes-bsp/formfactor/files/qemuriscv32/machconfig b/meta/recipes-bsp/formfactor/files/qemuriscv32/machconfig
new file mode 100755
index 000000000000..2789b5fc2ad5
--- /dev/null
+++ b/meta/recipes-bsp/formfactor/files/qemuriscv32/machconfig
@@ -0,0 +1,10 @@
+HAVE_TOUCHSCREEN=1
+HAVE_KEYBOARD=1
+
+DISPLAY_CAN_ROTATE=0
+DISPLAY_ORIENTATION=0
+DISPLAY_WIDTH_PIXELS=640
+DISPLAY_HEIGHT_PIXELS=480
+DISPLAY_BPP=16
+DISPLAY_DPI=150
+DISPLAY_SUBPIXEL_ORDER=vrgb
diff --git a/meta/recipes-bsp/formfactor/files/qemuriscv64/machconfig b/meta/recipes-bsp/formfactor/files/qemuriscv64/machconfig
new file mode 100755
index 000000000000..2789b5fc2ad5
--- /dev/null
+++ b/meta/recipes-bsp/formfactor/files/qemuriscv64/machconfig
@@ -0,0 +1,10 @@
+HAVE_TOUCHSCREEN=1
+HAVE_KEYBOARD=1
+
+DISPLAY_CAN_ROTATE=0
+DISPLAY_ORIENTATION=0
+DISPLAY_WIDTH_PIXELS=640
+DISPLAY_HEIGHT_PIXELS=480
+DISPLAY_BPP=16
+DISPLAY_DPI=150
+DISPLAY_SUBPIXEL_ORDER=vrgb
-- 
2.39.5


