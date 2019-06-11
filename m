Return-Path: <Haiqing.Bai@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9710A6D458
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2019 02:06:36 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5B25iH0019302
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 10 Jun 2019 19:05:54 -0700
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Mon, 10 Jun 2019 19:05:33 -0700
From: Haiqing Bai <Haiqing.Bai@windriver.com>
To: <richard.purdie@linuxfoundation.org>, <jun.nie@linaro.org>,
	<openembedded-core@lists.openembedded.org>
Date: Tue, 11 Jun 2019 09:47:52 +0800
Message-ID: <1560217673-228272-1-git-send-email-Haiqing.Bai@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [V2][PATCH] kernel.bbclass: Make task clean depend on cleaning of make-mod-scripts
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
X-List-Received-Date: Tue, 11 Jun 2019 02:06:36 -0000
Content-Type: text/plain

The package 'make-mod-scripts' creates files in 'kernel-build-artifacts/include/config'
which are removed by 'cleanall/cleansstate' of 'virtual/kernel'. And this causes the
below error while building out of tree kernel module:
ERROR: Kernel configuration is invalid.
      include/generated/autoconf.h or include/config/auto.conf are missing.
      Run 'make oldconfig && make prepare' on kernel src to fix it.

Suggested-by: Jun Nie <jun.nie@linaro.org>

Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
---
 meta/classes/kernel.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 111a0b2..a60e15b 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -8,6 +8,7 @@ DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc kmod-na
 PACKAGE_WRITE_DEPS += "depmodwrapper-cross"
 
 do_deploy[depends] += "depmodwrapper-cross:do_populate_sysroot"
+do_clean[depends] += "make-mod-scripts:do_clean"
 
 CVE_PRODUCT ?= "linux_kernel"
 
-- 
1.9.1


