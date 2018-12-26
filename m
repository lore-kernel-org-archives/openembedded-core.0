Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
	[209.85.214.181])
	by mail.openembedded.org (Postfix) with ESMTP id 3AF9A6BB13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Dec 2018 20:10:21 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id u6so7875504plm.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Dec 2018 12:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=B/bPFq5xgOVwpyIjUtlnx/AJcTwmf38ipwqWaAKGeE8=;
	b=Pm4rrkbXZxhW8F5LlokmnfhstV6/58RZgCM3ZTXISSzrBmIMvvvzq+WQYSb6MzrpJU
	gkjOPkUpZsLE4lWt2bwP8HARWa3cRZaTuBfquVXQlPgSANQKtFBDBPGeddrd0119mvg3
	oGBupzKtqcqORhlfwTlY0Vrq6naxjlNKXYLIB8hOpb1OMJ1HR3wvPBX7J/K5WZ2lkRG8
	tMtu679TUeLt6pdGdsftCYoVloI8UwcGZ/9hjocvTKg9Z2jW7S/7alzW0wrGL8Wv2pPx
	2uDa60f0uNv0ztxUImOSVOijfoYrnxQie8goFufi2wPT2Ub5sj43NhFFT2FHB4Fqc9PS
	R+/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=B/bPFq5xgOVwpyIjUtlnx/AJcTwmf38ipwqWaAKGeE8=;
	b=TZs0QrWJbCCWy5wPf8/kfmxIZ4GNIIFq01unfFsaEKNW+hWP6liw5e2f+RH3S+ZgtU
	TVK/rJez1QHRPGe7dELs0G9FWmKFeh1mJ1OZIHsBh42cBVxSuDzy8Aaj4j7+MQmRXSSQ
	rG/x+uwuRCpjb4Cas1XkSsf3j4VSVJvRd+j8yGb1yrYPvdPKsGCmpA000ZgK8NCdJSip
	nj01E14G7lHvMUDySRmL/nrRB1YgXgioMkrUvMfHEsliELnYX9CjEvYmzQ9Fol5cJuRa
	Sv9yNCPp9Sh+E1uNNCfWPgQQYP+qOAPWzy3Gi3Wy1BjKD5yJHx3QrdH1Nmc2UIz6I4aN
	Zisw==
X-Gm-Message-State: AJcUukeIxzurJXVJVNo4gA9sMM7JlsCzglDF57ycgf+AUx6dnecaacP4
	3MLq1rWktHwSvlAFB7MbOsXPBPsyvDA=
X-Google-Smtp-Source: ALg8bN5ZuGxFIFDdh7LNSNQyT8OXPfPySbjCI1YpwH+VajYHXw7UEWwppv3bwU3G5tpBtl3jeBd0Hg==
X-Received: by 2002:a17:902:48:: with SMTP id 66mr20485490pla.68.1545855021569;
	Wed, 26 Dec 2018 12:10:21 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:877f:9499::6e98])
	by smtp.gmail.com with ESMTPSA id
	l3sm60029493pga.92.2018.12.26.12.10.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Dec 2018 12:10:20 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Dec 2018 12:09:45 -0800
Message-Id: <20181226200954.5267-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 01/10] grub2: Fix passing null to printf formats
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
X-List-Received-Date: Wed, 26 Dec 2018 20:10:21 -0000
Content-Transfer-Encoding: 8bit

Backport a patch that helps with this error which is found
by gcc9

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...001-grub-setup-Debug-message-cleanup.patch | 34 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0001-grub-setup-Debug-message-cleanup.patch

diff --git a/meta/recipes-bsp/grub/files/0001-grub-setup-Debug-message-cleanup.patch b/meta/recipes-bsp/grub/files/0001-grub-setup-Debug-message-cleanup.patch
new file mode 100644
index 0000000000..e01fcdffb0
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0001-grub-setup-Debug-message-cleanup.patch
@@ -0,0 +1,34 @@
+From 4e9d9358e0cda6d01020005eb6343e3b69f7201a Mon Sep 17 00:00:00 2001
+From: Cao jin <caoj.fnst@cn.fujitsu.com>
+Date: Tue, 3 Jul 2018 18:51:13 +0800
+Subject: [PATCH] grub-setup: Debug message cleanup
+
+Variable "root" is initialized after root device probing and is null in
+current place, so, drop it.
+
+Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+---
+Upstream-Status: Backport [http://git.savannah.gnu.org/cgit/grub.git/commit/?id=4e9d9358e0cda6d01020005eb6343e3b69f7201a]
+
+ util/setup.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/util/setup.c b/util/setup.c
+index 80363075d..9c1e1b7da 100644
+--- a/util/setup.c
++++ b/util/setup.c
+@@ -305,9 +305,8 @@ SETUP (const char *dir,
+   bl.first_block = (struct grub_boot_blocklist *) (core_img
+ 						   + GRUB_DISK_SECTOR_SIZE
+ 						   - sizeof (*bl.block));
+-  grub_util_info ("root is `%s', dest is `%s'", root, dest);
+ 
+-  grub_util_info ("Opening dest");
++  grub_util_info ("Opening dest `%s'", dest);
+   dest_dev = grub_device_open (dest);
+   if (! dest_dev)
+     grub_util_error ("%s", grub_errmsg);
+-- 
+2.17.2 (Apple Git-113)
+
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 325eca25bb..8e0f86217c 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -20,6 +20,7 @@ SRC_URI = "https://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
            file://fix.build.with.gcc-7.patch \
            file://gcc8.patch \
            file://0001-x86-64-Treat-R_X86_64_PLT32-as-R_X86_64_PC32.patch \
+           file://0001-grub-setup-Debug-message-cleanup.patch \
 "
 SRC_URI[md5sum] = "1116d1f60c840e6dbd67abbc99acb45d"
 SRC_URI[sha256sum] = "660ee136fbcee08858516ed4de2ad87068bfe1b6b8b37896ce3529ff054a726d"
-- 
2.20.1


