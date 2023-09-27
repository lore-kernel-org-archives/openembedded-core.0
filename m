Return-Path: <asharma@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABA70E80ABB
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 14:40:33 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.19219.1695825630260746498
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Sep 2023 07:40:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=b270rmnG;
 spf=pass (domain: mvista.com, ip: 209.85.216.53, mailfrom: asharma@mvista.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-27763c2c22eso4795811a91.3
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 07:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1695825629; x=1696430429; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9HZv0JFNzROfk0jZn8iH0Ux7csnn/7g3UCf4SByHOuE=;
        b=b270rmnGG9dVqu9huyiWgKkD6+9shiWgskcCDBF9qMlanMYkoOGwKpw5MdtBFnB1y1
         YEO7w2PIfEk3LUwPxJomZLCeQW1/+QrD0wW5sXdhgEMkKfQVz3I+WwCVvM4MpqFkEpIb
         Y6BsbAbQltz7apwnMpcicxJfek4cDsroXL1sQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695825629; x=1696430429;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9HZv0JFNzROfk0jZn8iH0Ux7csnn/7g3UCf4SByHOuE=;
        b=Ixs/fTlgEmnaUS6IkhWjy6y2PyKT+SGgFjY5BbFJD39AK48EZb7z3DZ4dMrJgHcbg9
         rsC7nAuXF3U5gGpe5uwBIK+Pgc6pVnpUB3lZrQWD2iGDw8ozmawYrNsdG0ZTbpRTAAd2
         +EDCwtjWB5RDN2qxPSrpktEJzIWnwNS/eJf1oaCzrTbFWJQpbvemzFbqIo9yQDG576Vi
         vcHIu2fZS3PGHSMS7fFQVg5vARJh7NT3BHy+/lSb4arakbS/guvwCdMVxZuTgtrQLTMd
         Ja0Fqk7rBoy4tnakOJtj03rn9JeRPPK8AjafViajJJaoFZNXu70JqPX0ONt6oj4qmvZ2
         FsYQ==
X-Gm-Message-State: AOJu0Yyy/OiAddrzCaN1+xCWv/sx6nx5KXq6Xo0qzHxU9u1qHRo+SEx/
	f+WjGbPTGHpC8cSYVR5jby3QGxt3QSupZt2KFm8=
X-Google-Smtp-Source: AGHT+IF3KPHaa/n6oX4c+IMv/ybjnSOY1zpdSLlDknxECZ+izlwkXIV8f3VBVYe//0KU1vv2cl7e7A==
X-Received: by 2002:a17:90b:1bd2:b0:263:fbe5:2125 with SMTP id oa18-20020a17090b1bd200b00263fbe52125mr1719098pjb.15.1695825629135;
        Wed, 27 Sep 2023 07:40:29 -0700 (PDT)
Received: from asharma-Latitude-3400 ([122.161.87.225])
        by smtp.gmail.com with ESMTPSA id n1-20020a17090a670100b00277724dbfc1sm4087970pjj.53.2023.09.27.07.40.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Sep 2023 07:40:28 -0700 (PDT)
Received: by asharma-Latitude-3400 (sSMTP sendmail emulation); Wed, 27 Sep 2023 20:08:13 +0530
From: Ashish Sharma <asharma@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Ashish Sharma <asharma@mvista.com>
Subject: [OE-core][dunfell][PATCH] mdadm: Backport fix for CVE-2023-28736
Date: Wed, 27 Sep 2023 20:08:09 +0530
Message-Id: <20230927143809.24915-1-asharma@mvista.com>
X-Mailer: git-send-email 2.24.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 14:40:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188330

Signed-off-by: Ashish Sharma <asharma@mvista.com>
---
 .../mdadm/files/CVE-2023-28736.patch          | 77 +++++++++++++++++++
 meta/recipes-extended/mdadm/mdadm_4.1.bb      |  1 +
 2 files changed, 78 insertions(+)
 create mode 100644 meta/recipes-extended/mdadm/files/CVE-2023-28736.patch

diff --git a/meta/recipes-extended/mdadm/files/CVE-2023-28736.patch b/meta/recipes-extended/mdadm/files/CVE-2023-28736.patch
new file mode 100644
index 00000000000..8e0a06cbc7b
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
index bb77759cf97..5238a41df20 100644
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
2.24.4


