Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D0B0371A68
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 14:24:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uAGEOfMu011630
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 16 Nov 2016 06:24:41 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 16 Nov 2016 06:24:41 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 16 Nov 2016 09:24:35 -0500
Message-ID: <5fee293bc9ff05d7ac9d60c85c76e300cbdb18fc.1479306112.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1479306112.git.bruce.ashfield@windriver.com>
References: <cover.1479306112.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] kern-tools: error checking and tree generation fixes
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
X-List-Received-Date: Wed, 16 Nov 2016 14:24:41 -0000
Content-Type: text/plain

During processing of the kernel meta data the kern tools were
not properly exiting on syntax errors or invalid commands.

Noticing and debugging these issues wasn't trivial. To make this
easier, we now trap the error and dump the offending meta-data
for the user to see.

There was also an issue with creating branches during tree
generation, which is resolved by always switching to the
active branch.

The following are the commit logs of the changes themselves:

[
  commit b36f6f9a5695f2084b83823393e13ca42284bed9
  Author: Paul Gortmaker <paul.gortmaker@windriver.com>
  Date:   Sat Oct 22 17:23:25 2016 -0400

      kgit-scc: dont mention meta-repo in help ; it doesnt exist

      Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
      Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>

  commit 08463d684c1952e74c25344cddace4c3f24c739d
  Author: Bruce Ashfield <bruce.ashfield@windriver.com>
  Date:   Mon Oct 31 14:30:12 2016 -0400

      scc: exit on error

      If there is an error in the processing of the input files, scc
      should exit and inform the user.

      scc is executed on a combined/preprocessed file and as a result
      it doesn't have the granularity to see each input file individually.

      Rather than moving preprocessing into scc (from spp), we can trap
      the line number of the error and dump context around the line.
      This gives the user a pointer to the input file and the specific
      line that caused the problem.

      Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>

  commit bf99953e8ac14cee653e559f2d4a6022c847a182
  Author: Bruce Ashfield <bruce.ashfield@windriver.com>
  Date:   Fri Oct 28 21:23:27 2016 -0400

      kgit-meta: always checkout branches on branch commands

      During a tree generation we must always make the branch active when
      we see any kind of branch command. This ensures that any subsequent
      patches are applied in the proper context.

      Previously, only branch creation was changing the active branch, and
      this mean that tree generation was not determinstic and relied
      on the order of processing to generate a correct tree.

      Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index d8041ddd38c5..88b1aee729c9 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=a6c2fa8aef1b
 
 DEPENDS = "git-native"
 
-SRCREV = "9a3995ee8daabf37e92e1b51b133cf8582d85809"
+SRCREV = "b36f6f9a5695f2084b83823393e13ca42284bed9"
 PR = "r12"
 PV = "0.2+git${SRCPV}"
 
-- 
2.5.0


