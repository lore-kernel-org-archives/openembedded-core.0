Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 8F7D077174
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 05:48:05 +0000 (UTC)
Received: from trochilidae.toradex.int (unknown
	[IPv6:2601:602:8802:504f:3e97:eff:fe92:db3b])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 5914A5C0AC1;
	Mon,  8 Aug 2016 07:43:39 +0200 (CEST)
From: Stefan Agner <stefan@agner.ch>
To: openembedded-core@lists.openembedded.org
Date: Sun,  7 Aug 2016 22:47:28 -0700
Message-Id: <20160808054728.20371-1-stefan@agner.ch>
X-Mailer: git-send-email 2.9.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1470635020; bh=+3cU4XXZOBu2/iQOQ1u44Quk4QlLVu4x/9oYxGycqcI=;
	h=From:To:Cc:Subject:Date:Message-Id;
	b=bd/9dasl1vqY9Dw3P0phaltUpny8jNR2eXsC1KhvbxdxcCyXbOiFvdgEDGrGSl/pUxodb0T6VvSI3hIDKqog+Fq2TCDUc+LxMr5f3H9bWgTKubeqRZxvmV0d3U0XHYA7SzLE0kVA/5DsFnhbBhklMzoqIEHygZkbQiwPqzqvcXc=
Subject: [PATCH v2] busybox: Fix busybox-init on non-tty consoles
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
X-List-Received-Date: Mon, 08 Aug 2016 05:48:05 -0000

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
index 5e91a26..39c2eef 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -286,8 +286,8 @@ do_install () {
                         for i in $tmp
                         do
                                 j=`echo ${i} | sed s/\;/\ /g`
-                                label=`echo ${i} | sed -e 's/tty//' -e 's/^.*;//' -e 's/;.*//'`
-                                echo "tty$label::respawn:${base_sbindir}/getty ${j}" >> ${D}${sysconfdir}/inittab
+                                id=`echo ${i} | sed -e 's/^.*;//' -e 's/;.*//'`
+                                echo "$id::respawn:${base_sbindir}/getty ${j}" >> ${D}${sysconfdir}/inittab
                         done
                 fi
         fi
-- 
2.9.0


