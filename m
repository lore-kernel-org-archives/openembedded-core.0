Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id 703A26FA5E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jun 2014 13:42:55 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	s5CDWNNF028142
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jun 2014 15:32:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1402579947;
	bh=5GGoxGzw9DYXyc4e3VNepl6TbeYZD7G2WL9qWPI/sIo=;
	h=From:To:Cc:Subject:Date:Message-Id:Sender;
	b=PXDBIc2RPsCLFaXly8XKgEOqlctJ6YosGTqYHRb8bKHHyWO84sbU09aFFO9jPr63U
	1bxhGG2M8I+Zzi1bm3k4OXyj++oy4FlErFkXShjFF+0+WtWzptK6x1KN76QTKNFzzD
	KT7Bdu9UEkoMrI0z7zzEr8sLXR1BoyKoUYlveN3s=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id s5CDWFd1027182
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 12 Jun 2014 15:32:18 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1Wv571-00047g-7A; Thu, 12 Jun 2014 15:32:15 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Jun 2014 15:32:00 +0200
Message-Id: <1402579920-14967-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 1.9.3
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.3
X-Spam-Level: -----
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, RP_MATCHES_RCVD, SPF_NEUTRAL,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.74
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH] dbus: disable usage of dbus-glib explicitly
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
X-List-Received-Date: Thu, 12 Jun 2014 13:42:56 -0000

on rebuilds, dbus-native can detect an already existing dbus-glib and
tries to link some tests against it.  As files were unstaged and due
to libtool insanities this fails with:

| /usr/bin/grep: .../sysroots/x86_64-oe-linux/usr/lib/libdbus-1.la: No such file or directory
| sed: can't read .../sysroots/x86_64-oe-linux/usr/lib/libdbus-1.la: No such file or directory
| x86_64-oe-linux-libtool: link: `.../sysroots/x86_64-oe-linux/usr/lib/libdbus-1.la' is not a valid libtool archive
| make[3]: *** [libdbus-testutils.la] Error 1
| make[3]: Leaving directory `.../work/x86_64-oe-linux/dbus-native/1.8.2-r0/build/test'

Make builds predicatable (and working) by disabling usage of dbus-glib
explicitly.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 meta/recipes-core/dbus/dbus.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index b5c9159..5b2a056 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -83,7 +83,8 @@ EXTRA_OECONF = "--disable-tests \
                 --disable-xml-docs \
                 --disable-doxygen-docs \
                 --disable-libaudit \
-                --disable-systemd"
+                --disable-systemd \
+                --without-dbus-glib"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
-- 
1.9.3


