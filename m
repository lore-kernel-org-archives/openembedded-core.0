Return-Path: <marc.ferland@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 18BEB77A4A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Apr 2017 14:48:58 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id o85so15194671qkh.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Apr 2017 07:48:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=q5+uHatciTe+VGvEI/a+VHJNnGJmaNVmR08ZYhnmZ/Y=;
	b=Jr0odptoPRDKVQOphziePpP2AJmNP+gL61WJL2cF/hmJAoiKvSmorTM4YBaCFwqZNN
	oSkeDOdG7W6HM2Wgd7RXKQid7QH4tGdlgK33aviKwGDnQ0KMx83Awo05+yGH2EGPI0mq
	uuUMeFDce8C9JWZIkdyjnmRNXZIrvTENIfx+0iq44vpPQ3Wdoi1Sf90D9mx49vQblPGO
	P5ZBBx+4QWCGeIle0z8jGlH0Dn0evhGXUqVNW8qZlER3QqQ98SBK4toIrPK0fys0Uje+
	K6gJjxGlH60HJJCbmXLz9vODSVonLri1hhqoxDjnsaObuxbNXYll7qTOfruuEgCIm2d9
	6clw==
X-Gm-Message-State: AN3rC/5J5kt6btAFDHc25r79H+D5V+ft9b9Nhi6IeU56kR9TeU8jmJeY
	tiJVKxWoTCG/L6Ib
X-Received: by 10.55.142.69 with SMTP id q66mr29477721qkd.13.1493131739294;
	Tue, 25 Apr 2017 07:48:59 -0700 (PDT)
Received: from marc-desktop.AMOTUS.local
	(modemcable182.194-37-24.static.videotron.ca. [24.37.194.182])
	by smtp.gmail.com with ESMTPSA id
	s10sm15188330qke.53.2017.04.25.07.48.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 25 Apr 2017 07:48:58 -0700 (PDT)
From: Marc Ferland <ferlandm@amotus.ca>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Apr 2017 10:48:37 -0400
Message-Id: <1493131720-19456-5-git-send-email-ferlandm@amotus.ca>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1493131720-19456-1-git-send-email-ferlandm@amotus.ca>
References: <1493131720-19456-1-git-send-email-ferlandm@amotus.ca>
Subject: [PATCHv4 4/7] bluez5: add PACKAGECONFIG option for systemd
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
X-List-Received-Date: Tue, 25 Apr 2017 14:48:58 -0000

Signed-off-by: Marc Ferland <ferlandm@amotus.ca>
---
 meta/recipes-connectivity/bluez5/bluez5.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 687656e..71a5016 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -12,11 +12,12 @@ RPROVIDES_${PN} += "bluez-hcidump"
 
 RCONFLICTS_${PN} = "bluez4"
 
-PACKAGECONFIG ??= "obex-profiles readline"
+PACKAGECONFIG ??= "obex-profiles readline ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 PACKAGECONFIG[obex-profiles] = "--enable-obex,--disable-obex,libical"
 PACKAGECONFIG[readline] = "--enable-client,--disable-client,readline,"
 PACKAGECONFIG[testing] = "--enable-testing,--disable-testing"
 PACKAGECONFIG[midi] = "--enable-midi,--disable-midi,alsa-lib"
+PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd"
 
 SRC_URI = "\
     ${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
@@ -36,7 +37,6 @@ EXTRA_OECONF = "\
   --disable-cups \
   --enable-test \
   --enable-datafiles \
-  ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--enable-systemd', '--disable-systemd', d)} \
   --enable-library \
 "
 
-- 
2.7.4


