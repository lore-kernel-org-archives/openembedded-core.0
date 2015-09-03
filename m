Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 5F44777027
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Sep 2015 18:42:20 +0000 (UTC)
Received: by ioii196 with SMTP id i196so68659830ioi.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Sep 2015 11:42:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=N9WqmaLUshjvXqpowvNrxnEiOSsr0odKGaTscB/0jyI=;
	b=O4DpaOYdVjZ9IJWGg7zbGQlMYTxe8CU7pmO5QL/dzpWSyvwEgC7ZbXm2MHO4MaCbPM
	cH3qLFfvUgJwP5o1w69YFfiylSl7vsRBbplWpnCbhYIDAQNpNNMmOZRFjfsrFHZaaPfL
	qj+IBcDrLcYphaH4/48Phq0YJHtsiFBhR4Z+A9JzIKM69X179sMP2a6+mfLj8mhID0y0
	JTr7yjZKuxDj93V/ThNKFUIKaIiqlMip7ytAaR2mEBwe0I/ARWV7uPNDPFXSGEZ+8bOt
	HV8orfuIVBul1FVklNGxNHj8vY1bdtQXQRZ1KaCpLRrUUsrhdzK74s32qh6bGSW/9sOf
	HATQ==
X-Gm-Message-State: ALoCoQlfasK6fQ/RLk7ZCFm26TmrpxYDpC7cyMhytdP+vBoF0K0DgFEwJynweWYpMrVGfqFKB1Do
X-Received: by 10.107.8.89 with SMTP id 86mr918934ioi.125.1441305741150;
	Thu, 03 Sep 2015 11:42:21 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p57A5686C.dip0.t-ipconnect.de.
	[87.165.104.108])
	by smtp.gmail.com with ESMTPSA id cr1sm166136igb.15.2015.09.03.11.42.20
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 03 Sep 2015 11:42:20 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Sep 2015 20:42:31 +0200
Message-Id: <755b9f8188145bcc0c2bcc83ff255421880dbd35.1441305437.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <2ec9c7eef58ac9972154daa2d5d2d95d64931bd3.1441305437.git.patrick.ohly@intel.com>
References: <2ec9c7eef58ac9972154daa2d5d2d95d64931bd3.1441305437.git.patrick.ohly@intel.com>
In-Reply-To: <cover.1441305437.git.patrick.ohly@intel.com>
References: <cover.1441305437.git.patrick.ohly@intel.com>
Subject: [PATCH 6/8] image-vm.bbclass: support specifying an initramfs
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
X-List-Received-Date: Thu, 03 Sep 2015 18:42:21 -0000

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


