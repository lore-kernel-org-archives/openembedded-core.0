Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com
	[209.85.218.50])
	by mail.openembedded.org (Postfix) with ESMTP id 28A7A794A3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 15:09:56 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id b15-v6so3684292oib.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 08:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=xx9Lyp2y1ZTQj6H+anpK7YfmrKhTBIT6K/5yqbnJebM=;
	b=hAs8no5RzO177DW5I8Ua1dw2vfoQlPTrfjYiK8e95CoN9TGHamTLCpUQbVfANa+0Cn
	u6ntASl8qczI2f6tL0EG5wM1o4Q6wOdR6WOT+KebFzcdLnrZ33FeaR1kowcX7V4yQFsg
	S1yC2GqjKJLVMNBgg9cN2IRSQwy1fB9xUmefqdbNJDIZCGarLxWmfYxNwfq0ANEMPJ46
	0k4eW0raNeKI0c9NsA6jcVHn1lpbvWJnVvyiqn/1/gNNB9pnQCMzXAaTjqWbG1dyf35R
	EXfFLOgDBpHiyvJa6WZ+Z1QPW0FWoONmISggUlkKgap1aNrs9NhKOg+sZgsoRZkHRLRP
	m1YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=xx9Lyp2y1ZTQj6H+anpK7YfmrKhTBIT6K/5yqbnJebM=;
	b=LPc/FX0k2vg2///K7ul5hquV2JUfeYTaWvWRmdPyaSyNDfeAp48unUrxU1+32q/JxC
	LbthLYTQLikkDdgn3mhftuPzRp/ubR5D6c1yZOp9/ETiEF1y0eYmLSn43YRtga2hyaWH
	lHOMn809WsiUlYNxhJ9s8M8jPUwKDs39ppz6mI66qSNw37GWzVW1EVwLKhuRlfk+Uyk6
	zIwRdiKgMAGn8iBryvRLkZoKaAyoC/yMRQkR9//irJ55M18G5pKmvJyY8YwxTKsM1+NP
	UlG9LbPEibQAxbj+F2BFRAu0F6ts3J3a/7ftmaR/TPz0xV0/Rkj3dwgykPHjCKyfSecL
	VRQQ==
X-Gm-Message-State: APzg51DG2v/LxXPAxCjpyWsvYKG8CjYCKMxFDV0WE9StnV7l5W5kzo3P
	eTPbGqbpxFzG3r0oLW4Vu0otOIrE8yU=
X-Google-Smtp-Source: ANB0VdbJTOiyFTN1uYSJ8W12yFGgDggAUFDLInF4fOy0kRE1EswutZrkDTm3bb8UaHd9Yv4QxYR6CQ==
X-Received: by 2002:aca:5489:: with SMTP id
	i131-v6mr4474733oib.340.1534950597890; 
	Wed, 22 Aug 2018 08:09:57 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.107.222])
	by smtp.gmail.com with ESMTPSA id
	i132-v6sm1024281oif.20.2018.08.22.08.09.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 08:09:57 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 20:38:43 +0530
Message-Id: <1534950532-23850-25-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534950532-23850-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534950532-23850-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [ROCKO][PATCH V3 25/34] qemu: CVE-2018-12617
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Aug 2018 15:09:57 -0000

qga: check bytes count read by guest-file-read

While reading file content via 'guest-file-read' command,
'qmp_guest_file_read' routine allocates buffer of count+1
bytes. It could overflow for large values of 'count'.
Add check to avoid it.

Affects qemu < v3.0.0

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 .../qemu/qemu/CVE-2018-12617.patch                 | 53 ++++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.10.0.bb          |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2018-12617.patch

diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2018-12617.patch b/meta/recipes-devtools/qemu/qemu/CVE-2018-12617.patch
new file mode 100644
index 0000000..c89f189
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2018-12617.patch
@@ -0,0 +1,53 @@
+From 141b197408ab398c4f474ac1a728ab316e921f2b Mon Sep 17 00:00:00 2001
+From: Prasad J Pandit <pjp@fedoraproject.org>
+Date: Wed, 13 Jun 2018 11:46:57 +0530
+Subject: [PATCH] qga: check bytes count read by guest-file-read
+
+While reading file content via 'guest-file-read' command,
+'qmp_guest_file_read' routine allocates buffer of count+1
+bytes. It could overflow for large values of 'count'.
+Add check to avoid it.
+
+Reported-by: Fakhri Zulkifli <mohdfakhrizulkifli@gmail.com>
+Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
+Cc: qemu-stable@nongnu.org
+Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
+
+CVE: CVE-2018-12617
+Upstream-Status: Backport [https://git.qemu.org/?p=qemu.git;a=commitdiff;h=141b197408ab398c4f474ac1a728ab316e921f2b]
+
+Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
+---
+ qga/commands-posix.c | 2 +-
+ qga/commands-win32.c | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/qga/commands-posix.c b/qga/commands-posix.c
+index 594d21ef3e..9284e71666 100644
+--- a/qga/commands-posix.c
++++ b/qga/commands-posix.c
+@@ -458,7 +458,7 @@ struct GuestFileRead *qmp_guest_file_read(int64_t handle, bool has_count,
+ 
+     if (!has_count) {
+         count = QGA_READ_COUNT_DEFAULT;
+-    } else if (count < 0) {
++    } else if (count < 0 || count >= UINT32_MAX) {
+         error_setg(errp, "value '%" PRId64 "' is invalid for argument count",
+                    count);
+         return NULL;
+diff --git a/qga/commands-win32.c b/qga/commands-win32.c
+index 70ee5379f6..73f31fa8c2 100644
+--- a/qga/commands-win32.c
++++ b/qga/commands-win32.c
+@@ -318,7 +318,7 @@ GuestFileRead *qmp_guest_file_read(int64_t handle, bool has_count,
+     }
+     if (!has_count) {
+         count = QGA_READ_COUNT_DEFAULT;
+-    } else if (count < 0) {
++    } else if (count < 0 || count >= UINT32_MAX) {
+         error_setg(errp, "value '%" PRId64
+                    "' is invalid for argument count", count);
+         return NULL;
+-- 
+2.13.3
+
diff --git a/meta/recipes-devtools/qemu/qemu_2.10.0.bb b/meta/recipes-devtools/qemu/qemu_2.10.0.bb
index 5b88154..57d5106 100644
--- a/meta/recipes-devtools/qemu/qemu_2.10.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.10.0.bb
@@ -34,6 +34,7 @@ SRC_URI = "http://wiki.qemu-project.org/download/${BP}.tar.bz2 \
            file://CVE-2017-15119.patch \
            file://CVE-2017-18043.patch \
            file://CVE-2018-7550.patch \
+           file://CVE-2018-12617.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+\..*)\.tar"
 
-- 
2.7.4


