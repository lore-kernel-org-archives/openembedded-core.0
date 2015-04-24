Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 27ABF6E268
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Apr 2015 20:03:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3OK35Ip016864
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 24 Apr 2015 13:03:06 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Fri, 24 Apr 2015 13:03:05 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <akuster808@gmail.com>
Date: Fri, 24 Apr 2015 16:03:05 -0400
Message-ID: <1429905785-17121-1-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Cc: steve@staticfree.info, openembedded-core@lists.openembedded.org
Subject: [dizzy][PATCH] kernel-yocto.bbclass: Bug Fix inside do_kernel_checkout()
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
X-List-Received-Date: Fri, 24 Apr 2015 20:03:07 -0000
Content-Type: text/plain

From: Theodor Gherzan <theodor@resin.io>

--047d7b3a7fac0eebee050cb47483
Content-Type: text/plain; charset="UTF-8"

 After we check the existence of 'machine_branch' with 'git show-ref'
 the following if statement should change the 'machine_branch'
 to the default (i.e. master) if the 'git show-ref' has returned an
 exit code that is not 0, not the other way around.

 Signed-off-by: Theodor Gherzan <theodor@resin.io>

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/kernel-yocto.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index f42a5c2534ae..410a6e879fbe 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -211,7 +211,7 @@ do_kernel_checkout() {
 	# Create a working tree copy of the kernel by checking out a branch
 	machine_branch="${@ get_machine_branch(d, "${KBRANCH}" )}"
 	git show-ref --quiet --verify -- "refs/heads/${machine_branch}"
-	if [ $? -eq 0 ]; then
+	if [ $? -ne 0 ]; then
 		machine_branch="master"
 	fi
 
-- 
2.1.0


