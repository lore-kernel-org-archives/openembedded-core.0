Received: from mail-vc0-f178.google.com ([209.85.220.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <geiseri@geiseri.com>) id 1U25I9-0004XG-Jl
	for openembedded-core@lists.openembedded.org;
	Sun, 03 Feb 2013 20:31:57 +0100
Received: by mail-vc0-f178.google.com with SMTP id m8so3441854vcd.23
	for <openembedded-core@lists.openembedded.org>;
	Sun, 03 Feb 2013 11:16:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=7ywplEBjf8HzFeSTHwoGfK1DK8uEwIhjwyhvXziDmJ0=;
	b=gneMangCoL4rNRHJ2q9MPmXscN0fRcBl+WsQ95TL4Zbt7yf3sF164Q4+sAqA4jdiBm
	lIo3gbqm+pFPZ1wY2F6mbEzTs3uZNiatfje0BZdfn20HAJDE/6PruiVvgMwkxES3paSp
	euuiE9nkbRg/Ho9Y7SJemw/Q/gvEl3sAB/3ZA8GwSO7xVPIoVgHMbtQbmGYRgFg8isCT
	uOFmudhliaLDmtf4WrNt5CwpKiEghtgCb/t72eGShTDJ9Ep25aqjU+WBNCOE3w/3cWKN
	BNu+v/Gn053TcpxlfvUTo7ZK/xgGKK0qbIItbjl58CJEAi0WnxCTd9XRhXgeU7F5RZ7/
	iCug==
X-Received: by 10.58.46.203 with SMTP id x11mr15030514vem.8.1359918966150;
	Sun, 03 Feb 2013 11:16:06 -0800 (PST)
Received: from localhost.localdomain
	(pool-96-245-43-60.phlapa.fios.verizon.net. [96.245.43.60])
	by mx.google.com with ESMTPS id l18sm17769180vdh.10.2013.02.03.11.16.05
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 03 Feb 2013 11:16:05 -0800 (PST)
Sender: Ian Geiser <geiseri@geiseri.com>
From: igeiser@devonit.com
To: openembedded-core@lists.openembedded.org
Date: Sun,  3 Feb 2013 14:17:02 -0500
Message-Id: <1359919022-13375-1-git-send-email-igeiser@devonit.com>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQk5krlp0+IlgdvWINIBThBiRV4dQrLn5L62AGnXAmnmBrZHgGoovQYPTCMrQZZcJFBAR5vq
Subject: [PATCH ] add shutdown hook for udev
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 03 Feb 2013 19:32:00 -0000

From: Ian Reinhart Geiser <igeiser@devonit.com>

In cases where other initramfs modules need to rely on
udev running (ie in my case I have to load firmware on
a device that is slow to start) there needs to be a way
to keep it running during the lifecycle of the initramfs
but still be shut down before swith_root is called.  I
added a  module_pre_hook that will shut down udev before
the finish module is called.

Signed-off-by: Ian Reinhart Geiser <igeiser@devonit.com>
---
 .../initrdscripts/initramfs-framework/udev         |   12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/udev b/meta/recipes-core/initrdscripts/initramfs-framework/udev
index 7fbcc61..50c9349 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework/udev
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/udev
@@ -2,6 +2,14 @@
 # Copyright (C) 2011, 2012 O.S. Systems Software LTDA.
 # Licensed on MIT
 
+udev_shutdown_hook_handler() {
+	status=$1
+	module=$2
+	if [ "$status" = "pre" ] && [ "$module" = "finish" ]; then
+		killall `basename $_UDEV_DAEMON` 2>/dev/null
+	fi
+}
+
 udev_daemon() {
 	OPTIONS="/sbin/udevd /lib/udev/udevd /lib/systemd/systemd-udevd"
 
@@ -27,11 +35,11 @@ udev_enabled() {
 }
 
 udev_run() {
+	add_module_pre_hook "udev_shutdown_hook_handler"
+
 	mkdir -p /run
 
 	$_UDEV_DAEMON --daemon
 	udevadm trigger --action=add
 	udevadm settle
-
-	killall `basename $_UDEV_DAEMON` 2>/dev/null
 }
-- 
1.7.9.5



