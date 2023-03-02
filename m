Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51C83C678D4
	for <webhook@archiver.kernel.org>; Thu,  2 Mar 2023 07:48:38 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.9749.1677743314304261594
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Mar 2023 23:48:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=gb2Sg1jA;
 spf=pass (domain: mvista.com, ip: 209.85.210.176, mailfrom: vkumbhar@mvista.com)
Received: by mail-pf1-f176.google.com with SMTP id c4so6648190pfl.0
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 23:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1677743313;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0QDvx/DgjUapOG85+FhL6kKKlfKNoLmJt8dMaX/aozE=;
        b=gb2Sg1jASkhqUMtjmvwxyzXEXGdbprzZcVE2OmTl21Irz+g6XvThU0qOTfAZw9jutz
         A/QLNCP+sD2PJYRFuKkS0aiKQ56vTSlPubzB9iQjTYdEHk3bOfr02K2rLx+diHuHeeVm
         NSBYD3fXPRkE7oWOuv2W1G/lYCVm1Z+mfrfaM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677743313;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0QDvx/DgjUapOG85+FhL6kKKlfKNoLmJt8dMaX/aozE=;
        b=cMTi1kxKnwi/zfeO5570BD/zBTmI65jjThadbkMs9sE7LO0Pq51CDAet9suFf1ttwG
         UBzYZb3qpUyTa0kUvIY63f5G/vfytKHlb+mbhE6jfH1KAnuyfQKet6azh9ckC0pI/NBy
         jb79vcZNyeTGMl1n3djQrZj6dqweI1shg9jNQTWDmSOF5Oe+G8WTJzUih1K1pNT+RWG6
         GhhBEAedPkmelR+ooFcTaDlutpSjZKXxL1uXe85W86S9pG6Hd25KyRJK7j9X8aOXthc4
         UWR4Dk0iVe6MUl/Crp3LGZewKMsR1YZ1UrSMXVET1oFrkKuvRxgcJmnRDR3H69+mmKWY
         X+1A==
X-Gm-Message-State: AO0yUKUqFQvqM+ODz2k5dlVmo9unun8kaeJllBFlpBA00sJmpJ5DLP6r
	JO+yuLQ0LOZVJLnPxVSSQN5ToRDwobIN2Ad9
X-Google-Smtp-Source: AK7set/Ys2SuAfe3LfciTqg8sYnVpErtEGfoz5mhFPjhp+be686UNBWg+H56yl+C1OVmls2KmHVvhQ==
X-Received: by 2002:a62:30c1:0:b0:5e4:5b2d:5864 with SMTP id w184-20020a6230c1000000b005e45b2d5864mr7365200pfw.5.1677743313250;
        Wed, 01 Mar 2023 23:48:33 -0800 (PST)
Received: from localhost.localdomain ([116.74.133.147])
        by smtp.gmail.com with ESMTPSA id h26-20020aa786da000000b005e4c3e2022fsm9086271pfo.72.2023.03.01.23.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 23:48:32 -0800 (PST)
From: Vivek Kumbhar <vkumbhar@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vivek Kumbhar <vkumbhar@mvista.com>
Subject: [OE-core][kirkstone][PATCH v2] rpm: fix CVE-2021-35938 races with chown/chmod/capabilities calls during installation
Date: Thu,  2 Mar 2023 13:18:16 +0530
Message-Id: <20230302074816.1017714-1-vkumbhar@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Mar 2023 07:48:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177957

Set file metadata via fd-based ops for everything but symlinks

Regular file ops are fd-based already, for the rest we need to open them
manually. Files with temporary suffix must never be followed, for
directories (and pre-existing FA_TOUCHed files) use the rpm symlink
"root or target owner allowed" rule wrt following.

This mostly fixes CVE-2021-35938, but as we're not yet using dirfd-based
operatiosn for everything there are corner cases left undone. And then
there's the plugin API which needs updating for all this.

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
---
 .../rpm/files/CVE-2021-35938.patch            | 36 +++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_4.17.1.bb       |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/files/CVE-2021-35938.patch

diff --git a/meta/recipes-devtools/rpm/files/CVE-2021-35938.patch b/meta/recipes-devtools/rpm/files/CVE-2021-35938.patch
new file mode 100644
index 0000000000..9b2e7ee91f
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/CVE-2021-35938.patch
@@ -0,0 +1,36 @@
+From 25a435e90844ea98fe5eb7bef22c1aecf3a9c033 Mon Sep 17 00:00:00 2001
+From: Panu Matilainen <pmatilai@redhat.com>
+Date: Mon, 14 Feb 2022 14:29:33 +0200
+Subject: [PATCH] Set file metadata via fd-based ops for everything but
+ symlinks
+ 
+Upstream-Status: Backport [https://github.com/rpm-software-management/rpm/commit/25a435e90844ea98fe5eb7bef22c1aecf3a9c033]
+CVE: CVE-2023-25193
+Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
+---
+ lib/fsm.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/lib/fsm.c b/lib/fsm.c
+index 935a0a5c6..50c431d2a 100644
+--- a/lib/fsm.c
++++ b/lib/fsm.c
+@@ -1000,6 +1000,15 @@ int rpmPackageFilesInstall(rpmts ts, rpmte te, rpmfiles files,
+                 if (!IS_DEV_LOG(fp->fpath))
+                     rc = RPMERR_UNKNOWN_FILETYPE;
+             }
++            
++            if (!rc && fd == -1 && !S_ISLNK(fp->sb.st_mode)) {
++		/* Only follow safe symlinks, and never on temporary files */
++		fd = fsmOpenat(di.dirfd, fp->fpath,
++				fp->suffix ? AT_SYMLINK_NOFOLLOW : 0);
++		if (fd < 0)
++		    rc = RPMERR_OPEN_FAILED;
++	    }
++
+ 	} else if (firstlink && rpmfiArchiveHasContent(fi)) {
+ 	    /*
+ 	     * Tricksy case: this file is a being skipped, but it's part of
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/rpm/rpm_4.17.1.bb b/meta/recipes-devtools/rpm/rpm_4.17.1.bb
index 9b6446f265..e12d10c1e9 100644
--- a/meta/recipes-devtools/rpm/rpm_4.17.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.17.1.bb
@@ -40,6 +40,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.17.x;protoc
            file://0001-docs-do-not-build-manpages-requires-pandoc.patch \
            file://0001-build-pack.c-do-not-insert-payloadflags-into-.rpm-me.patch \
            file://0001-configure.ac-add-linux-gnux32-variant-to-triplet-han.patch \
+           file://CVE-2021-35938.patch \
            "
 
 PE = "1"
-- 
2.25.1


