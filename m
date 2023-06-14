Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F2B8EB64DB
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 09:30:04 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.7372.1686734994646226471
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 02:29:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=SzyiXL2Z;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-98284402adeso19027266b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 02:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686734993; x=1689326993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R72XbUZP07+Fd6bdvlwr0ZzZmqkzJAaankfametDuqc=;
        b=SzyiXL2ZwSOdC3wz/YCQC3E77A97DsUAdxjttMjS6SkZkRQbO1yXbpWTXuuqS6X77G
         xbwLmLgfn2hn/xCTIA4mJLfsCUP/EEuGXikhVab3OrltlfNQEaa4DT0aclyZQ12MneD1
         ZltDYbg2tYPJ0ZyD3HJJAncycTJ6uXAp4YjTAlokrBTcmUwaqdKy2HKfS8PJIMy4nQKf
         Xf3tnZ/IsWC5GWeIP2l3sCDmFiNZEmjVotO9HjF4E7bqtt1K4mL+lZhFlaxEh80hJEvk
         lVBzyu7TYCi6m6B5LOrpP0jMN/eQeVWeAXnGJOZTnYsf6yndJlQvhDNsqELemd+FnGIi
         wPBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686734993; x=1689326993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R72XbUZP07+Fd6bdvlwr0ZzZmqkzJAaankfametDuqc=;
        b=PEKEbezlIJ0S2h9tKEqT/OF6+vF0QK1mbQi9jXXKBFwsmZ/eMBVLM3CsfW6BtKGe3R
         59KDz74/PX78/JQSnNs97NYu7G1bFThRx0E6d4dGqdEQRYrui3QcZ2A5itDptfEUSVEY
         wm+2UD5rSyXEoHPW4FtUMc9ndXGQDflhhwd7GHbVbBgCmR7LbMuLyypIEhafUBoz00gW
         5lgvXD54/oYZxMCpOjDqI2/+aMYJX18LC90SGikErx7qRLlb74J4JITal4V6o2DzYcNn
         4SFM3Jx6NyzClMnFVNQX2piQiZuiDti61xPSOwJy8NNjJXNoEtqEGrBy026qZzGUOQA3
         3LeQ==
X-Gm-Message-State: AC+VfDzE1RPV96wcSSvnJHqkNZ16qjZU9BusOqdz3Q6pHvnK5h+WSae8
	OpbxXzp3pGIlQd7TWHLtavxpTZVRsKo=
X-Google-Smtp-Source: ACHHUZ6vhUyHmwnkho9mgiV37CAHd+TrsUE1KVDOUD1IGwaiprZ9pcJwpWhRwr3s3sI1Wp6d0r6Abg==
X-Received: by 2002:a17:907:96a2:b0:978:73af:1bec with SMTP id hd34-20020a17090796a200b0097873af1becmr1056990ejc.33.1686734993097;
        Wed, 14 Jun 2023 02:29:53 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id k19-20020a170906129300b0097381fe7aaasm7747375ejb.180.2023.06.14.02.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 02:29:52 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 47/55] squashfs-tools: upgrade 4.5.1 -> 4.6.1
Date: Wed, 14 Jun 2023 11:29:10 +0200
Message-Id: <20230614092918.4065570-47-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230614092918.4065570-1-alex@linutronix.de>
References: <20230614092918.4065570-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 09:30:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182792

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ....sh-do-not-write-original-timestamps.patch | 30 -------------------
 .../squashfs-tools/squashfs-tools_git.bb      |  8 ++---
 2 files changed, 3 insertions(+), 35 deletions(-)
 delete mode 100644 meta/recipes-devtools/squashfs-tools/files/0001-install-manpages.sh-do-not-write-original-timestamps.patch

diff --git a/meta/recipes-devtools/squashfs-tools/files/0001-install-manpages.sh-do-not-write-original-timestamps.patch b/meta/recipes-devtools/squashfs-tools/files/0001-install-manpages.sh-do-not-write-original-timestamps.patch
deleted file mode 100644
index ed1d2f5b3b2..00000000000
--- a/meta/recipes-devtools/squashfs-tools/files/0001-install-manpages.sh-do-not-write-original-timestamps.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From b44b00dae195d8587857c7e8054e9be4eaa1f8b3 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Thu, 7 Apr 2022 09:26:09 +0200
-Subject: [PATCH] install-manpages.sh: do not write original timestamps into
- .gz metadata
-
-This helps binary reproducibility.
-
-Upstream-Status: Submitted [https://github.com/plougher/squashfs-tools/pull/177]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- generate-manpages/install-manpages.sh | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/generate-manpages/install-manpages.sh b/generate-manpages/install-manpages.sh
-index d4c9e91..6a43b89 100755
---- a/generate-manpages/install-manpages.sh
-+++ b/generate-manpages/install-manpages.sh
-@@ -56,7 +56,7 @@ for i in mksquashfs unsquashfs sqfstar sqfscat; do
- 		exit 1
- 	fi
- 
--	if ! gzip -f9 $2/$i.1; then
-+	if ! gzip -n -f9 $2/$i.1; then
- 		echo "$0: Compressing installed manpage failed.  Aborting" >&2
- 		exit 1
- 	fi
--- 
-2.30.2
-
diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
index 4e009d26255..982a43f8899 100644
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
@@ -7,11 +7,9 @@ SECTION = "base"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-PV = "4.5.1"
-SRCREV = "afdd63fc386919b4aa40d573b0a6069414d14317"
-SRC_URI = "git://github.com/plougher/squashfs-tools.git;protocol=https;branch=master \
-           file://0001-install-manpages.sh-do-not-write-original-timestamps.patch \
-           "
+PV = "4.6.1"
+SRCREV = "d8cb82d9840330f9344ec37b992595b5d7b44184"
+SRC_URI = "git://github.com/plougher/squashfs-tools.git;protocol=https;branch=v6.1.1"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 
 S = "${WORKDIR}/git"
-- 
2.30.2


