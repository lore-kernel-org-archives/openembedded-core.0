Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1422777A56
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Sep 2017 01:41:02 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id h4so2202372pfk.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Sep 2017 18:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+RWpiyV4oI7pVX3f2Gj3aUCx2NSLYQmWfshL5J3tifE=;
	b=gv09Q8WnwSHAFg1LAR0i1mCDzZwV5H2Pt3jABQbw9lEpPBBJZzeW8eMdnaru3E9Qcn
	wRD5zW03FWykBkJlK7SBhKpSdxm4D+R2MI63j8+HU7FAI8a6SYfhfNfXrNtTRZ4nHq4S
	IN37lvw4Nfr9EghfsBuJoQl1L6cLzbX5i/hgEGLAZq1GYP5XczGx18fG9H5zJKEZw0ts
	S/PbrV1LbZxjxl15FjAhTaH2XkHHdn1L3kTDsPi85VufarWm1nBbBlRvgxA7Ctcvf5xn
	gwtd+OJXeuL6g2wYA7/+lgdQ9RwLF/m0Qsc5t5Gw4vjRzFKxUq0mvxP3JvBmF9/BySYy
	eAWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=+RWpiyV4oI7pVX3f2Gj3aUCx2NSLYQmWfshL5J3tifE=;
	b=ugUXtfErss8egDqTQXCotKZaDMR72sbmYmb6PRhf9pZpEsbs7ZQryc2ISdkjCqFRkO
	U8FHyKupPA2bzZta96bx2ITxyw8VJUCPFwfQxz4JdcahLwuINN5l3fulR9EzLdTsl3wt
	55PGCRDYVSJPHy8Itl3T9c1xxBq5g2fsnslNe/F2eB8gIGoR9Jhy6zxLxzx5n25d5TFl
	VmHGPY3A6DHC+n2KFBV+IN3XWfXoZOSABoeSQ4d9bnmh9dGFWr7Vpx4AnlJCp2jsoms/
	XMGmGJN4Gd3XCXqJ+AyZyXS6ff/Om3GRknq03cUMtPYT0+BjLp/eAblPY8cSevb9Uhqr
	eLnw==
X-Gm-Message-State: AHPjjUhF+K1G2xyWAmNFMlRMAO+3TOxHZSUv2R/XE+cyla1Y3g4c556c
	5LhAgil+bmyzjCzh
X-Google-Smtp-Source: ADKCNb6zvU9LJZ6Q+Od3IEswVgfvuYK+2/tsj5Be35rub2nnU0fW7aFfNDS6qvuhrGOgMfK5vDiJXw==
X-Received: by 10.98.73.73 with SMTP id w70mr4890293pfa.335.1504921264195;
	Fri, 08 Sep 2017 18:41:04 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4001:9ea0:a4cc:2cce:3cd3:65])
	by smtp.gmail.com with ESMTPSA id
	j83sm5635571pfe.133.2017.09.08.18.41.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Sep 2017 18:41:03 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Fri,  8 Sep 2017 18:41:00 -0700
Message-Id: <1504921260-10735-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1504921260-10735-1-git-send-email-akuster808@gmail.com>
References: <1504921260-10735-1-git-send-email-akuster808@gmail.com>
Subject: [Morty][PATCH] neard: Fix parallel build issue
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
X-List-Received-Date: Sat, 09 Sep 2017 01:41:03 -0000

From: Jussi Kukkonen <jussi.kukkonen@intel.com>

This only started showing up now for some reason but it does seem like
a legitimate bug in Makefile.am.

(From OE-Core rev: f43290f6e302dbacf5581d1fe1c6c991dd387779)

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...0001-Add-header-dependency-to-nciattach.o.patch | 35 ++++++++++++++++++++++
 meta/recipes-connectivity/neard/neard_0.16.bb      |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-connectivity/neard/neard/0001-Add-header-dependency-to-nciattach.o.patch

diff --git a/meta/recipes-connectivity/neard/neard/0001-Add-header-dependency-to-nciattach.o.patch b/meta/recipes-connectivity/neard/neard/0001-Add-header-dependency-to-nciattach.o.patch
new file mode 100644
index 0000000..d8e8a5e
--- /dev/null
+++ b/meta/recipes-connectivity/neard/neard/0001-Add-header-dependency-to-nciattach.o.patch
@@ -0,0 +1,35 @@
+From affaa2021a54c30353e4e1fee09c13a4de2196be Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Fri, 17 Mar 2017 14:24:29 +0200
+Subject: [PATCH] Add header dependency to nciattach.o
+
+This can happen when compiling nciattach.o:
+
+| In file included from ../neard-0.16/tools/nciattach.c:47:0:
+| ../neard-0.16/src/near.h:30:27: fatal error: near/nfc_copy.h: No such
+file or directory
+|  #include <near/nfc_copy.h>
+
+Add the missing dependency to local headers.
+
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Upstream-Status: Submitted [mailinglist]
+---
+ Makefile.am | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Makefile.am b/Makefile.am
+index fa552ee..acef6ba 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -253,6 +253,7 @@ se/builtin.h: src/genbuiltin $(builtin_se_sources)
+ 
+ $(src_neard_OBJECTS) \
+ $(tools_nfctool_nfctool_OBJECTS) \
++$(tools_nciattach_OBJECTS) \
+ $(plugin_objects) \
+ $(se_seeld_OBJECTS) \
+ $(unit_test_ndef_parse_OBJECTS) \
+-- 
+2.11.0
+
diff --git a/meta/recipes-connectivity/neard/neard_0.16.bb b/meta/recipes-connectivity/neard/neard_0.16.bb
index 5433dc3..238b241 100644
--- a/meta/recipes-connectivity/neard/neard_0.16.bb
+++ b/meta/recipes-connectivity/neard/neard_0.16.bb
@@ -9,6 +9,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/network/nfc/${BP}.tar.xz \
            file://neard.in \
            file://Makefile.am-fix-parallel-issue.patch \
            file://Makefile.am-do-not-ship-version.h.patch \
+           file://0001-Add-header-dependency-to-nciattach.o.patch \
           "
 SRC_URI[md5sum] = "5c691fb7872856dc0d909c298bc8cb41"
 SRC_URI[sha256sum] = "eae3b11c541a988ec11ca94b7deab01080cd5b58cfef3ced6ceac9b6e6e65b36"
-- 
2.7.4


