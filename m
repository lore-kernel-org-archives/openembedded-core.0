Return-Path: <naresh.bhat@linaro.org>
Received: from mail-yh0-f44.google.com (mail-yh0-f44.google.com
	[209.85.213.44])
	by mail.openembedded.org (Postfix) with ESMTP id 835DB65DA3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2015 14:56:00 +0000 (UTC)
Received: by yhzz6 with SMTP id z6so12057265yhz.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2015 07:56:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=0Cs+AnUMF3+FnKjQ6fh5wrvK9Ga3zgv9FZeufGaUJMs=;
	b=nH+m2Kk5r0bSOX1dOmFyeM2He33bRsQPg3FP04vzzLYgsD79VwgVuOsb7u0OZyt518
	qH3t/W0IkkeRy/aU3I+0xHzZSC+g3nvZzXU+tLMNVB1fm7j+q3elPY0djtqB1hcxQ+W8
	ilyFXBSJiktAXvV+K1Ztrv33xqeJTNR2NprERAb8TFQB8kl5sjI7U+os3Xmq9PpbaY/V
	ot3b26x+hdOCFsVnWn1nL28y+oSFN/vwCan8kJjwb2mqd5MpOELZvGC1rpoxNmRh4nQj
	7O+JB2YFmH9O1vfn1wmRH6W67u3fyGyjnSiJT2l5SPHhDBnuy2e43jLcCLkqyxBoIZes
	Uchw==
X-Gm-Message-State: ALoCoQk7IamdpWp58xOlY+itCmVPjiCPN0eEIBROfKLahpSBlpUUB+f8aVQaQQqAENm2Xrn7Gfv1
X-Received: by 10.236.227.166 with SMTP id d36mr46851987yhq.185.1426258562169; 
	Fri, 13 Mar 2015 07:56:02 -0700 (PDT)
Received: from Latitude-E6430.caveonetworks.com ([111.93.218.67])
	by mx.google.com with ESMTPSA id a74sm1773572yhq.31.2015.03.13.07.55.58
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 13 Mar 2015 07:56:00 -0700 (PDT)
From: Naresh Bhat <naresh.bhat@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Mar 2015 20:25:24 +0530
Message-Id: <1426258527-2329-3-git-send-email-naresh.bhat@linaro.org>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1426258527-2329-1-git-send-email-naresh.bhat@linaro.org>
References: <1426258527-2329-1-git-send-email-naresh.bhat@linaro.org>
Cc: matt.fleming@intel.com
Subject: [OE-core v1 PATCH 2/5] syslinux: Remove bootimg dependency on aarch64
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
X-List-Received-Date: Fri, 13 Mar 2015 14:56:01 -0000

Remove the bootimg dependency as syslinux for aarch64. The reason to skip the syslinux package
- syslinux package contains x86 assembly code. Hence it cannot be compiled on aarch64.
- There is no BIOS on aarch64 to answer syscalls.

Signed-off-by: Naresh Bhat <naresh.bhat@linaro.org>
---
 meta/classes/syslinux.bbclass |   10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/classes/syslinux.bbclass b/meta/classes/syslinux.bbclass
index d6498d9..7bd8fed 100644
--- a/meta/classes/syslinux.bbclass
+++ b/meta/classes/syslinux.bbclass
@@ -17,7 +17,15 @@
 # ${SYSLINUX_SERIAL_TTY} - Set alternate console=tty... kernel boot argument
 # ${SYSLINUX_KERNEL_ARGS} - Add additional kernel arguments
 
-do_bootimg[depends] += "${MLPREFIX}syslinux:do_populate_sysroot \
+def boot_image_depends(bb, d):
+         import re
+         deps = bb.data.getVar('TARGET_PREFIX', d, True)
+         if re.search("(x86_64|i.86).*",deps):
+                 return "${MLPREFIX}syslinux:do_populate_sysroot"
+         if re.search("aarch64",deps):
+                 return ""
+BIMGDEP = "${@boot_image_depends(bb, d)}"
+do_bootimg[depends] += "${BIMGDEP} \
                         syslinux-native:do_populate_sysroot"
 
 SYSLINUXCFG  = "${S}/syslinux.cfg"
-- 
1.7.9.5


