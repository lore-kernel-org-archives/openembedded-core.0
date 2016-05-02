Return-Path: <otavio.salvador@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 96695731E6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 May 2016 20:14:48 +0000 (UTC)
Received: by mail-pa0-f42.google.com with SMTP id xk12so7324298pac.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 May 2016 13:14:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=F46/lDahPLpz8Yktd/15OWsNmEno72pqCogXZdKue8w=;
	b=jWMswGEosj/OOXei6DmHHYNCt5EMhzJSxEzXdEsK20SEfSZOi6Tz6T3PuwIxe7FoLP
	DCcrXlsE13FQZkvtwmV+hLwndfhIr7/dvl+1X5buDyoXZvbDu4q+75oMHf3gLc5apfeB
	MVPmURF8UQxD/GX6Yb1/JcLkcTicso9eA1/+qtmDIXAn5rnsk+a+5ZfybLI658WcAfrl
	8j2hWwT1LUAjV8lNjiC4UO45213i+EdTyjdNyctvhgzfMNMnEmQJ89IHVMPcjhRxdL3l
	ZIcHxdltepS1+T1nEv1R/0JyN5tX47l57EH76U4yp10jGVhTQYZNDNUOcMcliN6ET5PQ
	+cKg==
X-Gm-Message-State: AOPr4FWDL89dbKjMlya3+XsptU+MVYqkS4QN9bq/1cgv6TECI77B0vvWbUz3OGWNVK3NmQ==
X-Received: by 10.66.153.174 with SMTP id vh14mr55049325pab.131.1462220089141; 
	Mon, 02 May 2016 13:14:49 -0700 (PDT)
Received: from localhost ([187.23.154.250])
	by smtp.gmail.com with ESMTPSA id y3sm54626946par.2.2016.05.02.13.14.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 May 2016 13:14:48 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Mon, 02 May 2016 17:14:42 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon,  2 May 2016 17:13:43 -0300
Message-Id: <1462220023-17811-8-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1462220023-17811-1-git-send-email-otavio@ossystems.com.br>
References: <1462220023-17811-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: prabhu.sundararaj@nxp.com, Otavio Salvador <otavio@ossystems.com.br>,
	neenareddy.busireddy@nxp.com,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: [oe-core PATCH 7/7] xserver-xorg: Add Xwayland initialization support using weston-start
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
X-List-Received-Date: Mon, 02 May 2016 20:14:48 -0000

The weston-start script now supports loading modules so the Xwayland
support can be loaded optionally. Use this to load Weston accordingly.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc      | 9 +++++++--
 meta/recipes-graphics/xorg-xserver/xserver-xorg/xwayland | 6 ++++++
 2 files changed, 13 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/xwayland

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index f4c5469..10f5b69 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -16,7 +16,8 @@ PE = "2"
 INC_PR = "r8"
 
 XORG_PN = "xorg-server"
-SRC_URI = "${XORG_MIRROR}/individual/xserver/${XORG_PN}-${PV}.tar.bz2"
+SRC_URI = "${XORG_MIRROR}/individual/xserver/${XORG_PN}-${PV}.tar.bz2 \
+           file://xwayland"
 SRC_URI += "file://macro_tweak.patch"
 
 S = "${WORKDIR}/${XORG_PN}-${PV}"
@@ -85,7 +86,7 @@ FILES_${PN}-fbdev = "${bindir}/Xfbdev"
 FILES_${PN}-xvfb = "${bindir}/Xvfb"
 FILES_${PN}-utils = "${bindir}/scanpci ${bindir}/pcitweak ${bindir}/ioport ${bindir}/in[bwl] ${bindir}/out[bwl] ${bindir}/mmap[rw] ${bindir}/gtf ${bindir}/getconfig ${bindir}/getconfig.pl"
 FILES_${PN}-xephyr = "${bindir}/Xephyr"
-FILES_${PN}-xwayland = "${bindir}/Xwayland"
+FILES_${PN}-xwayland = "${bindir}/Xwayland ${datadir}/weston-start"
 FILES_${PN}-multimedia-modules = "${libdir}/xorg/modules/multimedia/*drv*"
 FILES_${PN}-extension-dri = "${libdir}/xorg/modules/extensions/libdri.so"
 FILES_${PN}-extension-dri2 = "${libdir}/xorg/modules/extensions/libdri2.so"
@@ -146,6 +147,10 @@ PACKAGECONFIG[nettle] = "--with-sha1=libnettle,,nettle"
 PACKAGECONFIG[gcrypt] = "--with-sha1=libgcrypt,,libgcrypt"
 
 do_install_append () {
+	if [ "${@bb.utils.contains('PACKAGECONFIG', 'xwayland', 'yes', 'no', d)}" = "yes" ]; then
+	   install -Dm 644 ${WORKDIR}/xwayland ${D}${datadir}/weston-start/xwayland
+	fi
+
 	# Its assumed base-files creates this for us
 	rmdir ${D}${localstatedir}/log/
 }
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/xwayland b/meta/recipes-graphics/xorg-xserver/xserver-xorg/xwayland
new file mode 100644
index 0000000..9499f25
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/xwayland
@@ -0,0 +1,6 @@
+#!/bin/sh
+
+mkdir -p /tmp/.X11-unix
+
+use_launch
+add_weston_argument "--modules=xwayland.so"
-- 
2.8.2


