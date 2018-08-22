Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f47.google.com (mail-oi0-f47.google.com
	[209.85.218.47])
	by mail.openembedded.org (Postfix) with ESMTP id 7F6E879223
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 11:42:16 +0000 (UTC)
Received: by mail-oi0-f47.google.com with SMTP id 8-v6so2631333oip.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 04:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Ph6lourI0FggrTtzWFB89sTURSJwjn5zNNCBMHXSvqQ=;
	b=R5d7FDzFXgXt/jkuJiuyT5pkhIg+5kPHF5wJ5sDBJ54kS4NENhobE4Q1E/omlTiOLq
	HDu6AqPSdMu+sowos6G38SXjqnnVCwS322x1kFD59O2LVyJAvLUBv120gzt6YUJIV2vo
	dKRUZ5mw6TB6oXqioc+dIoGjc7nVaDBZauGgIBEuN9B04eAa+1UxCeZySqROUGxpwHOT
	bRpVrlM7jGCt2O/e/IGlNAKtSV/kKVgd9IWP1MQEVOcfSubNwIefafPrjH/Gmk3jSbxU
	v5+zmJiWRjsbP5ZHUVem9EapsZH9lY+v6cJOh0IR+AmEjIen+EvB+Uz096TCkCkxW++B
	OJ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Ph6lourI0FggrTtzWFB89sTURSJwjn5zNNCBMHXSvqQ=;
	b=Y8TAlLMTRWqVZHgo0Dg10UcZm3SI8UEqVBbEfy7xGE2Gke995pZpVOTE3jokG6gklw
	n1At0jXVhq56uC0S088cniTLZd1LiwYrXL+R2Lpo1ynImUX3YlpGwYkt9tt4vOoN7q3k
	1KByG6knOIyjv/8dfEmE39L/12cgWrV+7Z0i/6u66lWAQRq38fH0JvnQ6ttqR7TGMYB1
	9u0AbfnmeIzVzk7PC7lUErIh/Hcjiz+XxGL6yLOTvYf7emY6MGdHI3dKv0QdRsifukO8
	TKfZPkVdnfa2/M3YquDS5230HQkeL7PQGXWKuX/CdJu7oSa2R0Ky/lUGvN4/GjCLmlQe
	Dltw==
X-Gm-Message-State: APzg51D4T+2bchDzP5o4Gbbv58Fon8A9wzBGgpE+ncf49xCFNztoKd3T
	6itN99BwQXetUn6AN4Afizunu4HfDwA=
X-Google-Smtp-Source: ANB0VdZZgczFLDDT4dRhoiWmDenp1KJgM4DagaduHL49DGCOMJO9EJ8jD92nv+udgcQMdTpM7C9eCQ==
X-Received: by 2002:aca:bf88:: with SMTP id
	p130-v6mr3292217oif.344.1534938137305; 
	Wed, 22 Aug 2018 04:42:17 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.3.26])
	by smtp.gmail.com with ESMTPSA id
	f144-v6sm1323750oib.39.2018.08.22.04.42.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 04:42:16 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 17:11:47 +0530
Message-Id: <1534938113-12197-7-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534938113-12197-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534938113-12197-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [SUMO][PATCH V2] qemu: CVE-2018-12617
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
X-List-Received-Date: Wed, 22 Aug 2018 11:42:16 -0000

qga: check bytes count read by guest-file-read

While reading file content via 'guest-file-read' command,
'qmp_guest_file_read' routine allocates buffer of count+1
bytes. It could overflow for large values of 'count'.
Add check to avoid it.

Affects qemu < v3.0.0

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
v2:
  Corrected "From:" address

 .../qemu/qemu/CVE-2018-12617.patch                 | 53 ++++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.11.1.bb          |  1 +
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
diff --git a/meta/recipes-devtools/qemu/qemu_2.11.1.bb b/meta/recipes-devtools/qemu/qemu_2.11.1.bb
index db7ead7..a447dc7 100644
--- a/meta/recipes-devtools/qemu/qemu_2.11.1.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.11.1.bb
@@ -25,6 +25,7 @@ SRC_URI = "http://wiki.qemu-project.org/download/${BP}.tar.bz2 \
            file://0013-ps2-check-PS2Queue-pointers-in-post_load-routine.patch \
            file://0001-CVE-2018-11806-QEMU-slirp-heap-buffer-overflow.patch \
            file://CVE-2018-7550.patch \
+           file://CVE-2018-12617.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+\..*)\.tar"
 
-- 
2.7.4


