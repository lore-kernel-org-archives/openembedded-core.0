Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 695DF73178
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Mar 2016 10:03:22 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u2AA3MbE021078; Thu, 10 Mar 2016 04:03:22 -0600
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016031004032284-1226948 ;
	Thu, 10 Mar 2016 04:03:22 -0600 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Mar 2016 12:02:57 +0200
Message-Id: <0171a1681f66a5d10f62312fef85535925f710e4.1457603028.git.adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.7.2
In-Reply-To: <cover.1457603028.git.adrian.ratiu@ni.com>
References: <cover.1457603028.git.adrian.ratiu@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 03/10/2016 04:03:23 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 03/10/2016 04:03:23 AM,
	Serialize complete at 03/10/2016 04:03:23 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-03-10_07:, , signatures=0
Subject: [PATCH v8 3/6] gpg_sign: export_pubkey: add signature type support
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
X-List-Received-Date: Thu, 10 Mar 2016 10:03:22 -0000

Add support for multiple types of signatures (binary or ascii)
in export_pubkey(). There is no change in behaviour for the function,
the previous implicit default is the new parameter "armor" default.

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 meta/lib/oe/gpg_sign.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
index 0b5dc20..e738397 100644
--- a/meta/lib/oe/gpg_sign.py
+++ b/meta/lib/oe/gpg_sign.py
@@ -12,12 +12,14 @@ class LocalSigner(object):
         self.gpg_path = d.getVar('GPG_PATH', True)
         self.rpm_bin = bb.utils.which(os.getenv('PATH'), "rpm")
 
-    def export_pubkey(self, output_file, keyid):
+    def export_pubkey(self, output_file, keyid, armor=True):
         """Export GPG public key to a file"""
-        cmd = '%s --batch --yes --export --armor -o %s ' % \
+        cmd = '%s --batch --yes --export -o %s ' % \
                 (self.gpg_bin, output_file)
         if self.gpg_path:
             cmd += "--homedir %s " % self.gpg_path
+        if armor:
+            cmd += "--armor "
         cmd += keyid
         status, output = oe.utils.getstatusoutput(cmd)
         if status:
-- 
2.7.2


