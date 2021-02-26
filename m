Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
 by mx.groups.io with SMTP id smtpd.web08.9828.1614349535172589358
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 06:25:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=gAcIcw12;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.45, mailfrom: steve@sakoman.com)
Received: by mail-io1-f45.google.com with SMTP id z13so9771200iox.8
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Feb 2021 06:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=JWBlT3S8YJHkQCo8NuOdCGS9Pb1YwOS9krfQ57jDrfs=;
        b=gAcIcw12DIQD9BUrUmky1NI5SKMqOe979np9alZA5fz3Sb59RPJxFQbZvjC3/vxn9Q
         3Knk3vWxRohoPtmMGUKm/UxWcOJlTNGp1YwpqvazX72vMQ/uPBVyo1HJ9TdGiDqPvxMy
         51OX7UCE+jocfJukXuQLumt6pD9WcGN7YNiAXqKXrPZiah2xt8fGj0eiyUGclT/3VgCS
         aEHPgKjL8uoMyT74GFm1i8QGXqbNV4lVImhaoJC5MRHdX/wyDUKrcdG+HMb4BAGxgjrU
         kmr0+LH+XTDGBMPZ4/uLJopiaH30b3QeJha3lWIQZKDwxnuxTSvMHEyVUHDdEcKZb0Hr
         oVAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JWBlT3S8YJHkQCo8NuOdCGS9Pb1YwOS9krfQ57jDrfs=;
        b=HvHGF283QvMWxNPTUUvGziALGNTjp1lUCXKbZ/vMCyAWxMnNPd4LwyvE3efpybbBDM
         AtO6Yr6rTzR4pz7Sof9w9IyyBuNto7ut1Aug6tZB7CnNTXn6rx04Zd4ygPF28AB7dJ+/
         EgSbCeTcpg7CarMuwi+va5ZXVNR+eUyRC1nkpnBUSvgC/P6pQ/F06MOqH15BnGbQtaxK
         jAoQ8H+QtYkGJNNKsoTcHJsD7Q96LAFUe46OSq2IT5FPKEaFtuSm2hPUlqIRPNU/tHzF
         yjs4z5qVXUKZyXlDQTVlBnPYT9hcd8nqBxFp16wFRpIbcYp/DC9MutWGDPZd1alBALs1
         XoCg==
X-Gm-Message-State: AOAM532McjNHnZPHwowGNzbZImR35WTntTY9XuPm+1xPbUGzD3ExUpdG
	SVMZcE60JWA8p0GxrFQOX4ZELqs8Ye8FacEB
X-Google-Smtp-Source: ABdhPJzAW8A5sFhizAtACAKD5F9EaWU45XFM4uTyTYvJrZdVJyvOxKbUDXWEjeUesOBAFXkMxoiI6g==
X-Received: by 2002:a5d:9343:: with SMTP id i3mr3025174ioo.138.1614349533610;
        Fri, 26 Feb 2021 06:25:33 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id i3sm5383377ioq.13.2021.02.26.06.25.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 06:25:33 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/40] u-boot: fix CVE-2020-8432 and CVE-2020-10648
Date: Fri, 26 Feb 2021 04:23:50 -1000
Message-Id: <9c6131bc46e233ea8e446c49bba4360ec06b7168.1614348990.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1614348990.git.steve@sakoman.com>
References: <cover.1614348990.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Scott Murray <scott.murray@konsulko.com>

Backport fixes for CVE-2020-8432 and CVE-2020-10648 from upstream.

Signed-off-by: Scott Murray <scott.murray@konsulko.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../u-boot/files/CVE-2020-10648-1.patch       |  98 +++++++++++++++
 .../u-boot/files/CVE-2020-10648-2.patch       |  52 ++++++++
 .../u-boot/files/CVE-2020-8432.patch          | 114 ++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot-common.inc     |   3 +
 4 files changed, 267 insertions(+)
 create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2020-10648-1.patch
 create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2020-10648-2.patch
 create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2020-8432.patch

diff --git a/meta/recipes-bsp/u-boot/files/CVE-2020-10648-1.patch b/meta/recipes-bsp/u-boot/files/CVE-2020-10648-1.patch
new file mode 100644
index 0000000000..d784452b44
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/CVE-2020-10648-1.patch
@@ -0,0 +1,98 @@
+From 67acad3db71bb372458fbb8a77749f5eb88aa324 Mon Sep 17 00:00:00 2001
+From: Simon Glass <sjg@chromium.org>
+Date: Wed, 18 Mar 2020 11:44:01 -0600
+Subject: [PATCH] image: Check hash-nodes when checking configurations
+
+It is currently possible to use a different configuration's signature and
+thus bypass the configuration check. Make sure that the configuration node
+that was hashed matches the one being checked, to catch this problem.
+
+Also add a proper function comment to fit_config_check_sig() and make it
+static.
+
+Signed-off-by: Simon Glass <sjg@chromium.org>
+
+CVE: CVE-2020-10648
+Upstream-Status: Backport[https://github.com/u-boot/u-boot/commit/67acad3db71bb372458fbb8a77749f5eb88aa324]
+Signed-off-by: Scott Murray <scott.murray@konsulko.com>
+
+---
+ common/image-sig.c | 36 +++++++++++++++++++++++++++++++++---
+ 1 file changed, 33 insertions(+), 3 deletions(-)
+
+diff --git a/common/image-sig.c b/common/image-sig.c
+index 13ccd50bc5..03143a4040 100644
+--- a/common/image-sig.c
++++ b/common/image-sig.c
+@@ -359,20 +359,39 @@ int fit_image_verify_required_sigs(const void *fit, int image_noffset,
+ 	return 0;
+ }
+ 
+-int fit_config_check_sig(const void *fit, int noffset, int required_keynode,
+-			 char **err_msgp)
++/**
++ * fit_config_check_sig() - Check the signature of a config
++ *
++ * @fit: FIT to check
++ * @noffset: Offset of configuration node (e.g. /configurations/conf-1)
++ * @required_keynode:	Offset in the control FDT of the required key node,
++ *			if any. If this is given, then the configuration wil not
++ *			pass verification unless that key is used. If this is
++ *			-1 then any signature will do.
++ * @conf_noffset: Offset of the configuration subnode being checked (e.g.
++ *	 /configurations/conf-1/kernel)
++ * @err_msgp:		In the event of an error, this will be pointed to a
++ *			help error string to display to the user.
++ * @return 0 if all verified ok, <0 on error
++ */
++static int fit_config_check_sig(const void *fit, int noffset,
++				int required_keynode, int conf_noffset,
++				char **err_msgp)
+ {
+ 	char * const exc_prop[] = {"data"};
+ 	const char *prop, *end, *name;
+ 	struct image_sign_info info;
+ 	const uint32_t *strings;
++	const char *config_name;
+ 	uint8_t *fit_value;
+ 	int fit_value_len;
++	bool found_config;
+ 	int max_regions;
+ 	int i, prop_len;
+ 	char path[200];
+ 	int count;
+ 
++	config_name = fit_get_name(fit, conf_noffset, NULL);
+ 	debug("%s: fdt=%p, conf='%s', sig='%s'\n", __func__, gd_fdt_blob(),
+ 	      fit_get_name(fit, noffset, NULL),
+ 	      fit_get_name(gd_fdt_blob(), required_keynode, NULL));
+@@ -413,9 +432,20 @@ int fit_config_check_sig(const void *fit, int noffset, int required_keynode,
+ 	char *node_inc[count];
+ 
+ 	debug("Hash nodes (%d):\n", count);
++	found_config = false;
+ 	for (name = prop, i = 0; name < end; name += strlen(name) + 1, i++) {
+ 		debug("   '%s'\n", name);
+ 		node_inc[i] = (char *)name;
++		if (!strncmp(FIT_CONFS_PATH, name, strlen(FIT_CONFS_PATH)) &&
++		    name[sizeof(FIT_CONFS_PATH) - 1] == '/' &&
++		    !strcmp(name + sizeof(FIT_CONFS_PATH), config_name)) {
++			debug("      (found config node %s)", config_name);
++			found_config = true;
++		}
++	}
++	if (!found_config) {
++		*err_msgp = "Selected config not in hashed nodes";
++		return -1;
+ 	}
+ 
+ 	/*
+@@ -483,7 +513,7 @@ static int fit_config_verify_sig(const void *fit, int conf_noffset,
+ 		if (!strncmp(name, FIT_SIG_NODENAME,
+ 			     strlen(FIT_SIG_NODENAME))) {
+ 			ret = fit_config_check_sig(fit, noffset, sig_offset,
+-						   &err_msg);
++						   conf_noffset, &err_msg);
+ 			if (ret) {
+ 				puts("- ");
+ 			} else {
diff --git a/meta/recipes-bsp/u-boot/files/CVE-2020-10648-2.patch b/meta/recipes-bsp/u-boot/files/CVE-2020-10648-2.patch
new file mode 100644
index 0000000000..023f7eac0a
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/CVE-2020-10648-2.patch
@@ -0,0 +1,52 @@
+From 8a9d03732e6d0f68107c80919096e7cf956dcb3d Mon Sep 17 00:00:00 2001
+From: Simon Glass <sjg@chromium.org>
+Date: Wed, 18 Mar 2020 11:44:02 -0600
+Subject: [PATCH] image: Load the correct configuration in fit_check_sign
+
+At present bootm_host_load_images() is passed the configuration that has
+been verified, but ignores it and just uses the default configuration.
+This may not be the same.
+
+Update this function to use the selected configuration.
+
+Signed-off-by: Simon Glass <sjg@chromium.org>
+
+CVE: CVE-2020-10648
+Upstream-Status: Backport[https://github.com/u-boot/u-boot/commit/8a9d03732e6d0f68107c80919096e7cf956dcb3d]
+Signed-off-by: Scott Murray <scott.murray@konsulko.com>
+
+---
+ common/bootm.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/common/bootm.c b/common/bootm.c
+index 902c13880d..db4362a643 100644
+--- a/common/bootm.c
++++ b/common/bootm.c
+@@ -819,7 +819,8 @@ void __weak switch_to_non_secure_mode(void)
+ #else /* USE_HOSTCC */
+ 
+ #if defined(CONFIG_FIT_SIGNATURE)
+-static int bootm_host_load_image(const void *fit, int req_image_type)
++static int bootm_host_load_image(const void *fit, int req_image_type,
++				 int cfg_noffset)
+ {
+ 	const char *fit_uname_config = NULL;
+ 	ulong data, len;
+@@ -831,6 +832,7 @@ static int bootm_host_load_image(const void *fit, int req_image_type)
+ 	void *load_buf;
+ 	int ret;
+ 
++	fit_uname_config = fdt_get_name(fit, cfg_noffset, NULL);
+ 	memset(&images, '\0', sizeof(images));
+ 	images.verify = 1;
+ 	noffset = fit_image_load(&images, (ulong)fit,
+@@ -878,7 +880,7 @@ int bootm_host_load_images(const void *fit, int cfg_noffset)
+ 	for (i = 0; i < ARRAY_SIZE(image_types); i++) {
+ 		int ret;
+ 
+-		ret = bootm_host_load_image(fit, image_types[i]);
++		ret = bootm_host_load_image(fit, image_types[i], cfg_noffset);
+ 		if (!err && ret && ret != -ENOENT)
+ 			err = ret;
+ 	}
diff --git a/meta/recipes-bsp/u-boot/files/CVE-2020-8432.patch b/meta/recipes-bsp/u-boot/files/CVE-2020-8432.patch
new file mode 100644
index 0000000000..b0a16efeaa
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/CVE-2020-8432.patch
@@ -0,0 +1,114 @@
+From 5749faa3d6837d6dbaf2119fc3ec49a326690c8f Mon Sep 17 00:00:00 2001
+From: Tom Rini <trini@konsulko.com>
+Date: Tue, 21 Jan 2020 11:53:38 -0500
+Subject: [PATCH] cmd/gpt: Address error cases during gpt rename more correctly
+
+New analysis by the tool has shown that we have some cases where we
+weren't handling the error exit condition correctly.  When we ran into
+the ENOMEM case we wouldn't exit the function and thus incorrect things
+could happen.  Rework the unwinding such that we don't need a helper
+function now and free what we may have allocated.
+
+Fixes: 18030d04d25d ("GPT: fix memory leaks identified by Coverity")
+Reported-by: Coverity (CID: 275475, 275476)
+Cc: Alison Chaiken <alison@she-devel.com>
+Cc: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>
+Cc: Jordy <jordy@simplyhacker.com>
+Signed-off-by: Tom Rini <trini@konsulko.com>
+Reviewed-by: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>
+
+CVE: CVE-2020-8432
+Upstream-Status: Backport[https://github.com/u-boot/u-boot/commit/5749faa3d6837d6dbaf2119fc3ec49a326690c8f]
+Signed-off-by: Scott Murray <scott.murray@konsulko.com>
+
+---
+ cmd/gpt.c | 47 ++++++++++++-----------------------------------
+ 1 file changed, 12 insertions(+), 35 deletions(-)
+
+diff --git a/cmd/gpt.c b/cmd/gpt.c
+index 0c4349f4b2..964702bad4 100644
+--- a/cmd/gpt.c
++++ b/cmd/gpt.c
+@@ -633,21 +633,6 @@ static int do_disk_guid(struct blk_desc *dev_desc, char * const namestr)
+ }
+ 
+ #ifdef CONFIG_CMD_GPT_RENAME
+-/*
+- * There are 3 malloc() calls in set_gpt_info() and there is no info about which
+- * failed.
+- */
+-static void set_gpt_cleanup(char **str_disk_guid,
+-			    disk_partition_t **partitions)
+-{
+-#ifdef CONFIG_RANDOM_UUID
+-	if (str_disk_guid)
+-		free(str_disk_guid);
+-#endif
+-	if (partitions)
+-		free(partitions);
+-}
+-
+ static int do_rename_gpt_parts(struct blk_desc *dev_desc, char *subcomm,
+ 			       char *name1, char *name2)
+ {
+@@ -655,7 +640,7 @@ static int do_rename_gpt_parts(struct blk_desc *dev_desc, char *subcomm,
+ 	struct disk_part *curr;
+ 	disk_partition_t *new_partitions = NULL;
+ 	char disk_guid[UUID_STR_LEN + 1];
+-	char *partitions_list, *str_disk_guid;
++	char *partitions_list, *str_disk_guid = NULL;
+ 	u8 part_count = 0;
+ 	int partlistlen, ret, numparts = 0, partnum, i = 1, ctr1 = 0, ctr2 = 0;
+ 
+@@ -697,14 +682,8 @@ static int do_rename_gpt_parts(struct blk_desc *dev_desc, char *subcomm,
+ 	/* set_gpt_info allocates new_partitions and str_disk_guid */
+ 	ret = set_gpt_info(dev_desc, partitions_list, &str_disk_guid,
+ 			   &new_partitions, &part_count);
+-	if (ret < 0) {
+-		del_gpt_info();
+-		free(partitions_list);
+-		if (ret == -ENOMEM)
+-			set_gpt_cleanup(&str_disk_guid, &new_partitions);
+-		else
+-			goto out;
+-	}
++	if (ret < 0)
++		goto out;
+ 
+ 	if (!strcmp(subcomm, "swap")) {
+ 		if ((strlen(name1) > PART_NAME_LEN) || (strlen(name2) > PART_NAME_LEN)) {
+@@ -766,14 +745,8 @@ static int do_rename_gpt_parts(struct blk_desc *dev_desc, char *subcomm,
+ 	 * Even though valid pointers are here passed into set_gpt_info(),
+ 	 * it mallocs again, and there's no way to tell which failed.
+ 	 */
+-	if (ret < 0) {
+-		del_gpt_info();
+-		free(partitions_list);
+-		if (ret == -ENOMEM)
+-			set_gpt_cleanup(&str_disk_guid, &new_partitions);
+-		else
+-			goto out;
+-	}
++	if (ret < 0)
++		goto out;
+ 
+ 	debug("Writing new partition table\n");
+ 	ret = gpt_restore(dev_desc, disk_guid, new_partitions, numparts);
+@@ -795,10 +768,14 @@ static int do_rename_gpt_parts(struct blk_desc *dev_desc, char *subcomm,
+ 	}
+ 	printf("new partition table with %d partitions is:\n", numparts);
+ 	print_gpt_info();
+-	del_gpt_info();
+  out:
+-	free(new_partitions);
+-	free(str_disk_guid);
++	del_gpt_info();
++#ifdef CONFIG_RANDOM_UUID
++	if (str_disk_guid)
++		free(str_disk_guid);
++#endif
++	if (new_partitions)
++		free(new_partitions);
+ 	free(partitions_list);
+ 	return ret;
+ }
diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index 4a17894c49..198ed52c7c 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -16,6 +16,9 @@ SRCREV = "303f8fed261020c1cb7da32dad63b610bf6873dd"
 
 SRC_URI = "git://git.denx.de/u-boot.git \
            file://remove-redundant-yyloc-global.patch \
+           file://CVE-2020-8432.patch \
+           file://CVE-2020-10648-1.patch \
+           file://CVE-2020-10648-2.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
2.25.1

