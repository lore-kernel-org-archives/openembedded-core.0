Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id 3119176FD0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 23:08:10 +0000 (UTC)
Received: by qkfq186 with SMTP id q186so51225987qkf.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Sep 2015 16:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=GcnZcKCaXF3aL6ccsXghuZjzVW7pWfjBE/veWWkNCnU=;
	b=lcIwgH9lsADMRWb+mOfZG/s/dSIToKeb9XrYm1OCHS8FYnPiQJJaq2QdZpkJ1BDAit
	A2YGqoc9Z8noU3PJLoOWJvYiwGw5WnyJ1050bDzdV/iakxJua3ukUtlrw02CfHLGcK+e
	GZx7Njxxq3LKgN6AxxsosWnuTJtbkqvXRkmu/OPC853wnj3d9l4aszITVUE1T8ks34Jb
	8Z11u8D+aldPS3TBGe9RUwHvV+0DCB0uRb0/7BRkcw6URPQNEFd7IJsbjfzVxNPHfNU8
	kbC2Tu0PndKFnCrB1W1N+1GKnv9pr72I5fdKcA/8/cvLlqgyzfBUCabfY/XY3AqRbDCT
	xaeQ==
X-Received: by 10.55.214.70 with SMTP id t67mr38941373qki.61.1441753691089;
	Tue, 08 Sep 2015 16:08:11 -0700 (PDT)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	h66sm2784934qkh.28.2015.09.08.16.08.10
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Sep 2015 16:08:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Sep 2015 23:07:55 +0000
Message-Id: <73b288f8a68e60a03e28a0ba7751d8753968c1cd.1441753511.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <762ad7bc4268386c2a29ea6c23bc8094fd52d160.1441753511.git.raj.khem@gmail.com>
References: <762ad7bc4268386c2a29ea6c23bc8094fd52d160.1441753511.git.raj.khem@gmail.com>
In-Reply-To: <cover.1441753511.git.raj.khem@gmail.com>
References: <cover.1441753511.git.raj.khem@gmail.com>
Subject: [PATCH 15/16] mdadm: Fix bugs exposed by clang
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
X-List-Received-Date: Tue, 08 Sep 2015 23:08:11 -0000

clang points to coding errors which otherwise go unnoticed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../mdadm/files/0001-Fix-typo-in-comparision.patch | 86 ++++++++++++++++++++++
 meta/recipes-extended/mdadm/mdadm_3.3.4.bb         |  1 +
 2 files changed, 87 insertions(+)
 create mode 100644 meta/recipes-extended/mdadm/files/0001-Fix-typo-in-comparision.patch

diff --git a/meta/recipes-extended/mdadm/files/0001-Fix-typo-in-comparision.patch b/meta/recipes-extended/mdadm/files/0001-Fix-typo-in-comparision.patch
new file mode 100644
index 0000000..df70b1c
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/0001-Fix-typo-in-comparision.patch
@@ -0,0 +1,86 @@
+From 18d360d74271a066a849bc1fba4f10dbb23ed251 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 8 Sep 2015 08:17:42 +0000
+Subject: [PATCH] Fix typo in comparision
+
+error: comparison of array 'devnm' equal to a null pointer is always false
+
+User bitwise '&' operator as it is a mask
+
+Fixes
+error: use of logical '&&' with constant operand
+
+Remove extraneous parens
+
+error: equality comparison with extraneous parentheses
+
+Remove dead code
+
+restripe.c:465:21: error: explicitly assigning value of variable of type 'int' to itself
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ mdmon.h       | 2 +-
+ mdopen.c      | 2 +-
+ restripe.c    | 3 ---
+ super-intel.c | 2 +-
+ 4 files changed, 3 insertions(+), 6 deletions(-)
+
+diff --git a/mdmon.h b/mdmon.h
+index aa750c6..0b08c3d 100644
+--- a/mdmon.h
++++ b/mdmon.h
+@@ -101,7 +101,7 @@ static inline int is_resync_complete(struct mdinfo *array)
+ 		break;
+ 	case 10:
+ 		l = array->array.layout;
+-		ncopies = (l & 0xff) * ((l >> 8) && 0xff);
++		ncopies = (l & 0xff) * ((l >> 8) & 0xff);
+ 		sync_size = array->component_size * array->array.raid_disks;
+ 		sync_size /= ncopies;
+ 		break;
+diff --git a/mdopen.c b/mdopen.c
+index 28410f4..c5ee2a6 100644
+--- a/mdopen.c
++++ b/mdopen.c
+@@ -318,7 +318,7 @@ int create_mddev(char *dev, char *name, int autof, int trustworthy,
+ 	else if (num < 0) {
+ 		/* need to choose a free number. */
+ 		char *_devnm = find_free_devnm(use_mdp);
+-		if (devnm == NULL) {
++		if (_devnm == NULL) {
+ 			pr_err("No avail md devices - aborting\n");
+ 			return -1;
+ 		}
+diff --git a/restripe.c b/restripe.c
+index 4d92190..cfe9666 100644
+--- a/restripe.c
++++ b/restripe.c
+@@ -461,9 +461,6 @@ int raid6_check_disks(int data_disks, int start, int chunk_size,
+ 			curr_broken_disk = diskD;
+ 		}
+ 
+-		if((Px == 0) && (Qx == 0))
+-			curr_broken_disk = curr_broken_disk;
+-
+ 		if(curr_broken_disk >= data_disks + 2)
+ 			broken_status = 2;
+ 
+diff --git a/super-intel.c b/super-intel.c
+index 3f812d6..1838012 100644
+--- a/super-intel.c
++++ b/super-intel.c
+@@ -10027,7 +10027,7 @@ enum imsm_reshape_type imsm_analyze_change(struct supertype *st,
+ 				geo->size = max_size;
+ 		}
+ 
+-		if ((direction == ROLLBACK_METADATA_CHANGES)) {
++		if (direction == ROLLBACK_METADATA_CHANGES) {
+ 			/* accept size for rollback only
+ 			*/
+ 		} else {
+-- 
+2.5.1
+
diff --git a/meta/recipes-extended/mdadm/mdadm_3.3.4.bb b/meta/recipes-extended/mdadm/mdadm_3.3.4.bb
index 460a430..1198167 100644
--- a/meta/recipes-extended/mdadm/mdadm_3.3.4.bb
+++ b/meta/recipes-extended/mdadm/mdadm_3.3.4.bb
@@ -12,6 +12,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
            file://mdadm-3.2.2_fix_for_x32.patch \
            file://gcc-4.9.patch \
            file://mdadm-3.3.2_x32_abi_time_t.patch \
+           file://0001-Fix-typo-in-comparision.patch \
            file://run-ptest \
 	  "
 SRC_URI[md5sum] = "7ca8b114710f98f53f20c5787b674a09"
-- 
2.5.1


