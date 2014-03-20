Return-Path: <fathi.boudra@linaro.org>
Received: from mail-la0-f47.google.com (mail-la0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id 4F0F86F8D0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 17:49:40 +0000 (UTC)
Received: by mail-la0-f47.google.com with SMTP id y1so886342lam.34
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 10:49:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=r/eubFh2ukJtR88I2GHeekAUMoovq/QUsXLxd/qnbdo=;
	b=CDjwzI09D6GviUrdj0hhfKGzAsb+rA3LS/SRSAQbQ6SUHHlyQIrgFhR7Deyp4W3VMQ
	lwv5d00khiBoLhs+tVgswX3KL6Vls26tCa3rK56/XCsxwixeCg49s2R7T9qYMNxx2f1J
	Si9j08S5MAUMUYgo7XqeTvLMvbEZ+F/u7nWzx/+s6CJ/1jBSGBcGR1ZecszWqQgsXSIS
	XZeFdKtmzVdWZfee5mdsGHYOxs4KA3nvFtoZKsR3gWCxy+lR3Aqir1g6Bsm6fqr7dG9E
	yR/4V+D63oMe35xfbCQ6zuaHxa4i0TlHQuCITfi4wAaXUsD/X0HFMRJ6+HJP1Wx+TjhR
	XxeA==
X-Gm-Message-State: ALoCoQmpaD9hdnuKfWG4iq7ZSFCzXcZBJdltc+2C4g7/mU+SRcTppu4CpZoXvu686MSSF8noLg1X
X-Received: by 10.152.23.9 with SMTP id i9mr1453375laf.56.1395337780881;
	Thu, 20 Mar 2014 10:49:40 -0700 (PDT)
Received: from localhost.localdomain (a91-152-78-194.elisa-laajakaista.fi.
	[91.152.78.194])
	by mx.google.com with ESMTPSA id t3sm2354246laj.15.2014.03.20.10.49.39
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 20 Mar 2014 10:49:40 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Mar 2014 19:49:35 +0200
Message-Id: <1395337775-26756-1-git-send-email-fathi.boudra@linaro.org>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] kernel-arch.bbclass: add arm64 support to U-Bootarchitecture map
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
X-List-Received-Date: Thu, 20 Mar 2014 17:49:44 -0000

to define UBOOT_ARCH, we map kernel architectures to U-Boot architectures.
In the case of arm64 kernel, we should map to arm U-boot architecture.

This patch add the exception rule to the map_uboot_arch function.

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 meta/classes/kernel-arch.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/kernel-arch.bbclass b/meta/classes/kernel-arch.bbclass
index 6a6ad91..bbcfa15 100644
--- a/meta/classes/kernel-arch.bbclass
+++ b/meta/classes/kernel-arch.bbclass
@@ -40,6 +40,7 @@ def map_uboot_arch(a, d):
 
     if   re.match('p(pc|owerpc)(|64)', a): return 'ppc'
     elif re.match('i.86$', a): return 'x86'
+    elif re.match('arm64$', a): return 'arm'
     return a
 
 export UBOOT_ARCH = "${@map_uboot_arch(d.getVar('ARCH', True), d)}"
-- 
1.8.1.2


