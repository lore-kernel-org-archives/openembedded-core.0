Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web09.47689.1622484972662492909
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 May 2021 11:16:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EMwximJb;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id k7so2106835pjf.5
        for <openembedded-core@lists.openembedded.org>; Mon, 31 May 2021 11:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lAbOt/l9WAVK13TXscyIOqRPF7LulW9aZ1/CW60JdjY=;
        b=EMwximJbYemHmqBdlFYvmZQIMIkde1hsxeh9nGCLGmJadKrdKb2hM+R03fg/iu37QX
         /Kmv7MSr4CUHH31qZWTcK8EEh+yKE5YTSg1DeyXhUODmZ955SfdFnk+e/MBESzvy7H1y
         qw5wCfJw19klXALKDq25loOWWVLsUjJSeUWOtwvClr0ATXK84OQA6PBP3XqxK6SmWGbY
         aDCSsGveB3tkNb5JX8EDaKSFx8P4gU3iUfh4+s59sh4x3LPp03d7MKRmycInX9MD1+i6
         C4cpR01J+qIekvGxZaT7QCFMSLtSkmTx2hti8Rs/4r/GcsIJLc+OE7YXc/FNo6FSw5HL
         tbJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lAbOt/l9WAVK13TXscyIOqRPF7LulW9aZ1/CW60JdjY=;
        b=X7+tiMK5/XI5HqEqtvmTAO5J1dlNYgQ2Do4hMdhYyfmyOkSo4+MsSDGb45SyGfzFCF
         8dZiMAw0O0GtueAbZrQxbH1jDp3uuu9mw72dLf03iCMuZdPeabn1rIT2yZ9unDW1YU1z
         jSN4NaDDsnxv2/bbG0uJYb8Q7JAL4fG1KN4z3Aw3giBaYO2vdIMUvI7kRCh/c5PUW1zg
         vMzthHFw9717k46WmTVaVGZnxg7Ubi3dXjcFUofHaF/oHEymZfrZOr2uzUayYa0RxrY8
         GBZHAdAT61KuyKZETiQNxHYYd4Ec8azfsFlPAGNZoZV3nfhRyKMFzVA+F0aTws9OqzG1
         Phvw==
X-Gm-Message-State: AOAM5313w+JYHGQZbKU3TvI75Mx472PY3L5sYwgF1x/HtfSuV8b/3UgY
	6apXHif3AnJhOPalYXKXcAXDnM8uZwq+HA==
X-Google-Smtp-Source: ABdhPJxC58zFlO3i89wVcRPbmLzkYO++TnIJnph4VMf9wiY/PJMVchNcYV+uW9cpYumt6X9hCmjFOA==
X-Received: by 2002:a17:902:7401:b029:102:34f7:48f5 with SMTP id g1-20020a1709027401b029010234f748f5mr12064217pll.47.1622484971732;
        Mon, 31 May 2021 11:16:11 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from kona.dnls.ca.comcast.net (c-67-181-203-136.hsd1.ca.comcast.net. [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id 4sm103876pji.14.2021.05.31.11.16.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 11:16:11 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [v2][PATCH 1/3] kernel-features: add new class
Date: Mon, 31 May 2021 18:16:07 +0000
Message-Id: <20210531181609.963494-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This provides a common place to define kernel fragments
that may be usefull to the larger community.

Signed-off-by: Armin Kuster <akuster808@gmail.com>

---
v2]
Rename class
Add warning
Add TPM
---
 meta/classes/kernel-features.bbclass | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta/classes/kernel-features.bbclass

diff --git a/meta/classes/kernel-features.bbclass b/meta/classes/kernel-features.bbclass
new file mode 100644
index 0000000000..5735edbd7d
--- /dev/null
+++ b/meta/classes/kernel-features.bbclass
@@ -0,0 +1,13 @@
+#
+# Class to place yocto-kernel-cache fragments
+# selections usfull to anyone
+#
+python __anonymous() {
+    if not (bb.data.inherits_class('kernel-yocto', d)):
+        bb.warn("kernel-features class being inherited without kernel-yocto")
+}
+
+KERNEL_FEATURES_append = " ${@bb.utils.contains("DISTRO_FEATURES", "apparmor", " features/apparmor/apparmor.scc", "" ,d)}"
+KERNEL_FEATURES_append = " ${@bb.utils.contains("DISTRO_FEATURES", "smack", " features/smack/smack.scc", "" ,d)}"
+KERNEL_FEATURES_append = " ${@bb.utils.contains("DISTRO_FEATURES", "dm-verity", " features/device-mapper/dm-verity.scc", "" ,d)}"
+KERNEL_FEATURES_append = " ${@bb.utils.contains_any("MACHINE_FEATURES", "tpm tpm2", " features/tpm/tpm.scc","", d)}"
-- 
2.25.1

