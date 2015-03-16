Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4314673689
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 17:27:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t2GHRCvb014533
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 16 Mar 2015 10:27:12 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Mon, 16 Mar 2015 10:27:12 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 16 Mar 2015 13:27:07 -0400
Message-ID: <1cd7d6881e747b3458140e34d7801141b0ae62d1.1426525757.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1426525757.git.bruce.ashfield@windriver.com>
References: <cover.1426525757.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] kernel-yocto: split meta data generation from patching phase
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
X-List-Received-Date: Mon, 16 Mar 2015 17:27:12 -0000
Content-Type: text/plain

The linux-yocto kernel has a meta-data component which accompanies the
actual tree. That meta-data is processed to generate a series file that
controls the patching and configuration of the kernel.

patching and configuration are two distinct phases, so when working on
kernel configuration, it doesn't make sense to always have to re-run
the patching step just to update configuration data in the meta-series.

To allow a more granular set of tasks, we break the meta-data generation
into a separate task, which runs before do_patch. This allows the task
to be explicitly called when working on configuration, but otherwise
has no impact on the build.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 8db489964ed2..1e226a5722ac 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -55,7 +55,7 @@ def get_machine_branch(d, default):
 	    
     return default
 
-do_patch() {
+do_kernel_metadata() {
 	cd ${S}
 	export KMETA=${KMETA}
 
@@ -81,7 +81,7 @@ do_patch() {
 		createme_flags="--disable-meta-gen --meta ${KMETA}"
 	fi
 
-	createme ${createme_flags} ${ARCH} ${machine_branch}
+	createme -v -v ${createme_flags} ${ARCH} ${machine_branch}
 	if [ $? -ne 0 ]; then
 		bbfatal "Could not create ${machine_branch}"
 	fi
@@ -118,6 +118,10 @@ do_patch() {
 	if [ $? -ne 0 ]; then
 		bbfatal "Could not update ${machine_branch}"
 	fi
+}
+
+do_patch() {
+	cd ${S}
 
 	# executes and modifies the source tree as required
 	patchme ${KMACHINE}
@@ -221,6 +225,7 @@ do_kernel_checkout() {
 do_kernel_checkout[dirs] = "${S}"
 
 addtask kernel_checkout before do_patch after do_unpack
+addtask kernel_metadata after do_validate_branches before do_patch
 
 do_kernel_configme[dirs] += "${S} ${B}"
 do_kernel_configme() {
-- 
2.1.0


