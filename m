Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QR3mB-0007ZA-K4
	for openembedded-core@lists.openembedded.org;
	Mon, 30 May 2011 16:49:03 +0200
Received: by ywg8 with SMTP id 8so1593851ywg.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 May 2011 07:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references:in-reply-to:references;
	bh=rC/lRUpzEIzW211Iu3k8kdEIFmBmfYYO81fhTYsNHkA=;
	b=EKr50KJppHBgiwLkbqG76lwn+X59GBDcd7rhWVJqev5ZLiytOjwJeOwn/jk0Qm6szr
	IAoEgPqlHqQEJGe4eZqT9ytgDYqkoenvFyTvWs+BD0/Q1/5dx9wZGcelAo4ygsgiMcrl
	/zxMJzlCp4JyYC9YD7D8taX+sMwiljRgVeWAU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=oAvmEtWcGyG3S8C9BXdlQUI65VtYikmLqQrR/nu3GJU0LwUPhSVGUXzg6IJSL+oUHb
	Cyy1gK2pSX0DZQdca2f3NXabsegQ3PWxTTjbX5QaFTQX5tvE/6Za18g4V6eV/Jz4hgAO
	DpMJxSo2QNGS64U2V1IWktwiSyzbpJt9rTP3U=
Received: by 10.91.163.28 with SMTP id q28mr4178006ago.165.1306766752709;
	Mon, 30 May 2011 07:45:52 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id x37sm3343391ana.26.2011.05.30.07.45.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 May 2011 07:45:51 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 May 2011 14:45:38 +0000
Message-Id: <5dfe38efd96ced83dd91d28aa41f39125053bf6b.1306766682.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1306766682.git.otavio@ossystems.com.br>
References: <cover.1306766682.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1306766682.git.otavio@ossystems.com.br>
References: <cover.1306766682.git.otavio@ossystems.com.br>
Subject: [PATCH 1/2] busybox: enable mdev by default
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
X-List-Received-Date: Mon, 30 May 2011 14:49:03 -0000

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



