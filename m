Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id 2F03C6C138
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 05:11:58 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id a14so7241743plm.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 21:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=B/bPFq5xgOVwpyIjUtlnx/AJcTwmf38ipwqWaAKGeE8=;
	b=h9NZY8uDXXIDW3slW2tbIiZzcaJA2j3kksJ6QlWJgDvWSI+dFPDA+uDqgl7XNWbi9b
	eFLWwbMnHW+C3uflV1heugpFlh99ohX+hVMdmiyiyvYLZyhc5kzSEjvfYH4E/Fy7kWSa
	TQkNZq3RPw8/fzHo9yBEXLjHOs/Hxss0ol/7WQh6ekk+uAKvQl9ItV5B0FjtAPh1NZa7
	UPwRFSlIBb8ETBwg1jV620SyfpBeK0IComRl0rbm97LMr1X3oU3qDPwHnnIaeNlmbO3j
	x+qqSOKmSTAxsYag/iA9XS0BV5o3h+MaY9E0SEEC3FtyXyPkS0PEc+UTG6W3CDzS9Mjz
	btXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=B/bPFq5xgOVwpyIjUtlnx/AJcTwmf38ipwqWaAKGeE8=;
	b=LAiXhHEYcR1q4HeHktcfLw8apUApGWl1CEdCn8XgCzEshsxbKI1QyKMP9pN8KX/srw
	KRvKWgN7xTY8seUceyPSV2DiHyxdvTKqlFpDQgLoF7UCjjlGYhGqs0ovFCdplhSVR9Sz
	Gc/+SpUABJg1USTYuz9P8VzLROavUbNDMzQTjRkdbSC6k91R259/wylvvRp2wnaqNyaa
	nFbBSLLWPTqOoZYSTv4Cbb2GjnmambGmEm9WDXdNRgnm0Vr2PxRigPaIn7a6yPXV+PSe
	+khkPj/okSOjvd6FYRbSQALgn0uSWa3XVz3y/XHZ39tHfO2SgfYo7NXx4IsL6uBsPpK/
	iooQ==
X-Gm-Message-State: AA+aEWa2vHUJGBOKMVX22ZHfW992ibGQyBEqVHPevWfL3UJOy/Hidfq8
	prOkfU7DKq5myy7eFjFAG5G/KQIOP2I=
X-Google-Smtp-Source: AFSGD/W1CTh9JeSdXg0tVsOJbGrx8OWv6iwmx8s6ZRrkCkLGL2ygGJn0Pkd6x/LXnMpKhldrKQo+ig==
X-Received: by 2002:a17:902:20c8:: with SMTP id
	v8mr15447183plg.319.1545109918587; 
	Mon, 17 Dec 2018 21:11:58 -0800 (PST)
Received: from localhost.localdomain ([2601:646:877f:9499::19ec])
	by smtp.gmail.com with ESMTPSA id
	i193sm20421563pgc.22.2018.12.17.21.11.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Dec 2018 21:11:58 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Dec 2018 21:11:47 -0800
Message-Id: <20181218051149.33374-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/2] grub2: Fix passing null to printf formats
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
X-List-Received-Date: Tue, 18 Dec 2018 05:11:58 -0000
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


