Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QRrnH-0007Sj-Vk
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 22:13:32 +0200
Received: by yia13 with SMTP id 13so85484yia.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Jun 2011 13:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references:in-reply-to:references;
	bh=1tKmENQQn8VSagwuiDaEh+rU63Ql1TJjk0QeZYMvjE8=;
	b=si0HMnbC6puLTUuGqPtuhTAh8woGW+6/B3zMOSOZhs5qzwR6FjWbx1/QurMzjg3zAR
	BSRdykO/RorkDM9TU3eRwwGBpu0NrjejayK7voFNieTTDFHY0m7kdDrTASbaC6JPEf2Z
	S4/g4La6RyqUTES0sgPf3KAhA1+OoOheqEgyE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=IGi9ST5D8iKbocGHGJEh4naQCPHVZm7XDMfC+kedYRhaJpgSkvdp9z7gnlqetuOZK5
	X3IsZ/JrfRtQoAPaidYagv157nWZmE5N6LObgdn02Jr50hzZYYE5pPqh0qDMyD7+kMxK
	LC8fp+B9WtptWgAepjC1yC6C74qnFA6opCvSY=
Received: by 10.91.198.23 with SMTP id a23mr6656183agq.45.1306959009641;
	Wed, 01 Jun 2011 13:10:09 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id b25sm906310anb.46.2011.06.01.13.10.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Jun 2011 13:10:08 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Jun 2011 20:09:53 +0000
Message-Id: <e96c2e88aaf1cd22faac3b7ae61ccf34adfe92ba.1306958862.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1306958862.git.otavio@ossystems.com.br>
References: <cover.1306958862.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1306958862.git.otavio@ossystems.com.br>
References: <cover.1306958862.git.otavio@ossystems.com.br>
Subject: [PATCH 1/3] busybox: enable mdev by default
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
X-List-Received-Date: Wed, 01 Jun 2011 20:13:32 -0000

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
index 86fbdae..9b874c5 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -29,7 +29,6 @@ INITSCRIPT_PARAMS_${PN}-mdev = "start 06 S ."
 INITSCRIPT_NAME_${PN}-udhcpd = "busybox-udhcpd" 
 INITSCRIPT_NAME_${PN}-udhcpc = "busybox-udhcpc" 
 CONFFILES_${PN}-syslog = "${sysconfdir}/syslog.conf.${PN}"
-CONFFILES_${PN}-mdev = "${sysconfdir}/mdev.conf"
 
 RRECOMMENDS_${PN} = "${PN}-syslog ${PN}-udhcpc"
 
diff --git a/meta/recipes-core/busybox/busybox_1.18.4.bb b/meta/recipes-core/busybox/busybox_1.18.4.bb
index a5080d5..a999490 100644
--- a/meta/recipes-core/busybox/busybox_1.18.4.bb
+++ b/meta/recipes-core/busybox/busybox_1.18.4.bb
@@ -1,5 +1,5 @@
 require busybox.inc
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://udhcpscript.patch \
-- 
1.7.2.5



