Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f42.google.com (mail-oi0-f42.google.com
	[209.85.218.42])
	by mail.openembedded.org (Postfix) with ESMTP id 85E5A7916D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 11:17:41 +0000 (UTC)
Received: by mail-oi0-f42.google.com with SMTP id z185-v6so2042298oia.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 04:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+rZWTr65lw/wBdtOju/srdlwXsUmKr/VOJkTY6TK+Hs=;
	b=DhucIpTzPyGtkbbca7oMLXvln/XkMe5tPJ7NR04SdudERfiwml4JXg/vRA6q95PWid
	yO65QY8nD4Zw3lig3RNSyRx4SKPSTk4lNXlXy5RIzDK5hZ/+zr22Kh3n9YEYNsxQXvIC
	mSqNZbGX41zNcdrZlX0xHFFOjoomXyKh5Ovj4JSvUJJKFmA+fBTTZoZtxotP0tukvRil
	8b3ugjaeCFwtVdbUxV1HzXgmfxa5RDtBOUxObyuHOpE7VqnGVGLT9PYeigFCtKRh/rdj
	rU6+6EXKh+jzJHBYw0FS3X94I0lS4cjkR1UA1m9c/19RzR7gXbwjBkOP7jVtxmLYviw2
	pY7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=+rZWTr65lw/wBdtOju/srdlwXsUmKr/VOJkTY6TK+Hs=;
	b=PIyb+DLqSF3aQ9WF2Mp+Lt7kpGr+tCqYH74PmytLnnWXaqt4ksWoEDduYpThp7YU0R
	XY0a/eHwCAbtA9k3rEilBRNXHYVODHvCDW/9TXHARYmZ86aM6Jo7WJi+O+1Spek2CWhX
	xF5Z94nLr1jFEgpXR7cbXjXiQ0ADujttMrRy3DWZqKSZ5sp0qqJWVilkPR05RA5HdKVB
	XP/1ztDlx9zooLcWDTIg5RcAvnA3026uItJWaP3ueADxu8aJnpdiNlqpSleHxivDZjAh
	oE4o0I2FwvsyYbSIkNgeNlrgkhCjNufqijwK81diLJsYz6srif3bitbx8a1fnsnGH/Kj
	PYFA==
X-Gm-Message-State: APzg51ABMAQsUw7dlLQIm4Fst/nIdbAoll4fWPalKzEibXyMsA5ZDMGu
	NpA90XxE89N/6QmmFMtEPUK9avgCcz8=
X-Google-Smtp-Source: ANB0VdZZl2qTa+KW2x+l5a48ZVzv4vU04ubBo9lH2kDcUStyMyFdVA61hguXN0sClR6vTyXDrrtghQ==
X-Received: by 2002:aca:3a57:: with SMTP id
	h84-v6mr3378347oia.336.1534936662483; 
	Wed, 22 Aug 2018 04:17:42 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.107.222])
	by smtp.gmail.com with ESMTPSA id
	v5-v6sm694446oix.36.2018.08.22.04.17.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 04:17:42 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 16:46:47 +0530
Message-Id: <1534936615-11658-11-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534936615-11658-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534936615-11658-1-git-send-email-jkrishnanjanappa@mvista.com>
Cc: Ferret on Shark <shark_admin@mvista.co>
Subject: [SUMO][PATCH 11/19] qemu: CVE-2018-12617
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
X-List-Received-Date: Wed, 22 Aug 2018 11:17:41 -0000

From: Ferret on Shark <shark_admin@mvista.co>

qga: check bytes count read by guest-file-read

While reading file content via 'guest-file-read' command,
'qmp_guest_file_read' routine allocates buffer of count+1
bytes. It could overflow for large values of 'count'.
Add check to avoid it.

Affects qemu < v3.0.0

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
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


