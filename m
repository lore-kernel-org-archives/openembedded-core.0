Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44FF5E9D832
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 06:49:36 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.75303.1775544566943969888
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Apr 2026 23:49:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=kXUAFl2D;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so29747165e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2026 23:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775544565; x=1776149365; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sBr5WhENyKZD50S0xW1+E2GFl+WlEhxGv14F/64XGgA=;
        b=kXUAFl2DP5FfBoS+DyIwPdu4Q/ZR07Rb1bfI3vYOTrvvMvqI04iPJjL+5f/WpTciVJ
         4F/rz2leLW47fGPXwaQw8sD4ohydmt3n7GZ1xXb9rwa3cYYRduiD+zYHbI5AMwRikNBc
         VCpyNyhsV9AVUfKMjQL7luTVWS9o2lGHxvvxI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775544565; x=1776149365;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sBr5WhENyKZD50S0xW1+E2GFl+WlEhxGv14F/64XGgA=;
        b=GZM38IX/SmEQfZl6Zxzk1ApL6FNDnPcNkuthGMNxaHt0yyFQJPbEv5CR8R06LoxHxb
         2wsQKj4H5XFjcM4Qp+Yw6LqeSLuxqQ4iA/NBwuRPx3891k1zXEf+Z8Me0KU/Q7C8iWmM
         nCHi+Eci3yLWOoWe3INrTyWPgcFj89aQFWt6Wim4H/ooFUtCXBh7pps8kNA2EAoyQ9t3
         h4Yc1ACk6EjVh1d40EGNwWwridWTJfSRrJb5ujt8SXDGSQSS1+hITP1TGhXTnXI1XI42
         CljU8wdHvFd64IktI/2xRsO1XbDFOuF2KI4MceaWfwpGlkh7vg0akzVWJruuO3SUGTAt
         Y/SQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqNbA6U1ABmSRhT9J2HeLvLfU+AK87upn9qXsebEinHiYPagLqdR296D9orDElw7AulWq9o581p5PqsGXSoI3aMw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxSs0G0W7/z0Vc/Ek1n/Z9furIOVH/GbjsPaBpU8XTyX0y9EQYy
	v8AXZisa/rJT4AsX6B6tvUMFwaHFpTPr7EfDgC9hAqCqEN8XIQrws1L7b20xi48WdBoqicJmBeu
	Cj3o+8LU=
X-Gm-Gg: AeBDievIA+PIva/v+02xnDs7ykUKURTIYDu/j90RUpOmnN5DozLmz7dwxLCI5mdKVkQ
	fm5BeMfm1q1hsy1+2G/Kq034cPsXkKhPCICeivKztzB5BecFzvrzwVNmNMkGVXzeCoW4DWiRlRW
	0lURpMW99p2IiQQ0nehTDWZfJhjKb+/6n1iTd9Tc2gRBndhPVi+XFApZOKDkWF3AWtDwAfm51Uf
	/O8TEJ8gv8i0CyYSrvUXdkRSr86izxLAZmspdebmWKBsMapf/nfX6zsc6Exdd25wToGe9c+RaR2
	qOo5ndBCW7LiYz3rzq/m5kLe+F9GGaRnG3IbTK1DquL84Jhr/YboWuQuZoyDHZ+ClmofEH23ey6
	+ez/kSjNjYJqPTKaLpZy1tLDgNSMCzKJkWst5dvkQm1/Nqe2AvBENGo1zroxaZKKXZYfW7goI4A
	b4VMN2rkUZJnGegGmUaKMTxIXN/O7prj6TToq+SwTJ/CM6Ooux3Qjtn98slFFGlbJfEzy/Kh7au
	JI0rKiN8gRoFRg=
X-Received: by 2002:a05:600c:3544:b0:485:303b:c50a with SMTP id 5b1f17b1804b1-488997352d3mr213190555e9.13.1775544565122;
        Mon, 06 Apr 2026 23:49:25 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488980e312csm111701975e9.7.2026.04.06.23.49.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 23:49:24 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Apr 2026 08:49:24 +0200
Message-Id: <DHMQ0OAXFVYK.1M1BVD72ADTDO@smile.fr>
Subject: Re: [OE-core] [PATCH v2] u-boot: Fix CVE-2026-33243
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <yanis.binard@smile.fr>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260402091349.9001-1-yanis.binard@smile.fr>
In-Reply-To: <20260402091349.9001-1-yanis.binard@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 06:49:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234700

On Thu Apr 2, 2026 at 11:13 AM CEST, Yanis Brd via lists.openembedded.org w=
rote:
> From: Yanis BINARD <yanis.binard@smile.fr>
>
> U-Boot and barebox both have the vulnerability (signature verification
> with FIT images).
> Barebox published an advisory[0] linking to the fixing U-Boot commit.
> The commit is on U-Boot v2026.04-rc4 and had to be adjusted for v2026.01.
> Removed the check for a non-existent property since it was not
> supported in v2026.01.
>
> [0]: https://github.com/barebox/barebox/security/advisories/GHSA-3fvj-q26=
p-j6h4
>
> Signed-off-by: Yanis BINARD <yanis.binard@smile.fr>
> ---
> Fixed a typo and a spelling mistake.
> Added colon after link index.


Hello,

This is now redundant (and conflicting) with "[PATCH] u-boot: upgrade 2026.=
01 -> 2026.04"
https://lore.kernel.org/openembedded-core/20260406222906.7171-1-festevam@gm=
ail.com/T/#u

Regards,

>  .../u-boot/files/CVE-2026-33243.patch         | 374 ++++++++++++++++++
>  meta/recipes-bsp/u-boot/u-boot_2026.01.bb     |   2 +
>  2 files changed, 376 insertions(+)
>  create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2026-33243.patch
>
> diff --git a/meta/recipes-bsp/u-boot/files/CVE-2026-33243.patch b/meta/re=
cipes-bsp/u-boot/files/CVE-2026-33243.patch
> new file mode 100644
> index 0000000000..c7086e183f
> --- /dev/null
> +++ b/meta/recipes-bsp/u-boot/files/CVE-2026-33243.patch
> @@ -0,0 +1,374 @@
> +From 1e0e1520761a62488d10b486f6e5df0ccb82a74a Mon Sep 17 00:00:00 2001
> +From: Simon Glass <simon.glass@canonical.com>
> +Date: Thu, 5 Mar 2026 18:20:09 -0700
> +Subject: [PATCH] boot: Add fit_config_get_hash_list() to build signed no=
de
> + list
> +
> +The hashed-nodes property in a FIT signature node lists which FDT paths
> +are included in the signature hash. It is intended as a hint so should
> +not be used for verification.
> +
> +Add a function to build the node list from scratch by iterating the
> +configuration's image references. Skip properties known not to be image
> +references. For each image, collect the path plus all hash and cipher
> +subnodes.
> +
> +Use the new function in fit_config_check_sig() instead of reading
> +'hashed-nodes'.
> +
> +Update the test_vboot kernel@ test case: fit_check_sign now catches the
> +attack at signature-verification time (the @-suffixed node is hashed
> +instead of the real one, causing a mismatch) rather than at
> +fit_check_format() time.
> +
> +Update the docs to cover this. The FIT spec can be updated separately.
> +
> +Signed-off-by: Simon Glass <simon.glass@canonical.com>
> +Closes: https://lore.kernel.org/u-boot/20260302220937.3682128-1-trini@ko=
nsulko.com/
> +Reported-by: Apple Security Engineering and Architecture (SEAR)
> +Tested-by: Tom Rini <trini@konsulko.com>
> +
> +[YB: Removed a skippable condition in fit_config_get_hash_list.
> +	This flag is not available in this version]
> +CVE: CVE-2026-33243
> +Upstream-Status: Backport [https://github.com/u-boot/u-boot/commit/20923=
22b31cc8b1f8c9e2e238d1043ae0637b241]
> +Signed-off-by: Yanis Binard <yanis.binard@smile.fr>
> +---
> + boot/image-fit-sig.c        | 226 +++++++++++++++++++++++++++++-------
> + doc/usage/fit/signature.rst |  19 ++-
> + test/py/tests/test_vboot.py |   8 +-
> + 3 files changed, 200 insertions(+), 53 deletions(-)
> +
> +diff --git a/boot/image-fit-sig.c b/boot/image-fit-sig.c
> +index f23e9d5d0b0..d13df7d6153 100644
> +--- a/boot/image-fit-sig.c
> ++++ b/boot/image-fit-sig.c
> +@@ -18,6 +18,7 @@ DECLARE_GLOBAL_DATA_PTR;
> + #include <u-boot/hash-checksum.h>
> +=20
> + #define IMAGE_MAX_HASHED_NODES		100
> ++#define FIT_MAX_HASH_PATH_BUF		4096
> +=20
> + /**
> +  * fit_region_make_list() - Make a list of image regions
> +@@ -229,6 +230,178 @@ int fit_image_verify_required_sigs(const void *fit=
, int image_noffset,
> + 	return 0;
> + }
> +=20
> ++/**
> ++ * fit_config_add_hash() - Add hash nodes for one image to the node lis=
t
> ++ *
> ++ * Adds the image path, all its hash-* subnode paths, and its cipher
> ++ * subnode path (if present) to the packed buffer.
> ++ *
> ++ * @fit:		FIT blob
> ++ * @image_noffset:	Image node offset (e.g. /images/kernel-1)
> ++ * @node_inc:		Array of path pointers to fill
> ++ * @count:		Pointer to current count (updated on return)
> ++ * @max_nodes:		Maximum entries in @node_inc
> ++ * @buf:		Buffer for packed path strings
> ++ * @buf_used:		Pointer to bytes used in @buf (updated on return)
> ++ * @buf_len:		Total size of @buf
> ++ * Return: 0 on success, -ve on error
> ++ */
> ++static int fit_config_add_hash(const void *fit, int image_noffset,
> ++			       char **node_inc, int *count, int max_nodes,
> ++			       char *buf, int *buf_used, int buf_len)
> ++{
> ++	int noffset, hash_count, ret, len;
> ++
> ++	if (*count >=3D max_nodes)
> ++		return -ENOSPC;
> ++
> ++	ret =3D fdt_get_path(fit, image_noffset, buf + *buf_used,
> ++			   buf_len - *buf_used);
> ++	if (ret < 0)
> ++		return -ENOENT;
> ++	len =3D strlen(buf + *buf_used) + 1;
> ++	node_inc[(*count)++] =3D buf + *buf_used;
> ++	*buf_used +=3D len;
> ++
> ++	/* Add all this image's hash subnodes */
> ++	hash_count =3D 0;
> ++	for (noffset =3D fdt_first_subnode(fit, image_noffset);
> ++	     noffset >=3D 0;
> ++	     noffset =3D fdt_next_subnode(fit, noffset)) {
> ++		const char *name =3D fit_get_name(fit, noffset, NULL);
> ++
> ++		if (strncmp(name, FIT_HASH_NODENAME,
> ++			    strlen(FIT_HASH_NODENAME)))
> ++			continue;
> ++		if (*count >=3D max_nodes)
> ++			return -ENOSPC;
> ++		ret =3D fdt_get_path(fit, noffset, buf + *buf_used,
> ++				   buf_len - *buf_used);
> ++		if (ret < 0)
> ++			return -ENOENT;
> ++		len =3D strlen(buf + *buf_used) + 1;
> ++		node_inc[(*count)++] =3D buf + *buf_used;
> ++		*buf_used +=3D len;
> ++		hash_count++;
> ++	}
> ++
> ++	if (!hash_count) {
> ++		printf("No hash nodes in image '%s'\n",
> ++		       fdt_get_name(fit, image_noffset, NULL));
> ++		return -ENOMSG;
> ++	}
> ++
> ++	/* Add this image's cipher node if present */
> ++	noffset =3D fdt_subnode_offset(fit, image_noffset, FIT_CIPHER_NODENAME=
);
> ++	if (noffset !=3D -FDT_ERR_NOTFOUND) {
> ++		if (noffset < 0)
> ++			return -EIO;
> ++		if (*count >=3D max_nodes)
> ++			return -ENOSPC;
> ++		ret =3D fdt_get_path(fit, noffset, buf + *buf_used,
> ++				   buf_len - *buf_used);
> ++		if (ret < 0)
> ++			return -ENOENT;
> ++		len =3D strlen(buf + *buf_used) + 1;
> ++		node_inc[(*count)++] =3D buf + *buf_used;
> ++		*buf_used +=3D len;
> ++	}
> ++
> ++	return 0;
> ++}
> ++
> ++/**
> ++ * fit_config_get_hash_list() - Build the list of nodes to hash
> ++ *
> ++ * Works through every image referenced by the configuration and collec=
ts the
> ++ * node paths: root + config + all referenced images with their hash an=
d
> ++ * cipher subnodes.
> ++ *
> ++ * Properties known not to be image references (description, compatible=
,
> ++ * default, load-only) are skipped, so any new image type is covered by=
 default.
> ++ *
> ++ * @fit:	FIT blob
> ++ * @conf_noffset: Configuration node offset
> ++ * @node_inc:	Array to fill with path string pointers
> ++ * @max_nodes:	Size of @node_inc array
> ++ * @buf:	Buffer for packed null-terminated path strings
> ++ * @buf_len:	Size of @buf
> ++ * Return: number of entries in @node_inc, or -ve on error
> ++ */
> ++static int fit_config_get_hash_list(const void *fit, int conf_noffset,
> ++				    char **node_inc, int max_nodes,
> ++				    char *buf, int buf_len)
> ++{
> ++	const char *conf_name;
> ++	int image_count;
> ++	int prop_offset;
> ++	int used =3D 0;
> ++	int count =3D 0;
> ++	int ret, len;
> ++
> ++	conf_name =3D fit_get_name(fit, conf_noffset, NULL);
> ++
> ++	/* Always include the root node and the configuration node */
> ++	if (max_nodes < 2)
> ++		return -ENOSPC;
> ++
> ++	len =3D 2;  /* "/" + nul */
> ++	if (len > buf_len)
> ++		return -ENOSPC;
> ++	strcpy(buf, "/");
> ++	node_inc[count++] =3D buf;
> ++	used +=3D len;
> ++
> ++	len =3D snprintf(buf + used, buf_len - used, "%s/%s", FIT_CONFS_PATH,
> ++		       conf_name) + 1;
> ++	if (used + len > buf_len)
> ++		return -ENOSPC;
> ++	node_inc[count++] =3D buf + used;
> ++	used +=3D len;
> ++
> ++	/* Process each image referenced by the config */
> ++	image_count =3D 0;
> ++	fdt_for_each_property_offset(prop_offset, fit, conf_noffset) {
> ++		const char *prop_name;
> ++		int img_count, i;
> ++
> ++		fdt_getprop_by_offset(fit, prop_offset, &prop_name, NULL);
> ++		if (!prop_name)
> ++			continue;
> ++
> ++		/* Skip properties that are not image references */
> ++		if (!strcmp(prop_name, FIT_DESC_PROP) ||
> ++		    !strcmp(prop_name, FIT_DEFAULT_PROP))
> ++			continue;
> ++
> ++		img_count =3D fdt_stringlist_count(fit, conf_noffset, prop_name);
> ++		for (i =3D 0; i < img_count; i++) {
> ++			int noffset;
> ++
> ++			noffset =3D fit_conf_get_prop_node_index(fit,
> ++							       conf_noffset,
> ++							       prop_name, i);
> ++			if (noffset < 0)
> ++				continue;
> ++
> ++			ret =3D fit_config_add_hash(fit, noffset, node_inc,
> ++						  &count, max_nodes, buf, &used,
> ++						  buf_len);
> ++			if (ret < 0)
> ++				return ret;
> ++
> ++			image_count++;
> ++		}
> ++	}
> ++
> ++	if (!image_count) {
> ++		printf("No images in config '%s'\n", conf_name);
> ++		return -ENOMSG;
> ++	}
> ++
> ++	return count;
> ++}
> ++
> + /**
> +  * fit_config_check_sig() - Check the signature of a config
> +  *
> +@@ -269,20 +442,16 @@ static int fit_config_check_sig(const void *fit, i=
nt noffset, int conf_noffset,
> + 		FIT_DATA_POSITION_PROP,
> + 		FIT_DATA_OFFSET_PROP,
> + 	};
> +-
> +-	const char *prop, *end, *name;
> ++	char *node_inc[IMAGE_MAX_HASHED_NODES];
> ++	char hash_buf[FIT_MAX_HASH_PATH_BUF];
> + 	struct image_sign_info info;
> + 	const uint32_t *strings;
> +-	const char *config_name;
> + 	uint8_t *fit_value;
> + 	int fit_value_len;
> +-	bool found_config;
> + 	int max_regions;
> +-	int i, prop_len;
> + 	char path[200];
> + 	int count;
> +=20
> +-	config_name =3D fit_get_name(fit, conf_noffset, NULL);
> + 	debug("%s: fdt=3D%p, conf=3D'%s', sig=3D'%s'\n", __func__, key_blob,
> + 	      fit_get_name(fit, noffset, NULL),
> + 	      fit_get_name(key_blob, required_keynode, NULL));
> +@@ -297,45 +466,12 @@ static int fit_config_check_sig(const void *fit, i=
nt noffset, int conf_noffset,
> + 		return -1;
> + 	}
> +=20
> +-	/* Count the number of strings in the property */
> +-	prop =3D fdt_getprop(fit, noffset, "hashed-nodes", &prop_len);
> +-	end =3D prop ? prop + prop_len : prop;
> +-	for (name =3D prop, count =3D 0; name < end; name++)
> +-		if (!*name)
> +-			count++;
> +-	if (!count) {
> +-		*err_msgp =3D "Can't get hashed-nodes property";
> +-		return -1;
> +-	}
> +-
> +-	if (prop && prop_len > 0 && prop[prop_len - 1] !=3D '\0') {
> +-		*err_msgp =3D "hashed-nodes property must be null-terminated";
> +-		return -1;
> +-	}
> +-
> +-	/* Add a sanity check here since we are using the stack */
> +-	if (count > IMAGE_MAX_HASHED_NODES) {
> +-		*err_msgp =3D "Number of hashed nodes exceeds maximum";
> +-		return -1;
> +-	}
> +-
> +-	/* Create a list of node names from those strings */
> +-	char *node_inc[count];
> +-
> +-	debug("Hash nodes (%d):\n", count);
> +-	found_config =3D false;
> +-	for (name =3D prop, i =3D 0; name < end; name +=3D strlen(name) + 1, i=
++) {
> +-		debug("   '%s'\n", name);
> +-		node_inc[i] =3D (char *)name;
> +-		if (!strncmp(FIT_CONFS_PATH, name, strlen(FIT_CONFS_PATH)) &&
> +-		    name[sizeof(FIT_CONFS_PATH) - 1] =3D=3D '/' &&
> +-		    !strcmp(name + sizeof(FIT_CONFS_PATH), config_name)) {
> +-			debug("      (found config node %s)", config_name);
> +-			found_config =3D true;
> +-		}
> +-	}
> +-	if (!found_config) {
> +-		*err_msgp =3D "Selected config not in hashed nodes";
> ++	/* Build the node list from the config, ignoring hashed-nodes */
> ++	count =3D fit_config_get_hash_list(fit, conf_noffset,
> ++					 node_inc, IMAGE_MAX_HASHED_NODES,
> ++					 hash_buf, sizeof(hash_buf));
> ++	if (count < 0) {
> ++		*err_msgp =3D "Failed to build hash node list";
> + 		return -1;
> + 	}
> +=20
> +diff --git a/doc/usage/fit/signature.rst b/doc/usage/fit/signature.rst
> +index e5b5a8432e9..da08cc75c3a 100644
> +--- a/doc/usage/fit/signature.rst
> ++++ b/doc/usage/fit/signature.rst
> +@@ -353,20 +353,27 @@ meantime.
> + Details
> + -------
> + The signature node contains a property ('hashed-nodes') which lists all=
 the
> +-nodes that the signature was made over.  The image is walked in order a=
nd each
> +-tag processed as follows:
> ++nodes that the signature was made over.  The signer (mkimage) writes th=
is
> ++property as a record of what was included in the hash.  During verifica=
tion,
> ++however, U-Boot does not read 'hashed-nodes'. Instead it rebuilds the n=
ode
> ++list from the configuration's own image references (kernel, fdt, ramdis=
k,
> ++etc.), since 'hashed-nodes' is not itself covered by the signature. The
> ++rebuilt list always includes the root node, the configuration node, eac=
h
> ++referenced image node and its hash/cipher subnodes.
> ++
> ++The image is walked in order and each tag processed as follows:
> +=20
> + DTB_BEGIN_NODE
> +     The tag and the following name are included in the signature
> +-    if the node or its parent are present in 'hashed-nodes'
> ++    if the node or its parent are present in the node list
> +=20
> + DTB_END_NODE
> +     The tag is included in the signature if the node or its parent
> +-    are present in 'hashed-nodes'
> ++    are present in the node list
> +=20
> + DTB_PROPERTY
> +     The tag, the length word, the offset in the string table, and
> +-    the data are all included if the current node is present in 'hashed=
-nodes'
> ++    the data are all included if the current node is present in the nod=
e list
> +     and the property name is not 'data'.
> +=20
> + DTB_END
> +@@ -374,7 +381,7 @@ DTB_END
> +=20
> + DTB_NOP
> +     The tag is included in the signature if the current node is present
> +-    in 'hashed-nodes'
> ++    in the node list
> +=20
> + In addition, the signature contains a property 'hashed-strings' which c=
ontains
> + the offset and length in the string table of the strings that are to be
> +diff --git a/test/py/tests/test_vboot.py b/test/py/tests/test_vboot.py
> +index 7a7f9c379de..19f3f981379 100644
> +--- a/test/py/tests/test_vboot.py
> ++++ b/test/py/tests/test_vboot.py
> +@@ -362,10 +362,14 @@ def test_vboot(ubman, name, sha_algo, padding, sig=
n_options, required,
> +             shutil.copyfile(fit, efit)
> +             vboot_evil.add_evil_node(fit, efit, evil_kernel, 'kernel@')
> +=20
> +-            msg =3D 'Signature checking prevents use of unit addresses =
(@) in nodes'
> ++            # fit_check_sign catches this via signature mismatch (the @
> ++            # node is hashed instead of the real one)
> +             utils.run_and_log_expect_exception(
> +                 ubman, [fit_check_sign, '-f', efit, '-k', dtb],
> +-                1, msg)
> ++                1, 'Failed to verify required signature')
> ++
> ++            # bootm catches it earlier, at fit_check_format() time
> ++            msg =3D 'Signature checking prevents use of unit addresses =
(@) in nodes'
> +             run_bootm(sha_algo, 'evil kernel@', msg, False, efit)
> +=20
> +         # Create a new properly signed fit and replace header bytes
> diff --git a/meta/recipes-bsp/u-boot/u-boot_2026.01.bb b/meta/recipes-bsp=
/u-boot/u-boot_2026.01.bb
> index 5259fd5832..ac1b0b9b2b 100644
> --- a/meta/recipes-bsp/u-boot/u-boot_2026.01.bb
> +++ b/meta/recipes-bsp/u-boot/u-boot_2026.01.bb
> @@ -3,6 +3,8 @@ require u-boot.inc
> =20
>  DEPENDS +=3D "bc-native dtc-native gnutls-native python3-pyelftools-nati=
ve"
> =20
> +SRC_URI +=3D "file://CVE-2026-33243.patch"
> +
>  # workarounds for aarch64 kvm qemu boot regressions
>  SRC_URI:append:qemuarm64 =3D " file://disable-CONFIG_BLOBLIST.cfg"
>  SRC_URI:append:genericarm64 =3D " file://disable-CONFIG_BLOBLIST.cfg"


--=20
Yoann Congal
Smile ECS


