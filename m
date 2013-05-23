Return-Path: <Ming.Liu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A14E76086B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2013 07:33:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r4N7Xn3P005433
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2013 00:33:49 -0700 (PDT)
Received: from pek-lpgbuild4.wrs.com (128.224.153.32) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Thu, 23 May 2013 00:33:48 -0700
From: Ming Liu <ming.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 23 May 2013 15:33:43 +0800
Message-ID: <1369294423-19805-1-git-send-email-ming.liu@windriver.com>
X-Mailer: git-send-email 1.7.11
MIME-Version: 1.0
Subject: [PATCH] rm_work.bbclass: ignore failure for removing pseudo folder
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
X-List-Received-Date: Thu, 23 May 2013 07:33:48 -0000
Content-Type: text/plain

When building over NFS2/3 server, removal of pseudo folders will fail in
some cases for there are files in it still used by pseudo daemon, thus
cause ".nfsXXXXX" files generated which can't be removed by clients. This
will lead rm_work task fo fail.

These failures could be safely ignored because ".nfsXXXXX" files would be
automatically cleared by NFS server when no clients keep opening them.

[YOCTO #4531]
[ CQID: WIND00412051 ]

Signed-off-by: Ming Liu <ming.liu@windriver.com>
---
 meta/classes/rm_work.bbclass | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
index 1642af7..f0f6d18 100644
--- a/meta/classes/rm_work.bbclass
+++ b/meta/classes/rm_work.bbclass
@@ -30,15 +30,18 @@ do_rm_work () {
     cd ${WORKDIR}
     for dir in *
     do
-        # Retain only logs and other files in temp.
-        if [ $dir != 'temp' ]; then
+        # Retain only logs and other files in temp, safely ignore
+        # failures of removing pseudo folers on NFS2/3 server.
+        if [ $dir = 'pseudo' ]; then
+            rm -rf $dir 2> /dev/null || true
+        elif [ $dir != 'temp' ]; then
             rm -rf $dir
         fi
     done
 
     # Need to add pseudo back or subsqeuent work in this workdir
     # might fail since setscene may not rerun to recreate it
-    mkdir ${WORKDIR}/pseudo/
+    mkdir -p ${WORKDIR}/pseudo/
 
     # Change normal stamps into setscene stamps as they better reflect the
     # fact WORKDIR is now empty
-- 
1.7.11


