Return-Path: <marc.ferland@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 1BB7573123
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Apr 2017 13:39:29 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id o36so18603856qtb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Apr 2017 06:39:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=q5+uHatciTe+VGvEI/a+VHJNnGJmaNVmR08ZYhnmZ/Y=;
	b=g9TE2SQhFVVMzO/fRYXbxQEYkHzd45yHMCbAz+Tc3jgr18cgH5LMkPqeO70ag1qPEQ
	Zqaytu6KWEVUrl0N1pXX9yQ9UPFicNMchSaxN+h2AFM6lXk3sTkARrlqaBnieLLtOvgi
	hXV23IzDjweb1WVsopIzj5KfkovvqYwoHtSKE+Vs0ACFAdvb1c9juDuuCdqZTgGu9rfY
	ORuWeKK0iwB2BypHJe3W6xU14vIv3YfBtKUmTeYbtNLP5kOQ4A8jCvs+BhHc5Jkkv09B
	zDG5x3wsvGkq996lzEa72GbeIQdeeh5Idh/GPkeTSF6hDPsfu2hUJXzvfMjpzYbSyVAo
	Gl4w==
X-Gm-Message-State: AN3rC/609WWVIVtL8EYHzjx1NB4U9UtVfFYnhIPq9TjYm4ePaGn2ENuH
	jQIdrQDkqATYAQ==
X-Received: by 10.200.34.37 with SMTP id o34mr9007628qto.213.1492436370485;
	Mon, 17 Apr 2017 06:39:30 -0700 (PDT)
Received: from marc-desktop.AMOTUS.local
	(modemcable182.194-37-24.static.videotron.ca. [24.37.194.182])
	by smtp.gmail.com with ESMTPSA id
	r24sm7257707qkl.54.2017.04.17.06.39.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 17 Apr 2017 06:39:30 -0700 (PDT)
From: Marc Ferland <ferlandm@amotus.ca>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Apr 2017 09:38:54 -0400
Message-Id: <1492436338-32048-5-git-send-email-ferlandm@amotus.ca>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1492436338-32048-1-git-send-email-ferlandm@amotus.ca>
References: <1492436338-32048-1-git-send-email-ferlandm@amotus.ca>
Subject: [PATCHv2 4/8] bluez5: add PACKAGECONFIG option for systemd
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
X-List-Received-Date: Mon, 17 Apr 2017 13:39:30 -0000

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


