Return-Path: <naresh.bhat@linaro.org>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 424EF73998
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Mar 2015 18:31:55 +0000 (UTC)
Received: by igal13 with SMTP id l13so23561635iga.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Mar 2015 11:31:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=wY0LkG8jDYyGudCClCGAHv/vSvp3Iwa0ogh9VSULc68=;
	b=BVasg31UcLdJ3+NboRTMQkcbaeVMEVL230nC7xYVSND2Jy99s4LOZ6kFn7rQmMzfHf
	C78auK6c1Numa/2cvwPzBPh5b/9phV76XOzJzg1ic7tXuvywvNpmu8jNQdvUNDVVY9lI
	7TeXUrZ1VITL8FqdO8uG2eOPWaQZnDbgFltT5KnPCAVyjym/Awtql1UKyKQO2ipp123c
	PcP4MNRRRIRYGx40r6m5SCpMRKE0gvkmCS+am6l82L+XCf+ucYtyZsGxeR/7vWIf6c9n
	ybyeiaomUBg5UBmJr80dUImca3kJrv/yehg/N9d6Yg2qNDPd7luXa0IPfOuKXrKSH5Gt
	Xi5w==
X-Gm-Message-State: ALoCoQkT2g7nX4hNM12a/+Dt9AKzElBz9ErkuymKbYT1MJrcXpcWEqtNgy5M1N+QgKMQytmN9B0I
X-Received: by 10.42.76.205 with SMTP id f13mr29689008ick.42.1425925916634;
	Mon, 09 Mar 2015 11:31:56 -0700 (PDT)
Received: from Latitude-E6430.domain.name (64.2.3.194.ptr.us.xo.net.
	[64.2.3.194])
	by mx.google.com with ESMTPSA id w3sm6552503igz.4.2015.03.09.11.31.51
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 09 Mar 2015 11:31:54 -0700 (PDT)
From: Naresh Bhat <naresh.bhat@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Mar 2015 00:01:13 +0530
Message-Id: <1425925876-9663-3-git-send-email-naresh.bhat@linaro.org>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1425925876-9663-1-git-send-email-naresh.bhat@linaro.org>
References: <1425925876-9663-1-git-send-email-naresh.bhat@linaro.org>
Subject: [OE-core v1 PATCH 2/5] syslinux: Remove bootimg dependency for aarch64
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
X-List-Received-Date: Mon, 09 Mar 2015 18:31:55 -0000

Remove the bootimg dependency as syslinux for aarch64. The reasons to skip the syslinux package
- syslinux package contains x86 assembly code. Hence compilation errors on aarch64.
- There is no BIOS on aarch64 to answer syscalls.

Signed-off-by: Naresh Bhat <naresh.bhat@linaro.org>
---
 meta/classes/syslinux.bbclass |   11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/classes/syslinux.bbclass b/meta/classes/syslinux.bbclass
index d6498d9..2efb764 100644
--- a/meta/classes/syslinux.bbclass
+++ b/meta/classes/syslinux.bbclass
@@ -17,7 +17,16 @@
 # ${SYSLINUX_SERIAL_TTY} - Set alternate console=tty... kernel boot argument
 # ${SYSLINUX_KERNEL_ARGS} - Add additional kernel arguments
 
-do_bootimg[depends] += "${MLPREFIX}syslinux:do_populate_sysroot \
+def boot_image_depends(bb, d):
+         import re
+         deps = bb.data.getVar('TARGET_PREFIX', d, True)
+         if re.search("(x86_64|i.86).*",deps):
+                 return "${MLPREFIX}syslinux"
+         if re.search("aarch64",deps):
+                 return ""
+RDEPENDS = "${@boot_image_depends(bb, d)}"
+
+do_bootimg[depends] += "${RDEPENDS}:do_populate_sysroot \
                         syslinux-native:do_populate_sysroot"
 
 SYSLINUXCFG  = "${S}/syslinux.cfg"
-- 
1.7.9.5


