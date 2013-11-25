Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id 342C56D1E2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2013 15:11:03 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	rAPFAtZ1017938
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2013 16:10:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1385392259;
	bh=o8t92DxL6sH5hz+ELXJdg0Et8oUyberMaVo8hLSX0Ks=;
	h=From:To:Cc:Subject:Date:Message-Id:Sender;
	b=Jmy6F42ogu52tHk1Y3Z/oYjA5LYgMm588/vJ1fXdSAHyoucgl7T8AYPWxL+JJN9Ym
	Q146dkDJVRDa+vfHO0aRV8NL+Xt5rxKlxwUh1Lu3HVgB/tGU59md4encLay/XKFo2r
	J9C78ppezoNeuJh7q+Ruf/Io8Dt4WgVSDldvHoO0=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id rAPFAjsT016047
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 25 Nov 2013 16:10:46 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1VkxoD-00021o-4b; Mon, 25 Nov 2013 16:10:45 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Nov 2013 16:10:44 +0100
Message-Id: <1385392244-6924-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 1.8.3.1
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -4.9
X-Spam-Level: ----
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, RP_MATCHES_RCVD, SPF_NEUTRAL,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.74
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH] bluez4: added dependency on 'libsndfile1'
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
X-List-Received-Date: Mon, 25 Nov 2013 15:11:04 -0000

bluez4 detects and uses libsndfile1 and the compilation can fail with

| sbc/sbctester.c:32:21: fatal error: sndfile.h: No such file or directory
| ...
| compilation terminated.
| make[1]: *** [sbc/sbctester.o] Error 1

in rebuilds (image with libsndfile1 was built, then some change ->
bluez4 do_configure runs with libsndfile1 -> libsndfile1 gets removed
-> bluez4 do_compile fails).

As there is no trivial way to disable its detection and to make it a
PACKAGECONFIG option, 'libsndfile1' was put into static DEPENDS.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 meta/recipes-connectivity/bluez/bluez4.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/bluez/bluez4.inc b/meta/recipes-connectivity/bluez/bluez4.inc
index e4f6834..73c2b75 100644
--- a/meta/recipes-connectivity/bluez/bluez4.inc
+++ b/meta/recipes-connectivity/bluez/bluez4.inc
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
                     file://COPYING.LIB;md5=fb504b67c50331fc78734fed90fb0e09 \
                     file://src/main.c;beginline=1;endline=24;md5=9bc54b93cd7e17bf03f52513f39f926e \
                     file://sbc/sbc.c;beginline=1;endline=25;md5=1a40781ed30d50d8639323a184aeb191"
-DEPENDS = "udev libusb dbus-glib glib-2.0 libcheck readline"
+DEPENDS = "udev libusb dbus-glib glib-2.0 libcheck readline libsndfile1"
 RDEPENDS_${PN}-dev = "bluez-hcidump"
 
 PACKAGECONFIG ??= "\
-- 
1.8.3.1


