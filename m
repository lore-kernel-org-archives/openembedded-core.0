Return-Path: <asharma@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BC3BC4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 17:15:57 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.39477.1701191753178428083
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Nov 2023 09:15:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=RgKIvBMS;
 spf=pass (domain: mvista.com, ip: 209.85.210.172, mailfrom: asharma@mvista.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6cc02e77a9cso3253588b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 09:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1701191752; x=1701796552; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4adX4gEGrZybUGMP1GboxYOcJC6vpehRD19OqBbOQ50=;
        b=RgKIvBMS36hiRYEMUJfeg1zdV0ZAQ/Fm/XRck3NfZi6XYOxy0ogjwPxA07U/Fq8Fhj
         W8lnucL2NgUZ84msNGG67XQni+0RUW47FC1cqJrrUMINWKmcdrYyP3D/nbcasmBVTZqN
         JFVPx/lPt5UWZCHSDUsGJXVOZYS69jTuKwcQ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701191752; x=1701796552;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4adX4gEGrZybUGMP1GboxYOcJC6vpehRD19OqBbOQ50=;
        b=WUMnv7nuPkVS83LY3LmUCyJ569kRJ0oTCPNXZHPX/Y7u9g+FyEl74A114JsxiJnAa+
         5PqVq+HQLyUhtwnJ4eEWq8HMaDBrq1YpcW3FT+dl1/M5Rfm0olB2IWMq6mTAKTuzHvbK
         oLU6Ab9oJlQkegSJbjchilx/zIuSBaea6VnYWr1ujJeG/Q78fQJ8B3emG1PjRW+5beF5
         Nk4d0qUrD3uhiJAur/6XuHmqOKPkJzr0GelWOaPzDGNE2C6F60A9cHWGoaCm/xXwl5hQ
         5Xak43Awnz2/gf4pkwkDFT6yOST4SNIFVgEaQP7sc5J3hhsEYu0nJYMGFTXa1jPgKW/K
         9v5A==
X-Gm-Message-State: AOJu0YyDg1LaVzex1Wl8+FbkXyBMz2ufuJLQ55WZCqCsF8yoCV+9ikdi
	KDdW4XhUhcV7nRCJJMvvtrrFTCMf3cUeuihI9yFccg==
X-Google-Smtp-Source: AGHT+IHFvR/GmipViJL5s4J0mGAEQTEu2SKV5dgLK3jI1UYX4Z4JPNqdY3sn8p7abPvF+vTCcPvbag==
X-Received: by 2002:a05:6a20:7352:b0:18c:2d7:b84c with SMTP id v18-20020a056a20735200b0018c02d7b84cmr17491599pzc.61.1701191752241;
        Tue, 28 Nov 2023 09:15:52 -0800 (PST)
Received: from asharma-Latitude-3400 ([223.190.80.164])
        by smtp.gmail.com with ESMTPSA id u26-20020a62ed1a000000b006cbcd08ed56sm9166857pfh.56.2023.11.28.09.15.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Nov 2023 09:15:51 -0800 (PST)
Received: by asharma-Latitude-3400 (sSMTP sendmail emulation); Tue, 28 Nov 2023 22:43:36 +0530
From: Ashish Sharma <asharma@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Ashish Sharma <asharma@mvista.com>
Subject: [OE-core][dunfell][PATCH V2] mdadm: Backport fix for CVE-2023-28938
Date: Tue, 28 Nov 2023 22:43:34 +0530
Message-Id: <20231128171334.29700-1-asharma@mvista.com>
X-Mailer: git-send-email 2.24.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 17:15:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191382

Upstream-Status: Backport from [https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/patch/?id=7d374a1869d3a84971d027a7f4233878c8f25a62]
CVE: CVE-2023-28938
Signed-off-by: Ashish Sharma <asharma@mvista.com>
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
2.24.4


