Return-Path: <stefan@agner.ch>
X-Greylist: delayed 560 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 08 Aug 2016 01:40:27 UTC
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 109CA6FEFA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 01:40:27 +0000 (UTC)
Received: from trochilidae.toradex.int (unknown
	[IPv6:2601:602:8802:504f:3e97:eff:fe92:db3b])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 91DB85C141D;
	Mon,  8 Aug 2016 03:26:40 +0200 (CEST)
From: Stefan Agner <stefan@agner.ch>
To: openembedded-core@lists.openembedded.org
Date: Sun,  7 Aug 2016 18:30:58 -0700
Message-Id: <20160808013058.8636-1-stefan@agner.ch>
X-Mailer: git-send-email 2.9.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1470619601; bh=6LpeSQjWYDDryCP2H7D0zgyQjI4cgnzqMUF3BjH3yRY=;
	h=From:To:Cc:Subject:Date:Message-Id;
	b=IlEKlSUaJr3GTHFfqW30eKPhEW4RSpNK3MJRq5O5DBoE69ol9repAIn3dpXs43kGDMQ2wW20fXQsGDp0c0EuqM9Y/UeS4XkfN8MdbkB3dq6u2ZRkWMYl6J0cdwFfqN3QbGLPDaUK5UVejzwWAVc/8bAP9VRwxwjJIQQLUzaa8c8=
Subject: [PATCH] busybox: Fix busybox-init on non-tty consoles
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
X-List-Received-Date: Mon, 08 Aug 2016 01:40:29 -0000

When using non-tty consoles (e.g. VirtIO console /dev/hvc0) the
current init system fails with:
process '/sbin/getty 115200 hvc0' (pid 545) exited. Scheduling for restart.
can't open /dev/ttyhvc0: No such file or directory

The first field needs to be a valid device. The BusyBox inittab example
explains as follows:
"<id>: WARNING: This field has a non-traditional meaning for BusyBox init!

The id field is used by BusyBox init to specify the controlling tty for
the specified process to run on.  The contents of this field are
appended to "/dev/" and used as-is."

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 meta/recipes-core/busybox/busybox.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 5e91a26..4765c28 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -286,8 +286,8 @@ do_install () {
                         for i in $tmp
                         do
                                 j=`echo ${i} | sed s/\;/\ /g`
-                                label=`echo ${i} | sed -e 's/tty//' -e 's/^.*;//' -e 's/;.*//'`
-                                echo "tty$label::respawn:${base_sbindir}/getty ${j}" >> ${D}${sysconfdir}/inittab
+                                id=`echo ${i} | -e 's/^.*;//' -e 's/;.*//'`
+                                echo "$id::respawn:${base_sbindir}/getty ${j}" >> ${D}${sysconfdir}/inittab
                         done
                 fi
         fi
-- 
2.9.0


