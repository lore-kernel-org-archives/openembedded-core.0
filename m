Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f42.google.com (mail-pg0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id AB4AC74F87
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 May 2018 20:24:28 +0000 (UTC)
Received: by mail-pg0-f42.google.com with SMTP id z70-v6so2958544pgz.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 May 2018 13:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=NF3mWhAzBB2veH6p2wxBPJ11XKdiS2/WN3wPtiIxeJU=;
	b=d3VkS9QphIbbbm4EfcVIwxvr2koEqE66P7es4N9gwMujFpzgmuUV2YmrU7tuwGzC4W
	ummy8glgnr3TSIvrP6PlofQ8LnxbLsZm5livEpWe0Yxj+WSpLcrtRY+A/vXTxGZTksp5
	xEbsl0hfAJ+STeABBGocXfYtLfWa/L7lYRaJK56nI2e5u2nvIovLgt9eP8qqFyfvg3rC
	Xp5LBm8Dj1JBmJkUBNFjN0F0J6O1v9OHrkBPjVyY297eIqbGCg7Y2eUDbv1uO1Mc3CRg
	EzgSRgc968c4TVwEEFzgEoF83DmlUpz50kuo+EBZUU+pcCYmJUFOcQwKK4Y0fYq8Voxd
	03cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=NF3mWhAzBB2veH6p2wxBPJ11XKdiS2/WN3wPtiIxeJU=;
	b=I7kg7oDi/5BpWWKi3mByzACV62zHADdrkGbHdZQJD6UX81rafNgNuWsXbJVuBazK52
	0KNyx4+GBLRr+EhZ9sc9jm1umMC1nUXXYcWwGvT2gFxwwKoW0XlSUUpeUV+Vs5x1TscN
	lInnV7FxfGutRxCBv4xJRxKKAox6ISV9J38CznlaWOlDWci2j+h4Y2dDLrBBb2fWH8v7
	ecxkSmTl996ezOJydSnOlT4Tw6AHeDmAY6tpvSBGUz/zFLHGKPzpenfSSlF97j0LFPpZ
	0RYmchlTdRAjAgXaWq/dxjG1h5ymx3Is71xpWWHuF7Vjhnyp2x23vze0fCX96sr5No4G
	yd3Q==
X-Gm-Message-State: ALQs6tDQGyDqX94/cg8odiO01LF2y9hI5TG73xIEU1bEFX+q9IUlI+6e
	NMMiXCuuub46bnQarjMAKircYA==
X-Google-Smtp-Source: AB8JxZpptmBLDWGiv7ixqJzr5N2840sf4FFvXVHdG4TU5YnxVlMFi58ATYWpKDz8dkF6QM13Slskcw==
X-Received: by 2002:a63:2b46:: with SMTP id
	r67-v6mr36124036pgr.89.1525897469018; 
	Wed, 09 May 2018 13:24:29 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	x124sm2142222pfx.72.2018.05.09.13.24.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 May 2018 13:24:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 May 2018 13:24:17 -0700
Message-Id: <20180509202422.22501-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180509202422.22501-1-raj.khem@gmail.com>
References: <20180509202422.22501-1-raj.khem@gmail.com>
Subject: [PATCH V2 4/9] mdadm: Fix build with gcc8
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
X-List-Received-Date: Wed, 09 May 2018 20:24:28 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
Changes since v1:
- Fix build with gcc < 8 too

 .../files/0001-Disable-gcc8-warnings.patch    | 130 ++++++++++++++++++
 ...tead-of-memcpy-on-overlapping-region.patch |  31 +++++
 meta/recipes-extended/mdadm/mdadm_4.0.bb      |   2 +
 3 files changed, 163 insertions(+)
 create mode 100644 meta/recipes-extended/mdadm/files/0001-Disable-gcc8-warnings.patch
 create mode 100644 meta/recipes-extended/mdadm/files/0001-use-memmove-instead-of-memcpy-on-overlapping-region.patch

diff --git a/meta/recipes-extended/mdadm/files/0001-Disable-gcc8-warnings.patch b/meta/recipes-extended/mdadm/files/0001-Disable-gcc8-warnings.patch
new file mode 100644
index 0000000000..8cf52406c4
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/0001-Disable-gcc8-warnings.patch
@@ -0,0 +1,130 @@
+From b83218de2623c0bbe9af355a81ae8385d7f30cfc Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 9 May 2018 12:56:41 -0700
+Subject: [PATCH] Disable gcc8 warnings
+
+This is needed until
+https://bugzilla.redhat.com/show_bug.cgi?id=1553958
+
+Upstream-Status: Inappropriate [Workaround]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+---
+ Monitor.c     | 4 +++-
+ mdopen.c      | 4 ++++
+ super-ddf.c   | 4 ++++
+ super-intel.c | 6 ++++++
+ super1.c      | 5 +++++
+ 5 files changed, 22 insertions(+), 1 deletion(-)
+
+diff --git a/Monitor.c b/Monitor.c
+index 802a9d9..23b246b 100644
+--- a/Monitor.c
++++ b/Monitor.c
+@@ -441,7 +441,8 @@ static void alert(char *event, char *dev, char *disc, struct alert_info *info)
+ 			       event, dev);
+ 	}
+ }
+-
++#pragma GCC diagnostic push
++#pragma GCC diagnostic ignored "-Wformat-truncation"
+ static int check_array(struct state *st, struct mdstat_ent *mdstat,
+ 		       int test, struct alert_info *ainfo,
+ 		       int increments, char *prefer)
+@@ -683,6 +684,7 @@ static int check_array(struct state *st, struct mdstat_ent *mdstat,
+ 		return 1;
+ 	return 0;
+ }
++#pragma GCC diagnostic pop
+ 
+ static int add_new_arrays(struct mdstat_ent *mdstat, struct state **statelist,
+ 			  int test, struct alert_info *info)
+diff --git a/mdopen.c b/mdopen.c
+index 685ca32..406aba4 100644
+--- a/mdopen.c
++++ b/mdopen.c
+@@ -26,6 +26,9 @@
+ #include "md_p.h"
+ #include <ctype.h>
+ 
++#pragma GCC diagnostic push
++#pragma GCC diagnostic ignored "-Wformat-truncation"
++
+ void make_parts(char *dev, int cnt)
+ {
+ 	/* make 'cnt' partition devices for 'dev'
+@@ -99,6 +102,7 @@ void make_parts(char *dev, int cnt)
+ 	}
+ 	free(name);
+ }
++#pragma GCC diagnostic pop
+ 
+ /*
+  * We need a new md device to assemble/build/create an array.
+diff --git a/super-ddf.c b/super-ddf.c
+index 1707ad1..e08d289 100644
+--- a/super-ddf.c
++++ b/super-ddf.c
+@@ -2846,6 +2846,9 @@ static void _set_config_size(struct phys_disk_entry *pde, const struct dl *dl)
+ 		(unsigned long long)cfs, (unsigned long long)(dl->size-cfs));
+ }
+ 
++#pragma GCC diagnostic push
++#pragma GCC diagnostic ignored "-Wformat-overflow"
++
+ /* Add a device to a container, either while creating it or while
+  * expanding a pre-existing container
+  */
+@@ -2981,6 +2984,7 @@ static int add_to_super_ddf(struct supertype *st,
+ 
+ 	return 0;
+ }
++#pragma GCC diagnostic pop
+ 
+ static int remove_from_super_ddf(struct supertype *st, mdu_disk_info_t *dk)
+ {
+diff --git a/super-intel.c b/super-intel.c
+index 00a2925..44fbead 100644
+--- a/super-intel.c
++++ b/super-intel.c
+@@ -298,6 +298,11 @@ struct md_list {
+ };
+ 
+ #define pr_vrb(fmt, arg...) (void) (verbose && pr_err(fmt, ##arg))
++#pragma GCC diagnostic push
++# if __GNUC__ == 8
++# pragma GCC diagnostic ignored "-Wstringop-truncation"
++# endif
++#pragma GCC diagnostic ignored "-Wformat-truncation"
+ 
+ static __u8 migr_type(struct imsm_dev *dev)
+ {
+@@ -11618,3 +11623,4 @@ struct superswitch super_imsm = {
+ 	.get_bad_blocks   = imsm_get_badblocks,
+ #endif /* MDASSEMBLE */
+ };
++#pragma GCC diagnostic pop
+diff --git a/super1.c b/super1.c
+index 87a74cb..71c515f 100644
+--- a/super1.c
++++ b/super1.c
+@@ -1091,6 +1091,10 @@ static struct mdinfo *container_content1(struct supertype *st, char *subarray)
+ 	return info;
+ }
+ 
++#pragma GCC diagnostic push
++# if __GNUC__ == 8
++# pragma GCC diagnostic ignored "-Wstringop-truncation"
++#endif
+ static int update_super1(struct supertype *st, struct mdinfo *info,
+ 			 char *update,
+ 			 char *devname, int verbose,
+@@ -1473,6 +1477,7 @@ static int init_super1(struct supertype *st, mdu_array_info_t *info,
+ 
+ 	return 1;
+ }
++#pragma GCC diagnostic pop
+ 
+ struct devinfo {
+ 	int fd;
diff --git a/meta/recipes-extended/mdadm/files/0001-use-memmove-instead-of-memcpy-on-overlapping-region.patch b/meta/recipes-extended/mdadm/files/0001-use-memmove-instead-of-memcpy-on-overlapping-region.patch
new file mode 100644
index 0000000000..44351b6569
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/0001-use-memmove-instead-of-memcpy-on-overlapping-region.patch
@@ -0,0 +1,31 @@
+From ab18f04cf89ef4e8521c81c50477e1363b2d333b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 28 Apr 2018 09:46:12 -0700
+Subject: [PATCH] use memmove instead of memcpy on overlapping region
+
+Fixes
+super0.c:526:3: error: 'memcpy' accessing 3936 bytes at offsets 156 and 160 overlaps 3932 bytes at offset 160 [-Werror=restrict]
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ super0.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/super0.c b/super0.c
+index f5b4507..264b598 100644
+--- a/super0.c
++++ b/super0.c
+@@ -523,7 +523,7 @@ static int update_super0(struct supertype *st, struct mdinfo *info,
+ 		 * up 4 bytes before continuing
+ 		 */
+ 		__u32 *sb32 = (__u32*)sb;
+-		memcpy(sb32+MD_SB_GENERIC_CONSTANT_WORDS+7,
++		memmove(sb32+MD_SB_GENERIC_CONSTANT_WORDS+7,
+ 		       sb32+MD_SB_GENERIC_CONSTANT_WORDS+7+1,
+ 		       (MD_SB_WORDS - (MD_SB_GENERIC_CONSTANT_WORDS+7+1))*4);
+ 		if (verbose >= 0)
+-- 
+2.17.0
+
diff --git a/meta/recipes-extended/mdadm/mdadm_4.0.bb b/meta/recipes-extended/mdadm/mdadm_4.0.bb
index dc098f19b6..226b974352 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.0.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.0.bb
@@ -22,6 +22,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
            file://0004-mdadm-Forced-type-conversion-to-avoid-truncation.patch \
            file://0005-Add-a-comment-to-indicate-valid-fallthrough.patch \
            file://0001-Use-CC-to-check-for-implicit-fallthrough-warning-sup.patch \
+           file://0001-use-memmove-instead-of-memcpy-on-overlapping-region.patch \
+           file://0001-Disable-gcc8-warnings.patch \
            "
 SRC_URI[md5sum] = "2cb4feffea9167ba71b5f346a0c0a40d"
 SRC_URI[sha256sum] = "1d6ae7f24ced3a0fa7b5613b32f4a589bb4881e3946a5a2c3724056254ada3a9"
-- 
2.17.0


