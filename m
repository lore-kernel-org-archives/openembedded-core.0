Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SwuPF-0006yY-Dv
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 14:21:33 +0200
Received: by wibhm11 with SMTP id hm11so4363250wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Aug 2012 05:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=VTOgQieqXwzCOiP+MBixd5MUHepqE6Es0XweLNCZV9Y=;
	b=yetu01R2Vo7c+iiIxri6YU/NDcb9jQPBQMFDfmAM8c9G5iXImtOdn9nMdKT78OVVO2
	0mPD67UWXaFF25dhg7qn/vLCBlvtqvPdJmK8Dr7byzY+ZbHfpAh0oLHwCto7/1pyD/hr
	VvTJ7VH018B3UWY22f5QZP+Wbwu6crUkWauoi3/qkTjRs3PvrOIdg6EbEXO3PX8XifOU
	3+ni3zzXhOM/ZEyEyJDgCGRGB5gSZWFGYG9BbkJKstrpNeN3/d5EuTcTCsyN9TfdHPIj
	UgO9jwQxvGv4allVcaa490+Ts2pVSb6sJTJi5lYmabHh6WpS9W7dIz0pdeplWOv2J67Z
	DXdw==
Received: by 10.180.80.134 with SMTP id r6mr4262663wix.1.1343909394159;
	Thu, 02 Aug 2012 05:09:54 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id bc2sm16826626wib.0.2012.08.02.05.09.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 02 Aug 2012 05:09:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Aug 2012 14:09:50 +0200
Message-Id: <1343909390-23651-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <20120802115012.GO16306@jama.jama.net>
References: <20120802115012.GO16306@jama.jama.net>
Subject: [PATCH] u-boot.inc: fix regexp used when ld-is-gold
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Aug 2012 12:21:33 -0000

* with old regexp it wasn't reentrant, causing stuff like this:
  -LD     = $(CROSS_COMPILE)ld
  +LD     = $(CROSS_COMPILE)ld.bfd.bfd
  -LDR    = $(CROSS_COMPILE)ldr
  +LDR    = $(CROSS_COMPILE)ld.bfd.bfdr
  when do_compile was reexecuted, also breaking LDR variable and
  http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/recipes-bsp/u-boot/u-boot/0001-config-Always-use-GNU-ld.patch
  when it was used together with u-boot.inc from oe-core (meta-ti is using own u-boot.inc)

* This patch is also better solution to ld-is-gold problem then regexp in metadata.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-bsp/u-boot/u-boot.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 42bdde9..a8642f0 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -34,7 +34,7 @@ SPL_SYMLINK ?= "${SPL_BINARY}-${MACHINE}"
 
 do_compile () {
 	if [ "${@base_contains('DISTRO_FEATURES', 'ld-is-gold', 'ld-is-gold', '', d)}" = "ld-is-gold" ] ; then
-		sed -i 's/$(CROSS_COMPILE)ld/$(CROSS_COMPILE)ld.bfd/g' config.mk
+		sed -i 's/$(CROSS_COMPILE)ld$/$(CROSS_COMPILE)ld.bfd/g' config.mk
 	fi
 
 	unset LDFLAGS
-- 
1.7.8.6



