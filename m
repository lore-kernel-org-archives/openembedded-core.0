Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RuIOu-0004YB-I7
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Feb 2012 07:50:08 +0100
Received: by pbbb4 with SMTP id b4so4117762pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Feb 2012 22:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=HsSp+RqukBAlK2Osbfnz9LCXkQWJgNfciVzjOlNVh0E=;
	b=NlIMCdj5scjo1yDCQTkezQsB2/CdtR8VyEcYthAI/dspxekDvv9OI8H3kdMOA73FSG
	76Qe2Vs+2e7a4+2h8SrAVu05e6/eoj5jUUON+XK0ynhFzsTDNV5+jgg7KUc3aWmzcTq3
	nDklLNKnfPvs4Ny+8eHcWb3XATAF8ffkVLWv4=
Received: by 10.68.73.6 with SMTP id h6mr44630291pbv.116.1328510527121;
	Sun, 05 Feb 2012 22:42:07 -0800 (PST)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168]) by mx.google.com with ESMTPS id
	li19sm37030710pbb.17.2012.02.05.22.42.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Feb 2012 22:42:06 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  5 Feb 2012 22:40:39 -0800
Message-Id: <41e218a2ce9a874d44f09eeec9190e2431c647e6.1328510189.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <04705556464a6e41642962da40f0e17847ee3483.1328510188.git.raj.khem@gmail.com>
References: <04705556464a6e41642962da40f0e17847ee3483.1328510188.git.raj.khem@gmail.com>
In-Reply-To: <cover.1328510187.git.raj.khem@gmail.com>
References: <cover.1328510187.git.raj.khem@gmail.com>
Subject: [PATCH 13/20] runqemu-internal: qemuarm can handle 256M
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
X-List-Received-Date: Mon, 06 Feb 2012 06:50:12 -0000

Raise the check for max RAM supported for QEMU/arm
its 256M since we patched it to be so in OE

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 scripts/runqemu-internal |   13 +++++++------
 1 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index 21fbce3..73b8b41 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -67,13 +67,14 @@ fi
 # QEMU_MEMORY has 'M' appended to mem_size
 QEMU_MEMORY="$mem_size"M
 
-# Bug 433: qemuarm cannot use > 128 MB RAM
+# Bug 433: qemuarm cannot use > 256 MB RAM
 if [ "$MACHINE" = "qemuarm" ]; then
-    if [[ -z "$mem_size" || $mem_size -gt 128 ]]; then
-        echo "WARNING: qemuarm does not support > 128M of RAM."
-        echo "Changing QEMU_MEMORY to default of 128M."
-        QEMU_MEMORY="128M"
-        SCRIPT_QEMU_EXTRA_OPT=`echo $SCRIPT_QEMU_EXTRA_OPT | sed -e "s/$mem_set/-m 128/" `
+    if [[ -z "$mem_size" || $mem_size -gt 256 ]]; then
+        echo "WARNING: qemuarm does not support > 256M of RAM."
+        echo "Changing QEMU_MEMORY to default of 256M."
+        QEMU_MEMORY="256M"
+	mem_size="256"
+        SCRIPT_QEMU_EXTRA_OPT=`echo $SCRIPT_QEMU_EXTRA_OPT | sed -e "s/$mem_set/-m 256/" `
     fi
 fi
 
-- 
1.7.5.4



