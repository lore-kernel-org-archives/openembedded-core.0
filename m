Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-it1-f193.google.com (mail-it1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id ABAFE6C3B6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Mar 2019 19:31:50 +0000 (UTC)
Received: by mail-it1-f193.google.com with SMTP id z124so23007589itc.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Mar 2019 11:31:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=u99w5iViXhBPvVJnFh5Py9JkDG8vEI9uNr/0T0EUmXo=;
	b=s/eNyZBSKK5vgWJwAKkgu9CyjxG9fVJEINGYFEHlNbfkvBJYgHM2/SsZY6FUgpPCht
	yW2CZHQPyV19GKlTTBbft4NRDoUJyrT0hXddsLQNTJRK6tJZvtCPHZsrmwBystokRF38
	+gkrybWRp0/X0JJABUybd5Otg9RdYnK+6jMwnj6ha9tmoT/A+vEtM+i03JZlBCRBcvEL
	W2a+VzZNJ3k9b4nQfIcLbJ6a702MUOvi2xWXCrXN76nHAW2M1eMtj1ICHeN4BdUh+tYi
	ul3cr+1u+p1fopFRDlbNspsNWCsk2+9P9Cfo4q9/k0UlLGjbu39sWinG7cm1oeaQOMdT
	Jnxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=u99w5iViXhBPvVJnFh5Py9JkDG8vEI9uNr/0T0EUmXo=;
	b=QJM2Mc4Op10954RvYgNeMQVtLBUklCAy65FRIjMc4XZZjbY3Mrzy1Azgq9JPSgxcEV
	nAbcpy7WNZ+YGf7XLeu02MdCfh1XnUBXNLVo3IdDiF6YoKHDnZe3tFkG0vvlw5PYGIHO
	KbziXD/pLfNaCS6mTOFvuSbiikj/jLf2G3SqX4MbNfUsmfVgtRG3jUmlxcOfH89q9byw
	5Y431BhoSHM++6BEUA8jksVd0w1LkkIqYDSC3WffjtEUhZ0JOGs4Wr2IkyQptaIt8e90
	SRptHPyUc8tabZ+qPz/UFaTpBldr7xvWqu2jZyrX5HMc7kwOtJWt1VUTaW9ip0sNP2ds
	DKag==
X-Gm-Message-State: APjAAAXEd4bN7f8phylIAf1FUBV1OGiT7WMO4OO81f6feqVj4bRkdRbn
	Eeao8XafibdnGWhFn5rCJBg=
X-Google-Smtp-Source: APXvYqzDrP8L1whjsFVhthfVpGOpHrDVmQ0FPugrRxLu40u+CO8tXZiMA6cV1u2gjWC+6ARjCsTGBA==
X-Received: by 2002:a24:1cc9:: with SMTP id c192mr9316988itc.80.1552073511384; 
	Fri, 08 Mar 2019 11:31:51 -0800 (PST)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.116.254.195]) by smtp.gmail.com with ESMTPSA id
	a18sm3480869iol.68.2019.03.08.11.31.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Mar 2019 11:31:50 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Fri,  8 Mar 2019 14:31:48 -0500
Message-Id: <20190308193148.24082-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto/5.0: fix systemtap for arm
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
X-List-Received-Date: Fri, 08 Mar 2019 19:31:50 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

We need to enable the arm unwinder for systemtap to work out of the
box:

  root@qemuarm:~# stap --disable-cache -DSTP_NO_VERREL_CHECK ./hello.stp
  [ 1600.955262] stap_2097: loading out-of-tree module taints kernel.
  hello world

This option is useful for much more than systemtap, so it is a good
idea to have on in the base configs. It make the image slightly larger,
but has no performance impacts.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.0.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
index a757945f8d..2350973fef 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "1a0da7e50b77c82841efb501c648dbaca699eac2"
-SRCREV_meta ?= "be627e4e38626c5e949de04c814ebd2487d5dd98"
+SRCREV_meta ?= "4faa4419884d2bbe65f637befd71a1e95629eaae"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.0;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
index 57aada3f62..e0a6801446 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "6da91ac9afd3b8c144760e3ceacc6a812ddfa3f6"
 SRCREV_machine ?= "1a0da7e50b77c82841efb501c648dbaca699eac2"
-SRCREV_meta ?= "be627e4e38626c5e949de04c814ebd2487d5dd98"
+SRCREV_meta ?= "4faa4419884d2bbe65f637befd71a1e95629eaae"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.0.bb b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
index a56e9a19d8..f2c066a150 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "1a0da7e50b77c82841efb501c648dbaca699eac2"
 SRCREV_machine_qemux86-64 ?= "1a0da7e50b77c82841efb501c648dbaca699eac2"
 SRCREV_machine_qemumips64 ?= "5f072445126e6a9e44f9435a552f4fcf6fc15499"
 SRCREV_machine ?= "1a0da7e50b77c82841efb501c648dbaca699eac2"
-SRCREV_meta ?= "be627e4e38626c5e949de04c814ebd2487d5dd98"
+SRCREV_meta ?= "4faa4419884d2bbe65f637befd71a1e95629eaae"
 
 # remap qemuarm to qemuarma15 for the 5.0 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.19.1


