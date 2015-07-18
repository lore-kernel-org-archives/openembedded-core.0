Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id A446B7611D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jul 2015 15:16:53 +0000 (UTC)
Received: by pabkd10 with SMTP id kd10so4895444pab.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jul 2015 08:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=n8WNP61e95ZlsKIgvS2/yYUG+vU1gfISxYiEpTik+RM=;
	b=E3utn2lcP9RVKbpXZSWDTaXKoxUwXLDUe58Hs/CYQMnqPMG2CKY7cfL3G+lFH++kSh
	JiowXTqxiIxTh3tkPXRGQnSOlh2PpJCV7iDeftS5G0JjzW4oKENX1IAKnMsMzbOiuPKn
	cPQngg2t+uKhE8mCKqeYkrwhbpIrbzsUp7dUSSD2R2MYpNxTGRDSqyKXqdziO9FFhQH2
	kIvXJoFTe84dHf+926C/clCcsYj5NeRJYmMoMj232y4KBrqdI+iEuW71372Qdp/hbIcN
	kUsmh6md03IkXnnJ0Ci/2Mt6A4LZYX63nswVEnYXuyY0MjdZTnjYO0/2dcotJjX2fHxp
	qW9A==
X-Received: by 10.66.132.81 with SMTP id os17mr40371643pab.153.1437232614009; 
	Sat, 18 Jul 2015 08:16:54 -0700 (PDT)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	kx14sm14689927pab.0.2015.07.18.08.16.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 Jul 2015 08:16:51 -0700 (PDT)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id 38331FC12FC; Sat, 18 Jul 2015 08:16:36 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Jul 2015 08:16:27 -0700
Message-Id: <61263029dc57b2b3bf72df1bff6e582fe9444544.1437232180.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1437232180.git.akuster808@gmail.com>
References: <cover.1437232180.git.akuster808@gmail.com>
In-Reply-To: <cover.1437232180.git.akuster808@gmail.com>
References: <cover.1437232180.git.akuster808@gmail.com>
Subject: [PATCH 20/25] dbus: CVE-2015-0245: prevent forged ActivationFailure
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
X-List-Received-Date: Sat, 18 Jul 2015 15:16:53 -0000

From: Jussi Kukkonen <jussi.kukkonen@intel.com>

Fix CVE-2015-0245 by preventing non-root and non-systemd processes
from fooling the dbus daemon into thinking systemd service activation
failed.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-core/dbus/dbus.inc                    |  1 +
 ...015-0245-prevent-forged-ActivationFailure.patch | 48 ++++++++++++++++++++++
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-core/dbus/dbus/CVE-2015-0245-prevent-forged-ActivationFailure.patch

diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index d38ba7e..971eabf 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -17,6 +17,7 @@ SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://dbus-1.init \
            file://os-test.patch \
            file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
+           file://CVE-2015-0245-prevent-forged-ActivationFailure.patch \
 "
 
 inherit useradd autotools pkgconfig gettext update-rc.d
diff --git a/meta/recipes-core/dbus/dbus/CVE-2015-0245-prevent-forged-ActivationFailure.patch b/meta/recipes-core/dbus/dbus/CVE-2015-0245-prevent-forged-ActivationFailure.patch
new file mode 100644
index 0000000..59363b3
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus/CVE-2015-0245-prevent-forged-ActivationFailure.patch
@@ -0,0 +1,48 @@
+CVE-2015-0245: prevent forged ActivationFailure from non-root processes
+
+Upstream has fixed this in code but suggests using this as a easily
+backportable fix: https://bugs.freedesktop.org/show_bug.cgi?id=88811
+
+Upstream-Status: Inappropriate
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+
+
+
+From 91eb2ea3362630190e08c1c777c47bae065ac828 Mon Sep 17 00:00:00 2001
+From: Simon McVittie <simon.mcvittie@collabora.co.uk>
+Date: Mon, 26 Jan 2015 20:09:56 +0000
+Subject: [PATCH 1/3] CVE-2015-0245: prevent forged ActivationFailure from
+ non-root processes
+
+Without either this rule or better checking in dbus-daemon, non-systemd
+processes can make dbus-daemon think systemd failed to activate a system
+service, resulting in an error reply back to the requester.
+
+This is redundant with the fix in the C code (which I consider to be
+the real solution), but is likely to be easier to backport.
+---
+ bus/system.conf.in | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/bus/system.conf.in b/bus/system.conf.in
+index 92f4cc4..851b9e6 100644
+--- a/bus/system.conf.in
++++ b/bus/system.conf.in
+@@ -68,6 +68,14 @@
+     <deny send_destination="org.freedesktop.DBus"
+           send_interface="org.freedesktop.DBus"
+           send_member="UpdateActivationEnvironment"/>
++    <deny send_destination="org.freedesktop.DBus"
++          send_interface="org.freedesktop.systemd1.Activator"/>
++  </policy>
++
++  <!-- Only systemd, which runs as root, may report activation failures. -->
++  <policy user="root">
++    <allow send_destination="org.freedesktop.DBus"
++           send_interface="org.freedesktop.systemd1.Activator"/>
+   </policy>
+ 
+   <!-- Config files are placed here that among other things, punch 
+-- 
+2.1.4
+
-- 
1.9.1


