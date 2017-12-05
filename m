Return-Path: <jason.wessel@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 037D4783AE
	for <Openembedded-core@lists.openembedded.org>;
	Tue,  5 Dec 2017 17:51:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vB5HpJKT024110
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 5 Dec 2017 09:51:20 -0800
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 5 Dec 2017 09:51:18 -0800
From: Jason Wessel <jason.wessel@windriver.com>
To: <Openembedded-core@lists.openembedded.org>
Date: Tue, 5 Dec 2017 09:51:16 -0800
Message-ID: <20171205175116.91943-2-jason.wessel@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20171205175116.91943-1-jason.wessel@windriver.com>
References: <20171205175116.91943-1-jason.wessel@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] ovmf: Fix build failure for PARALLEL_MAKE with no space
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
X-List-Received-Date: Tue, 05 Dec 2017 17:51:19 -0000
Content-Type: text/plain

The ovmf package fails to build if you use a PARALLEL_MAKE flag
without a space in it.  If you put the following in local.conf for
example:

     PARALLEL_MAKE = "-j4"

The build will fail with as follows:

| build.exe: error: Option -n only allows one instance in command line!
| WARNING: /opt/build/ovmf/git-r0/temp/run.do_compile.26080:1 exit 2 from '/opt/build/ovmf/git-r0/git/OvmfPkg/build.sh $PARALLEL_JOBS -a $OVMF_ARCH -b RELEASE -t ${FIXED_GCCVER}'
| ERROR: Function failed: do_compile (log file is located at /opt/build/ovmf/git-r0/temp/log.do_compile.26080)

The failure is because the build.sh expects a space.  The simple work
around is to fix the recipe to add some white space.  The build.sh
only cares that it gets at least one space between the arguments, the
extra space if someone uses "-j 4" does not cause problems.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 meta/recipes-core/ovmf/ovmf_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index a98826210e..fa0d66291d 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -151,7 +151,7 @@ do_compile_class-native() {
 
 do_compile_class-target() {
     export LFLAGS="${LDFLAGS}"
-    PARALLEL_JOBS="${@ '${PARALLEL_MAKE}'.replace('-j', '-n')}"
+    PARALLEL_JOBS="${@ '${PARALLEL_MAKE}'.replace('-j', '-n ')}"
     OVMF_ARCH="X64"
     if [ "${TARGET_ARCH}" != "x86_64" ] ; then
         OVMF_ARCH="IA32"
-- 
2.11.0


