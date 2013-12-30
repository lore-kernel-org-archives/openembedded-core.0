Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 753D560C22
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Dec 2013 09:09:16 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rBU99Fjv021661
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 30 Dec 2013 01:09:16 -0800 (PST)
Received: from d9010-u1204.wrs.com (128.224.163.135) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Mon, 30 Dec 2013 01:09:14 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 30 Dec 2013 17:09:16 +0800
Message-ID: <1388394556-28170-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] test-dependencies.sh: avoid showing misleading error messages
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
X-List-Received-Date: Mon, 30 Dec 2013 09:09:17 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

This avoids the following error messages when no dependency
issue detected:
find: `/build/r_cgp-dep_1225/p_x86_1225/bitbake_build/tmp/work/': No such file or directory
grep: test-dependencies/1388042399/3_min/failed/*: No such file or directory
ls: cannot access test-dependencies/1388042399/3_min/failed/*: No such file or directory

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 scripts/test-dependencies.sh |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/test-dependencies.sh b/scripts/test-dependencies.sh
index e4cf4d3..ca7e687 100755
--- a/scripts/test-dependencies.sh
+++ b/scripts/test-dependencies.sh
@@ -178,14 +178,14 @@ build_every_recipe() {
   # This will be usefull to see which library is pulling new dependency
   echo "Copying do_package logs to ${OUTPUTB}/do_package/"
   mkdir ${OUTPUTB}/do_package
-  find $tmpdir/work/ -name log.do_package | while read f; do
+  find $tmpdir/work/ -name log.do_package 2>/dev/null| while read f; do
     # pn is 3 levels back, but we don't know if there is just one log per pn (only one arch and version)
     # dest=`echo $f | sed 's#^.*/\([^/]*\)/\([^/]*\)/\([^/]*\)/log.do_package#\1#g'`
     dest=`echo $f | sed "s#$tmpdir/work/##g; s#/#_#g"`
     cp $f ${OUTPUTB}/do_package/$dest
   done
-  grep "ERROR: Task.*failed" ${OUTPUTB}/failed/*
-  ls -1 ${OUTPUTB}/failed/* >> ${OUTPUT_BASE}/failed.recipes
+  grep "ERROR: Task.*failed" ${OUTPUTB}/failed/* 2>/dev/null
+  ls -1 ${OUTPUTB}/failed/* >> ${OUTPUT_BASE}/failed.recipes 2>/dev/null
 }
 
 compare_deps() {
-- 
1.7.9.5


