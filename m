Return-Path: <luca@lucaceresoli.net>
Received: from srv-hp10-72.netsons.net (srv-hp10-72.netsons.net [94.141.22.72])
	by mail.openembedded.org (Postfix) with ESMTP id 5B4917858B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2018 16:48:00 +0000 (UTC)
Received: from [109.168.11.45] (port=59066 helo=pc-ceresoli.dev.aim)
	by srv-hp10.netsons.net with esmtpa (Exim 4.89_1)
	(envelope-from <luca@lucaceresoli.net>)
	id 1f1EEx-0020JL-Bf; Wed, 28 Mar 2018 18:47:59 +0200
From: Luca Ceresoli <luca@lucaceresoli.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Mar 2018 18:47:35 +0200
Message-Id: <1522255655-25428-1-git-send-email-luca@lucaceresoli.net>
X-Mailer: git-send-email 2.7.4
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - srv-hp10.netsons.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: srv-hp10.netsons.net: authenticated_id:
	luca+lucaceresoli.net/only user confirmed/virtual account not
	confirmed
X-Authenticated-Sender: srv-hp10.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Subject: [rocko][PATCH] bitbake.conf: Add comm to HOSTTOOLS
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
X-List-Received-Date: Wed, 28 Mar 2018 16:48:01 -0000

From: Niko Mauno <niko.mauno@vaisala.com>

This mitigates following issues during u-boot do_compile() step --
otherwise, if comm is not available, they are quietly ignored:

  .../scripts/check-config.sh: line 33: comm: command not found
  .../scripts/check-config.sh: line 39: comm: command not found

Since 'comm' is provided by coreutils package, adding it to HOSTTOOLS
was considered a lower impact fix compared to adding coreutils-native
buildtime dependency to u-boot recipe.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6dc33687de9edd4269cbaf85e30945771f61f313)
Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 9696273acc0f..1cdbf430a93b 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -473,7 +473,7 @@ HOSTTOOLS_DIR = "${TMPDIR}/hosttools"
 
 # Tools needed to run builds with OE-Core
 HOSTTOOLS += " \
-    [ ar as awk basename bash bzip2 cat chgrp chmod chown chrpath cmp cp cpio \
+    [ ar as awk basename bash bzip2 cat chgrp chmod chown chrpath cmp comm cp cpio \
     cpp cut date dd diff diffstat dirname du echo egrep env expand expr false \
     fgrep file find flock g++ gawk gcc getconf getopt git grep gunzip gzip \
     head hostname id install ld ldd ln ls make makeinfo md5sum mkdir mknod \
-- 
2.7.4


