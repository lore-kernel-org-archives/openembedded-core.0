Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	by mail.openembedded.org (Postfix) with ESMTP id 8AED67458F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2018 11:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=Subject:Message-Id:Date:Cc:To:From:Sender:Reply-To:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=l/ERiHGm6SXQuEFEUFS6OTBEwn8Qh5qGnU/yi2gMoDM=;
	b=LJDOPkcwas6+TbSGXmxceaTM3V
	SWziwjFGKyNFLtfOuEDrsV9FV/vzKLNP5UJhGmBwQ+sCzN3wWXFl57PZGTlUQuF5ozpMWRckYg3OA
	NPTD+r4vOZeV0NoWeL1p9FzrGG/Yy+SSXV2UX1nDMFIPzqW/dFcpj0qNPjV10atac+iBH9NSk0vsy
	4ZJdcup1AVLwqB5TYydtTyPdtRqiEviTt9FZ052vSqKYzKrXjdh9ZxMMv5ElpDeAll1dXE8ontt3e
	bfCwpaRHvkIJ5VaR85CR2HtsM1FBp4e0l/0APWZANVSAwbNB0hA22opcU1woNNsH8IZ5B1EFXLiUG
	kBhenIfw==;
Received: from [91.232.154.11] (helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <mcfrisk@kapsi.fi>)
	id 1g3JwW-0006s0-BE; Fri, 21 Sep 2018 14:49:52 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1g3JwC-0002M6-7W; Fri, 21 Sep 2018 14:49:32 +0300
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Sep 2018 14:49:27 +0300
Message-Id: <1537530567-8604-1-git-send-email-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
X-SA-Exim-Connect-IP: 91.232.154.11
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on mail
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,RDNS_NONE,SPF_NEUTRAL autolearn=no
	autolearn_force=no version=3.4.1
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on mail.kapsi.fi)
Subject: [PATCH] kernel.bbclass: allow exporting files from kernel recipes to sysroot
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
X-List-Received-Date: Fri, 21 Sep 2018 11:49:53 -0000

This change enables kernel recipes to share files with other
recipes. Firmware, modules and kernel-depmod are still not shared
since according to git history they cause problems with multiarch,
but all others are allowed. Examples of shared files are
kernel version and recipe specific headers and scripts which
are not needed by common linux-libc-headers to bootstrap glibc.

For example, if a kernel recipe wants to share headers, it can do:

PACKAGES =+ "${PN}-headers"

do_install_append() {
    install -d "${D}${includedir}/${PN}"
    oe_runmake INSTALL_HDR_PATH="${D}${includedir}/${PN}" headers_install
}

FILES_${PN}-headers = "\
                      ${includedir}/${PN}/* \
                      "

Users can find the headers from ${includedir}/${PN} and they don't conflict
with the generic linux-libc-headers which are used to boostrap userspace.

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 meta/classes/kernel.bbclass | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index bfb4243..acf9c2c 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -487,10 +487,14 @@ do_shared_workdir () {
 	fi
 }
 
-# We don't need to stage anything, not the modules/firmware since those would clash with linux-firmware
-sysroot_stage_all () {
-	:
-}
+# We don't need to stage modules/firmware since those would clash with linux-firmware, but
+# kernel recipes can still expose kernel version specific headers or scripts to userspace
+# sysroot.
+SYSROOT_DIRS_BLACKLIST_append += "\
+    ${datadir}/kernel-depmod \
+    ${base_libdir}/modules \
+    ${base_libdir}/firmware \
+"
 
 KERNEL_CONFIG_COMMAND ?= "oe_runmake_call -C ${S} CC="${KERNEL_CC}" O=${B} oldnoconfig"
 
-- 
1.9.1


