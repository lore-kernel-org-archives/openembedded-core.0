Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 82EAE60745
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Jan 2016 10:33:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0GAXMPt004075 for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Jan 2016 10:33:22 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id N5uy_qsVuUoy
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Jan 2016 10:33:22 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0GAXIA5004071
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Jan 2016 10:33:19 GMT
Message-ID: <1452940398.27999.10.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sat, 16 Jan 2016 10:33:18 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] image: Fix instability of do_image_* checksums
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
X-List-Received-Date: Sat, 16 Jan 2016 10:33:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The do_image_* tasks contained the expanded version of DATETIME. Due
to the expansion, we couldn't exclude the value from the task checksum
which meant the task would rerun.

We fix this by deleting the DATETIME value during expansion so we don't
expand any references to at that time. This means the task's hash can be
stable rather than having hardcoded date/time values. It will get expanded
at execution time.

This also fixes errors shown by -S:

NOTE: Reparsing files to collect dependency data
Writing locked sigs to /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/build/locked-sigs.inc
ERROR: Bitbake's cached basehash does not match the one we just generated (/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/recipes-sato/images/core-image-sato.bb.do_image_tar)!
ERROR: The mismatched hashes were 77872792556367f1dde49a1425caf1a0 and 9bb0aca6286ab7dd22d3c69964beb665

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 8ff157a..9d4438b 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -363,6 +363,10 @@ python () {
         localdata.setVar('OVERRIDES', '%s:%s' % (realt, old_overrides))
         bb.data.update_data(localdata)
         localdata.setVar('type', realt)
+        # Delete DATETIME so we don't expand any references to it now
+        # This means the task's hash can be stable rather than having hardcoded
+        # date/time values. It will get expanded at execution time.
+        localdata.delVar('DATETIME')
 
         image_cmd = localdata.getVar("IMAGE_CMD", True)
         vardeps.add('IMAGE_CMD_' + realt)
@@ -391,6 +395,7 @@ python () {
         d.setVarFlag('do_image_%s' % t, 'postfuncs', 'create_symlinks')
         d.setVarFlag('do_image_%s' % t, 'subimages', subimages)
         d.appendVarFlag('do_image_%s' % t, 'vardeps', ' '.join(vardeps))
+        d.appendVarFlag('do_image_%s' % t, 'vardepsexclude', 'DATETIME')
 
         if realt == "wic":
             d.appendVarFlag('do_image_%s' % t, 'prefuncs', ' write_wic_env')



