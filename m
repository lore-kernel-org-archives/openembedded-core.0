Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id E2AAA789CE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Mar 2018 18:25:19 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Mar 2018 10:25:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,441,1515484800"; d="scan'208";a="24053960"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga006.jf.intel.com with ESMTP; 08 Mar 2018 10:25:20 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Mar 2018 20:17:47 +0200
Message-Id: <20180308181804.31261-25-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180308181804.31261-1-alexander.kanavin@linux.intel.com>
References: <20180308181804.31261-1-alexander.kanavin@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 25/42] mdadm: refresh patches
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
X-List-Received-Date: Thu, 08 Mar 2018 18:25:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@intel.com>

The patch tool will apply patches by default with "fuzz", which is where if the
hunk context isn't present but what is there is close enough, it will force the
patch in.

Whilst this is useful when there's just whitespace changes, when applied to
source it is possible for a patch applied with fuzz to produce broken code which
still compiles (see #10450).  This is obviously bad.

We'd like to eventually have do_patch() rejecting any fuzz on these grounds. For
that to be realistic the existing patches with fuzz need to be rebased and
reviewed.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-extended/mdadm/files/gcc-4.9.patch              | 12 ++++++------
 .../mdadm/files/mdadm-3.3.2_x32_abi_time_t.patch             | 12 ++++++------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-extended/mdadm/files/gcc-4.9.patch b/meta/recipes-extended/mdadm/files/gcc-4.9.patch
index 54bf1d79ab7..df21399deb2 100644
--- a/meta/recipes-extended/mdadm/files/gcc-4.9.patch
+++ b/meta/recipes-extended/mdadm/files/gcc-4.9.patch
@@ -7,13 +7,13 @@ make: *** [super-intel.o] Error 1
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Upstream-Status: Pending
 
-Index: mdadm-3.3/super-intel.c
+Index: mdadm-4.0/super-intel.c
 ===================================================================
---- mdadm-3.3.orig/super-intel.c	2014-05-02 15:08:21.154319651 -0700
-+++ mdadm-3.3/super-intel.c	2014-05-02 15:09:31.470985794 -0700
-@@ -5060,7 +5060,7 @@
- 	spare->cache_size = mpb->cache_size,
- 	spare->pwr_cycle_count = __cpu_to_le32(1),
+--- mdadm-4.0.orig/super-intel.c
++++ mdadm-4.0/super-intel.c
+@@ -5725,7 +5725,7 @@ static int write_super_imsm_spares(struc
+ 	spare->cache_size = mpb->cache_size;
+ 	spare->pwr_cycle_count = __cpu_to_le32(1);
  
 -	snprintf((char *) spare->sig, MAX_SIGNATURE_LENGTH,
 +	(void)snprintf((char *) spare->sig, MAX_SIGNATURE_LENGTH,
diff --git a/meta/recipes-extended/mdadm/files/mdadm-3.3.2_x32_abi_time_t.patch b/meta/recipes-extended/mdadm/files/mdadm-3.3.2_x32_abi_time_t.patch
index c656d073e37..00e6657e091 100644
--- a/meta/recipes-extended/mdadm/files/mdadm-3.3.2_x32_abi_time_t.patch
+++ b/meta/recipes-extended/mdadm/files/mdadm-3.3.2_x32_abi_time_t.patch
@@ -5,13 +5,13 @@ Upstream-Status: Pending
 
 Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
 
-Index: mdadm-3.3.4/monitor.c
+Index: mdadm-4.0/monitor.c
 ===================================================================
---- mdadm-3.3.4.orig/monitor.c
-+++ mdadm-3.3.4/monitor.c
-@@ -257,9 +257,12 @@ static int read_and_act(struct active_ar
- 			mdi->curr_state = read_dev_state(mdi->state_fd);
- 		}
+--- mdadm-4.0.orig/monitor.c
++++ mdadm-4.0/monitor.c
+@@ -445,9 +445,12 @@ static int read_and_act(struct active_ar
+ 		if (FD_ISSET(mdi->bb_fd, fds))
+ 			check_for_cleared_bb(a, mdi);
  	}
 -
  	gettimeofday(&tv, NULL);
-- 
2.16.1


