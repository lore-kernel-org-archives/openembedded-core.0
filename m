Return-Path: <andre.draszik@gmail.com>
Received: from mail-yb1-f196.google.com (mail-yb1-f196.google.com
	[209.85.219.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1DC677BFFB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 12:56:41 +0000 (UTC)
Received: by mail-yb1-f196.google.com with SMTP id j10so8553076ybj.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 04:56:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Zl7kaL4vuBOzcZI7Y60o6YbTr/KKLJilyQzZt8t/lUk=;
	b=PI6BgeekHN9GRr3Lcl+9isWHX2vuYNwPJ5mnE92qLwNCXhoANpv4WihN5oHbW0IOYE
	yDX47w5UL+ldAWqeWh07CtkCqYOG65EszPkRxzKZdED24CHZG6Rq408EpHKJneh6++Xs
	dChsEqceA5QVfBA5l92f3bRtogZl9Qstwz0oC0f68f04HBUFK2xuuqUrUsKfYJuQpr3Q
	ar29bRamtxAgupweCI+VOndd28GwOBivs5nN2M8YHbMHVxpmFGKYg7qLCy3M/gMUEpV7
	Rs+No5ox94g1Kh/tH5TJghThy17TNOgDSEGw5spGjWb59xa4bk2s1gkVOP2kcRCr1nGX
	HrQA==
X-Gm-Message-State: AJcUukdekBkbiJNlnF9RiNPXKOVJeI2p8IFwCavP5odlhSonDjT6plYX
	sVVOEubFpZJiBVfECQo1m5tWxB7M
X-Google-Smtp-Source: ALg8bN7UM7Vy3vvWl4/riIFhhPA+4ih3ojsq/I7QCBK/3zZvSh5IUxmTJ0CNRS9vCI4F0w3/yAV2jg==
X-Received: by 2002:a25:bc4b:: with SMTP id d11mr22368243ybk.389.1547470602847;
	Mon, 14 Jan 2019 04:56:42 -0800 (PST)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	h145sm115143ywc.72.2019.01.14.04.56.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Jan 2019 04:56:42 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Jan 2019 12:56:22 +0000
Message-Id: <20190114125632.4780-3-git@andred.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190114125632.4780-1-git@andred.net>
References: <20190114125632.4780-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH 02/12] util-linux: remove erroneous patch (qsort_r)
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
X-List-Received-Date: Mon, 14 Jan 2019 12:56:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

The patch in question is patching the code to use
qsort() instead of qsort_r(), without adopting the
compare function. This is a major issue, because
the compare function as written is evaluating /
accessing a third argument, which is not passed
with this OE patch, causing access to random
memory.

Given this patch was added so as to support (old)
linux (host) distros which might not provide
qsort_r(), according to the git history, and given
these days util-linux detects availability of
qsort_r() during configure phase, and given musl
builds (which doesn't provide qsort_r() either)
work without problem, the right solution is to
simply drop this invalid patch.

Do so.

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 .../util-linux/util-linux-native-qsort.patch  | 33 -------------------
 .../util-linux/util-linux_2.32.1.bb           |  6 ----
 2 files changed, 39 deletions(-)
 delete mode 100644 meta/recipes-core/util-linux/util-linux/util-linux-native-qsort.patch

diff --git a/meta/recipes-core/util-linux/util-linux/util-linux-native-qsort.patch b/meta/recipes-core/util-linux/util-linux/util-linux-native-qsort.patch
deleted file mode 100644
index 68bf22de8c..0000000000
--- a/meta/recipes-core/util-linux/util-linux/util-linux-native-qsort.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From f220d809be1baa654503bf6ff52f3630b0d7015c Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Wed, 26 Mar 2014 01:30:29 +0000
-Subject: [PATCH] sun.c: use qsort() to instead of qsort_r()
-
-qsort_r() was added to glibc in version 2.8, so there is no qsort_r() on
-the host like CentOS 5.x.
-
-Upstream-Status: Inappropriate [Other]
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- libfdisk/src/sun.c | 5 ++---
- 1 file changed, 2 insertions(+), 3 deletions(-)
-
-Index: util-linux-2.24.2/libfdisk/src/sun.c
-===================================================================
---- util-linux-2.24.2.orig/libfdisk/src/sun.c
-+++ util-linux-2.24.2/libfdisk/src/sun.c
-@@ -431,10 +431,9 @@ static int sun_verify_disklabel(struct f
-     }
-     verify_sun_starts = starts;
- 
--    qsort_r(array,ARRAY_SIZE(array),sizeof(array[0]),
--	  (int (*)(const void *,const void *,void *)) verify_sun_cmp,
--	  verify_sun_starts);
--
-+    qsort(array,ARRAY_SIZE(array),sizeof(array[0]),
-+         (int (*)(const void *,const void *)) verify_sun_cmp);
-+ 
-     if (array[0] == -1) {
- 	fdisk_info(cxt, _("No partitions defined."));
- 	return 0;
diff --git a/meta/recipes-core/util-linux/util-linux_2.32.1.bb b/meta/recipes-core/util-linux/util-linux_2.32.1.bb
index b0492afff3..0f860c221b 100644
--- a/meta/recipes-core/util-linux/util-linux_2.32.1.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.32.1.bb
@@ -1,14 +1,8 @@
 require util-linux.inc
 
-# To support older hosts, we need to patch and/or revert
-# some upstream changes.  Only do this for native packages.
-OLDHOST = ""
-OLDHOST_class-native = "file://util-linux-native-qsort.patch"
-
 SRC_URI += "file://configure-sbindir.patch \
             file://runuser.pamd \
             file://runuser-l.pamd \
-            ${OLDHOST} \
             file://ptest.patch \
             file://run-ptest \
             file://display_testname_for_subtest.patch \
-- 
2.20.1


