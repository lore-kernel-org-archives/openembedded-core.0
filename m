Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19AF9E63FF3
	for <webhook@archiver.kernel.org>; Sat,  4 Apr 2026 18:52:19 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8961.1775266161672874411
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2026 18:29:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pSFYsTUI;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: zizuzacker@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ab46931cf1so22838685ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2026 18:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775266161; x=1775870961; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U+PwjQG6Cxl4URYKzFV9YHZghn4vHQKoAI1RWdC4wr4=;
        b=pSFYsTUIk+bBhyU2C86tGFY2mf7EPbohjFlaKbG2UdAXQwEhHikzgYXykNN/sYYM75
         dO+B/l4qlkVJggnvz2JIC/l+v/eI77r+44iBAqgHGuOVlMSaoY5obkq4at/VeGzjFGUf
         uKadNZIUZOhvMaNJgdYeDalWoLMo0eH6toWexUUhnPTQyQKAg30A5FwEbQeZZ4jO9yuV
         466pG1e2NVp/571OhCSukcfiBB6fe9Ev/164hvmgPhMMMAMVgf06BcmrDkJ9WK83UCW5
         qIDyF1iS1+Y0CyIsqL4Q4hw9soW6t697Wonhk/Vd3drKHM5ppaw7aeMK2By1Vk0Q9mDH
         q+yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775266161; x=1775870961;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U+PwjQG6Cxl4URYKzFV9YHZghn4vHQKoAI1RWdC4wr4=;
        b=d68X95IExwKI8FcL3Bc2Z/DX+cM/3zM4pvpaVRexDVV+SSI/U0KR+f1fTU8jQiSlBQ
         yof40r4/cFAB0vc6Uz1aCjdoc8gKsLkFkzmPfPtHOlms6OICN0QOfexgL5BtsX9uyU/1
         Fs8np7K/lG810L/wmFhMvVKhZ2tJH+EzbLLSnQNlP+gnFU8XOzpBZ+o2Sf737So268dT
         lG8cuofKmyIxzfKfsUJ4/HIVgEwzAYi8PMxvhnIJYj/OfDQFJnH1Xu/JWsxCBYrANk4q
         ehrkYx51JqllXteZBv4go5ARqRqJXYHLVi8qgboQ/YTSLhitaBasKIQRVdgv5445fcjc
         sbWg==
X-Gm-Message-State: AOJu0YxAQv9xZZlCf8j5fk/IvbgnOWQtjnCUXNtRH5rJTHQGn2TYB3FL
	gdQ1ubw23R4M1iQcvcXyJ86nco8jw0NNLnbHbcem5cA8x9AFcvUoHnO05vioWA==
X-Gm-Gg: AeBDievMxApOC6FiMOQbA1a2z7s3kzonqVRPjYMhgyokrXQJQxVPJdEj6r49JHbiWZu
	x2GKf/oNSzt5kkhzs5heGrPOefia4e4AimQkHs4i/H5IaU4MUN8flDU7Tme5BKxcamoS1tlTBvV
	1UMHWaUliqAz9XVrkd4NhOLpLDSnTKP3PdXFyRa12Tt8S0mPIWPljGZ+Y6GT/WDZvZCXNyfu8ht
	qvL+DWAp6iomWdU2iKWj8L4MfHgGjc7nYynOm5PCmykhOJ7k46QrtVY7stYiJLTOAKWZKs6WO/x
	khGzvN/LHWvn/CoqahXNmYFK0fHznEYz5N1QwhF/qJkgpcUF1+8wtH+xpSPIQ3b1SO51A7a4GEh
	RyMvaCBwAbPpMZhtvg1vwwmd69pddZ9JGWtYT/K6pXWwNDQKcn9RoVXmGNjTxzS2YJRIZNYiMQG
	tOycnYqVp7Kp7UlxqJI6tKaByNlS5BmJMflcI=
X-Received: by 2002:a17:903:388b:b0:2ae:5ab4:f4c0 with SMTP id d9443c01a7336-2b28205a9d8mr46369695ad.13.1775266160835;
        Fri, 03 Apr 2026 18:29:20 -0700 (PDT)
Received: from localhost.localdomain ([42.112.63.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27497aeffsm69722105ad.43.2026.04.03.18.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 18:29:20 -0700 (PDT)
From: "Zk47T" <zizuzacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Zk47T <zizuzacker@gmail.com>
Subject: [PATCH] qemuarm/qemuarm64: add WKS_FILE for wic image creation
Date: Sat,  4 Apr 2026 08:28:59 +0700
Message-Id: <20260404012859.2463603-1-zizuzacker@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Apr 2026 18:52:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234619

Some of the oe-selftest test cases require generating a wic file, but
the qemuarm and qemuarm64 machines didn't have one defined, which
caused tests to fail when attempting to build WIC images.
This creates a default qemuarm.wks providing a single 5GB ext4 root
partition and assigns it via the WKS_FILE variable in both the
qemuarm.conf and qemuarm64.conf machine configurations.
[YOCTO #14963]

Signed-off-by: Zk47T <zizuzacker@gmail.com>
---
 meta/conf/machine/qemuarm.conf         | 2 ++
 meta/conf/machine/qemuarm64.conf       | 2 ++
 scripts/lib/wic/canned-wks/qemuarm.wks | 3 +++
 3 files changed, 7 insertions(+)
 create mode 100644 scripts/lib/wic/canned-wks/qemuarm.wks

diff --git a/meta/conf/machine/qemuarm.conf b/meta/conf/machine/qemuarm.conf
index 943ce7c16a..685483c545 100644
--- a/meta/conf/machine/qemuarm.conf
+++ b/meta/conf/machine/qemuarm.conf
@@ -29,3 +29,5 @@ QB_SERIAL_OPT = "-device virtio-serial-device -chardev null,id=virtcon -device v
 QB_TCPSERIAL_OPT = "-device virtio-serial-device -chardev socket,id=virtcon,port=@PORT@,host=127.0.0.1,nodelay=on -device virtconsole,chardev=virtcon"
 
 KMACHINE:qemuarm = "qemuarma15"
+
+WKS_FILE ?= "qemuarm.wks"
diff --git a/meta/conf/machine/qemuarm64.conf b/meta/conf/machine/qemuarm64.conf
index a096d964db..14b9f838e2 100644
--- a/meta/conf/machine/qemuarm64.conf
+++ b/meta/conf/machine/qemuarm64.conf
@@ -28,3 +28,5 @@ QB_ROOTFS_OPT = "-drive id=disk0,file=@ROOTFS@,if=none,format=raw -device virtio
 # Virtio serial console
 QB_SERIAL_OPT = "-device virtio-serial-pci -chardev null,id=virtcon -device virtconsole,chardev=virtcon"
 QB_TCPSERIAL_OPT = "-device virtio-serial-pci -chardev socket,id=virtcon,port=@PORT@,host=127.0.0.1,nodelay=on -device virtconsole,chardev=virtcon"
+
+WKS_FILE ?= "qemuarm.wks"
diff --git a/scripts/lib/wic/canned-wks/qemuarm.wks b/scripts/lib/wic/canned-wks/qemuarm.wks
new file mode 100644
index 0000000000..01d9fbf10b
--- /dev/null
+++ b/scripts/lib/wic/canned-wks/qemuarm.wks
@@ -0,0 +1,3 @@
+# short-description: Create qcow2 image for ARM QEMU machines
+
+part / --source rootfs --fstype=ext4 --label root --align 4096 --size 5G
-- 
2.34.1


