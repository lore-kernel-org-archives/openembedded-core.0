Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QOU4S-0007sx-Q4
	for openembedded-core@lists.openembedded.org;
	Mon, 23 May 2011 14:17:16 +0200
Received: by mail-gw0-f47.google.com with SMTP id 11so2169547gwb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2011 05:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references:in-reply-to:references;
	bh=rC/lRUpzEIzW211Iu3k8kdEIFmBmfYYO81fhTYsNHkA=;
	b=ZEN6yhDs5zcNJYoOwZqFi5i1QB4JUmMCwGXKAfLCf66r5WuEjAD2yh6c2/MddOw594
	yjfoB701x10I6dbEJQU1tar6PCu11GG70nWu+8WmtXgtcxLbO4SEcCVFweYM2P+zVj17
	dMmlGxgHI5clk6BT/T/aCgJyx1NI9VIWy4SAU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=LspmPh1GLkKiRA5CuqPaAZe8UR3qIs4l5qWv8/Ha9WQPexnSg2k4Ih4GV9sRv8hiP+
	Q5/xLZLj8Se107+sSxnbYhSTZAixECES+zBytFr5MePHB/xxp+i0tZ4G1RDTQPi9mc8C
	AxZF+dZZEqD4gd7ITC5tldcP1eBZyFAXf8w3k=
Received: by 10.91.199.25 with SMTP id b25mr2973063agq.118.1306152856799;
	Mon, 23 May 2011 05:14:16 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id q8sm4737950ann.19.2011.05.23.05.14.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 23 May 2011 05:14:15 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 May 2011 12:13:54 +0000
Message-Id: <596fd53943dd383f89abb767d7a3b624e6b20b92.1306152724.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1306152724.git.otavio@ossystems.com.br>
References: <cover.1306152724.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1306152724.git.otavio@ossystems.com.br>
References: <cover.1306152724.git.otavio@ossystems.com.br>
Subject: [PATCH 2/3] busybox: enable mdev by default
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
X-List-Received-Date: Mon, 23 May 2011 12:17:17 -0000

Since we do not require a configuration file by default we don't force
it's addition on the package. If the a layer wants to have it enabled
it should also set the CONFFILES for busybox-mdev package.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-core/busybox/busybox-1.18.4/defconfig |    2 +-
 meta/recipes-core/busybox/busybox.inc              |    1 -
 meta/recipes-core/busybox/busybox_1.18.4.bb        |    2 +-
 3 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox-1.18.4/defconfig b/meta/recipes-core/busybox/busybox-1.18.4/defconfig
index 5327a64..6b48cc1 100644
--- a/meta/recipes-core/busybox/busybox-1.18.4/defconfig
+++ b/meta/recipes-core/busybox/busybox-1.18.4/defconfig
@@ -518,7 +518,7 @@ CONFIG_FEATURE_HWCLOCK_ADJTIME_FHS=y
 CONFIG_LOSETUP=y
 # CONFIG_LSPCI is not set
 # CONFIG_LSUSB is not set
-# CONFIG_MDEV is not set
+CONFIG_MDEV=y
 # CONFIG_FEATURE_MDEV_CONF is not set
 # CONFIG_FEATURE_MDEV_RENAME is not set
 # CONFIG_FEATURE_MDEV_RENAME_REGEXP is not set
diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 341c5c4..de711d2 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -29,7 +29,6 @@ INITSCRIPT_PARAMS_${PN}-mdev = "start 06 S ."
 INITSCRIPT_NAME_${PN}-udhcpd = "busybox-udhcpd" 
 INITSCRIPT_NAME_${PN}-udhcpc = "busybox-udhcpc" 
 CONFFILES_${PN}-syslog = "${sysconfdir}/syslog.conf.${PN}"
-CONFFILES_${PN}-mdev = "${sysconfdir}/mdev.conf"
 
 RRECOMMENDS_${PN} = "${PN}-syslog ${PN}-udhcpc"
 
diff --git a/meta/recipes-core/busybox/busybox_1.18.4.bb b/meta/recipes-core/busybox/busybox_1.18.4.bb
index cf37650..a5080d5 100644
--- a/meta/recipes-core/busybox/busybox_1.18.4.bb
+++ b/meta/recipes-core/busybox/busybox_1.18.4.bb
@@ -1,5 +1,5 @@
 require busybox.inc
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://udhcpscript.patch \
-- 
1.7.2.5



