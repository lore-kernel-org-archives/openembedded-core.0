Return-Path: <Noor_Ahsan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 0A40376F58
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Oct 2015 13:39:33 +0000 (UTC)
Received: from svr-orw-fem-02x.mgc.mentorg.com ([147.34.96.206]
	helo=SVR-ORW-FEM-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1Zs9u1-00076u-Ts from Noor_Ahsan@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Oct 2015 06:39:33 -0700
Received: from gemini.alm.mentorg.com (147.34.91.1) by
	svr-orw-fem-02.mgc.mentorg.com (147.34.96.168) with Microsoft SMTP
	Server (TLS) id 14.3.224.2; Fri, 30 Oct 2015 06:39:33 -0700
Received: from pkl-ahsann-ubuntu.pkl.mentorg.com
	(pkl-ahsann-ubuntu.pkl.mentorg.com [137.202.157.70])	by
	gemini.alm.mentorg.com (8.14.4/8.14.4) with ESMTP id t9UDdUIi002295;
	Fri, 30 Oct 2015 08:39:32 -0500
From: "Noor, Ahsan" <noor_ahsan@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 30 Oct 2015 18:38:29 +0500
Message-ID: <1446212309-5674-1-git-send-email-noor_ahsan@mentor.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] rawcopy.py: Copy source file in image creation build folder
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
X-List-Received-Date: Fri, 30 Oct 2015 13:39:34 -0000
Content-Type: text/plain

From: Noor <noor_ahsan@mentor.com>

* In wks file when a file name is given using --sourceparams then wic directly
  use that file instead of copying them to build folder. "assemble" function in
  partitionedfs.py calls os.rename which renames the file given in --sourceparams.
  When image recipe is rebuilt then wic complains about missing file which was
  renamed in previous build.

Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
---
 scripts/lib/wic/plugins/source/rawcopy.py |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/lib/wic/plugins/source/rawcopy.py b/scripts/lib/wic/plugins/source/rawcopy.py
index f0691ba..8481168 100644
--- a/scripts/lib/wic/plugins/source/rawcopy.py
+++ b/scripts/lib/wic/plugins/source/rawcopy.py
@@ -74,6 +74,10 @@ class RawCopyPlugin(SourcePlugin):
             dd_cmd = "dd if=%s of=%s ibs=%s skip=1 conv=notrunc" % \
                     (src, dst, source_params['skip'])
             exec_cmd(dd_cmd)
+        else:
+             dst = os.path.join(cr_workdir, source_params['file'])
+             cp_cmd = "cp %s %s" % (src, dst)
+             exec_cmd(cp_cmd)
 
         # get the size in the right units for kickstart (kB)
         du_cmd = "du -Lbks %s" % dst
-- 
1.7.9.5


