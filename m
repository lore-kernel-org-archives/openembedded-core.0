Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RtElt-0000vk-RE
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Feb 2012 09:45:30 +0100
Received: by mail-pw0-f47.google.com with SMTP id b4so2433706pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Feb 2012 00:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=HsSp+RqukBAlK2Osbfnz9LCXkQWJgNfciVzjOlNVh0E=;
	b=jpZOvTOVWx8hYEEWztO+76wE7EqZ39HXFRqiaccccR7IFk1+XkBKKNTy4cvARxRxLj
	wNimGJ8B/dj1t16/9SZiy8l2dJGkqq/ZO/fn5x6HD6Mr5FqstZObEyhf+pkEiBxD8Bg4
	Bwew/59tmlpU7WWabYI6lGnIOmuTvvqFsVHnA=
Received: by 10.68.75.79 with SMTP id a15mr15912865pbw.62.1328258254629;
	Fri, 03 Feb 2012 00:37:34 -0800 (PST)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id z5sm11478262pbc.5.2012.02.03.00.37.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 03 Feb 2012 00:37:33 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Feb 2012 00:36:18 -0800
Message-Id: <5407fb2fc93f7d28a0e5000834c7b3b548826392.1328257913.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <a6d38499fa7010e3e96d9a36d9b88231d911a3c8.1328257913.git.raj.khem@gmail.com>
References: <a6d38499fa7010e3e96d9a36d9b88231d911a3c8.1328257913.git.raj.khem@gmail.com>
In-Reply-To: <cover.1328257913.git.raj.khem@gmail.com>
References: <cover.1328257913.git.raj.khem@gmail.com>
Subject: [PATCH 13/14] runqemu-internal: qemuarm can handle 256M
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
X-List-Received-Date: Fri, 03 Feb 2012 08:45:30 -0000

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



