Return-Path: <naresh.bhat@linaro.org>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id D56D26AC43
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2015 11:27:29 +0000 (UTC)
Received: by padcy3 with SMTP id cy3so39983809pad.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2015 04:27:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=KKw8Itp2rV5DICcnGPZqe6lnZWbMMgiRDTAcqVR7t/Q=;
	b=cfMH8/LZGLMWRDF4d3qa0O7Q8c2qW1p7FnS4eMdLjiaUOF4pg6Gr8PuL9WD7qU/PDz
	omK8hul20rpGqlCP3x46z5GVr6dcXC8njjDDLLzIfxrMxmT3W5K3u0x8UTgbIJt9+SyV
	9t3JQzVHMLK1qKi/NHPOOYlizTbCiqphnVfoHglAmhMA4170beMZk8Cl2soI2wMZplv4
	/W/8UW8cRcXVFI51jGRgxeDaEBkNWoC19D8PWE/PkUHnbfrrWWuVPF0FfpYKwEDftM8y
	JDOt/wOtezEoA43Za/tB89wB7Ii6SYm16lhCNOE7cEjwI77/bRDDaVACUM+qLboirWyV
	7VOA==
X-Gm-Message-State: ALoCoQlJ/yXf+wtu1IJRvZ7xqhQUrwXKE2NDv5zAErXAPzKPW5My7I09y/W0x9w29RO6Ot6Qk+Uy
X-Received: by 10.70.53.196 with SMTP id d4mr5317436pdp.6.1426678050694;
	Wed, 18 Mar 2015 04:27:30 -0700 (PDT)
Received: from Latitude-E6430.domain.name ([119.82.123.224])
	by mx.google.com with ESMTPSA id x1sm27111518pdr.17.2015.03.18.04.27.27
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 18 Mar 2015 04:27:29 -0700 (PDT)
From: Naresh Bhat <naresh.bhat@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Mar 2015 16:57:06 +0530
Message-Id: <1426678029-19516-3-git-send-email-naresh.bhat@linaro.org>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1426678029-19516-1-git-send-email-naresh.bhat@linaro.org>
References: <1426678029-19516-1-git-send-email-naresh.bhat@linaro.org>
Cc: matt.fleming@intel.com
Subject: [OE-core v2 PATCH 2/5] syslinux: Remove bootimg dependency on aarch64
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
X-List-Received-Date: Wed, 18 Mar 2015 11:27:30 -0000

Remove the bootimg dependency as syslinux for aarch64. The reason to skip the syslinux package
- syslinux package contains x86 assembly code. Hence it cannot be compiled on aarch64.
- There is no BIOS on aarch64 to answer syscalls.

Signed-off-by: Naresh Bhat <naresh.bhat@linaro.org>
---
 meta/classes/syslinux.bbclass |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/syslinux.bbclass b/meta/classes/syslinux.bbclass
index d6498d9..16c12a9 100644
--- a/meta/classes/syslinux.bbclass
+++ b/meta/classes/syslinux.bbclass
@@ -17,7 +17,10 @@
 # ${SYSLINUX_SERIAL_TTY} - Set alternate console=tty... kernel boot argument
 # ${SYSLINUX_KERNEL_ARGS} - Add additional kernel arguments
 
-do_bootimg[depends] += "${MLPREFIX}syslinux:do_populate_sysroot \
+EXTRABOOTIMGDEPS = ""
+EXTRABOOTIMGDEPS_x86 = "${MLPREFIX}syslinux:do_populate_sysroot"
+EXTRABOOTIMGDEPS_x86-64 = "${MLPREFIX}syslinux:do_populate_sysroot"
+do_bootimg[depends] += "${EXTRABOOTIMGDEPS} \
                         syslinux-native:do_populate_sysroot"
 
 SYSLINUXCFG  = "${S}/syslinux.cfg"
-- 
1.7.9.5


