Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 597F5C433EF
	for <webhook@archiver.kernel.org>; Mon,  7 Feb 2022 09:16:29 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web09.20083.1644225387770998194
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Feb 2022 01:16:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SG83Z0Z/;
 spf=pass (domain: gmail.com, ip: 209.85.208.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id cz16so10283958edb.8
        for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Feb 2022 01:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vSmm+cFOTfiyyDTwr+fR5lOikC+fNxxDYc+3iUzKLtU=;
        b=SG83Z0Z/8SEFGwt6pyx5kmrX0qZ1TBCsJ0Au8j2LjgOm7irIuV8RPXV1h2ytN5Y4pQ
         aWjy8xApQyMZFwgPwFYnwW3+MdUxqSfhaVTEnEn7nvgX//4XQY2Vf3/BK2v7D2iyOXQe
         Ve+GYJZMCxJPcix+oJBcyNuqC/oLwiciFLKoB/Dgiygfle8z8f4Xa6b69zlVG0zCgq3E
         HWJCWG7P6goqxGESQxjR6jGOqPprGRmHLqAnlKcCEv4QBpv85aAW8Ua2vuy+ZAmDGaJk
         6QgDqeCD37WSDrWU9UVi3rp+JMwcam7CJGFVyAgkTbHEgrzreQxz4yGZEdHqxj9KJ/ez
         bi/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vSmm+cFOTfiyyDTwr+fR5lOikC+fNxxDYc+3iUzKLtU=;
        b=TTzncjvymk2gOFFb1t+Y7xlPIYd/yrfql470Nx3Of898Ex0/lTYE3hZ/Erf9OzeMRH
         6FFExwuEX6YsEunfZv3JAXNfoTIFgB/7YcJyfzmiQyCatOTCX6KsAUGe9yETm/W7+20d
         J2RtRLobFhvxDBG7FUIuR9ZMI5zhd0uSe5ujGNvB81ThivlGwqYSe7hDC9Rf3YXCMpff
         wuMhxjzSWWPRETLuFEEoDDIFb96Cp4N7XAmJtczMyhs1Y6Jt20ibyhq+LtQ5J64d1J8W
         qNCxu+mjFcwTBAaS5fNaGsVX20pJI067LXYxqne/DeArysLdLlM932HCygey671/dTQL
         /8xg==
X-Gm-Message-State: AOAM533zmR/NF9X7Bn56lk3CsqDZpdvE23WWBh5cWVEosWYviqa7tXvi
	RCxHLM/EJc1LeuIEzneQ7wstQcPNC44=
X-Google-Smtp-Source: 
 ABdhPJwg0eo4nKA66vTWDNlAYD7P8zx61tIeoykAPeylWlHi4xMh5qSm5SWCNzEe9z6vWaTDhdF0aw==
X-Received: by 2002:a05:6402:3511:: with SMTP id
 b17mr12842738edd.244.1644225386161;
        Mon, 07 Feb 2022 01:16:26 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 e18sm5106614edj.85.2022.02.07.01.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 01:16:25 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] git: restore reproducibility on centos 7
Date: Mon,  7 Feb 2022 10:16:21 +0100
Message-Id: <20220207091621.756173-1-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Feb 2022 09:16:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161456

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...-do-not-force-RHEL-7-specific-build-.patch | 30 +++++++++++++++++++
 meta/recipes-devtools/git/git_2.35.1.bb       |  3 +-
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch

diff --git a/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch b/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch
new file mode 100644
index 0000000000..e0f702f327
--- /dev/null
+++ b/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch
@@ -0,0 +1,30 @@
+From 3b2505435bc6f982226eff84bad6bf9a36381573 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Mon, 7 Feb 2022 10:13:15 +0100
+Subject: [PATCH] config.mak.uname: do not force RHEL-7 specific build settings
+
+This breaks reproducibility as git builds on centos 7 use
+different flags than git builds on other host distros.
+
+Upstream-Status: Inappropriate [upstream needs to check compiler and component versions properly]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ config.mak.uname | 5 -----
+ 1 file changed, 5 deletions(-)
+
+diff --git a/config.mak.uname b/config.mak.uname
+index c48db45..9b3e9bf 100644
+--- a/config.mak.uname
++++ b/config.mak.uname
+@@ -63,11 +63,6 @@ ifeq ($(uname_S),Linux)
+ 	PROCFS_EXECUTABLE_PATH = /proc/self/exe
+ 	HAVE_PLATFORM_PROCINFO = YesPlease
+ 	COMPAT_OBJS += compat/linux/procinfo.o
+-	# centos7/rhel7 provides gcc 4.8.5 and zlib 1.2.7.
+-	ifneq ($(findstring .el7.,$(uname_R)),)
+-		BASIC_CFLAGS += -std=c99
+-		NO_UNCOMPRESS2 = YesPlease
+-	endif
+ endif
+ ifeq ($(uname_S),GNU/kFreeBSD)
+ 	HAVE_ALLOCA_H = YesPlease
diff --git a/meta/recipes-devtools/git/git_2.35.1.bb b/meta/recipes-devtools/git/git_2.35.1.bb
index 62017b98ef..a333458d5f 100644
--- a/meta/recipes-devtools/git/git_2.35.1.bb
+++ b/meta/recipes-devtools/git/git_2.35.1.bb
@@ -9,7 +9,8 @@ PROVIDES:append:class-native = " git-replacement-native"
 
 SRC_URI = "${KERNELORG_MIRROR}/software/scm/git/git-${PV}.tar.gz;name=tarball \
            file://fixsort.patch \
-"
+           file://0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch \
+           "
 
 S = "${WORKDIR}/git-${PV}"
 
-- 
2.20.1


