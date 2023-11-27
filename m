Return-Path: <asharma@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AD24C4167B
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 17:04:50 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.100083.1701104684286107311
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Nov 2023 09:04:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=REevV+cD;
 spf=pass (domain: mvista.com, ip: 209.85.210.181, mailfrom: asharma@mvista.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6b20a48522fso3480164b3a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 09:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1701104683; x=1701709483; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ovz+1b3M2fPgXy1qoSHuLVb75K4frpLA9vHYtO4rmT0=;
        b=REevV+cDs9gvG8PCij0kifIFye1zMcB3MSJKJEEiRbXOKMcvQvpXH52I2FJr2Qu48A
         dsDpFXNYr2CytcBxRDmgFPLkirgzLfcozE+UG8w0mJMJmVUHP3bGgC+2bMtiTtoiW1xo
         njEmwA6kSsU0fiXluV3CSrjV6jLGWT5rt2xVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701104683; x=1701709483;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ovz+1b3M2fPgXy1qoSHuLVb75K4frpLA9vHYtO4rmT0=;
        b=seV8U/RR1uuov8R5MyQ/fgJLHJaucXfkOg1I+3HsPJw7EwUgexkOXxg+bufCplIFJU
         vYYV97Ttjv4AaSlyaVEDFpGNRzjUVd/0j+7F32g9Of3wUtASv6y+M66oZcIFKDPtYJrs
         GWg6VKVY2wO1gCO3FZ5oIlBFaqOdTLIPVAXl/LIIsuCzPsVHDLTjFRVl4NEbWyIXZjRQ
         EjotGFGPccx0+Q077bzrbqBverMUuTxTY1QAK4aoMszTdZnajSH+epN33Uo5JdoqssiU
         Z4XqG6UkKPNtHOHJzQLLcuj3gvhK602zg7353s0nvc3Br1FEtKhY59p+wROvwiACVcUh
         1laQ==
X-Gm-Message-State: AOJu0YywEzBPbJsbGj7d3OSkBwJUA4SDSG0j4wiUyTn/8hxcNIo1eGBk
	hhYH9UV9AGRvoGPL8XBMmvv9SOzFvquMSvsR0Uw=
X-Google-Smtp-Source: AGHT+IE2zZjl4nCG4HO4tgKQFuiy/LPXtLlZhaElCvHN8UiFkwfPtkCPiIPoUdRGKwIuaFAPL5X+SQ==
X-Received: by 2002:a05:6a00:938f:b0:6cb:a18a:22b5 with SMTP id ka15-20020a056a00938f00b006cba18a22b5mr13719443pfb.2.1701104683301;
        Mon, 27 Nov 2023 09:04:43 -0800 (PST)
Received: from asharma-Latitude-3400 ([223.190.80.164])
        by smtp.gmail.com with ESMTPSA id ei44-20020a056a0080ec00b006c988fda657sm7743044pfb.177.2023.11.27.09.04.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Nov 2023 09:04:43 -0800 (PST)
Received: by asharma-Latitude-3400 (sSMTP sendmail emulation); Mon, 27 Nov 2023 22:32:28 +0530
From: Ashish Sharma <asharma@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Ashish Sharma <asharma@mvista.com>
Subject: [OE-core][dunfell][PATCH] mdadm: Backport fix CVE-2023-28938
Date: Mon, 27 Nov 2023 22:32:23 +0530
Message-Id: <20231127170223.28941-1-asharma@mvista.com>
X-Mailer: git-send-email 2.24.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 17:04:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191310

Signed-off-by: Ashish Sharma <asharma@mvista.com>
---
 .../mdadm/files/CVE-2023-28938.patch          | 80 +++++++++++++++++++
 meta/recipes-extended/mdadm/mdadm_4.1.bb      |  1 +
 2 files changed, 81 insertions(+)
 create mode 100644 meta/recipes-extended/mdadm/files/CVE-2023-28938.patch

diff --git a/meta/recipes-extended/mdadm/files/CVE-2023-28938.patch b/meta/recipes-extended/mdadm/files/CVE-2023-28938.patch
new file mode 100644
index 00000000000..1e2990d79af
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
index 5238a41df20..ca326fd1cb1 100644
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
2.24.4


