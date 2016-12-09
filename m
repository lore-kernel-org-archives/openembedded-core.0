Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B523771D6D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Dec 2016 19:28:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uB9JS3sC000341
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 9 Dec 2016 11:28:03 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Fri, 9 Dec 2016 11:28:02 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 9 Dec 2016 14:28:00 -0500
Message-ID: <5ba0c0a6cd0e079327804e6133842a8b3dc08644.1481311536.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1481311536.git.bruce.ashfield@windriver.com>
References: <cover.1481311536.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] kernel-yocto: explicitly trap subcommand errors
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
X-List-Received-Date: Fri, 09 Dec 2016 19:28:02 -0000
Content-Type: text/plain

To trap errors and halt processing, do_kernel_metadata was recently
switched to exit on any non zero return code. While the concept is
sound, there are subcommands that have legitimate non-zero return
codes.

Instead of removing set +e, we'll explicitly check the return code
of the commands that can error, and throw a bbfatal to alert the
user.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 7c32c9664610..a60327a07e50 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -61,6 +61,7 @@ def get_machine_branch(d, default):
     return default
 
 do_kernel_metadata() {
+	set +e
 	cd ${S}
 	export KMETA=${KMETA}
 
@@ -148,12 +149,18 @@ do_kernel_metadata() {
 	elements="`echo -n ${bsp_definition} ${sccs} ${patches} ${KERNEL_FEATURES}`"
 	if [ -n "${elements}" ]; then
 		scc --force -o ${S}/${meta_dir}:cfg,meta ${includes} ${bsp_definition} ${sccs} ${patches} ${KERNEL_FEATURES}
+		if [ $? -ne 0 ]; then
+			bbfatal_log "Could not generate configuration queue for ${KMACHINE}."
+		fi
 	fi
 
 	# run2: only generate patches for elements that have been passed on the SRC_URI
 	elements="`echo -n ${sccs} ${patches} ${KERNEL_FEATURES}`"
 	if [ -n "${elements}" ]; then
 		scc --force -o ${S}/${meta_dir}:patch --cmds patch ${includes} ${sccs} ${patches} ${KERNEL_FEATURES}
+		if [ $? -ne 0 ]; then
+			bbfatal_log "Could not generate configuration queue for ${KMACHINE}."
+		fi
 	fi
 }
 
-- 
2.5.0


