Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1S7HxU-00043b-SJ
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 03:59:33 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q2D2omvg023556
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2012 19:50:48 -0700 (PDT)
Received: from build-PowerEdge-T100.corp.ad.wrs.com (128.224.163.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Mon, 12 Mar 2012 19:50:48 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 13 Mar 2012 10:50:25 +0800
Message-ID: <195b9ad9e78ea2355c0a5594436293e803bd460e.1331605922.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1331605922.git.liezhi.yang@windriver.com>
References: <cover.1331605922.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] package.bbclass: create debugsources.list if it doesn't exist
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
X-List-Received-Date: Tue, 13 Mar 2012 02:59:33 -0000
Content-Type: text/plain

Serval pkg's debug pkg is null, so the find-debuginfo.sh would not
generate the ${WORKDIR}/debugsources.list, but the processdebugsrc
always need it, there are a few such errors currently:(53 pkgs have such
errors in a core-image-sato build):

log.do_package:sort: open failed: debugsources.list: No such file or directory

Create debugsources.list if it doesn't exist would fix this problem.

[YOCTO #2076]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/package.bbclass |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 9b6862d..8e76ef8 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -243,6 +243,11 @@ def splitfile2(debugsrcdir, d):
     workparentdir = os.path.dirname(workdir)
     workbasedir = os.path.basename(workdir)
     sourcefile = d.expand("${WORKDIR}/debugsources.list")
+    # There is no debugsources.list when the debug pkg is null, but the
+    # processdebugsrc needs it, so create one if it doesn't exist.
+    if not os.path.isfile(sourcefile):
+        f = open(sourcefile, 'w')
+        f.close()
 
     if debugsrcdir:
        nosuchdir = []
-- 
1.7.4.1



