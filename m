Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AB19C10F07
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 13:56:08 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.32046.1701870966303556892
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Dec 2023 05:56:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=KjyQE5GD;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-5c6b9583dcbso1049088a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 05:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1701870965; x=1702475765; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JRWfzu3Wnt87v8DEAKCmKFk1CDwpZMCZ+ZfWBk/t0SE=;
        b=KjyQE5GDwY6KqW2M5HIGuAnVDjJX7XZpn5QnEfXxbOWQIhL3JJf3/hijiVn4exkbG5
         UtZbVRul5ANFa0Lu5ZjUFssvuT8OFaA2yGbvzAaZVK7uLvP0BGk7eILuyeqgkTaQ6Y6H
         /2nCCgSNIWce4HSP3V3+sQ6qkFobj5j9JYjv53zqi5M4m0JckLdiMm9bcwEq1JXP9ccL
         UzA3n/0y/tiHr2WUKf2Mdj6nBp9m4uBdY2xh3r61kdf/79SsT23z650xskaw324sMlQa
         Ysi8DKSvAJT64PMKu4UZ+XauQVHJGlBo/Ua8+O+7EH0/2g6GOweZQrWCbtzRSpm4Ybrr
         Xwkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701870965; x=1702475765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JRWfzu3Wnt87v8DEAKCmKFk1CDwpZMCZ+ZfWBk/t0SE=;
        b=VFMCcRluVjtRWhUgy55uSg8LJRnw0ChjH0hm5CuM8RHNLFdcpYBiM9mLD4NHbas4Kt
         5bpcKWuIfBjjHplnwn0bB6iafVnuMBqrhFC9vOTt/34ChHGLIBq7SVdRulk7ipWom5/b
         V/KS7EbHf7JjeMjaofiJjivnb6pLClPTgRyBkdfycSK9A1O8baBIClOTMKEvPQjyYBBU
         e5Uf/I0eYQvemXkMpfhqws1t1y5ai1QVwmuYPu1CU3tAopC8RQ42XTAIA3LyGOKD2exw
         TReXTx0YXzh6P4OFuw1toxn9EeJTxHJupMLGVor0K+RgtTFH34t3wRI/WZUSPClnNveT
         5Yfw==
X-Gm-Message-State: AOJu0YwEFSf3B+bxGTxrvK6txHfp31OWE1TCRFXihUWvTF28kjGc/chE
	t0L6MwcNdEspnI3+m2eZpS+I6hvYiry4ZHtt4iI=
X-Google-Smtp-Source: AGHT+IE+qsaycRiRGTLRuEf1UnAQJGAEFBFQt8ScUZSlVw4f8THmGJ/A2YswJcvqxz9MXiQdhvFYgA==
X-Received: by 2002:a05:6a20:3c90:b0:18b:902f:88fe with SMTP id b16-20020a056a203c9000b0018b902f88femr1021691pzj.9.1701870965303;
        Wed, 06 Dec 2023 05:56:05 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id h14-20020a170902680e00b001d07b659f91sm7887650plk.6.2023.12.06.05.56.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 05:56:05 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/11] mdadm: Backport fix for CVE-2023-28938
Date: Wed,  6 Dec 2023 03:55:46 -1000
Message-Id: <8cf02e6b60e2916b9e4832590257d5d184258e9c.1701870718.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701870718.git.steve@sakoman.com>
References: <cover.1701870718.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 13:56:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191889

From: Ashish Sharma <asharma@mvista.com>

Upstream-Status: Backport from [https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/patch/?id=7d374a1869d3a84971d027a7f4233878c8f25a62]
CVE: CVE-2023-28938
Signed-off-by: Ashish Sharma <asharma@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../mdadm/files/CVE-2023-28938.patch          | 80 +++++++++++++++++++
 meta/recipes-extended/mdadm/mdadm_4.1.bb      |  1 +
 2 files changed, 81 insertions(+)
 create mode 100644 meta/recipes-extended/mdadm/files/CVE-2023-28938.patch

diff --git a/meta/recipes-extended/mdadm/files/CVE-2023-28938.patch b/meta/recipes-extended/mdadm/files/CVE-2023-28938.patch
new file mode 100644
index 0000000000..1e2990d79a
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/CVE-2023-28938.patch
@@ -0,0 +1,80 @@
+From 7d374a1869d3a84971d027a7f4233878c8f25a62 Mon Sep 17 00:00:00 2001
+From: Mateusz Grzonka <mateusz.grzonka@intel.com>
+Date: Tue, 27 Jul 2021 10:25:18 +0200
+Subject: Fix memory leak after "mdadm --detail"
+
+Signed-off-by: Mateusz Grzonka <mateusz.grzonka@intel.com>
+Signed-off-by: Jes Sorensen <jsorensen@fb.com>
+---
+Upstream-Status: Backport from [https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/patch/?id=7d374a1869d3a84971d027a7f4233878c8f25a62]
+CVE: CVE-2023-28938
+Signed-off-by: Ashish Sharma <asharma@mvista.com>
+ 
+ Detail.c | 20 +++++++++-----------
+ 1 file changed, 9 insertions(+), 11 deletions(-)
+
+diff --git a/Detail.c b/Detail.c
+index ad56344f..d3af0ab5 100644
+--- a/Detail.c
++++ b/Detail.c
+@@ -66,11 +66,11 @@ int Detail(char *dev, struct context *c)
+ 	int spares = 0;
+ 	struct stat stb;
+ 	int failed = 0;
+-	struct supertype *st;
++	struct supertype *st = NULL;
+ 	char *subarray = NULL;
+ 	int max_disks = MD_SB_DISKS; /* just a default */
+ 	struct mdinfo *info = NULL;
+-	struct mdinfo *sra;
++	struct mdinfo *sra = NULL;
+ 	struct mdinfo *subdev;
+ 	char *member = NULL;
+ 	char *container = NULL;
+@@ -93,8 +93,7 @@ int Detail(char *dev, struct context *c)
+ 	if (!sra) {
+ 		if (md_get_array_info(fd, &array)) {
+ 			pr_err("%s does not appear to be an md device\n", dev);
+-			close(fd);
+-			return rv;
++			goto out;
+ 		}
+ 	}
+ 	external = (sra != NULL && sra->array.major_version == -1 &&
+@@ -108,16 +107,13 @@ int Detail(char *dev, struct context *c)
+ 			    sra->devs == NULL) {
+ 				pr_err("Array associated with md device %s does not exist.\n",
+ 				       dev);
+-				close(fd);
+-				sysfs_free(sra);
+-				return rv;
++				goto out;
+ 			}
+ 			array = sra->array;
+ 		} else {
+ 			pr_err("cannot get array detail for %s: %s\n",
+ 			       dev, strerror(errno));
+-			close(fd);
+-			return rv;
++			goto out;
+ 		}
+ 	}
+ 
+@@ -827,10 +823,12 @@ out:
+ 	close(fd);
+ 	free(subarray);
+ 	free(avail);
+-	for (d = 0; d < n_devices; d++)
+-		free(devices[d]);
++	if (devices)
++		for (d = 0; d < n_devices; d++)
++			free(devices[d]);
+ 	free(devices);
+ 	sysfs_free(sra);
++	free(st);
+ 	return rv;
+ }
+ 
+-- 
+cgit 
+
diff --git a/meta/recipes-extended/mdadm/mdadm_4.1.bb b/meta/recipes-extended/mdadm/mdadm_4.1.bb
index 5238a41df2..ca326fd1cb 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.1.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.1.bb
@@ -25,6 +25,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
            file://include_sysmacros.patch \
            file://0001-mdadm-skip-test-11spare-migration.patch \
            file://CVE-2023-28736.patch \
+           file://CVE-2023-28938.patch \
            "
 
 SRC_URI[md5sum] = "51bf3651bd73a06c413a2f964f299598"
-- 
2.34.1


