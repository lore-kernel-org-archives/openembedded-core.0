Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id A8C4D77032
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 15:48:39 +0000 (UTC)
Received: by igbni9 with SMTP id ni9so17209664igb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Sep 2015 08:48:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=N9WqmaLUshjvXqpowvNrxnEiOSsr0odKGaTscB/0jyI=;
	b=Y0XaXEBuJaU35UiU4jUzh3tmYBQrPWCOzcPwc0TaCJiUrEQuJtwnOztO1aqhYYJvX+
	p6/L0PdARnsov04SPEY+ZlasOW1Sq0SRJnueXHmE+n8G1pkyBS1gKulP6MGCgoVe1DB9
	LkPxrBJsJw6YFVO3IB+TPfs8r5oFWnQfmAkMWGrwreOtTI+et8NV0YjxgQxtwWuhDSo5
	DUF0c1cxqd/SDr+Pk0rFrzWHsd/Y5EhmNYSpSGXI8MpM2A7jQvFh7JvB93G0/KBTrEVQ
	I1jBnBVC9A0I7dQXA6yrYM1qfyFFgsqE19QvJ/CvCazEMFCq7GHISI7Bg1dNFAtaxv2P
	fJlw==
X-Gm-Message-State: ALoCoQkBFzSM/hEttp8D6dXylNnov9rrRdoMSY+wAsZZrqhEhEOieuYmr12k99e70ZdA12Zq8baQ
X-Received: by 10.50.142.1 with SMTP id rs1mr3907947igb.17.1441208919993;
	Wed, 02 Sep 2015 08:48:39 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8FD7A.dip0.t-ipconnect.de.
	[93.232.253.122]) by smtp.gmail.com with ESMTPSA id
	o189sm17258398ioe.30.2015.09.02.08.48.38
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 02 Sep 2015 08:48:39 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Sep 2015 17:48:44 +0200
Message-Id: <d605cde1f665cfa4f98fbfa6402f58461a4b3335.1441207840.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <3b40bb267aa67a9c7adae08713d85060129a219b.1441207840.git.patrick.ohly@intel.com>
References: <3b40bb267aa67a9c7adae08713d85060129a219b.1441207840.git.patrick.ohly@intel.com>
In-Reply-To: <cover.1441207840.git.patrick.ohly@intel.com>
References: <cover.1441207840.git.patrick.ohly@intel.com>
Subject: [PATCH 08/10] image-vm.bbclass: support specifying an initramfs
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
X-List-Received-Date: Wed, 02 Sep 2015 15:48:42 -0000

Set INITRD_IMAGE to automatically add a custom initramfs to the boot
partition.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/classes/image-vm.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/image-vm.bbclass b/meta/classes/image-vm.bbclass
index 3df2c36..0632667 100644
--- a/meta/classes/image-vm.bbclass
+++ b/meta/classes/image-vm.bbclass
@@ -3,6 +3,11 @@ SYSLINUX_PROMPT ?= "0"
 SYSLINUX_LABELS = "boot"
 LABELS_append = " ${SYSLINUX_LABELS} "
 
+# Using an initramfs is optional. Enable it by setting INITRD_IMAGE.
+INITRD_IMAGE ?= ""
+INITRD ?= "${@'${DEPLOY_DIR_IMAGE}/${INITRD_IMAGE}-${MACHINE}.cpio.gz' if '${INITRD_IMAGE}' else ''}"
+do_bootdirectdisk[depends] += "${@'${INITRD_IMAGE}:do_rootfs' if '${INITRD_IMAGE}' else ''}"
+
 # need to define the dependency and the ROOTFS for directdisk
 do_bootdirectdisk[depends] += "${PN}:do_rootfs"
 ROOTFS ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_BASENAME}-${MACHINE}.ext4"
-- 
2.1.4


