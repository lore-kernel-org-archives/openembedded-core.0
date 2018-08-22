Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f52.google.com (mail-oi0-f52.google.com
	[209.85.218.52])
	by mail.openembedded.org (Postfix) with ESMTP id 2964379385
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 11:19:20 +0000 (UTC)
Received: by mail-oi0-f52.google.com with SMTP id r69-v6so1919007oie.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 04:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=xx9Lyp2y1ZTQj6H+anpK7YfmrKhTBIT6K/5yqbnJebM=;
	b=EQSdkYJitNOA2GdMmBdIubKtBpnB35+U9AakxEtldZozc1W2VJYRQu2OXr4rrsZzh/
	vZxWj/o4ycOf51k71/Big2z8hiJNKQYq95ih0e5OQb+LOBbgxGaFaixf2z79REBYinzK
	GwAMmt9AnEgfalAm5y2pbrdVDYpkQXpQ+A6LDo96zScWBIRC3obFUxkJ2BM22AmB+R2D
	Pks+uHr9SUGg1obxsK5tbjy+6053HPynctD5qutI47boo9WBqoTBV29MuFxeUtWyOjnE
	gErOz4+OM6Gaet/DQnsz2/xZcYGMdvGY3LPxXj/lHNP/46SjDU1Xfof7L79KnQ+2rFU2
	YGHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=xx9Lyp2y1ZTQj6H+anpK7YfmrKhTBIT6K/5yqbnJebM=;
	b=OhmShvuhG9iccHNJ0+yYn3viToeSLBmoLBSMQNu4akgtUgvOLHvk/dkPufwDkaj79J
	fvzhwiiknHcJoebydcXP5s1gO3UDg+2MWr2fBAI/pv3kUD+/kgCIMBqZKvNCb/ImCdBX
	O85AMuNC/zarLuJN0U2lSvk/KLSrMzegcHAlSxFsCBlZnnEbfomtm5J/NJw0qk9eerrx
	8TuyJSmSvKS3lDHEU/IPIFEw+0h6J7qdNAcOLsiRyNTcAF3BKnBzHSz03ZbxOYP3WjWE
	cqpLRg9raK7WqRR/KO5rHnhhx5+hzf2QZkzXjlXi8UdZnpdgq6dhrMlBL4wQP5n3RyEa
	IbUw==
X-Gm-Message-State: APzg51DBeWzGsSsflQDymNWBpVvcg66YRFRjoDgkZ+01mVoVtfZ4/DW9
	vIhOy5/Q9+is8efn35NuZkhJcYos5NE=
X-Google-Smtp-Source: ANB0VdYt57yJUTgXeHt4QZz0sxmn1XHnzo7ODnH9yUWqNXFUco7EM5vKjEK8/NpBxYPpHCQ+cZqPpw==
X-Received: by 2002:aca:ebd8:: with SMTP id
	j207-v6mr3594758oih.206.1534936761060; 
	Wed, 22 Aug 2018 04:19:21 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.107.222])
	by smtp.gmail.com with ESMTPSA id
	c9-v6sm862308oia.1.2018.08.22.04.19.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 04:19:20 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 16:48:03 +0530
Message-Id: <1534936692-11736-25-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534936692-11736-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534936692-11736-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [ROCKO][PATCH 25/34] qemu: CVE-2018-12617
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
X-List-Received-Date: Wed, 22 Aug 2018 11:19:20 -0000

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


