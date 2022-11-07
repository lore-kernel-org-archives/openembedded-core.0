Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DDD6C4332F
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 05:31:49 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web12.264.1667799106666267851
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Nov 2022 21:31:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=h3Qbl1nE;
 spf=pass (domain: mvista.com, ip: 209.85.214.175, mailfrom: hprajapati@mvista.com)
Received: by mail-pl1-f175.google.com with SMTP id p21so10099378plr.7
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 21:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1F0XIZzmA4Z6JfXyAed3inPojl64hyyoU6aIjR13+O0=;
        b=h3Qbl1nEhE/4XR6Qyxmfm5dcf6dAtb/ObMpzNtKjgUxDRxzbjTSzkXzv0NwQgyS8BZ
         Z+8H4gYETKraHkOR1nDGqXICcSSGpVsW3Eq1ulylncyL5WvqEBe1JpzqCdZA0ByyJHGN
         aKbz5eiSDz9q0MFfmskLKxl+nwFHzbZ69BtEI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1F0XIZzmA4Z6JfXyAed3inPojl64hyyoU6aIjR13+O0=;
        b=yZwWuRemZ3eFPhK2K2SePIsqg2henhg+myJagS+mJII7KSN2YffGRk1s4/9bqJnLHg
         +BbFvZuvr3Ifdu/PSiDdehWsY/JrWPHKLuLPX6wSmrJG+hDfbvdDRzmUkmiXWEftRFfg
         KoTIzn4TLdKoEAHZgTetJnUyia9tQLC5+eed+iUgums/x4o2HQZukRfrS+gZninAqvnr
         x2n0UI0knrVU6jMJNN/MRDmY+vNE4q/fx2vNnEr1fWg5yFfs15+f4++hmG6HqAxM+gI/
         xqqAVon7o+s7BYSoUjGmioMTt6q6y8uYBlGXOyaHDG0n+k8HkowDxQJsn3i44UxdNKqu
         g99g==
X-Gm-Message-State: ACrzQf08+yJ3ydsp28Ibg1bdZKgQVvq4w0gI6y36o/droQ6OtIsxvniB
	99nNW6xSXYt8cG9O8U4djaL8SdC8719CDg==
X-Google-Smtp-Source: AMsMyM4qtXVtPW501f5SYyJ+5XSZTqLVOW+gzlZL4/19bKf4bOkCjwzGSZtMibJuNcn4urxezL1H0g==
X-Received: by 2002:a17:902:9a0a:b0:188:4f8b:abb8 with SMTP id v10-20020a1709029a0a00b001884f8babb8mr23691450plp.157.1667799105740;
        Sun, 06 Nov 2022 21:31:45 -0800 (PST)
Received: from MVIN00024 ([43.249.234.214])
        by smtp.gmail.com with ESMTPSA id u18-20020a170902e81200b00186fb8f931asm3999884plg.206.2022.11.06.21.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 21:31:45 -0800 (PST)
Received: by MVIN00024 (sSMTP sendmail emulation); Mon, 07 Nov 2022 11:01:40 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCH] bluez: CVE-2022-3563 Fix null pointer derefference
Date: Mon,  7 Nov 2022 11:01:38 +0530
Message-Id: <20221107053138.7177-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 05:31:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172823

Upstream-Status: Backport from https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=e3c92f1f786f0b55440bd908b55894d0c792cf0e

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
 .../bluez5/bluez5/CVE-2022-3563.patch         | 44 +++++++++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/CVE-2022-3563.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 07d36ab74b..a9989585f5 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -54,6 +54,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
            file://0001-test-gatt-Fix-hung-issue.patch \
            file://CVE-2022-3637.patch \
+           file://CVE-2022-3563.patch \
            "
 S = "${WORKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/CVE-2022-3563.patch b/meta/recipes-connectivity/bluez5/bluez5/CVE-2022-3563.patch
new file mode 100644
index 0000000000..e67e7093ec
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/CVE-2022-3563.patch
@@ -0,0 +1,44 @@
+From 5e22473411bbd673b588d9f3d9d130199be13b4b Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Fri, 4 Nov 2022 17:09:57 +0530
+Subject: [PATCH] CVE-2022-3563
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=e3c92f1f786f0b55440bd908b55894d0c792cf0e]
+CVE: CVE-2022-3563
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+
+mgmt-tester: Fix null dereference issue reported by scan-build
+This patch fixes the null dereference reported by the scan-build.
+
+tools/mgmt-tester.c:12025:28: warning: Access to field 'cap_len' results
+in a dereference of a null pointer (loaded from variable 'rp')
+[core.NullDereference]
+
+        if (sizeof(rp->cap_len) + rp->cap_len != length) {
+                                  ^~~~~~~~~~~
+---
+ tools/mgmt-tester.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/tools/mgmt-tester.c b/tools/mgmt-tester.c
+index e5319d1..b15ed5e 100644
+--- a/tools/mgmt-tester.c
++++ b/tools/mgmt-tester.c
+@@ -11960,12 +11960,14 @@ static void read_50_controller_cap_complete(uint8_t status, uint16_t length,
+ 		tester_warn("Failed to read advertising features: %s (0x%02x)",
+ 						mgmt_errstr(status), status);
+ 		tester_test_failed();
++		return;
+ 	}
+ 
+ 	if (sizeof(rp->cap_len) + rp->cap_len != length) {
+ 		tester_warn("Controller capabilities malformed, size %zu != %u",
+ 				sizeof(rp->cap_len) + rp->cap_len, length);
+ 		tester_test_failed();
++		return;
+ 	}
+ 
+ 	while (offset < rp->cap_len) {
+-- 
+2.25.1
+
-- 
2.25.1


