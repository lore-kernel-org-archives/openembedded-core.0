Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9D18871A88
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 10:12:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2MACVlB021107; Wed, 22 Mar 2017 10:12:31 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ncWQMz4MGHCB; Wed, 22 Mar 2017 10:12:31 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2MACTkb021104
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 22 Mar 2017 10:12:30 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cqdFl-0003LZ-Q1; Wed, 22 Mar 2017 10:12:29 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Mar 2017 10:12:28 +0000
Message-Id: <1490177548-12827-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] sstate: Ensure installation directory is empty before execution
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
X-List-Received-Date: Wed, 22 Mar 2017 10:12:35 -0000

When you enable the systemd DISTRO_FEATURE, opkg-native contains systemd units
which have a relocation fixme list. When systemd isn't in DISTRO_FEATURES, there
are no fixmes required. Unfortunately as sstate isn't cleaning up its installation
directory before use, if you install the systemd version, then install the
non-systemd version from sstate, it would leave behind the fixme file from the
systemd version and breakage results as it would try and fixup files which don't
exist.

The solution is to ensure the unpack/install directory is clean before use. It
does raise other questions about opkg-native, systemd and DISTRO_FEATURES but there
is an underlying sstate issue here too which would cause missing file failures.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sstate.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index a780926..af58854 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -313,6 +313,11 @@ def sstate_installpkg(ss, d):
         if not signer.verify(sstatepkg + '.sig'):
             bb.warn("Cannot verify signature on sstate package %s" % sstatepkg)
 
+    # Empty sstateinst directory, ensure its clean
+    if os.path.exists(sstateinst):
+        oe.path.remove(sstateinst)
+    bb.utils.mkdirhier(sstateinst)
+
     sstateinst = d.getVar("SSTATE_INSTDIR")
     d.setVar('SSTATE_FIXMEDIR', ss['fixmedir'])
 
-- 
2.7.4


