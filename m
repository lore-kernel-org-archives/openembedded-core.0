Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B5FFC6FD1F
	for <webhook@archiver.kernel.org>; Wed, 22 Mar 2023 14:22:24 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.44327.1679494940879761247
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Mar 2023 07:22:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=L+KR0aKa;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id p3-20020a17090a74c300b0023f69bc7a68so14818882pjl.4
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 07:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679494940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pGaqHvI62+/H81FkGvl4+1Nqs0HhkDrDFZ8PnXvzly0=;
        b=L+KR0aKaWRiys6J5o/wS9e18ZqR6anIre/E0fGPqpMlWOOcHagWrNWZ3FGnS0+ThYs
         gR0ZJWVLYxWltHt9oucGSfk9fsGEcyjYWybGtZlVrAvRGEmVhC1/9Klk7oIDvWvlxFcu
         SvMXqyBmjRvmexTZ7EsNXzm7Wz/Pz2EHn11IvvQ3iH/cMrcWJMlAtIPg9jMXU8A9x9SY
         HJlPGvQ9MPrLbBSblzS5ORa6WxrymhPjBztY3WY7nVVU2BSDbTrDlupefBfDYWJEKgCM
         7OXMGchbqOe8bJxWcJQrmknIng/EXL0w/bjmF/R6xaquyGA6/NEopwhELABgsIHduDnJ
         MXEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679494940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pGaqHvI62+/H81FkGvl4+1Nqs0HhkDrDFZ8PnXvzly0=;
        b=QOVJvXJZChJuwwJCU/69E57aOVUb/xQZnD1cWclJAk1s8pJG3HsufxxU0tLmcrpT5g
         IISxgW1r/83q1V0Awlg6vLtnrF+9OkmLF28E1Gn0xkd0yNLM2tzFakrm5EchKdfTu7iS
         EFu+SeFdBE5yK37O/NGzTf+7iW6QeRVJtLh7Wb723ItztFv5uyp5N8YC1oeuBDBfvS88
         DOJcMfzbOme+BlT4hHjN8jNDxQdH8uJEIR425afrW1N37zioeARUcGEBOPDieqmq+Foa
         kRemHAI0N+AhMTNtm0VeeWMCn4lA5mcT17/G7OM9OxA37bK/tYUKDhvMOpiWxA4GwvS9
         vksg==
X-Gm-Message-State: AO0yUKU5a/yxAsfIl98fubretwGRRHDDjhRofQ2VFeYdMKIPPLjf9Yut
	c+b3p0C354AnYLfSTWQKWWPNzejvFrIaQpG5eqc=
X-Google-Smtp-Source: AK7set+4NAayxh9XsOOqniVT7AUL6K9LUO1xMuMRid+DHM4sIx0oPyb7JOW+fTfhHzy9FXn1Z78znQ==
X-Received: by 2002:a05:6a20:2a24:b0:d9:ec4b:82c8 with SMTP id e36-20020a056a202a2400b000d9ec4b82c8mr5406390pzh.48.1679494939755;
        Wed, 22 Mar 2023 07:22:19 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id e25-20020a62aa19000000b00627ed3e9c10sm6893524pff.137.2023.03.22.07.22.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 07:22:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 18/21] mdadm: Fix raid0 tests
Date: Wed, 22 Mar 2023 04:21:37 -1000
Message-Id: <4bacfa12a832e3b4d0b1b0ee0ad64ed8b830b339.1679494378.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679494378.git.steve@sakoman.com>
References: <cover.1679494378.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 14:22:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178943

From: Mingli Yu <mingli.yu@windriver.com>

Backport patches to fix raid0 tests:
  tests/00raid0
  tests/00readonly
  tests/03r0assem
  tests/04r0update
  tests/04update-metadata

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit a5c38968e1a188f7d186c42c38ee49fb749f2b97)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...d-a-test-that-validates-raid0-with-l.patch |  41 +++++++
 ...-Run-udevadm-settle-before-setting-r.patch |  39 +++++++
 ...metadata-avoid-passing-chunk-size-to.patch |  41 +++++++
 ...ts-fix-raid0-tests-for-0.90-metadata.patch | 102 ++++++++++++++++++
 meta/recipes-extended/mdadm/mdadm_4.2.bb      |   4 +
 5 files changed, 227 insertions(+)
 create mode 100644 meta/recipes-extended/mdadm/files/0001-tests-00raid0-add-a-test-that-validates-raid0-with-l.patch
 create mode 100644 meta/recipes-extended/mdadm/files/0001-tests-00readonly-Run-udevadm-settle-before-setting-r.patch
 create mode 100644 meta/recipes-extended/mdadm/files/0001-tests-04update-metadata-avoid-passing-chunk-size-to.patch
 create mode 100644 meta/recipes-extended/mdadm/files/0001-tests-fix-raid0-tests-for-0.90-metadata.patch

diff --git a/meta/recipes-extended/mdadm/files/0001-tests-00raid0-add-a-test-that-validates-raid0-with-l.patch b/meta/recipes-extended/mdadm/files/0001-tests-00raid0-add-a-test-that-validates-raid0-with-l.patch
new file mode 100644
index 0000000000..1c95834a7e
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/0001-tests-00raid0-add-a-test-that-validates-raid0-with-l.patch
@@ -0,0 +1,41 @@
+From 7539254342bc591717b0051734cc6c09c1b88640 Mon Sep 17 00:00:00 2001
+From: Sudhakar Panneerselvam <sudhakar.panneerselvam@oracle.com>
+Date: Wed, 22 Jun 2022 14:25:13 -0600
+Subject: [PATCH] tests/00raid0: add a test that validates raid0 with layout
+ fails for 0.9
+
+329dfc28debb disallows the creation of raid0 with layouts for 0.9
+metadata. This test confirms the new behavior.
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?id=7539254342bc591717b0051734cc6c09c1b88640]
+
+Signed-off-by: Sudhakar Panneerselvam <sudhakar.panneerselvam@oracle.com>
+Signed-off-by: Himanshu Madhani <himanshu.madhani@oracle.com>
+Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
+Signed-off-by: Jes Sorensen <jes@trained-monkey.org>
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ tests/00raid0 | 6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/tests/00raid0 b/tests/00raid0
+index 8bc18985..e6b21cc4 100644
+--- a/tests/00raid0
++++ b/tests/00raid0
+@@ -6,11 +6,9 @@ check raid0
+ testdev $md0 3 $mdsize2_l 512
+ mdadm -S $md0
+ 
+-# now with version-0.90 superblock
++# verify raid0 with layouts fail for 0.90
+ mdadm -CR $md0 -e0.90 -l0 -n4 $dev0 $dev1 $dev2 $dev3
+-check raid0
+-testdev $md0 4 $mdsize0 512
+-mdadm -S $md0
++check opposite_result
+ 
+ # now with no superblock
+ mdadm -B $md0 -l0 -n5 $dev0 $dev1 $dev2 $dev3 $dev4
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/mdadm/files/0001-tests-00readonly-Run-udevadm-settle-before-setting-r.patch b/meta/recipes-extended/mdadm/files/0001-tests-00readonly-Run-udevadm-settle-before-setting-r.patch
new file mode 100644
index 0000000000..c621c082e8
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/0001-tests-00readonly-Run-udevadm-settle-before-setting-r.patch
@@ -0,0 +1,39 @@
+From 39b381252c32275079344d30de18b76fda4bba26 Mon Sep 17 00:00:00 2001
+From: Logan Gunthorpe <logang@deltatee.com>
+Date: Wed, 27 Jul 2022 15:52:45 -0600
+Subject: [PATCH] tests/00readonly: Run udevadm settle before setting ro
+
+In some recent kernel versions, 00readonly fails with:
+
+  mdadm: failed to set readonly for /dev/md0: Device or resource busy
+  ERROR: array is not read-only!
+
+This was traced down to a race condition with udev holding a reference
+to the block device at the same time as trying to set it read only.
+
+To fix this, call udevadm settle before setting the array read only.
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?id=39b381252c32275079344d30de18b76fda4bba26]
+
+Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
+Signed-off-by: Jes Sorensen <jsorensen@fb.com>
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ tests/00readonly | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tests/00readonly b/tests/00readonly
+index 39202487..afe243b3 100644
+--- a/tests/00readonly
++++ b/tests/00readonly
+@@ -12,6 +12,7 @@ do
+ 			$dev1 $dev2 $dev3 $dev4 --assume-clean
+ 		check nosync
+ 		check $level
++		udevadm settle
+ 		mdadm -ro $md0
+ 		check readonly
+ 		state=$(cat /sys/block/md0/md/array_state)
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/mdadm/files/0001-tests-04update-metadata-avoid-passing-chunk-size-to.patch b/meta/recipes-extended/mdadm/files/0001-tests-04update-metadata-avoid-passing-chunk-size-to.patch
new file mode 100644
index 0000000000..9098fb2540
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/0001-tests-04update-metadata-avoid-passing-chunk-size-to.patch
@@ -0,0 +1,41 @@
+From de045db607b1ac4b70fc2a8878463e029c2ab1dc Mon Sep 17 00:00:00 2001
+From: Sudhakar Panneerselvam <sudhakar.panneerselvam@oracle.com>
+Date: Wed, 22 Jun 2022 14:25:15 -0600
+Subject: [PATCH] tests/04update-metadata: avoid passing chunk size to raid1
+
+'04update-metadata' test fails with error, "specifying chunk size is
+forbidden for this level" added by commit, 5b30a34aa4b5e. Hence,
+correcting the test to ignore passing chunk size to raid1.
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?id=de045db607b1ac4b70fc2a8878463e029c2ab1dc]
+
+Signed-off-by: Sudhakar Panneerselvam <sudhakar.panneerselvam@oracle.com>
+Signed-off-by: Himanshu Madhani <himanshu.madhani@oracle.com>
+[logang@deltatee.com: fix if/then style and dropped unrelated hunk]
+Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
+Signed-off-by: Jes Sorensen <jes@trained-monkey.org>
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ tests/04update-metadata | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/tests/04update-metadata b/tests/04update-metadata
+index 08c14af7..2b72a303 100644
+--- a/tests/04update-metadata
++++ b/tests/04update-metadata
+@@ -11,7 +11,11 @@ dlist="$dev0 $dev1 $dev2 $dev3"
+ for ls in linear/4 raid1/1 raid5/3 raid6/2
+ do
+   s=${ls#*/} l=${ls%/*}
+-  mdadm -CR --assume-clean -e 0.90 $md0 --level $l -n 4 -c 64 $dlist
++  if [[ $l == 'raid1' ]]; then
++	mdadm -CR --assume-clean -e 0.90 $md0 --level $l -n 4 $dlist
++  else
++	mdadm -CR --assume-clean -e 0.90 $md0 --level $l -n 4 -c 64 $dlist
++  fi
+   testdev $md0 $s 19904 64
+   mdadm -S $md0
+   mdadm -A $md0 --update=metadata $dlist
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/mdadm/files/0001-tests-fix-raid0-tests-for-0.90-metadata.patch b/meta/recipes-extended/mdadm/files/0001-tests-fix-raid0-tests-for-0.90-metadata.patch
new file mode 100644
index 0000000000..d2e7d8ee50
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/0001-tests-fix-raid0-tests-for-0.90-metadata.patch
@@ -0,0 +1,102 @@
+From 14c2161edb77d7294199e8aa7daa9f9d1d0ad5d7 Mon Sep 17 00:00:00 2001
+From: Sudhakar Panneerselvam <sudhakar.panneerselvam@oracle.com>
+Date: Wed, 22 Jun 2022 14:25:14 -0600
+Subject: [PATCH] tests: fix raid0 tests for 0.90 metadata
+
+Some of the test cases fail because raid0 creation fails with the error,
+"0.90 metadata does not support layouts for RAID0" added by commit,
+329dfc28debb. Fix some of the test cases by switching from raid0 to
+linear level for 0.9 metadata where possible.
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?id=14c2161edb77d7294199e8aa7daa9f9d1d0ad5d7]
+
+Signed-off-by: Sudhakar Panneerselvam <sudhakar.panneerselvam@oracle.com>
+Signed-off-by: Himanshu Madhani <himanshu.madhani@oracle.com>
+Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
+Signed-off-by: Jes Sorensen <jes@trained-monkey.org>
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ tests/00raid0           | 4 ++--
+ tests/00readonly        | 4 ++++
+ tests/03r0assem         | 6 +++---
+ tests/04r0update        | 4 ++--
+ tests/04update-metadata | 2 +-
+ 5 files changed, 12 insertions(+), 8 deletions(-)
+
+diff --git a/tests/00raid0 b/tests/00raid0
+index e6b21cc4..9b8896cb 100644
+--- a/tests/00raid0
++++ b/tests/00raid0
+@@ -20,8 +20,8 @@ mdadm -S $md0
+ # now same again with different chunk size
+ for chunk in 4 32 256
+ do
+-  mdadm -CR $md0 -e0.90 -l raid0 --chunk $chunk -n3 $dev0 $dev1 $dev2
+-  check raid0
++  mdadm -CR $md0 -e0.90 -l linear --chunk $chunk -n3 $dev0 $dev1 $dev2
++  check linear
+   testdev $md0 3 $mdsize0 $chunk
+   mdadm -S $md0
+ 
+diff --git a/tests/00readonly b/tests/00readonly
+index 28b0fa13..39202487 100644
+--- a/tests/00readonly
++++ b/tests/00readonly
+@@ -4,6 +4,10 @@ for metadata in 0.9 1.0 1.1 1.2
+ do
+ 	for level in linear raid0 raid1 raid4 raid5 raid6 raid10
+ 	do
++		if [[ $metadata == "0.9" && $level == "raid0" ]];
++		then
++			continue
++		fi
+ 		mdadm -CR $md0 -l $level -n 4 --metadata=$metadata \
+ 			$dev1 $dev2 $dev3 $dev4 --assume-clean
+ 		check nosync
+diff --git a/tests/03r0assem b/tests/03r0assem
+index 6744e322..44df0645 100644
+--- a/tests/03r0assem
++++ b/tests/03r0assem
+@@ -68,9 +68,9 @@ mdadm -S $md2
+ ### Now for version 0...
+ 
+ mdadm --zero-superblock $dev0 $dev1 $dev2
+-mdadm -CR $md2 -l0 --metadata=0.90 -n3 $dev0 $dev1 $dev2
+-check raid0
+-tst="testdev $md2 3 $mdsize0 512"
++mdadm -CR $md2 -llinear --metadata=0.90 -n3 $dev0 $dev1 $dev2
++check linear
++tst="testdev $md2 3 $mdsize0 1"
+ $tst
+ 
+ uuid=`mdadm -Db $md2 | sed 's/.*UUID=//'`
+diff --git a/tests/04r0update b/tests/04r0update
+index 73ee3b9f..b95efb06 100644
+--- a/tests/04r0update
++++ b/tests/04r0update
+@@ -1,7 +1,7 @@
+ 
+ # create a raid0, re-assemble with a different super-minor
+-mdadm -CR -e 0.90 $md0 -l0 -n3 $dev0 $dev1 $dev2
+-testdev $md0 3 $mdsize0 512
++mdadm -CR -e 0.90 $md0 -llinear -n3 $dev0 $dev1 $dev2
++testdev $md0 3 $mdsize0 1
+ minor1=`mdadm -E $dev0 | sed -n -e 's/.*Preferred Minor : //p'`
+ mdadm -S /dev/md0
+ 
+diff --git a/tests/04update-metadata b/tests/04update-metadata
+index 232fc1ff..08c14af7 100644
+--- a/tests/04update-metadata
++++ b/tests/04update-metadata
+@@ -8,7 +8,7 @@ set -xe
+ 
+ dlist="$dev0 $dev1 $dev2 $dev3"
+ 
+-for ls in raid0/4 linear/4 raid1/1 raid5/3 raid6/2
++for ls in linear/4 raid1/1 raid5/3 raid6/2
+ do
+   s=${ls#*/} l=${ls%/*}
+   mdadm -CR --assume-clean -e 0.90 $md0 --level $l -n 4 -c 64 $dlist
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/mdadm/mdadm_4.2.bb b/meta/recipes-extended/mdadm/mdadm_4.2.bb
index 120c7f582b..4aa3737562 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.2.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.2.bb
@@ -26,6 +26,10 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
            file://0001-Makefile-install-mdcheck.patch \
            file://0001-mdadm-Fix-optional-write-behind-parameter.patch \
            file://0001-tests-02lineargrow-clear-the-superblock-at-every-ite.patch \
+           file://0001-tests-00raid0-add-a-test-that-validates-raid0-with-l.patch \
+           file://0001-tests-fix-raid0-tests-for-0.90-metadata.patch \
+           file://0001-tests-00readonly-Run-udevadm-settle-before-setting-r.patch \
+           file://0001-tests-04update-metadata-avoid-passing-chunk-size-to.patch \
            "
 
 SRC_URI[sha256sum] = "461c215670864bb74a4d1a3620684aa2b2f8296dffa06743f26dda5557acf01d"
-- 
2.34.1


