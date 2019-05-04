Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id AA5E87D7A0
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 May 2019 15:27:54 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id i21so4201795pgi.12
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 May 2019 08:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=8FLz8WflWXIgh32ShZRC0ryVX5OJaQkRz+7XjhjySiU=;
	b=reMT1GPAniyJ+c6todEQC/jzeWYSWHOgYpXlC5ofzA8wu2CJBeiuteTBg3A4kyplHB
	adZGMonisRICf4tsjAeWNqpUAlPxTCexumqg6/69GIiUmGIJdwc76yK06HMREhLnPGUT
	TcNew5r9JG8WlDccT05TzoIpwE8C3EyR5pGMiCoeNO8erb5QaD/J9KRahPY9AxMF25pJ
	2h7jBhN2t5Vl08jWpCcVRL50HRoz16hDJUcmlfhnCMKaj2Utixh3lrIE6gfGVBNm+cld
	7VCdwYtcFKhdV0qYdXyPQFKaUv4HArHL1WUEb4mh0GNmLPEEoRCtWGi5g3dMxByoq4iP
	GoeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=8FLz8WflWXIgh32ShZRC0ryVX5OJaQkRz+7XjhjySiU=;
	b=MqKfNCiINC98+gjQBq3PGO1gExmuonO5pYbwclUetjjfL/vgUHtOiwaKn1nCKp4Kd9
	6ApQzCcYJ3ob4J9IeQaGcaIy0sbghA21E3DQ+S2xxElbBjW/4EGJMa386miEWQMIvUl+
	UF5bNH6/yg3X1WdqVyf+fk80FZxEDw6I98h3bScnW3RG7czJgc/ucj1p62j46IU7PKsB
	X5HkWJPEruzSN4oB1pzISo3ZhhJP68Q2w3LJYW/iJVZj6c0qC638FaByED5gShC45GgW
	gOBMDvw0iHlXOZxN3PTCNWZmDYEYxCWLE5GSTpF6uQkBFR2eg/MtcqtAKIK7wk4w4MRx
	tpgA==
X-Gm-Message-State: APjAAAVqmPX5bfIqlLbSBroeu1GNfzM9fATI2LZaJr1ShgCzeExCEG20
	t1BZE2Nef1z+4HYmtSCJI2sNxMeN
X-Google-Smtp-Source: APXvYqxuFg27EotU5oMw/e0gBA4OL7UyyX6WQvMbtvGscyHP+fIeocvYPv7mI6EAGWfKU2TwiDDCaA==
X-Received: by 2002:a62:570a:: with SMTP id l10mr9940062pfb.151.1556983675838; 
	Sat, 04 May 2019 08:27:55 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:e5bb:fdcb:954:875c])
	by smtp.gmail.com with ESMTPSA id
	k12sm6394214pfk.86.2019.05.04.08.27.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 04 May 2019 08:27:55 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 May 2019 08:27:06 -0700
Message-Id: <8a0b045e8c31a706f8254db971b0348c6f144758.1556983501.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1556983501.git.akuster808@gmail.com>
References: <cover.1556983501.git.akuster808@gmail.com>
Subject: [PATCH 30/43] linux-yocto/5.0: port RAID configuration tweaks from master
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 04 May 2019 15:27:54 -0000

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Porting the following three RAID config changes from master to
the 5.0 branch:

   ffd8cf5baf8 intel-x86: add Intel VMD support
   8edf951a15c cfg/efi.cfg: built-in CONFIG_EFIVAR_FS to support Intel VROC
   041a6c04244 intel-x86: built-in nvme driver to support boot from nvme disk

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.0.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
index 842aa5b..07fa910 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "04585fb29f99725a27acb96fc25efa0a55a62a8a"
-SRCREV_meta ?= "7477b32eaf608884be5664fadd79331b39afaaa6"
+SRCREV_meta ?= "ffd8cf5baf8e741b8987b72c942ce3b9cc7c7f30"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.0;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
index eba6cc6..c1084f2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "e265300362d7004e3b57bb5cbcfc65fb469b9ce9"
 SRCREV_machine ?= "9c40ed0d86ad87f48659aad4fdead2455e8b5db8"
-SRCREV_meta ?= "7477b32eaf608884be5664fadd79331b39afaaa6"
+SRCREV_meta ?= "ffd8cf5baf8e741b8987b72c942ce3b9cc7c7f30"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.0.bb b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
index fe773be..01269dd 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "9c40ed0d86ad87f48659aad4fdead2455e8b5db8"
 SRCREV_machine_qemux86-64 ?= "9c40ed0d86ad87f48659aad4fdead2455e8b5db8"
 SRCREV_machine_qemumips64 ?= "437d99225c689f3f192bb834e4d649ea0467ac87"
 SRCREV_machine ?= "9c40ed0d86ad87f48659aad4fdead2455e8b5db8"
-SRCREV_meta ?= "7477b32eaf608884be5664fadd79331b39afaaa6"
+SRCREV_meta ?= "ffd8cf5baf8e741b8987b72c942ce3b9cc7c7f30"
 
 # remap qemuarm to qemuarma15 for the 5.0 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.7.4


