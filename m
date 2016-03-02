Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id A1CCF77071
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Mar 2016 14:48:06 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u22Em6fL004300; Wed, 2 Mar 2016 08:48:06 -0600
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016030208480711-926335 ;
	Wed, 2 Mar 2016 08:48:07 -0600 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 2 Mar 2016 16:47:32 +0200
Message-Id: <a52fff5bc361cff7b3866dc5ed10333d50ab1bb5.1456929539.git.adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <cover.1456929539.git.adrian.ratiu@ni.com>
References: <cover.1456929539.git.adrian.ratiu@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 03/02/2016 08:48:07 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 03/02/2016 08:48:07 AM,
	Serialize complete at 03/02/2016 08:48:07 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-03-02_05:, , signatures=0
Subject: [PATCH v7 2/5] gpg_sign: detach_sign: fix gpg > 2.1 STDIN file descriptor
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
X-List-Received-Date: Wed, 02 Mar 2016 14:48:08 -0000

Starting from v2.1 passing passwords directly to gpg does not work
anymore [1], instead a loopback interface must be used otherwise
gpg >2.1 will error out with:
"gpg: signing failed: Inappropriate ioctl for device"

gpg <2.1 does not work with the new --pinentry-mode arg and gives an
invalid option error, so we detect what is the running version of gpg
and pass it accordingly.

[1] https://wiki.archlinux.org/index.php/GnuPG#Unattended_passphrase

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 meta/lib/oe/gpg_sign.py | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
index 1406f17..5d9ad49 100644
--- a/meta/lib/oe/gpg_sign.py
+++ b/meta/lib/oe/gpg_sign.py
@@ -67,6 +67,13 @@ class LocalSigner(object):
         if armor:
             cmd += ['--armor']
 
+        #gpg > 2.1 supports password pipes only through the loopback interface
+        #gpg < 2.1 errors out if given unknown parameters
+        dots = self.get_gpg_version().split('.')
+        assert len(dots) >= 2
+        if int(dots[0]) >= 2 and int(dots[1]) >= 1:
+            cmd += ['--pinentry-mode', 'loopback']
+
         cmd += [input_file]
 
         try:
@@ -92,6 +99,15 @@ class LocalSigner(object):
             raise Exception("Failed to sign '%s'" % input_file)
 
 
+    def get_gpg_version(self):
+        """Return the gpg version"""
+        import subprocess
+        try:
+            return subprocess.check_output((self.gpg_bin, "--version")).split()[2]
+        except subprocess.CalledProcessError as e:
+            raise bb.build.FuncFailed("Could not get gpg version: %s" % e)
+
+
     def verify(self, sig_file):
         """Verify signature"""
         cmd = self.gpg_bin + " --verify "
-- 
2.7.1


