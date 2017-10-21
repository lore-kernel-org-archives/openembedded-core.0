Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 075DD782FE
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Oct 2017 12:06:19 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v9LC6GpA002741
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sat, 21 Oct 2017 13:06:18 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1e5sXg-0001F3-TC; Sat, 21 Oct 2017 13:06:16 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sat, 21 Oct 2017 13:06:11 +0100
Message-Id: <1508587571-4733-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH] oe-buildenv-internal: Fix finding build directory
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
X-List-Received-Date: Sat, 21 Oct 2017 12:06:20 -0000

The intent of the env setup scripts is to set BBPATH to point at the
build directory if not already set. This means if the user changes
directory, bitbake can still find the original build directory. The
default bblayers.conf files reset BBPATH to the correct components so
this is safe and restores the behaviour the script was intended to have.

[YOCTO #12163]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/oe-buildenv-internal | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
index e6cd141..abc5aff 100755
--- a/scripts/oe-buildenv-internal
+++ b/scripts/oe-buildenv-internal
@@ -105,6 +105,11 @@ fi
 
 BITBAKEDIR=$(readlink -f "$BITBAKEDIR")
 BUILDDIR=$(readlink -f "$BUILDDIR")
+if [ -z "$BBPATH" ]; then
+    BBPATH=$BUILDDIR
+fi
+
+export BBPATH
 
 if [ ! -d "$BITBAKEDIR" ]; then
     echo >&2 "Error: The bitbake directory ($BITBAKEDIR) does not exist!  Please ensure a copy of bitbake exists at this location or specify an alternative path on the command line"
-- 
2.7.4


