Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 525B3C61DC4
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 08:13:26 +0000 (UTC)
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7691.1787732003200354880
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 01:13:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=RB6Y85Ia;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=14759; q=dns/txt;
  s=iport01; t=1787732003; x=1788941603;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TERPuGqb5o5XoOzdGapMmaScUZRzjyMxbvwVKFeR+uE=;
  b=RB6Y85IaGgWgBH0Dm2Rsxqo3PX+mnUI9SMWHdsC/V6pdHjM+ZIf94uO3
   P4zlDrrPXMQFfceaZuAAAgdb1qDhJlDknJGw2dreAUiFXbJ7NHLfTp+wv
   2a/g3lNG4oaAX7rMdWTRbekgRMhSa7bKGmhCP1YL2ePjQlOKExP5UdhgF
   I2mT90WmRBBDIRF0YDyV6hSgjqlWLvqgfTl7+ueuln16BoPPzFef0hx9d
   5rJD5KVac0iFoJ7l4lU33pREtsfCUNr1RAKSIHLcw2wRWU1z9XDvuNoR1
   WZjJjIkiX12JZPyD8CNKgfVpaWXsH8q7Kc2x4eDG56NPMcU1eLeFs+JHo
   g==;
X-CSE-ConnectionGUID: qcVk2MB/RM+OS69090tqzA==
X-CSE-MsgGUID: FyutvAVxSie/ZTOY9LGeOg==
X-IPAS-Result: =?us-ascii?q?A0AIAAC6n45q/48QJK1aGwEBAQEBAQEBBQEBARIBAQEDA?=
 =?us-ascii?q?wEBAYF8BgEBAQsBglZ0X0JJBIxuiVgDnhuBfg8BAQEPRA0EAQGFBQKNbAImN?=
 =?us-ascii?q?AkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHBYEOE4ZPDYZaAQIBAzIBR?=
 =?us-ascii?q?hAcAQIBAi8rHQYIGYMDgnQCARG/BoIsgQGDaAJDUNswAQsUAQWBMwGFPogiX?=
 =?us-ascii?q?RgBgkmCMycbG4FygRUygzeBBYFcAQGIJQSCIoEMgVqBFpBySIEeA1ksAVUTD?=
 =?us-ascii?q?QoLBwWBZgM1EioVbjIdgSM+F4ENGwYFgR2BKIQQIxk2fIEJXoErKWABEheBC?=
 =?us-ascii?q?YIHAoJaggUCAUlDDgdHPgsYDUgRLDcUGQQ+bgeOax+BekgHASwQJBoTASsFg?=
 =?us-ascii?q?QBIHxcBKAU1kmsJhD2LaoIhgTWfWgoog3aMIpVUM4QElBeSUQuYfYJZizGWD?=
 =?us-ascii?q?kKEaYFoPIFHCwdwFTuCZwkKQBkPjioCAQsLg2CBf4MUxyYkNQIBCDIBAQcCB?=
 =?us-ascii?q?w4DC4FokX4BAQ?=
IronPort-Data: A9a23:B8vBEK1THA1zA4A2mfbD5YRwkn2cJEfYwER7XKvMYLTBsI5bp2FTn
 zBKDDjTbqqOYmCmf9hzb47k9EwCv8WGyNQxQFNr3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 Lsen+WFYAX7g24ubDpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGFUoIPtc90KFNJCJpz
 qJJcGFVcgmRrrfjqF67YrEEasULJc3vOsYb/3pn1zycVahgSpHYSKKM7thdtNsyrpkRRrCFO
 YxAN3w2ME+ojx5nYj/7DLo+gOehhXDlWzZZs1mS46Ew5gA/ySQhiem2aYWKIYbiqcN9sFeFu
 nzvwXTCAxxdBuC4+Guh3X+Libqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYVX95WVul/4waXx++MvUCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXMIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:1nt/0KkDjSCwe4sS6Iy6Jbzl1CnpDfL03DAbv31ZSRFFG/FwWf
 rAoB19726StN9/YhAdcLy7VZVoBEmsl6KdgrNhWYtKIjOHhILAFugLhuHfKn/bakjDH4Vmu5
 uIHZITNDTYNykdsS+D2njaL/8QhP+a7auvmeDSi11pTQ1sduVcyj0RMHfjLqWzLzM2fqbQ0/
 Gnl7J6mwY=
X-Talos-CUID: =?us-ascii?q?9a23=3AEiYogmsQ+B7sWViFBwvnlt5t6Is8eUPellL6ZHW?=
 =?us-ascii?q?dSkFSFuzNGAeM4bFNxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AhFg2pg1lBUK2isWr9FVUeCG9eTUjzbWzFF4kr4U?=
 =?us-ascii?q?9usTDBxBXCma5ozmQTdpy?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,244,1779148800"; 
   d="scan'208";a="819317732"
Received: from alln-l-core-06.cisco.com ([173.36.16.143])
  by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 26 Aug 2026 08:13:22 +0000
Received: from sjc-ads-4178.cisco.com (sjc-ads-4178.cisco.com [171.70.54.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-06.cisco.com (Postfix) with ESMTPS id ECC4A18000247;
	Wed, 26 Aug 2026 08:13:21 +0000 (GMT)
Received: by sjc-ads-4178.cisco.com (Postfix, from userid 1887505)
	id 92B0CCE1BBC; Wed, 26 Aug 2026 01:13:21 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [OE-core][scarthgap][Patch 01/11] u-boot, u-boot-tools: Fix CVE-2026-46728
Date: Wed, 26 Aug 2026 01:12:50 -0700
Message-Id: <7ca025aefed43b95e6f5a8fa13db65781b6f6eb1.1787731424.git.hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <cover.1787731424.git.hthakar@cisco.com>
References: <cover.1787731424.git.hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4178.cisco.com [171.70.54.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.54.199, sjc-ads-4178.cisco.com
X-Outbound-Node: alln-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:13:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244328

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream U-Boot fix referenced by the advisory in
[2], using the commit shown in [1]. The fix rebuilds the FIT signed-node
list from the selected configuration instead of trusting the
attacker-controlled hashed-nodes property.

[1] https://github.com/u-boot/u-boot/commit/2092322b31cc
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-46728

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../u-boot/files/CVE-2026-46728.patch         | 379 ++++++++++++++++++
 .../u-boot/u-boot-tools_2024.01.bb            |   2 +
 meta/recipes-bsp/u-boot/u-boot_2024.01.bb     |   1 +
 3 files changed, 382 insertions(+)
 create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2026-46728.patch

diff --git a/meta/recipes-bsp/u-boot/files/CVE-2026-46728.patch b/meta/recipes-bsp/u-boot/files/CVE-2026-46728.patch
new file mode 100644
index 0000000000..e6737f38a6
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/CVE-2026-46728.patch
@@ -0,0 +1,379 @@
+From 2092322b31cc8b1f8c9e2e238d1043ae0637b241 Mon Sep 17 00:00:00 2001
+From: Simon Glass <simon.glass@canonical.com>
+Date: Thu, 5 Mar 2026 18:20:09 -0700
+Subject: [PATCH] boot: Add fit_config_get_hash_list() to build signed node
+ list
+
+The hashed-nodes property in a FIT signature node lists which FDT paths
+are included in the signature hash. It is intended as a hint so should
+not be used for verification.
+
+Add a function to build the node list from scratch by iterating the
+configuration's image references. Skip properties known not to be image
+references. For each image, collect the path plus all hash and cipher
+subnodes.
+
+Use the new function in fit_config_check_sig() instead of reading
+'hashed-nodes'.
+
+Update the test_vboot kernel@ test case: fit_check_sign now catches the
+attack at signature-verification time (the @-suffixed node is hashed
+instead of the real one, causing a mismatch) rather than at
+fit_check_format() time.
+
+Update the docs to cover this. The FIT spec can be updated separately.
+
+Signed-off-by: Simon Glass <simon.glass@canonical.com>
+Closes: https://lore.kernel.org/u-boot/20260302220937.3682128-1-trini@konsulko.com/
+Reported-by: Apple Security Engineering and Architecture (SEAR)
+Tested-by: Tom Rini <trini@konsulko.com>
+
+CVE: CVE-2026-46728
+Upstream-Status: Backport [https://github.com/u-boot/u-boot/commit/2092322b31cc8b1f8c9e2e238d1043ae0637b241]
+
+Backport Changes:
+- Use the v2024.01 FIT_COMP_PROP name for the compatible property.
+- Adapt test_vboot.py context to the v2024.01 test layout.
+
+(cherry picked from commit 2092322b31cc8b1f8c9e2e238d1043ae0637b241)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ boot/image-fit-sig.c        | 227 +++++++++++++++++++++++++++++-------
+ doc/usage/fit/signature.rst |  19 ++-
+ test/py/tests/test_vboot.py |   8 +-
+ 3 files changed, 201 insertions(+), 53 deletions(-)
+
+diff --git a/boot/image-fit-sig.c b/boot/image-fit-sig.c
+index 12369896..79e7ff93 100644
+--- a/boot/image-fit-sig.c
++++ b/boot/image-fit-sig.c
+@@ -19,6 +19,7 @@ DECLARE_GLOBAL_DATA_PTR;
+ #include <u-boot/hash-checksum.h>
+ 
+ #define IMAGE_MAX_HASHED_NODES		100
++#define FIT_MAX_HASH_PATH_BUF		4096
+ 
+ /**
+  * fit_region_make_list() - Make a list of image regions
+@@ -225,6 +226,179 @@ int fit_image_verify_required_sigs(const void *fit, int image_noffset,
+ 	return 0;
+ }
+ 
++/**
++ * fit_config_add_hash() - Add hash nodes for one image to the node list
++ *
++ * Adds the image path, all its hash-* subnode paths, and its cipher
++ * subnode path (if present) to the packed buffer.
++ *
++ * @fit:		FIT blob
++ * @image_noffset:	Image node offset (e.g. /images/kernel-1)
++ * @node_inc:		Array of path pointers to fill
++ * @count:		Pointer to current count (updated on return)
++ * @max_nodes:		Maximum entries in @node_inc
++ * @buf:		Buffer for packed path strings
++ * @buf_used:		Pointer to bytes used in @buf (updated on return)
++ * @buf_len:		Total size of @buf
++ * Return: 0 on success, -ve on error
++ */
++static int fit_config_add_hash(const void *fit, int image_noffset,
++			       char **node_inc, int *count, int max_nodes,
++			       char *buf, int *buf_used, int buf_len)
++{
++	int noffset, hash_count, ret, len;
++
++	if (*count >= max_nodes)
++		return -ENOSPC;
++
++	ret = fdt_get_path(fit, image_noffset, buf + *buf_used,
++			   buf_len - *buf_used);
++	if (ret < 0)
++		return -ENOENT;
++	len = strlen(buf + *buf_used) + 1;
++	node_inc[(*count)++] = buf + *buf_used;
++	*buf_used += len;
++
++	/* Add all this image's hash subnodes */
++	hash_count = 0;
++	for (noffset = fdt_first_subnode(fit, image_noffset);
++	     noffset >= 0;
++	     noffset = fdt_next_subnode(fit, noffset)) {
++		const char *name = fit_get_name(fit, noffset, NULL);
++
++		if (strncmp(name, FIT_HASH_NODENAME,
++			    strlen(FIT_HASH_NODENAME)))
++			continue;
++		if (*count >= max_nodes)
++			return -ENOSPC;
++		ret = fdt_get_path(fit, noffset, buf + *buf_used,
++				   buf_len - *buf_used);
++		if (ret < 0)
++			return -ENOENT;
++		len = strlen(buf + *buf_used) + 1;
++		node_inc[(*count)++] = buf + *buf_used;
++		*buf_used += len;
++		hash_count++;
++	}
++
++	if (!hash_count) {
++		printf("No hash nodes in image '%s'\n",
++		       fdt_get_name(fit, image_noffset, NULL));
++		return -ENOMSG;
++	}
++
++	/* Add this image's cipher node if present */
++	noffset = fdt_subnode_offset(fit, image_noffset, FIT_CIPHER_NODENAME);
++	if (noffset != -FDT_ERR_NOTFOUND) {
++		if (noffset < 0)
++			return -EIO;
++		if (*count >= max_nodes)
++			return -ENOSPC;
++		ret = fdt_get_path(fit, noffset, buf + *buf_used,
++				   buf_len - *buf_used);
++		if (ret < 0)
++			return -ENOENT;
++		len = strlen(buf + *buf_used) + 1;
++		node_inc[(*count)++] = buf + *buf_used;
++		*buf_used += len;
++	}
++
++	return 0;
++}
++
++/**
++ * fit_config_get_hash_list() - Build the list of nodes to hash
++ *
++ * Works through every image referenced by the configuration and collects the
++ * node paths: root + config + all referenced images with their hash and
++ * cipher subnodes.
++ *
++ * Properties known not to be image references (description, compatible,
++ * default, load-only) are skipped, so any new image type is covered by default.
++ *
++ * @fit:	FIT blob
++ * @conf_noffset: Configuration node offset
++ * @node_inc:	Array to fill with path string pointers
++ * @max_nodes:	Size of @node_inc array
++ * @buf:	Buffer for packed null-terminated path strings
++ * @buf_len:	Size of @buf
++ * Return: number of entries in @node_inc, or -ve on error
++ */
++static int fit_config_get_hash_list(const void *fit, int conf_noffset,
++				    char **node_inc, int max_nodes,
++				    char *buf, int buf_len)
++{
++	const char *conf_name;
++	int image_count;
++	int prop_offset;
++	int used = 0;
++	int count = 0;
++	int ret, len;
++
++	conf_name = fit_get_name(fit, conf_noffset, NULL);
++
++	/* Always include the root node and the configuration node */
++	if (max_nodes < 2)
++		return -ENOSPC;
++
++	len = 2;  /* "/" + nul */
++	if (len > buf_len)
++		return -ENOSPC;
++	strcpy(buf, "/");
++	node_inc[count++] = buf;
++	used += len;
++
++	len = snprintf(buf + used, buf_len - used, "%s/%s", FIT_CONFS_PATH,
++		       conf_name) + 1;
++	if (used + len > buf_len)
++		return -ENOSPC;
++	node_inc[count++] = buf + used;
++	used += len;
++
++	/* Process each image referenced by the config */
++	image_count = 0;
++	fdt_for_each_property_offset(prop_offset, fit, conf_noffset) {
++		const char *prop_name;
++		int img_count, i;
++
++		fdt_getprop_by_offset(fit, prop_offset, &prop_name, NULL);
++		if (!prop_name)
++			continue;
++
++		/* Skip properties that are not image references */
++		if (!strcmp(prop_name, FIT_DESC_PROP) ||
++		    !strcmp(prop_name, FIT_COMP_PROP) ||
++		    !strcmp(prop_name, FIT_DEFAULT_PROP))
++			continue;
++
++		img_count = fdt_stringlist_count(fit, conf_noffset, prop_name);
++		for (i = 0; i < img_count; i++) {
++			int noffset;
++
++			noffset = fit_conf_get_prop_node_index(fit,
++							       conf_noffset,
++							       prop_name, i);
++			if (noffset < 0)
++				continue;
++
++			ret = fit_config_add_hash(fit, noffset, node_inc,
++						  &count, max_nodes, buf, &used,
++						  buf_len);
++			if (ret < 0)
++				return ret;
++
++			image_count++;
++		}
++	}
++
++	if (!image_count) {
++		printf("No images in config '%s'\n", conf_name);
++		return -ENOMSG;
++	}
++
++	return count;
++}
++
+ /**
+  * fit_config_check_sig() - Check the signature of a config
+  *
+@@ -265,20 +439,16 @@ static int fit_config_check_sig(const void *fit, int noffset, int conf_noffset,
+ 		FIT_DATA_POSITION_PROP,
+ 		FIT_DATA_OFFSET_PROP,
+ 	};
+-
+-	const char *prop, *end, *name;
++	char *node_inc[IMAGE_MAX_HASHED_NODES];
++	char hash_buf[FIT_MAX_HASH_PATH_BUF];
+ 	struct image_sign_info info;
+ 	const uint32_t *strings;
+-	const char *config_name;
+ 	uint8_t *fit_value;
+ 	int fit_value_len;
+-	bool found_config;
+ 	int max_regions;
+-	int i, prop_len;
+ 	char path[200];
+ 	int count;
+ 
+-	config_name = fit_get_name(fit, conf_noffset, NULL);
+ 	debug("%s: fdt=%p, conf='%s', sig='%s'\n", __func__, key_blob,
+ 	      fit_get_name(fit, noffset, NULL),
+ 	      fit_get_name(key_blob, required_keynode, NULL));
+@@ -293,45 +463,12 @@ static int fit_config_check_sig(const void *fit, int noffset, int conf_noffset,
+ 		return -1;
+ 	}
+ 
+-	/* Count the number of strings in the property */
+-	prop = fdt_getprop(fit, noffset, "hashed-nodes", &prop_len);
+-	end = prop ? prop + prop_len : prop;
+-	for (name = prop, count = 0; name < end; name++)
+-		if (!*name)
+-			count++;
+-	if (!count) {
+-		*err_msgp = "Can't get hashed-nodes property";
+-		return -1;
+-	}
+-
+-	if (prop && prop_len > 0 && prop[prop_len - 1] != '\0') {
+-		*err_msgp = "hashed-nodes property must be null-terminated";
+-		return -1;
+-	}
+-
+-	/* Add a sanity check here since we are using the stack */
+-	if (count > IMAGE_MAX_HASHED_NODES) {
+-		*err_msgp = "Number of hashed nodes exceeds maximum";
+-		return -1;
+-	}
+-
+-	/* Create a list of node names from those strings */
+-	char *node_inc[count];
+-
+-	debug("Hash nodes (%d):\n", count);
+-	found_config = false;
+-	for (name = prop, i = 0; name < end; name += strlen(name) + 1, i++) {
+-		debug("   '%s'\n", name);
+-		node_inc[i] = (char *)name;
+-		if (!strncmp(FIT_CONFS_PATH, name, strlen(FIT_CONFS_PATH)) &&
+-		    name[sizeof(FIT_CONFS_PATH) - 1] == '/' &&
+-		    !strcmp(name + sizeof(FIT_CONFS_PATH), config_name)) {
+-			debug("      (found config node %s)", config_name);
+-			found_config = true;
+-		}
+-	}
+-	if (!found_config) {
+-		*err_msgp = "Selected config not in hashed nodes";
++	/* Build the node list from the config, ignoring hashed-nodes */
++	count = fit_config_get_hash_list(fit, conf_noffset,
++					 node_inc, IMAGE_MAX_HASHED_NODES,
++					 hash_buf, sizeof(hash_buf));
++	if (count < 0) {
++		*err_msgp = "Failed to build hash node list";
+ 		return -1;
+ 	}
+ 
+diff --git a/doc/usage/fit/signature.rst b/doc/usage/fit/signature.rst
+index 0804bffd..80373234 100644
+--- a/doc/usage/fit/signature.rst
++++ b/doc/usage/fit/signature.rst
+@@ -353,20 +353,27 @@ meantime.
+ Details
+ -------
+ The signature node contains a property ('hashed-nodes') which lists all the
+-nodes that the signature was made over.  The image is walked in order and each
+-tag processed as follows:
++nodes that the signature was made over.  The signer (mkimage) writes this
++property as a record of what was included in the hash.  During verification,
++however, U-Boot does not read 'hashed-nodes'. Instead it rebuilds the node
++list from the configuration's own image references (kernel, fdt, ramdisk,
++etc.), since 'hashed-nodes' is not itself covered by the signature. The
++rebuilt list always includes the root node, the configuration node, each
++referenced image node and its hash/cipher subnodes.
++
++The image is walked in order and each tag processed as follows:
+ 
+ DTB_BEGIN_NODE
+     The tag and the following name are included in the signature
+-    if the node or its parent are present in 'hashed-nodes'
++    if the node or its parent are present in the node list
+ 
+ DTB_END_NODE
+     The tag is included in the signature if the node or its parent
+-    are present in 'hashed-nodes'
++    are present in the node list
+ 
+ DTB_PROPERTY
+     The tag, the length word, the offset in the string table, and
+-    the data are all included if the current node is present in 'hashed-nodes'
++    the data are all included if the current node is present in the node list
+     and the property name is not 'data'.
+ 
+ DTB_END
+@@ -374,7 +381,7 @@ DTB_END
+ 
+ DTB_NOP
+     The tag is included in the signature if the current node is present
+-    in 'hashed-nodes'
++    in the node list
+ 
+ In addition, the signature contains a property 'hashed-strings' which contains
+ the offset and length in the string table of the strings that are to be
+diff --git a/test/py/tests/test_vboot.py b/test/py/tests/test_vboot.py
+index 04fa59f9..817eb980 100644
+--- a/test/py/tests/test_vboot.py
++++ b/test/py/tests/test_vboot.py
+@@ -362,10 +362,14 @@ def test_vboot(u_boot_console, name, sha_algo, padding, sign_options, required,
+             shutil.copyfile(fit, efit)
+             vboot_evil.add_evil_node(fit, efit, evil_kernel, 'kernel@')
+ 
+-            msg = 'Signature checking prevents use of unit addresses (@) in nodes'
++            # fit_check_sign catches this via signature mismatch (the @
++            # node is hashed instead of the real one)
+             util.run_and_log_expect_exception(
+                 cons, [fit_check_sign, '-f', efit, '-k', dtb],
+-                1, msg)
++                1, 'Failed to verify required signature')
++
++            # bootm catches it earlier, at fit_check_format() time
++            msg = 'Signature checking prevents use of unit addresses (@) in nodes'
+             run_bootm(sha_algo, 'evil kernel@', msg, False, efit)
+ 
+         # Create a new properly signed fit and replace header bytes
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb
index 7eaf721ca8..4b6d89ed4e 100644
--- a/meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb
@@ -1,2 +1,4 @@
 require u-boot-common.inc
 require u-boot-tools.inc
+
+SRC_URI += "file://CVE-2026-46728.patch"
diff --git a/meta/recipes-bsp/u-boot/u-boot_2024.01.bb b/meta/recipes-bsp/u-boot/u-boot_2024.01.bb
index e412f503f1..7eaeed1004 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2024.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2024.01.bb
@@ -12,4 +12,5 @@ SRC_URI += "file://CVE-2024-57254.patch \
             file://CVE-2024-57258-3.patch \
             file://CVE-2024-57259.patch \
             file://CVE-2024-42040.patch \
+            file://CVE-2026-46728.patch \
 "
-- 
2.35.6


