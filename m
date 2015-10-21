Return-Path: <Noor_Ahsan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 2FA4B769A7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Oct 2015 16:05:23 +0000 (UTC)
Received: from svr-orw-fem-04.mgc.mentorg.com ([147.34.97.41])
	by relay1.mentorg.com with esmtp 
	id 1ZovtD-0005WA-MU from Noor_Ahsan@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Oct 2015 09:05:23 -0700
Received: from gemini.alm.mentorg.com (147.34.91.1) by
	svr-orw-fem-04.mgc.mentorg.com (147.34.97.41) with Microsoft SMTP
	Server (TLS) id 14.3.224.2; Wed, 21 Oct 2015 09:05:23 -0700
Received: from pkl-ahsann-ubuntu.pkl.mentorg.com
	(pkl-ahsann-ubuntu.pkl.mentorg.com [137.202.157.70])	by
	gemini.alm.mentorg.com (8.14.4/8.14.4) with ESMTP id t9LG5KGI017217;
	Wed, 21 Oct 2015 11:05:22 -0500
From: "Noor, Ahsan" <noor_ahsan@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 21 Oct 2015 21:04:28 +0500
Message-ID: <1445443468-8394-1-git-send-email-noor_ahsan@mentor.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [RFC] rawcopy.py: Copy source file in image creation build folder
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
X-List-Received-Date: Wed, 21 Oct 2015 16:05:24 -0000
Content-Type: text/plain

From: Noor <noor_ahsan@mentor.com>

* When a file is given using --sourceparams then wic directly use that file
  instead of copying them to build folder. At time of assmebling it os.rename
  is called which rename all the files to name. In that process the original
  file get renamed. When image recipe is rebuilt then wic complains about
  missing file which renamed in previous build.

Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
---
 scripts/lib/wic/plugins/source/rawcopy.py |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/lib/wic/plugins/source/rawcopy.py b/scripts/lib/wic/plugins/source/rawcopy.py
index f0691ba..f17da27 100644
--- a/scripts/lib/wic/plugins/source/rawcopy.py
+++ b/scripts/lib/wic/plugins/source/rawcopy.py
@@ -74,6 +74,10 @@ class RawCopyPlugin(SourcePlugin):
             dd_cmd = "dd if=%s of=%s ibs=%s skip=1 conv=notrunc" % \
                     (src, dst, source_params['skip'])
             exec_cmd(dd_cmd)
+        else:
+            dst = os.path.join(cr_workdir, source_params['file'])
+            dd_cmd = "cp src dst"
+            exec_cmd(dd_cmd)
 
         # get the size in the right units for kickstart (kB)
         du_cmd = "du -Lbks %s" % dst
-- 
1.7.9.5


