Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f170.google.com (mail-wr0-f170.google.com
	[209.85.128.170])
	by mail.openembedded.org (Postfix) with ESMTP id 8F4E5775FC
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 16:06:44 +0000 (UTC)
Received: by mail-wr0-f170.google.com with SMTP id u108so76738464wrb.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Mar 2017 08:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=DStL4SCRDotFods4ShPvVkFNOZGCS8L2P6THqSCxbWU=;
	b=ciTjO4fWzIPmU6VpACEI8U4NJkTDZpA+qRnO1ooOEFgRQwkGkKKr0S1LA9q839UFa8
	cVLOPI0Yy5tayA2lP+87JBQhCOmT+PR19VI/FfW1sfAEOQAVkr18xcPe6OJKJ3HAM3QH
	tq5OjywbYX1Chad5Szy/QyNKo4VkZ057c1zk4i57YVI00FgETTcNWv3xCEvMhPnHDgzH
	FFkuiUhv8Ys/KBeBH5Y6efI1sMdZCGfqx5kb1q5AOWNAmNYMQwB7ugdnZ4oFI2d8t1ba
	aVdO7KJD5dJfyu8HonrNTkZ8OZBePPPocBh6FTCxF8SlJzS8RzJnh2uV7exbEGNVxdlC
	9lgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=DStL4SCRDotFods4ShPvVkFNOZGCS8L2P6THqSCxbWU=;
	b=DAw+Y7cZTdfdl8hSS8wp2ATjp/FSgvVlRwVFRRiMQposzTXb+oUpLOJMQruZU7WyMU
	zyHdAL1eWqFW7h2nVK/ESPxAo1NLJBLnOvD6gFzbzNF83+EMPTw+I1+HIwywt2uJ3Dzb
	MZ2KUcBlonCxX9cO1ANCiOxrEWg15wPuJvRrUB7JHj2M0+kcLZ2esN2BKiG8DiLom2ix
	to7F6gRVnPJAYRaJ2/Pb/EWzFBKMzZgpgvdZNgO+EUo88t2ZncCVEfbs6UWDKEYTh6De
	THx0HgdmN74pZQwL9Z8mDT8YtkRK40+zYQUV6EiR7JRD7uSc9fpwqbmv2yT2aVwU2QyT
	RjWg==
X-Gm-Message-State: AMke39mHx3hjsBaZmwC/qzGVF9qq+K5ICtCGPIgTlNemfHfRDsZmRdObSJo0DB5XSu6+nM6h
X-Received: by 10.223.164.16 with SMTP id d16mr3220396wra.47.1488557204811;
	Fri, 03 Mar 2017 08:06:44 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	i203sm3579424wmf.12.2017.03.03.08.06.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 03 Mar 2017 08:06:43 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Mar 2017 16:06:40 +0000
Message-Id: <1488557200-14910-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] cryptodev: update to handle 4.10 kernel API
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
X-List-Received-Date: Fri, 03 Mar 2017 16:06:44 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-kernel/cryptodev/cryptodev.inc        |  3 +-
 .../cryptodev/files/kernel-4-10-changes.patch      | 57 ++++++++++++++++++++++
 2 files changed, 59 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/cryptodev/files/kernel-4-10-changes.patch

diff --git a/meta/recipes-kernel/cryptodev/cryptodev.inc b/meta/recipes-kernel/cryptodev/cryptodev.inc
index 6241238..24b3227 100644
--- a/meta/recipes-kernel/cryptodev/cryptodev.inc
+++ b/meta/recipes-kernel/cryptodev/cryptodev.inc
@@ -6,7 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SRC_URI = "http://download.gna.org/cryptodev-linux/cryptodev-linux-${PV}.tar.gz \
            file://06d6b560c6e45dc317dae47c74706fa43f4a31d8.patch \
            file://cb186f682679383e8b5806240927903730ce85d9.patch \
-           file://0001-Adjust-to-another-change-in-the-user-page-API.patch"
+           file://0001-Adjust-to-another-change-in-the-user-page-API.patch \
+           file://kernel-4-10-changes.patch"
 
 SRC_URI[md5sum] = "02644cc4cd02301e0b503a332eb2f0b5"
 SRC_URI[sha256sum] = "67fabde9fb67b286a96c4f45b594b0eccd0f761b495705c18f2ae9461b831376"
diff --git a/meta/recipes-kernel/cryptodev/files/kernel-4-10-changes.patch b/meta/recipes-kernel/cryptodev/files/kernel-4-10-changes.patch
new file mode 100644
index 0000000..93d608b
--- /dev/null
+++ b/meta/recipes-kernel/cryptodev/files/kernel-4-10-changes.patch
@@ -0,0 +1,57 @@
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 2b29be8ac41414ed19cb4f5d5626d9bd0d7b11a8 Mon Sep 17 00:00:00 2001
+From: Cristian Stoica <cristian.stoica@nxp.com>
+Date: Wed, 8 Feb 2017 12:11:04 +0200
+Subject: [PATCH] adjust to API changes in kernel >=4.10
+
+There are many changes related to get_user_pages and the code is rewritten
+for clarity.
+
+Signed-off-by: Cristian Stoica <cristian.stoica@nxp.com>
+---
+ zc.c | 28 +++++++++++++++++-----------
+ 1 file changed, 17 insertions(+), 11 deletions(-)
+
+diff --git a/zc.c b/zc.c
+index e766ee3..2f4ea99 100644
+--- a/zc.c
++++ b/zc.c
+@@ -59,19 +59,25 @@ int __get_userbuf(uint8_t __user *addr, uint32_t len, int write,
+ 	}
+ 
+ 	down_read(&mm->mmap_sem);
+-#if (LINUX_VERSION_CODE >= KERNEL_VERSION(4, 6, 0))
+-	ret = get_user_pages_remote(
++#if (LINUX_VERSION_CODE < KERNEL_VERSION(4, 6, 0))
++	ret = get_user_pages(task, mm,
++			(unsigned long)addr, pgcount, write, 0, pg, NULL);
+ #else
+-	ret = get_user_pages(
+-#endif
+-			task, mm,
+-			(unsigned long)addr, pgcount,
+-#if (LINUX_VERSION_CODE >= KERNEL_VERSION(4, 9, 0))
+-			write ? FOLL_WRITE : 0,
+-#else
+-			write, 0,
+-#endif
++#  if (LINUX_VERSION_CODE < KERNEL_VERSION(4, 9, 0))
++	ret = get_user_pages_remote(task, mm,
++			(unsigned long)addr, pgcount, write, 0, pg, NULL);
++#  else
++#    if (LINUX_VERSION_CODE < KERNEL_VERSION(4, 10, 0))
++	ret = get_user_pages_remote(task, mm,
++			(unsigned long)addr, pgcount, write ? FOLL_WRITE : 0,
+ 			pg, NULL);
++#    else
++	ret = get_user_pages_remote(task, mm,
++			(unsigned long)addr, pgcount, write ? FOLL_WRITE : 0,
++			pg, NULL, NULL);
++#    endif
++#  endif
++#endif
+ 	up_read(&mm->mmap_sem);
+ 	if (ret != pgcount)
+ 		return -EINVAL;
-- 
2.8.1


