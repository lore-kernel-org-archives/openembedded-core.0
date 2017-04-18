Return-Path: <marc.ferland@gmail.com>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id D391F71C72
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Apr 2017 13:20:28 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id d203so30827381iof.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Apr 2017 06:20:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=q5+uHatciTe+VGvEI/a+VHJNnGJmaNVmR08ZYhnmZ/Y=;
	b=LL3JsDveTvPpXIJ8H462Hz+mgO9Kjy9dkhbTaA9ImE9it+HQ7RAfvJLGF9fFDPaLa5
	TfTtpfnARTjAUQE5If/qxDZR4rBJBX/TjyoVbmEr+8LNGiGbGIPeoKsiPoTEhcLOZj+2
	wcmTnyVXewLJTNqtH5p7czcWR2IHvUNS+2XztrBe30uSN34esdAresmwraVpfR5onIzi
	1CbwnLEn+MB/jlZhK+UObdtIO36Aji+E5pPAGrZaKPz8HBImY/0xwxU5xAqqtO1DGuzd
	NP5+17/6/2c6KyDo8RnWtN/WzNk3WnTb6bafP0VtjvZt7WaUA/Gfd0YgX02erI5hc2+h
	mW+w==
X-Gm-Message-State: AN3rC/4Oy0n5w1aRi4pJLAd5ihWwPr8C8UmMJlQgck2Pjkicp14GvYH7
	mgV61QEU63GfMQ==
X-Received: by 10.36.94.138 with SMTP id h132mr14692266itb.104.1492521629900; 
	Tue, 18 Apr 2017 06:20:29 -0700 (PDT)
Received: from marc-desktop.AMOTUS.local
	(modemcable182.194-37-24.static.videotron.ca. [24.37.194.182])
	by smtp.gmail.com with ESMTPSA id
	m124sm4879865itd.3.2017.04.18.06.20.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 18 Apr 2017 06:20:29 -0700 (PDT)
From: Marc Ferland <ferlandm@amotus.ca>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Apr 2017 09:20:05 -0400
Message-Id: <1492521609-26624-5-git-send-email-ferlandm@amotus.ca>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1492521609-26624-1-git-send-email-ferlandm@amotus.ca>
References: <1492521609-26624-1-git-send-email-ferlandm@amotus.ca>
Subject: [PATCHv3 4/8] bluez5: add PACKAGECONFIG option for systemd
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
X-List-Received-Date: Tue, 18 Apr 2017 13:20:29 -0000

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


