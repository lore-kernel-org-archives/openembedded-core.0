Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2D90E728E1
	for <webhook@archiver.kernel.org>; Sat, 30 Sep 2023 19:40:24 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web11.47401.1696102821699495219
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Sep 2023 12:40:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=yTRJnJdy;
 spf=softfail (domain: sakoman.com, ip: 209.85.160.46, mailfrom: steve@sakoman.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-1dd8304b980so3595799fac.2
        for <openembedded-core@lists.openembedded.org>; Sat, 30 Sep 2023 12:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696102820; x=1696707620; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mC+3C8oxYwk136v1RPQ41CWRX6xO+vAEuFcidQxvvko=;
        b=yTRJnJdyNFIISQIuRrR4yALlWyUr/AWwgvfO/nJq/vAuavxNVrYDbN/NOoU7EpYejo
         9Cyq2aZe2qTGciNdSVi8q6WkPHa3x2K9faZaJ6O5VkqxfdVl7u4of43+KBMmBIirczK3
         KLZ3nYfmc5RUAPCNzNUNsVJA11GqUfCJKpOmYQSXeqPvuYWdXkKLrnPx7Lwm4wglLIeQ
         NRIMfCNowhKQusS9YthFY9RAwXov8fVF45H+Tsz4DOYf0Cz2Nwv8QRWy9s71lh7T8q5M
         BXhrNVgf++nn4r8nc3IfKZiYUVxkb7xm4PptJqXxgDsJ6lBbmsqZqxg8FoGWMLIveEOi
         UcTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696102820; x=1696707620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mC+3C8oxYwk136v1RPQ41CWRX6xO+vAEuFcidQxvvko=;
        b=i7hCW16EK0qW/LcCZZWSYsCgjeEbg3hOS6mPZbSWNuz0g2GCmpr7VIxBIUFJvj+hEf
         rAYv+FYNxH8EcNNpDexHtJ0E3YGDSXBwnZVvhhaoZmaV9SwjiSPznquCE8IC1wiruQ8X
         3BRXV+/mW5Hyyni8sE1FmMC688In2Ew2g0pp7GpwpEb/wmb28caELWJYeG9kN6IFYoOX
         L7hL7T0eYenxEv1TipnP/MecyO62c47L3WOkF9YQiLiA2wp0z6It+ENuWW6AovCSGyuI
         ZZpPLne2DDgRIeBUxIcp0ufVHDZaUDLizFfEy9r89QX0bp72rwFF4OCfzC0qMCbKLUfY
         0HLA==
X-Gm-Message-State: AOJu0YycnUxINoRWxYFrkJN4MuScPK7AFO4pOaPmBkpzg3XUpiZKoIwF
	t6IOqBaQkILGOPsxPWgZVE9IZVikFsPm/gmTojA=
X-Google-Smtp-Source: AGHT+IHB6iYoixgGKZyLeB6pCxzJbZVJivIATxJuIRSTtbKTJxWC7PGOZAv5hMBDWsffTN7htIqIkg==
X-Received: by 2002:a05:6870:1691:b0:1d7:876:c825 with SMTP id j17-20020a056870169100b001d70876c825mr8912307oae.48.1696102820602;
        Sat, 30 Sep 2023 12:40:20 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id p2-20020a62ab02000000b006936d053677sm2880011pff.133.2023.09.30.12.40.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Sep 2023 12:40:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/13] mdadm: Backport fix for CVE-2023-28736
Date: Sat, 30 Sep 2023 09:39:58 -1000
Message-Id: <fb37fa3661095b8ebe68c2ffa36aabf35da30b91.1696102675.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696102675.git.steve@sakoman.com>
References: <cover.1696102675.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Sep 2023 19:40:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188466

From: Ashish Sharma <asharma@mvista.com>

Signed-off-by: Ashish Sharma <asharma@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../mdadm/files/CVE-2023-28736.patch          | 77 +++++++++++++++++++
 meta/recipes-extended/mdadm/mdadm_4.1.bb      |  1 +
 2 files changed, 78 insertions(+)
 create mode 100644 meta/recipes-extended/mdadm/files/CVE-2023-28736.patch

diff --git a/meta/recipes-extended/mdadm/files/CVE-2023-28736.patch b/meta/recipes-extended/mdadm/files/CVE-2023-28736.patch
new file mode 100644
index 0000000000..8e0a06cbc7
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/CVE-2023-28736.patch
@@ -0,0 +1,77 @@
+From ced5fa8b170ad448f4076e24a10c731b5cfb36ce Mon Sep 17 00:00:00 2001
+From: Blazej Kucman <blazej.kucman@intel.com>
+Date: Fri, 3 Dec 2021 15:31:15 +0100
+Subject: mdadm: block creation with long names
+
+This fixes buffer overflows in create_mddev(). It prohibits
+creation with not supported names for DDF and native. For IMSM,
+mdadm will do silent cut to 16 later.
+
+Signed-off-by: Mariusz Tkaczyk <mariusz.tkaczyk@linux.intel.com>
+Signed-off-by: Blazej Kucman <blazej.kucman@intel.com>
+Signed-off-by: Jes Sorensen <jsorensen@fb.com>
+---
+
+Upstream-Status: Backport from [https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/patch/?id=ced5fa8b170ad448f4076e24a10c731b5cfb36ce]
+CVE: CVE-2023-28736
+Signed-off-by: Ashish Sharma <asharma@mvista.com>
+
+ mdadm.8.in | 5 +++++
+ mdadm.c    | 9 ++++++++-
+ mdadm.h    | 5 +++++
+ 3 files changed, 18 insertions(+), 1 deletion(-)
+
+diff --git a/mdadm.8.in b/mdadm.8.in
+index 28d773c2..68e100cb 100644
+--- a/mdadm.8.in
++++ b/mdadm.8.in
+@@ -2186,6 +2186,11 @@ is run, but will be created by
+ .I udev
+ once the array becomes active.
+ 
++The max length md-device name is limited to 32 characters.
++Different metadata types have more strict limitation
++(like IMSM where only 16 characters are allowed).
++For that reason, long name could be truncated or rejected, it depends on metadata policy.
++
+ As devices are added, they are checked to see if they contain RAID
+ superblocks or filesystems.  They are also checked to see if the variance in
+ device size exceeds 1%.
+diff --git a/mdadm.c b/mdadm.c
+index 91e67467..26299b2e 100644
+--- a/mdadm.c
++++ b/mdadm.c
+@@ -1359,9 +1359,16 @@ int main(int argc, char *argv[])
+ 			mdfd = open_mddev(devlist->devname, 1);
+ 			if (mdfd < 0)
+ 				exit(1);
+-		} else
++		} else {
++			char *bname = basename(devlist->devname);
++
++			if (strlen(bname) > MD_NAME_MAX) {
++				pr_err("Name %s is too long.\n", devlist->devname);
++				exit(1);
++			}
+ 			/* non-existent device is OK */
+ 			mdfd = open_mddev(devlist->devname, 0);
++		}
+ 		if (mdfd == -2) {
+ 			pr_err("device %s exists but is not an md array.\n", devlist->devname);
+ 			exit(1);
+diff --git a/mdadm.h b/mdadm.h
+index 54567396..c7268a71 100644
+--- a/mdadm.h
++++ b/mdadm.h
+@@ -1880,3 +1880,8 @@ enum r0layout {
+ #define INVALID_SECTORS 1
+ /* And another special number needed for --data_offset=variable */
+ #define VARIABLE_OFFSET 3
++
++/**
++ * This is true for native and DDF, IMSM allows 16.
++ */
++#define MD_NAME_MAX 32
+-- 
+cgit 
+
diff --git a/meta/recipes-extended/mdadm/mdadm_4.1.bb b/meta/recipes-extended/mdadm/mdadm_4.1.bb
index bb77759cf9..5238a41df2 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.1.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.1.bb
@@ -24,6 +24,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
            file://0001-mdadm-add-option-y-for-use-syslog-to-recive-event-re.patch \
            file://include_sysmacros.patch \
            file://0001-mdadm-skip-test-11spare-migration.patch \
+           file://CVE-2023-28736.patch \
            "
 
 SRC_URI[md5sum] = "51bf3651bd73a06c413a2f964f299598"
-- 
2.34.1


