Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [217.30.184.167])
	by mail.openembedded.org (Postfix) with ESMTP id 34A6C782F6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 13:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; 
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=nfbdLcH0UYXUN7jxK+xI2htQHp61M6a8neILrUvlIuc=; 
	b=PQ12N++O5OnKbwd254sR0176qbip1wgUS4KXA8sHYFkSbkFF5IyJUuWdfLoqPLscUVP8jEC9UFJvBJt4HzdYejtDbXo5n1BXK/tITLC6GgPBTVarXKdmlDcl/SAya9nY4Dqd5UkXiWmqQ8EwFOAVBVSowKyMKVdvjzXcwNx5DM2+kMZGzMGVjs07d1rKlHSY+v6386jUu0zCMMMhqhoofvjEembMt5GeqOK1P4b6Jd72zE2qqzvvt/BOCaAqLDohokI4sxohpdliRmQJeV8vJosBMvF0U3X3XholzuBJXbt/xs054xUPCkG72djciKHGZ0/gcxSVgH8upWtieOTaUA==;
Received: from lakka.kapsi.fi ([2001:1bc8:1004::1] ident=Debian-exim)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.84_2) (envelope-from <mcfrisk@kapsi.fi>)
	id 1dYBQN-0005Nl-AJ; Thu, 20 Jul 2017 16:23:27 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1dYBQN-0003UH-9A; Thu, 20 Jul 2017 16:23:27 +0300
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Jul 2017 16:23:10 +0300
Message-Id: <1500556991-11471-23-git-send-email-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1500556991-11471-1-git-send-email-mikko.rapeli@bmw.de>
References: <1500556991-11471-1-git-send-email-mikko.rapeli@bmw.de>
X-SA-Exim-Connect-IP: 2001:1bc8:1004::1
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Subject: [PATCH 22/23] kernel.bbclass: set CVE_PRODUCT to linux_kernel if not set by recipe
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
X-List-Received-Date: Thu, 20 Jul 2017 13:23:29 -0000

It is used by NVD database CVE's like:

https://nvd.nist.gov/vuln/detail/CVE-2017-7273

Setting this in kernel.bbclass fixes CVE reporting for all users of
the class.

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 meta/classes/kernel.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 7670c71..ce2cab6 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -6,6 +6,8 @@ PACKAGE_WRITE_DEPS += "depmodwrapper-cross virtual/update-alternatives-native"
 
 do_deploy[depends] += "depmodwrapper-cross:do_populate_sysroot"
 
+CVE_PRODUCT ?= "linux_kernel"
+
 S = "${STAGING_KERNEL_DIR}"
 B = "${WORKDIR}/build"
 KBUILD_OUTPUT = "${B}"
-- 
1.9.1


