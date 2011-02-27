Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1PtcyC-0007DK-Ud
	for openembedded-core@lists.openembedded.org;
	Sun, 27 Feb 2011 10:31:17 +0100
Received: by mail-ww0-f43.google.com with SMTP id 15so3168700wwe.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Feb 2011 01:29:55 -0800 (PST)
Received: by 10.227.155.11 with SMTP id q11mr3828625wbw.130.1298798995433;
	Sun, 27 Feb 2011 01:29:55 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id n18sm1285699wee.16.2011.02.27.01.29.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 27 Feb 2011 01:29:55 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Sun, 27 Feb 2011 10:29:29 +0100
Message-Id: <c153f926735da3c4ced00d08dc1c0cbc9f94f933.1298798633.git.koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <cover.1298798633.git.koen@dominion.thruhere.net>
References: <cover.1298798633.git.koen@dominion.thruhere.net>
Subject: [PATCH 22/50] poky-qemu: handle cases where an nfs directory contains -image-
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
X-List-Received-Date: Sun, 27 Feb 2011 09:36:27 -0000

From: Scott Garman <scott.a.garman@intel.com>

Previously we mistakenly assumed that any argument which contained
*-image-* was the name of a rootfs image file. This allows nfs
directory paths to work correctly when they contain this substring.

This fixes [BUGID #743]

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 scripts/poky-qemu |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/scripts/poky-qemu b/scripts/poky-qemu
index 1086c3d..c76b3ab 100755
--- a/scripts/poky-qemu
+++ b/scripts/poky-qemu
@@ -113,6 +113,12 @@ while [ $i -le $# ]; do
             if [ -z "$ROOTFS" ]; then
                 if [ -f "$arg" ]; then
                     process_filename $arg
+                elif [ -d "$arg" ]; then
+                    # Handle the case where the nfsroot dir has -image-
+                    # in the pathname
+                    echo "Assuming $arg is an nfs rootfs"
+                    FSTYPE=nfs
+                    ROOTFS=$arg
                 else
                     ROOTFS=$arg
                     LAZY_ROOTFS="true"
-- 
1.6.6.1



