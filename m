Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CBA3B6FFE8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 16:49:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u7UGnJgS003122
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 30 Aug 2016 09:49:19 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 30 Aug 2016 09:49:19 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 30 Aug 2016 12:49:05 -0400
Message-ID: <7cb5498ebb5800eafb42c6787536d7eed2ce4fe1.1472574514.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1472574514.git.bruce.ashfield@windriver.com>
References: <cover.1472574514.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 7/9] kernel-yocto: test for empty artifacts
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
X-List-Received-Date: Tue, 30 Aug 2016 16:49:20 -0000
Content-Type: text/plain

With the updated kernel tools, we generate a list of sccs, patches,
configs and BSP definitions as part of the meta data generation.

It is valid if there aren't any of these artifacts found (i.e. you
are just building a branch and a default config), but invoking the
tools with no inputs isn't a good idea.

To avoid this issue, we generate a string based on the artifacts
and skip calling the tools if there's nothing to do.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 8650e55de727..9b8bab63ca09 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -139,10 +139,16 @@ do_kernel_metadata() {
 	meta_dir=$(kgit --meta)
 
 	# run1: pull all the configuration fragments, no matter where they come from
-	scc --force -o ${S}/${meta_dir}:cfg,meta ${includes} ${bsp_definition} ${sccs} ${patches} ${KERNEL_FEATURES}
+	elements="`echo -n ${bsp_definition} ${sccs} ${patches} ${KERNEL_FEATURES}`"
+	if [ -n "${elements}" ]; then
+		scc --force -o ${S}/${meta_dir}:cfg,meta ${includes} ${bsp_definition} ${sccs} ${patches} ${KERNEL_FEATURES}
+	fi
 
 	# run2: only generate patches for elements that have been passed on the SRC_URI
-	scc --force -o ${S}/${meta_dir}:patch --cmds patch ${includes} ${sccs} ${patches} ${KERNEL_FEATURES}
+	elements="`echo -n ${sccs} ${patches} ${KERNEL_FEATURES}`"
+	if [ -n "${elements}" ]; then
+		scc --force -o ${S}/${meta_dir}:patch --cmds patch ${includes} ${sccs} ${patches} ${KERNEL_FEATURES}
+	fi
 }
 
 do_patch() {
-- 
2.5.0


