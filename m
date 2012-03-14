Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1S7ia6-0001MN-55
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 08:25:10 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q2E7GOwR011823
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2012 00:16:24 -0700 (PDT)
Received: from build-PowerEdge-T100.corp.ad.wrs.com (128.224.163.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Wed, 14 Mar 2012 00:16:24 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 14 Mar 2012 15:16:03 +0800
Message-ID: <8cc6388313595c314347bf98254a4c2489be69e4.1331709176.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1331709176.git.liezhi.yang@windriver.com>
References: <cover.1331709176.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1 V2] package.bbclass: do not split debug pkg when no debugsources.list
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Mar 2012 07:25:10 -0000
Content-Type: text/plain

We don't have to split the debug pkg if it is null (No debugsources.list
since the find-debuginfo.sh would not generate it for the null pkg).

Serval pkg's debug pkg is null, and there were a few errors: (53 pkgs
had such errors in a core-image-sato build):

log.do_package:sort: open failed: debugsources.list: No such file or directory

[YOCTO #2076]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/package.bbclass |   18 +++++++++---------
 1 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 7bcfa02..bdc4d37 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -234,17 +234,17 @@ def splitfile2(debugsrcdir, d):
 
     import commands, stat
 
-    dvar = d.getVar('PKGD', True)
-    pathprefix = "export PATH=%s; " % d.getVar('PATH', True)
-    strip = d.getVar("STRIP", True)
-    objcopy = d.getVar("OBJCOPY", True)
-    debugedit = d.expand("${STAGING_LIBDIR_NATIVE}/rpm/bin/debugedit")
-    workdir = d.getVar("WORKDIR", True)
-    workparentdir = os.path.dirname(workdir)
-    workbasedir = os.path.basename(workdir)
     sourcefile = d.expand("${WORKDIR}/debugsources.list")
+    if debugsrcdir and os.path.isfile(sourcefile):
+       dvar = d.getVar('PKGD', True)
+       pathprefix = "export PATH=%s; " % d.getVar('PATH', True)
+       strip = d.getVar("STRIP", True)
+       objcopy = d.getVar("OBJCOPY", True)
+       debugedit = d.expand("${STAGING_LIBDIR_NATIVE}/rpm/bin/debugedit")
+       workdir = d.getVar("WORKDIR", True)
+       workparentdir = os.path.dirname(workdir)
+       workbasedir = os.path.basename(workdir)
 
-    if debugsrcdir:
        nosuchdir = []
        basepath = dvar
        for p in debugsrcdir.split("/"):
-- 
1.7.4.1



