Return-Path: <valentin.boudevin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CB03D73E83
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 21:10:22 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25816.1769721018719264854
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jan 2026 13:10:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MtgQKYI5;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: valentin.boudevin@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-8946648487eso2586886d6.2
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 13:10:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769721018; x=1770325818; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qjqy9ylUYRSj52KfBrM1Vd/gMadKSuO5iHIHLuYGHf8=;
        b=MtgQKYI5tiG25Ze6/b6woc13xVskNt/GmKEpl+qkZN1eOe2RjAL6NorOgvQB8eN/GV
         JC/i4qQ6WdyUS/4tnWIlu+7BvPmbk5Q99zucfm3RH5MItusz5diZ0KtjfV7BMxMc1nh9
         5UhrY3gLON3FzE1PF3d2xI8fW5DDQVx4NmtKONwi75eFWw5H/hScyjx3syzCW3YbLGjh
         T4fXLAiyq3NS62V6snbJjlrLvZRUawjABOYEX5NuuqbV7K4aC0GXnyG1SZccXYAvPzCa
         z6AZbw5fG70PXT85maL/oJSP6lzirj8U5xozXxJUPODim9ZhtdBk+0GZWo/2hS4vWtUu
         CMQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769721018; x=1770325818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qjqy9ylUYRSj52KfBrM1Vd/gMadKSuO5iHIHLuYGHf8=;
        b=JZPj2aY5rZXMJESaSMHpS3MhSpqne9pN+Ca6K8wCGoLUdJuvsQFo0Q0kQftONGpqvX
         M24Rx7H+jEPnP3EDshZOXuNu6RlACQYXEGvYNAMjVUQxTKHtW8ceEYLgctTtS/YtTbaj
         Lu4ZrI3fc8cp0+nflR4YS25JqsJzMI2AltP9vX4NeHMumgCZVmBCsrYXmaKUWasLGsBE
         +62VhnDbxhpwF5Zev2j5AXJ/5lmfBJ7drDpxfFFZu12CyksGHc+/PKYXXWSNX749avAL
         IGnEijUutyhzdMsTN1nMAUtKje1ezuf29/sHudKf0BZYz0hVLbaIIE3F+tBOfgkfXx5u
         yMQg==
X-Gm-Message-State: AOJu0YyIMK8FIyYsCmk8wa58i8vUdNKZRsXHePs/usOrchUHbwpAhlkA
	oSj8d9KDfOc7WP5Eu5y7n51/Ol0C1q4Dqmk4SWdWI+9wggZelXUzp4eAwfzg9IWugSM=
X-Gm-Gg: AZuq6aK96DmihZPqHtVpj1YFxFUP2rcD+HEjPHJ/IguNzO4e+lgRIG8JJClC87j+BjH
	qJWBiNdPfwFNqGp+zRY/8szESz2lZP4+qeISEvTtXsBB9YmT6m+CNdvsl66HXQfg0iMW6nUvlGe
	DLUvntCqjDf3/9VWAy/MHHPfFxhcxHnY/RHF6ocZgCFh/VbyaUCXrTReD5oBebNN1jCDKD80rnL
	D1JXxApG21t05UJyFfy3U3iLnEwuVdQb/QkGCDlLUzXc45ojxeSnR7nZWqAY3ROMOsmk6jWX3Po
	Tokn/tDsngA22x6wPqQx08nxRm+rbXPBPtyhaF6r76MwKvcl2vtlblEVIwj6IlhHtxgzwRP8bB7
	1uhmGE1BiHicJ1H9WH4kWRbnbPyGxvp5rYP5YMEfC0uMr9tY/JuvwRfFqNCROODbQduTva1VK9Z
	TvakBp0WGK+GlfJFQ8zMkdKXvXBnmqMIgvsCh/3VxVwXyyOR/RaYjNNQw=
X-Received: by 2002:a05:620a:1a90:b0:8c7:eb2:1c3a with SMTP id af79cd13be357-8c9eb20ca23mr113819685a.1.1769721017675;
        Thu, 29 Jan 2026 13:10:17 -0800 (PST)
Received: from vboudevin-pc.mtl.sfl (mtl.savoirfairelinux.net. [208.88.110.46])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-894d36a5fb1sm45251326d6.9.2026.01.29.13.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 13:10:17 -0800 (PST)
From: ValentinBoudevin <valentin.boudevin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: daniel.turull@ericsson.com,
	jerome.oufella@savoirfairelinux.com,
	ValentinBoudevin <valentin.boudevin@gmail.com>
Subject: [PATCH v6 2/4] cvelistv5: add a new recipe
Date: Thu, 29 Jan 2026 16:10:10 -0500
Message-ID: <20260129211012.623827-3-valentin.boudevin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260129211012.623827-1-valentin.boudevin@gmail.com>
References: <188AFCD98EA3E578.3200434@lists.openembedded.org>
 <20260129211012.623827-1-valentin.boudevin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 21:10:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230161

This recipe is in charge of cloning and setting the cvelistv5
repository: https://github.com/CVEProject/cvelistV5

The variable CVELISTV5_USE_AUTOREV can be used to use AUTOREV to use the
latest available commit on the remote repository and stay
up-to-date with the latest CVE information available.

AUTOREV would make the build non-deterministic, turned off by default.

Signed-off-by: ValentinBoudevin <valentin.boudevin@gmail.com>
---
 .../cvelistv5-native/cvelistv5-native_git.bb  | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta/recipes-kernel/cvelistv5-native/cvelistv5-native_git.bb

diff --git a/meta/recipes-kernel/cvelistv5-native/cvelistv5-native_git.bb b/meta/recipes-kernel/cvelistv5-native/cvelistv5-native_git.bb
new file mode 100644
index 0000000000..f25dda9f3d
--- /dev/null
+++ b/meta/recipes-kernel/cvelistv5-native/cvelistv5-native_git.bb
@@ -0,0 +1,24 @@
+SUMMARY = "CVE List V5"
+DESCRIPTION = "Official CVE List. It is a catalog of all CVE Records identified by, or reported to, the CVE Program. \
+The cvelistV5 repository hosts downloadable files of CVE Records in the CVE Record Format."
+HOMEPAGE = "https://github.com/CVEProject/cvelistV5"
+LICENSE = "cve-tou"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/cve-tou;md5=4f7e96b3094e80e66b53359a8342c7f8"
+
+inherit native allarch
+
+SRC_URI = "git://github.com/CVEProject/cvelistV5.git;branch=main;protocol=https"
+CVELISTV5_USE_AUTOREV ?= "0"
+CVELISTV5_DEFAULT_SRCREV ?= "644ce1758db1773336ebebb6a0da90e132da0eb7"
+
+python __anonymous () {
+    if d.getVar("CVELISTV5_USE_AUTOREV") == "1":
+        d.setVar("SRCREV", d.getVar("AUTOREV"))
+    else:
+        d.setVar("SRCREV", d.getVar("CVELISTV5_DEFAULT_SRCREV"))
+}
+
+do_install(){
+	install -d ${D}${datadir}/cvelistv5-native
+	cp -r ${UNPACKDIR}/cvelistv5-git/* ${D}${datadir}/cvelistv5-native/
+}

