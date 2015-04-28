Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id F3225716CE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 10:49:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3SAnW32028758 for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 11:49:32 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id X0yDkYBPJcYC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 11:49:32 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3SAnKDk028735
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 11:49:32 +0100
Message-ID: <1430218152.13022.157.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 28 Apr 2015 11:49:12 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] sstate: Use SSTATE_DIR for FILESPATH
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
X-List-Received-Date: Tue, 28 Apr 2015 10:49:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

FILESPATH was only being overridden in one fetch location, it should be
equally handled in both.

Also use SSTATE_DIR as FILESPATH so that mirror urls which do remapping
can search the local SSTATE_DIR for other paths.

Also ensure that MIRRORS is removed in both locations, previously
it was only unset in one but both codepaths should be consistent.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 8350bb0..450b736 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -569,7 +569,7 @@ def pstaging_fetch(sstatefetch, sstatepkg, d):
     bb.utils.mkdirhier(dldir)
 
     localdata.delVar('MIRRORS')
-    localdata.delVar('FILESPATH')
+    localdata.setVar('FILESPATH', dldir)
     localdata.setVar('DL_DIR', dldir)
     localdata.setVar('PREMIRRORS', mirrors)
 
@@ -700,6 +700,8 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d):
         bb.data.update_data(localdata)
 
         dldir = localdata.expand("${SSTATE_DIR}")
+        localdata.delVar('MIRRORS')
+        localdata.setVar('FILESPATH', dldir)
         localdata.setVar('DL_DIR', dldir)
         localdata.setVar('PREMIRRORS', mirrors)
 



