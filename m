Return-Path: <mcfrisk@kapsi.fi>
X-Greylist: delayed 1444 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 13 Jun 2018 07:40:25 UTC
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	by mail.openembedded.org (Postfix) with ESMTP id 592B8789C6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2018 07:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=Subject:Message-Id:Date:Cc:To:From;
	bh=8aK6Yy18kj6ifPa5V+c55064u8omuwzEeg/M/FQaJZU=; 
	b=lDcPJIBR6HZEKZs8iQBtEA5vPgal7kgj4dLspDbaPM1LeHYG2gRXxPwiysLMipg1r1ldMs4JGODnni8n4wt69kQVTr3X5B0zLeydw2XxHn+XTBXf6QYmGAGITISCuFnNCUvOnWZzPWJ+D9qtebdx3zjbjSszMBZBi9JwasnH+jDLqPN2dyvwc0ZUz1ew47her+/xfmMKZPJPjlAyaIzLe6fH+YFXythiVtZW6Q4E3beSCoG0WytnkRGJ71Dli7htZdJGLkN81io3mzoh7+fUcr9QmMxr5Ml34XBYzKUoQkp3eKjJfP2cqi2uzVm3+0KhjXFp899SAMUyWAwvaSkEXA==;
Received: from [2001:67c:1be8::1] (helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.84_2) (envelope-from <mcfrisk@kapsi.fi>)
	id 1fT00z-0003Ef-1W; Wed, 13 Jun 2018 10:16:21 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1fT00m-0007R2-Dd; Wed, 13 Jun 2018 10:16:08 +0300
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jun 2018 10:15:56 +0300
Message-Id: <1528874156-26329-1-git-send-email-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
X-SA-Exim-Connect-IP: 2001:67c:1be8::1
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on mail
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,RDNS_NONE,SPF_NEUTRAL autolearn=no
	autolearn_force=no version=3.4.0
X-SA-Exim-Version: 4.2.1 (built Mon, 26 Dec 2011 16:24:06 +0000)
X-SA-Exim-Scanned: Yes (on mail.kapsi.fi)
Subject: [PATCH] openssh: add nativesdk support
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
X-List-Received-Date: Wed, 13 Jun 2018 07:40:25 -0000

And use bitbake variables for install paths to fix nativesdk-openssh
compilation.

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 meta/recipes-connectivity/openssh/openssh_7.7p1.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh_7.7p1.bb b/meta/recipes-connectivity/openssh/openssh_7.7p1.bb
index 7b6ee5c..bdd6123 100644
--- a/meta/recipes-connectivity/openssh/openssh_7.7p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_7.7p1.bb
@@ -55,9 +55,9 @@ EXTRA_AUTORECONF += "--exclude=aclocal"
 EXTRA_OECONF = "'LOGIN_PROGRAM=${base_bindir}/login' \
                 ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '--with-pam', '--without-pam', d)} \
                 --without-zlib-version-check \
-                --with-privsep-path=/var/run/sshd \
+                --with-privsep-path=${localstatedir}/run/sshd \
                 --sysconfdir=${sysconfdir}/ssh \
-                --with-xauth=/usr/bin/xauth \
+                --with-xauth=${bindir}/xauth \
                 --disable-strip \
                 "
 
@@ -164,3 +164,5 @@ CONFFILES_${PN}-ssh = "${sysconfdir}/ssh/ssh_config"
 ALTERNATIVE_PRIORITY = "90"
 ALTERNATIVE_${PN}-scp = "scp"
 ALTERNATIVE_${PN}-ssh = "ssh"
+
+BBCLASSEXTEND += "nativesdk"
-- 
1.9.1


