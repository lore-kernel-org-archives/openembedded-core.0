Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 20261719AF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Apr 2017 02:32:04 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id r16so47737883ioi.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 19:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=EznMoNHX9dxhZaeR8Rk66mFAe+L7yt6vFcJFEpOxYO8=;
	b=gwkEU27mlkDis+eAVNjsLpq3ExRI3jYHgYIlosXpht8FV4JmAD4y5zwTT4oI5lsCpd
	FAf4Ait202AXqUvv+No+3oH4hmxQpQObQ6ZjCjzUJ7C5QU2AifLWP7lgvVjCiz7Hqmo6
	9L73RxaZAkkEtUuymhKfIinWoY3huScO9gkZCnIAkzBwslJxDtDDf3bZG/KtkvG117/o
	tUt8uVSq4oppIWQY/EAnhGVEcF1KiSey4LqM+T68ZlbAOSfdD77/msAol+gVL32wvaiS
	y9WItH8yqDyCHHdcrljbDhxTyc/0Z/cosqeEJd2BhKZVv5XycbJl+gS3ySSBnScGbJeE
	Amhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=EznMoNHX9dxhZaeR8Rk66mFAe+L7yt6vFcJFEpOxYO8=;
	b=L2dzDNHZsHg+cQlQSiIKHOKW9IWeZG9Xz0mDEZShJURpYjJD6LQj1yIWA07ltNYqJw
	G46SC1M34Cal/W9zBcoFDAo4l0DMGSCQU2QchS0fSYaSYjz8JiyXlygv5BbDGMqrwKMr
	CDOrUEpRCHRuZ1Uyd5RsiVtdBYIk5vhXg7BLIbcczPpM21eTvvMrdxLepSiMTx1j1KJ6
	iEdfhnL3myQg80E4KOFPmKO/IVr42lh/37mDXKT7CRERtK036GOsTML1HagrLzGdoluk
	DVtkeaglCkR50sahthHy0mhlmy4yeeFYlkl7cxaAx2nwjmeteXaLOT5wJsOTlubgMkhh
	oxlw==
X-Gm-Message-State: AN3rC/5YkQ/i4JzA1BZB5XaXayYalvPpeLd5PsQeGHz+JewBBZtYEYEY
	oquW54SDSvMmqg==
X-Received: by 10.98.11.13 with SMTP id t13mr5925172pfi.104.1492655525808;
	Wed, 19 Apr 2017 19:32:05 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	r73sm6790312pfa.65.2017.04.19.19.32.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Apr 2017 19:32:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Apr 2017 19:31:47 -0700
Message-Id: <20170420023147.1868-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170420023147.1868-1-raj.khem@gmail.com>
References: <20170420023147.1868-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] mdadm: Backport and make fixes for building with gcc7
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
X-List-Received-Date: Thu, 20 Apr 2017 02:32:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...m-Add-Wimplicit-fallthrough-0-in-Makefile.patch |  37 ++++++
 ...pecify-enough-length-when-write-to-buffer.patch |  75 ++++++++++++
 ...rintf-with-strncpy-at-some-places-to-avoi.patch |  59 ++++++++++
 ...orced-type-conversion-to-avoid-truncation.patch |  33 ++++++
 ...d-a-comment-to-indicate-valid-fallthrough.patch | 128 +++++++++++++++++++++
 meta/recipes-extended/mdadm/mdadm_4.0.bb           |   5 +
 6 files changed, 337 insertions(+)
 create mode 100644 meta/recipes-extended/mdadm/files/0001-mdadm-Add-Wimplicit-fallthrough-0-in-Makefile.patch
 create mode 100644 meta/recipes-extended/mdadm/files/0002-mdadm-Specify-enough-length-when-write-to-buffer.patch
 create mode 100644 meta/recipes-extended/mdadm/files/0003-Replace-snprintf-with-strncpy-at-some-places-to-avoi.patch
 create mode 100644 meta/recipes-extended/mdadm/files/0004-mdadm-Forced-type-conversion-to-avoid-truncation.patch
 create mode 100644 meta/recipes-extended/mdadm/files/0005-Add-a-comment-to-indicate-valid-fallthrough.patch

diff --git a/meta/recipes-extended/mdadm/files/0001-mdadm-Add-Wimplicit-fallthrough-0-in-Makefile.patch b/meta/recipes-extended/mdadm/files/0001-mdadm-Add-Wimplicit-fallthrough-0-in-Makefile.patch
new file mode 100644
index 00000000000..ce15170c758
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/0001-mdadm-Add-Wimplicit-fallthrough-0-in-Makefile.patch
@@ -0,0 +1,37 @@
+From aa09af0fe2ec0737fa04ffd00957532684e257b9 Mon Sep 17 00:00:00 2001
+From: Xiao Ni <xni@redhat.com>
+Date: Fri, 17 Mar 2017 19:55:42 +0800
+Subject: [PATCH 1/5] mdadm: Add Wimplicit-fallthrough=0 in Makefile
+
+There are many errors like 'error: this statement may fall through'.
+But the logic is right. So add the flag Wimplicit-fallthrough=0
+to disable the error messages. The method I use is from
+https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html
+#index-Wimplicit-fallthrough-375
+
+Signed-off-by: Xiao Ni <xni@redhat.com>
+Signed-off-by: Jes Sorensen <Jes.Sorensen@gmail.com>
+---
+Upstream-Status: Backport
+ Makefile | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/Makefile b/Makefile
+index 0f307ec..e1a7058 100644
+--- a/Makefile
++++ b/Makefile
+@@ -48,6 +48,11 @@ ifdef WARN_UNUSED
+ CWFLAGS += -Wp,-D_FORTIFY_SOURCE=2 -O3
+ endif
+ 
++FALLTHROUGH := $(shell gcc -v --help 2>&1 | grep "implicit-fallthrough" | wc -l)
++ifneq "$(FALLTHROUGH)"  "0"
++CWFLAGS += -Wimplicit-fallthrough=0
++endif
++
+ ifdef DEBIAN
+ CPPFLAGS += -DDEBIAN
+ endif
+-- 
+2.12.2
+
diff --git a/meta/recipes-extended/mdadm/files/0002-mdadm-Specify-enough-length-when-write-to-buffer.patch b/meta/recipes-extended/mdadm/files/0002-mdadm-Specify-enough-length-when-write-to-buffer.patch
new file mode 100644
index 00000000000..cbce053a3ae
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/0002-mdadm-Specify-enough-length-when-write-to-buffer.patch
@@ -0,0 +1,75 @@
+From bb4df273041ba206008bdb0ada75ccd97c29f623 Mon Sep 17 00:00:00 2001
+From: Xiao Ni <xni@redhat.com>
+Date: Fri, 17 Mar 2017 19:55:43 +0800
+Subject: [PATCH 2/5] mdadm: Specify enough length when write to buffer
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+In Detail.c the buffer path in function Detail is defined as path[200],
+in fact the max lenth of content which needs to write to the buffer is
+287. Because the length of dname of struct dirent is 255.
+During building it reports error:
+error: ‘%s’ directive writing up to 255 bytes into a region of size 189
+[-Werror=format-overflow=]
+
+In function examine_super0 there is a buffer nb with length 5.
+But it need to show a int type argument. The lenght of max
+number of int is 10. So the buffer length should be 11.
+
+In human_size function the length of buf is 30. During building
+there is a error:
+output between 20 and 47 bytes into a destination of size 30.
+Change the length to 47.
+
+Signed-off-by: Xiao Ni <xni@redhat.com>
+Signed-off-by: Jes Sorensen <Jes.Sorensen@gmail.com>
+---
+Upstream-Status: Backport
+ Detail.c | 2 +-
+ super0.c | 2 +-
+ util.c   | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/Detail.c b/Detail.c
+index 509b0d4..cb33794 100644
+--- a/Detail.c
++++ b/Detail.c
+@@ -575,7 +575,7 @@ This is pretty boring
+ 			printf("  Member Arrays :");
+ 
+ 			while (dir && (de = readdir(dir)) != NULL) {
+-				char path[200];
++				char path[287];
+ 				char vbuf[1024];
+ 				int nlen = strlen(sra->sys_name);
+ 				dev_t devid;
+diff --git a/super0.c b/super0.c
+index 938cfd9..f5b4507 100644
+--- a/super0.c
++++ b/super0.c
+@@ -231,7 +231,7 @@ static void examine_super0(struct supertype *st, char *homehost)
+ 	     d++) {
+ 		mdp_disk_t *dp;
+ 		char *dv;
+-		char nb[5];
++		char nb[11];
+ 		int wonly, failfast;
+ 		if (d>=0) dp = &sb->disks[d];
+ 		else dp = &sb->this_disk;
+diff --git a/util.c b/util.c
+index f100972..32bd909 100644
+--- a/util.c
++++ b/util.c
+@@ -811,7 +811,7 @@ unsigned long calc_csum(void *super, int bytes)
+ #ifndef MDASSEMBLE
+ char *human_size(long long bytes)
+ {
+-	static char buf[30];
++	static char buf[47];
+ 
+ 	/* We convert bytes to either centi-M{ega,ibi}bytes or
+ 	 * centi-G{igi,ibi}bytes, with appropriate rounding,
+-- 
+2.12.2
+
diff --git a/meta/recipes-extended/mdadm/files/0003-Replace-snprintf-with-strncpy-at-some-places-to-avoi.patch b/meta/recipes-extended/mdadm/files/0003-Replace-snprintf-with-strncpy-at-some-places-to-avoi.patch
new file mode 100644
index 00000000000..dcec84ffcd7
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/0003-Replace-snprintf-with-strncpy-at-some-places-to-avoi.patch
@@ -0,0 +1,59 @@
+From bc87af1314325b00c6ac002a60a2b0f0caa81e34 Mon Sep 17 00:00:00 2001
+From: Xiao Ni <xni@redhat.com>
+Date: Sat, 18 Mar 2017 10:33:44 +0800
+Subject: [PATCH 3/5] Replace snprintf with strncpy at some places to avoid
+ truncation
+
+In gcc7 there are some building errors like:
+directive output may be truncated writing up to 31 bytes into a region of size 24
+snprintf(str, MPB_SIG_LEN, %s, mpb->sig);
+
+It just need to copy one string to target. So use strncpy to replace it.
+
+For this line code: snprintf(str, MPB_SIG_LEN, %s, mpb->sig);
+Because mpb->sig has the content of version after magic, so
+it's better to use strncpy to replace snprintf too.
+
+Signed-off-by: Xiao Ni <xni@redhat.com>
+Signed-off-by: Jes Sorensen <Jes.Sorensen@gmail.com>
+---
+Upstream-Status: Backport
+ super-intel.c | 9 ++++++---
+ 1 file changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/super-intel.c b/super-intel.c
+index 57c7e75..5499098 100644
+--- a/super-intel.c
++++ b/super-intel.c
+@@ -1811,7 +1811,8 @@ static void examine_super_imsm(struct supertype *st, char *homehost)
+ 	__u32 reserved = imsm_reserved_sectors(super, super->disks);
+ 	struct dl *dl;
+ 
+-	snprintf(str, MPB_SIG_LEN, "%s", mpb->sig);
++	strncpy(str, (char *)mpb->sig, MPB_SIG_LEN);
++	str[MPB_SIG_LEN-1] = '\0';
+ 	printf("          Magic : %s\n", str);
+ 	snprintf(str, strlen(MPB_VERSION_RAID0), "%s", get_imsm_version(mpb));
+ 	printf("        Version : %s\n", get_imsm_version(mpb));
+@@ -7142,14 +7143,16 @@ static int update_subarray_imsm(struct supertype *st, char *subarray,
+ 
+ 			u->type = update_rename_array;
+ 			u->dev_idx = vol;
+-			snprintf((char *) u->name, MAX_RAID_SERIAL_LEN, "%s", name);
++			strncpy((char *) u->name, name, MAX_RAID_SERIAL_LEN);
++			u->name[MAX_RAID_SERIAL_LEN-1] = '\0';
+ 			append_metadata_update(st, u, sizeof(*u));
+ 		} else {
+ 			struct imsm_dev *dev;
+ 			int i;
+ 
+ 			dev = get_imsm_dev(super, vol);
+-			snprintf((char *) dev->volume, MAX_RAID_SERIAL_LEN, "%s", name);
++			strncpy((char *) dev->volume, name, MAX_RAID_SERIAL_LEN);
++			dev->volume[MAX_RAID_SERIAL_LEN-1] = '\0';
+ 			for (i = 0; i < mpb->num_raid_devs; i++) {
+ 				dev = get_imsm_dev(super, i);
+ 				handle_missing(super, dev);
+-- 
+2.12.2
+
diff --git a/meta/recipes-extended/mdadm/files/0004-mdadm-Forced-type-conversion-to-avoid-truncation.patch b/meta/recipes-extended/mdadm/files/0004-mdadm-Forced-type-conversion-to-avoid-truncation.patch
new file mode 100644
index 00000000000..94fde42e992
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/0004-mdadm-Forced-type-conversion-to-avoid-truncation.patch
@@ -0,0 +1,33 @@
+From 5da889032e2d99751ed9fe60016146e9ae8114cd Mon Sep 17 00:00:00 2001
+From: Xiao Ni <xni@redhat.com>
+Date: Sat, 18 Mar 2017 10:33:45 +0800
+Subject: [PATCH 4/5] mdadm: Forced type conversion to avoid truncation
+
+Gcc reports it needs 19 bytes to right to disk->serial. Because the
+type of argument i is int. But the meaning of i is failed disk
+number. So it doesn't need to use 19 bytes.  Just add a type
+conversion to avoid this building error
+
+Signed-off-by: Xiao Ni <xni@redhat.com>
+Signed-off-by: Jes Sorensen <Jes.Sorensen@gmail.com>
+---
+Upstream-Status: Backport
+ super-intel.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/super-intel.c b/super-intel.c
+index 5499098..4e466ff 100644
+--- a/super-intel.c
++++ b/super-intel.c
+@@ -5228,7 +5228,7 @@ static int init_super_imsm_volume(struct supertype *st, mdu_array_info_t *info,
+ 			disk->status = CONFIGURED_DISK | FAILED_DISK;
+ 			disk->scsi_id = __cpu_to_le32(~(__u32)0);
+ 			snprintf((char *) disk->serial, MAX_RAID_SERIAL_LEN,
+-				 "missing:%d", i);
++				 "missing:%d", (__u8)i);
+ 		}
+ 		find_missing(super);
+ 	} else {
+-- 
+2.12.2
+
diff --git a/meta/recipes-extended/mdadm/files/0005-Add-a-comment-to-indicate-valid-fallthrough.patch b/meta/recipes-extended/mdadm/files/0005-Add-a-comment-to-indicate-valid-fallthrough.patch
new file mode 100644
index 00000000000..3d9d3b90447
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/0005-Add-a-comment-to-indicate-valid-fallthrough.patch
@@ -0,0 +1,128 @@
+From 09014233bf10900f7bd8390b3b64ff82bca45222 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 19 Apr 2017 12:04:15 -0700
+Subject: [PATCH 5/5] Add a comment to indicate valid fallthrough
+
+gcc7 warns about code with fallthroughs, this patch adds
+the comment to indicate a valid fallthrough, helps gcc7
+compiler warnings
+
+This works in cross and native compilation case
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted
+
+ Grow.c        | 4 ++++
+ bitmap.c      | 8 ++++++++
+ mdadm.c       | 2 ++
+ super-intel.c | 1 +
+ util.c        | 1 +
+ 5 files changed, 16 insertions(+)
+
+diff --git a/Grow.c b/Grow.c
+index 455c5f9..27c73b1 100755
+--- a/Grow.c
++++ b/Grow.c
+@@ -1257,6 +1257,7 @@ char *analyse_change(char *devname, struct mdinfo *info, struct reshape *re)
+ 		switch (info->new_level) {
+ 		case 4:
+ 			delta_parity = 1;
++			/* fallthrough */
+ 		case 0:
+ 			re->level = 4;
+ 			re->before.layout = 0;
+@@ -1284,10 +1285,12 @@ char *analyse_change(char *devname, struct mdinfo *info, struct reshape *re)
+ 
+ 	case 4:
+ 		info->array.layout = ALGORITHM_PARITY_N;
++		/* fallthrough */
+ 	case 5:
+ 		switch (info->new_level) {
+ 		case 0:
+ 			delta_parity = -1;
++			/* fallthrough */
+ 		case 4:
+ 			re->level = info->array.level;
+ 			re->before.data_disks = info->array.raid_disks - 1;
+@@ -1343,6 +1346,7 @@ char *analyse_change(char *devname, struct mdinfo *info, struct reshape *re)
+ 		case 4:
+ 		case 5:
+ 			delta_parity = -1;
++			/* fallthrough */
+ 		case 6:
+ 			re->level = 6;
+ 			re->before.data_disks = info->array.raid_disks - 2;
+diff --git a/bitmap.c b/bitmap.c
+index ccedfd3..a6ff091 100644
+--- a/bitmap.c
++++ b/bitmap.c
+@@ -82,13 +82,21 @@ static inline int count_dirty_bits_byte(char byte, int num_bits)
+ 
+ 	switch (num_bits) { /* fall through... */
+ 		case 8:	if (byte & 128) num++;
++		/* fallthrough */
+ 		case 7:	if (byte &  64) num++;
++		/* fallthrough */
+ 		case 6:	if (byte &  32) num++;
++		/* fallthrough */
+ 		case 5:	if (byte &  16) num++;
++		/* fallthrough */
+ 		case 4:	if (byte &   8) num++;
++		/* fallthrough */
+ 		case 3: if (byte &   4) num++;
++		/* fallthrough */
+ 		case 2:	if (byte &   2) num++;
++		/* fallthrough */
+ 		case 1:	if (byte &   1) num++;
++		/* fallthrough */
+ 		default: break;
+ 	}
+ 
+diff --git a/mdadm.c b/mdadm.c
+index c3a265b..2d06d3b 100644
+--- a/mdadm.c
++++ b/mdadm.c
+@@ -148,6 +148,7 @@ int main(int argc, char *argv[])
+ 			    mode == CREATE || mode == GROW ||
+ 			    mode == INCREMENTAL || mode == MANAGE)
+ 				break; /* b means bitmap */
++		/* fallthrough */
+ 		case Brief:
+ 			c.brief = 1;
+ 			continue;
+@@ -828,6 +829,7 @@ int main(int argc, char *argv[])
+ 
+ 		case O(INCREMENTAL,NoDegraded):
+ 			pr_err("--no-degraded is deprecated in Incremental mode\n");
++			/* fallthrough */
+ 		case O(ASSEMBLE,NoDegraded): /* --no-degraded */
+ 			c.runstop = -1; /* --stop isn't allowed for --assemble,
+ 					 * so we overload slightly */
+diff --git a/super-intel.c b/super-intel.c
+index 4e466ff..00a2925 100644
+--- a/super-intel.c
++++ b/super-intel.c
+@@ -3271,6 +3271,7 @@ static void getinfo_super_imsm_volume(struct supertype *st, struct mdinfo *info,
+ 						<< SECT_PER_MB_SHIFT;
+ 			}
+ 		}
++		/* fallthrough */
+ 		case MIGR_VERIFY:
+ 			/* we could emulate the checkpointing of
+ 			 * 'sync_action=check' migrations, but for now
+diff --git a/util.c b/util.c
+index 32bd909..f2a4d19 100644
+--- a/util.c
++++ b/util.c
+@@ -335,6 +335,7 @@ unsigned long long parse_size(char *size)
+ 		switch (*c) {
+ 		case 'K':
+ 			c++;
++		/* fallthrough */
+ 		default:
+ 			s *= 2;
+ 			break;
+-- 
+2.12.2
+
diff --git a/meta/recipes-extended/mdadm/mdadm_4.0.bb b/meta/recipes-extended/mdadm/mdadm_4.0.bb
index 62614f060f2..98a10a8b15d 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.0.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.0.bb
@@ -16,6 +16,11 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
            file://run-ptest \
            file://0001-mdadm.h-Undefine-dprintf-before-redefining.patch \
            file://0001-include-sys-sysmacros.h-for-major-minor-defintions.patch \
+           file://0001-mdadm-Add-Wimplicit-fallthrough-0-in-Makefile.patch \
+           file://0002-mdadm-Specify-enough-length-when-write-to-buffer.patch \
+           file://0003-Replace-snprintf-with-strncpy-at-some-places-to-avoi.patch \
+           file://0004-mdadm-Forced-type-conversion-to-avoid-truncation.patch \
+           file://0005-Add-a-comment-to-indicate-valid-fallthrough.patch \
            "
 SRC_URI[md5sum] = "2cb4feffea9167ba71b5f346a0c0a40d"
 SRC_URI[sha256sum] = "1d6ae7f24ced3a0fa7b5613b32f4a589bb4881e3946a5a2c3724056254ada3a9"
-- 
2.12.2


