Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0CFC777317
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Feb 2017 15:30:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v11FUk1X001507
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 1 Feb 2017 07:30:47 -0800
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 1 Feb 2017 07:30:46 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 1 Feb 2017 10:30:35 -0500
Message-ID: <7c0148e6b60423f4165de96867495887f00ad5c1.1485962567.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1485962567.git.bruce.ashfield@windriver.com>
References: <cover.1485962567.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/10] kernel-yocto: log the BSP definition file
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
X-List-Received-Date: Wed, 01 Feb 2017 15:30:47 -0000
Content-Type: text/plain

When debugging a kernel configuration issue, one of the first questions
is "what BSP was used". To answer this qusetion, we log the BSP .scc
file that was used to generate the kernel configuration in the kernel
source meta directory.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 36f61c5694fb..a7b635638186 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -148,6 +148,7 @@ do_kernel_metadata() {
 	# run1: pull all the configuration fragments, no matter where they come from
 	elements="`echo -n ${bsp_definition} ${sccs} ${patches} ${KERNEL_FEATURES}`"
 	if [ -n "${elements}" ]; then
+		echo "${bsp_definition}}" > ${S}/${meta_dir}/bsp_definition
 		scc --force -o ${S}/${meta_dir}:cfg,merge,meta ${includes} ${bsp_definition} ${sccs} ${patches} ${KERNEL_FEATURES}
 		if [ $? -ne 0 ]; then
 			bbfatal_log "Could not generate configuration queue for ${KMACHINE}."
-- 
2.5.0


