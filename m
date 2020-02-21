Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 85B3C616D8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 17:46:09 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id d5so1872556qto.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 09:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=q3h276msiLpnnUxFNjH4yCD7pXo6f5bP7bw7XRMkUQM=;
	b=H7cC9bcmU96N9JLD1PYujKpenJxU8GYSh0Hrb5052YBuivcNdg90EhsYIV722cFwoC
	sUFgc4+XNYFnlU86KXfTpfp/7UMtqh0SfG2/WlVRf14VzTdb8Alk4R/79SNcg/AjsGGS
	zJ+ZqaZdWsWk21tuLlUbrf4sQjfEJo7+DMOv+emLV/BsnmDjk+LFSll9nk4SDkwoyxwd
	khzLHac1N75dlzM6EOXyoLw59iinOu3uVQxaH6dgmR/hYpqaEdFCKfz7YqQZsJ6gvZSg
	azSWdGb1+gLCYXs+IpO0d5b4h4OxZo6dZAANKoeXyRjmRqEoNRk08mKLbCtSiX+V3Suj
	BXmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=q3h276msiLpnnUxFNjH4yCD7pXo6f5bP7bw7XRMkUQM=;
	b=m8KMhPWXeA30H+0LiV6bUe1lpsJgjalzD2Hofkn42dhUf4AdBcTSKYGASPhGRDFWRk
	DlldwRd64fvthy2qdjWW6ffmL2H5b9iFX70JuLxSXWVoYgqbM6+oEscnmSCjAM+uUQ0M
	x5f3nvwe0FWRgJV+sZFTyS+NFKbjz6AV2Z4PnxOa4Q725MQNq76ZNDevTdUjTUxNb2N5
	wHvu2Z7r4r6Ak32LTodfKNHTClBFNd0RX4y7jMqtwxp0rF+UhkphNtRsJc6iYHZU7xe+
	0vCajwETw+BkvV3MpidYoiEFATqsaJtzrRDgb+XwKw1AX3/E5RpDivh6TYybMoHSX03a
	s/DA==
X-Gm-Message-State: APjAAAWyyIr4Ke4e/7bV4CubrlFLVhl5x+HLxVykdZFPdDsF1TMg3wKr
	4CPkzZAahp2Hb+e5otwtFp97MRmVKLn7zg==
X-Google-Smtp-Source: APXvYqwsUfxj2FNbfAYV1cWAMOeZOATjx1IGQtVro44XfwgOuQlrN6J6LABJwE/rSu4O4eox3kbI5A==
X-Received: by 2002:ac8:1937:: with SMTP id t52mr31991309qtj.215.1582307170392;
	Fri, 21 Feb 2020 09:46:10 -0800 (PST)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.113.11.95]) by smtp.gmail.com with ESMTPSA id
	g17sm1855153qtq.29.2020.02.21.09.46.09
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 21 Feb 2020 09:46:09 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Fri, 21 Feb 2020 12:45:58 -0500
Message-Id: <e984603239546930c52298491a4f0a3cd0a4f73f.1582306887.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1582306887.git.bruce.ashfield@gmail.com>
References: <cover.1582306887.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/10] linux-yocto/5.4: integrate mips64 multlib/32bit VDSO fix
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
X-List-Received-Date: Fri, 21 Feb 2020 17:46:09 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Bumping the SRCREVs to pickup the VDSO fix by Victor Kamensky. We
need it to avoid segfaults in SDK testing as well as the standard
mips image test cases.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../recipes-kernel/linux/linux-yocto-rt_5.4.bb |  2 +-
 .../linux/linux-yocto-tiny_5.4.bb              |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_5.4.bb   | 18 +++++++++---------
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index ab93f1bf55..94a8e052e7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "a9334277f632a96eca9d037e9bc077a855d0908d"
+SRCREV_machine ?= "2f533134cfb54b0f77e39a9a9108836aafc3eea1"
 SRCREV_meta ?= "c11911d4d1cf0d0b069dfd1922b41256f61442de"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 097357d9c0..622f5e60c0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -15,8 +15,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "3805e4f98313c4a4c64ffdb06b6401de8746fe45"
-SRCREV_machine ?= "2358d789229f8d80ebe4b3e35d3819c4f0e00926"
+SRCREV_machine_qemuarm ?= "b73dad53d5bfa6b53f56a9022dd9f965d47c93e2"
+SRCREV_machine ?= "239eea7ef5dd5ec7ce6712ea6fc8e9ba9bd49ece"
 SRCREV_meta ?= "c11911d4d1cf0d0b069dfd1922b41256f61442de"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 0b2a2305f1..feb89780ea 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,15 +12,15 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "0eb0f3620fc93699d1d8adafa2b07174733c7c98"
-SRCREV_machine_qemuarm64 ?= "2358d789229f8d80ebe4b3e35d3819c4f0e00926"
-SRCREV_machine_qemumips ?= "933d80248406c58efdfe32d130479f59d56727be"
-SRCREV_machine_qemuppc ?= "2358d789229f8d80ebe4b3e35d3819c4f0e00926"
-SRCREV_machine_qemuriscv64 ?= "2358d789229f8d80ebe4b3e35d3819c4f0e00926"
-SRCREV_machine_qemux86 ?= "2358d789229f8d80ebe4b3e35d3819c4f0e00926"
-SRCREV_machine_qemux86-64 ?= "2358d789229f8d80ebe4b3e35d3819c4f0e00926"
-SRCREV_machine_qemumips64 ?= "db201874e886742eb7a5adf450f5be1293fb83c2"
-SRCREV_machine ?= "2358d789229f8d80ebe4b3e35d3819c4f0e00926"
+SRCREV_machine_qemuarm ?= "65ea2729e3e6a8db8512a80a9838a975ca38f1b3"
+SRCREV_machine_qemuarm64 ?= "239eea7ef5dd5ec7ce6712ea6fc8e9ba9bd49ece"
+SRCREV_machine_qemumips ?= "75b3ff96ee76cdfbf5320ddf97b1c929bb8400c8"
+SRCREV_machine_qemuppc ?= "239eea7ef5dd5ec7ce6712ea6fc8e9ba9bd49ece"
+SRCREV_machine_qemuriscv64 ?= "239eea7ef5dd5ec7ce6712ea6fc8e9ba9bd49ece"
+SRCREV_machine_qemux86 ?= "239eea7ef5dd5ec7ce6712ea6fc8e9ba9bd49ece"
+SRCREV_machine_qemux86-64 ?= "239eea7ef5dd5ec7ce6712ea6fc8e9ba9bd49ece"
+SRCREV_machine_qemumips64 ?= "419af24bb95f01a2106b7cf25b0adc965368d486"
+SRCREV_machine ?= "239eea7ef5dd5ec7ce6712ea6fc8e9ba9bd49ece"
 SRCREV_meta ?= "c11911d4d1cf0d0b069dfd1922b41256f61442de"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
-- 
2.19.1


