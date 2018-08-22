Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f45.google.com (mail-oi0-f45.google.com
	[209.85.218.45])
	by mail.openembedded.org (Postfix) with ESMTP id 31504793A5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 13:20:47 +0000 (UTC)
Received: by mail-oi0-f45.google.com with SMTP id p84-v6so3067807oic.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 06:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KmZTpF25gyjC1FbkwoBg1KNU9wqzcMCOZE+3/vibYmk=;
	b=nhaFsc+y/uxajcgPGy7vuSXNR9gLqblgs8vUXTdtxputUT5fzNZ/uHfj1nSY1+RF/e
	zmj2AdpsE0s5349N13k5LmWOsNQ8aUfWVFxeDLjnNdE30VFC8NEl/kFYXpvf6i1/rOqz
	4d9NGaNd9xf/Qd+UejoIv8qNm+xYnCuM2+5PIvVXx4K04B2j6LThHQ0Dfdj+d/8NHfAC
	UqR3uIAE8un+NBA1rCT8tK4Ze3CUhoQvQHYzIoPDKvxwMeRrNqqVE7oP623sSvvcE+Lg
	HQU2Z0EtLGg+d4rWUcYYVBFWJFyLDoOjutxoXHNIc9kmOPLeyHc9/bsTEwuzPniILQJA
	5hfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=KmZTpF25gyjC1FbkwoBg1KNU9wqzcMCOZE+3/vibYmk=;
	b=i4wpSgbooF81ziqi3IPuUznoj/9BFBOAtnaL28vbASkg/Xt6fUdtpFWe2FGiMT1TgH
	YPxFPcFZLnWuseZ01dBnEIqavFYbh1db2yEexEzVm6d3a+LY8j0DgWDH9mpMWfUI30m2
	8qnQV4m/hCtcmqd44sJaBbm51igxVy51fvKzu4Qfh/izI6cV/QvvNyhG79ej8Q6ggo0j
	5f78DPqv7KbpkSk+sNmzOWHKxT5wJ1dtvoPL3lNJGs2Go0wZkii/SH6mZ+RCeegNjkVg
	eUKz6NBlPITYMyz0P5dt+gANBp40Xi5IolowztDoLK6r/XevO+kslOp564hno1u/ZVZo
	f9Eg==
X-Gm-Message-State: APzg51AXzqU+VuIo2zuF9jQBgZ5vkQGCtyOyc2bW559GFJqihNxaloWg
	Q8urOwQrz0F8njHGaP83oIONra/CN+I=
X-Google-Smtp-Source: ANB0VdbZLZHfa0wu3Gge5W53bosrrJnbv3YS09OyzI/0NRrzg3iPC+TYOqbMkL1PQFT0QfxPngm/VQ==
X-Received: by 2002:aca:c5:: with SMTP id 188-v6mr3712751oia.128.1534944048062;
	Wed, 22 Aug 2018 06:20:48 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.3.26])
	by smtp.gmail.com with ESMTPSA id
	t141-v6sm2354715oif.18.2018.08.22.06.20.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 06:20:47 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 18:50:01 +0530
Message-Id: <1534944009-21362-11-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534944009-21362-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534944009-21362-1-git-send-email-jkrishnanjanappa@mvista.com>
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
X-List-Received-Date: Wed, 22 Aug 2018 13:20:47 -0000

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


