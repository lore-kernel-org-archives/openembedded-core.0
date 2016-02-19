Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id F40C577216
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Feb 2016 15:46:05 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u1JFk5NY019494; Fri, 19 Feb 2016 09:46:05 -0600
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016021909460492-1165576 ;
	Fri, 19 Feb 2016 09:46:04 -0600 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Feb 2016 17:45:47 +0200
Message-Id: <ccea554cd4fef5dcffc2e9edfb69a8b606907716.1455895912.git.adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <cover.1455895912.git.adrian.ratiu@ni.com>
References: <cover.1455895912.git.adrian.ratiu@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 02/19/2016 09:46:05 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 02/19/2016 09:46:06 AM,
	Serialize complete at 02/19/2016 09:46:06 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-02-19_08:, , signatures=0
Subject: [PATCH v6 2/4] gpg_sign: detach_sign: fix gpg > 2.1 STDIN file descriptor
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
X-List-Received-Date: Fri, 19 Feb 2016 15:46:06 -0000

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
 meta/lib/oe/gpg_sign.py | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
index ef47d1a..9f6b0f0 100644
--- a/meta/lib/oe/gpg_sign.py
+++ b/meta/lib/oe/gpg_sign.py
@@ -66,6 +66,12 @@ class LocalSigner(object):
         if armor:
             cmd += ['--armor']
 
+        #gpg > 2.1 supports password pipes only through the loopback interface
+        #gpg < 2.1 errors out if given unknown parameters
+        gpg_ver = self.get_gpg_version()
+        if gpg_ver > 2.1:
+            cmd += ['--pinentry-mode', 'loopback']
+
         try:
             keypipe = os.pipe()
 
@@ -99,6 +105,20 @@ class LocalSigner(object):
             raise Exception("Failed to sign '%s'" % input_file)
 
 
+    def get_gpg_version(self):
+        """Return the gpg version"""
+        import subprocess
+
+        job = subprocess.Popen([self.gpg_bin, "--version"], stdout=subprocess.PIPE)
+        (stdout, _) = job.communicate()
+
+        if job.returncode:
+            raise bb.build.FuncFailed("Could not get gpg version (is %s installed?)" %
+                                      self.gpg_bin)
+
+        return stdout.split()[2]
+
+
     def verify(self, sig_file):
         """Verify signature"""
         cmd = self.gpg_bin + " --verify "
-- 
2.7.1


