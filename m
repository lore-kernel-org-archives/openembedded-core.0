Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id C5B56731F4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 17:36:27 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id gh9so4054633pac.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 10:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=X09O1iuH+uXU3Rg6G7FAOTgaleageQ7vLUJEzYZ+g2g=;
	b=UQLUgH1Vy+zRxo9aEQRZKve/munPcCtrAABDfMxNFQTI7aRVC5S+kYRObyv9jQkjTP
	ZkuBdiCLVaJFmeiranHnD/OuB0Souou043g6TaLLzRh+wqfMp1o3XoT9EAdf3cYMjQBu
	R4ofbwMXNmaB1HC1tIqG/KNZXqgPiPQKxTgHZLWusjwuI1i/5SW/MF/9IX4uje4fx7rP
	dOPV3zNmnpH1KI/QflSaB0EBA9CkcFktYQ0NiRsPlTrjoujSU4oLNPKlm9ubbZNDkRJG
	ZFtCd/wvWYlhD1yYnnes8FOIMTMuMF+PsMS1LIgId/NHavtYGGhbe6JQExRwUrtc3cck
	DfSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=X09O1iuH+uXU3Rg6G7FAOTgaleageQ7vLUJEzYZ+g2g=;
	b=BsKjfSyEa5qRL6T4PLJ4EtfhFSJwRQIM6G8bud0hwy4rJ9/pTs5YJ59EhUYZu8sq5c
	p7oYRhVD84gTO5Q6NRK7SB1pQGCtgAHDbRlwRllAas+YvuiXF+ymom3tB9ZfWUYPXbdW
	PXJWFOl9lXWEfjEjhywNWez3d+nEuQMfUvDKvC8NWae5OD5sbdQfNAJa/khA9jCh7OId
	fRnLMMxxNe6BlP/3meP0ygl4FZ37RWbLMtHh1TPompoIV0+XO6+OIvdcFiO9/MBRv8xB
	H7jwBMFBBQ1tMzR7CjEyf1iipMcHuRJM1x/j0ls4Bv3LbZNw1MF59hCrp1cypk/1YhDq
	GGag==
X-Gm-Message-State: AOPr4FV6BThMj7GX+Bph/zpBygzXBZ8JCN9g8/h24X3kO/h6oVGC0uJiE+bLllwQx+Uyvg==
X-Received: by 10.66.148.42 with SMTP id tp10mr6783630pab.159.1462988188835;
	Wed, 11 May 2016 10:36:28 -0700 (PDT)
Received: from haswell.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a5sm13669903pat.19.2016.05.11.10.36.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 May 2016 10:36:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 May 2016 10:35:41 -0700
Message-Id: <ef4e4bd0b035f4ec7bdcfcd9bf1af2f3170264f7.1462987863.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
References: <2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
In-Reply-To: <cover.1462987863.git.raj.khem@gmail.com>
References: <cover.1462987863.git.raj.khem@gmail.com>
Subject: [PATCH 38/42] mdadm: Fix build with clang
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
X-List-Received-Date: Wed, 11 May 2016 17:36:28 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...dadm.h-Undefine-dprintf-before-redefining.patch | 43 ++++++++++++++++++++++
 meta/recipes-extended/mdadm/mdadm_3.4.bb           |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-extended/mdadm/files/0001-mdadm.h-Undefine-dprintf-before-redefining.patch

diff --git a/meta/recipes-extended/mdadm/files/0001-mdadm.h-Undefine-dprintf-before-redefining.patch b/meta/recipes-extended/mdadm/files/0001-mdadm.h-Undefine-dprintf-before-redefining.patch
new file mode 100644
index 0000000..4cf8092
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/0001-mdadm.h-Undefine-dprintf-before-redefining.patch
@@ -0,0 +1,43 @@
+From 6d369e8f226594632ce4260129509daf7030de0a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 9 May 2016 22:03:57 +0000
+Subject: [PATCH] mdadm.h: Undefine dprintf before redefining
+
+dprintf is also defined in libc see
+usr/include/bits/stdio2.h, this comes into
+play especially when fortify sources is enabled
+and compilers like clang reports the override
+
+In file included from policy.c:25:
+./mdadm.h:1562:9: error: 'dprintf' macro redefined [-Werror,-Wmacro-redefined]
+        ^
+/mnt/oe/openembedded-core/build/tmp-glibc/sysroots/qemux86/usr/include/bits/stdio2.h:145:12: note: previous definition is here
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ mdadm.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/mdadm.h b/mdadm.h
+index 230e60f..8c8f4d1 100755
+--- a/mdadm.h
++++ b/mdadm.h
+@@ -1554,11 +1554,13 @@ static inline char *to_subarray(struct mdstat_ent *ent, char *container)
+ }
+ 
+ #ifdef DEBUG
++#undef dprintf
+ #define dprintf(fmt, arg...) \
+ 	fprintf(stderr, "%s: %s: "fmt, Name, __func__, ##arg)
+ #define dprintf_cont(fmt, arg...) \
+ 	fprintf(stderr, fmt, ##arg)
+ #else
++#undef dprintf
+ #define dprintf(fmt, arg...) \
+         ({ if (0) fprintf(stderr, "%s: %s: " fmt, Name, __func__, ##arg); 0; })
+ #define dprintf_cont(fmt, arg...) \
+-- 
+1.9.1
+
diff --git a/meta/recipes-extended/mdadm/mdadm_3.4.bb b/meta/recipes-extended/mdadm/mdadm_3.4.bb
index 0e55de4..513a3ce 100644
--- a/meta/recipes-extended/mdadm/mdadm_3.4.bb
+++ b/meta/recipes-extended/mdadm/mdadm_3.4.bb
@@ -20,6 +20,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
            file://0001-Fix-the-path-of-corosync-and-dlm-header-files-check.patch \
            file://run-ptest \
            file://0001-raid6check-Fix-if-else-indentation.patch \
+           file://0001-mdadm.h-Undefine-dprintf-before-redefining.patch \
            "
 SRC_URI[md5sum] = "04b8b21f637540350f8517c7e68d3c63"
 SRC_URI[sha256sum] = "27d0be4627d38a12ddcd1c1c3721d649d4e89e1093914497e22b57245cda8808"
-- 
2.8.2


