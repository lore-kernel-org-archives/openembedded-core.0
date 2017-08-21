Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 728107826F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 02:58:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v7L2wWpg017278
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 20 Aug 2017 19:58:32 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Sun, 20 Aug 2017 19:58:31 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Sun, 20 Aug 2017 22:58:21 -0400
Message-ID: <ab92e7d90c416d6e5cdb17cdba269e09ec967607.1503283308.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1503283308.git.bruce.ashfield@windriver.com>
References: <cover.1503283308.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 8/9] kernel-yocto: ensure that only valid BSPs are built
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
X-List-Received-Date: Mon, 21 Aug 2017 02:58:32 -0000
Content-Type: text/plain

There was a bug in the search routines responsible for locating
BSP definitions which returned a valid match if only the ktype
matched.

This meant that someone looking for "qemux86foo" (which is an
invalid definition) would potentially end up building "qemuarm"
and be none the wiser (until it didn't boot).

With this fix to the tools search routine, and improved return
code testing, we will now stop the build and report and error to
the user.

[YOCTO: #11878]

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass                       | 3 +++
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 1ca0756c4959..3c6df92131bc 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -143,6 +143,9 @@ do_kernel_metadata() {
 
 	# expand kernel features into their full path equivalents
 	bsp_definition=$(spp ${includes} --find -DKMACHINE=${KMACHINE} -DKTYPE=${LINUX_KERNEL_TYPE})
+	if [ $? -ne 0 ] || [ -z "${bsp_definition}" ]; then
+		bbfatal_log "Could not locate BSP definiton for ${KMACHINE}/${LINUX_KERNEL_TYPE}."
+	fi
 	meta_dir=$(kgit --meta)
 
 	# run1: pull all the configuration fragments, no matter where they come from
diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index 2217a31076a2..4a78b897d34f 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=a6c2fa8aef1b
 
 DEPENDS = "git-native"
 
-SRCREV = "9cd2b626d652bec10c6bc75275b35bfee74d447c"
+SRCREV = "0571411cc033c11df7827508dd786876ce2f8c83"
 PR = "r12"
 PV = "0.2+git${SRCPV}"
 
-- 
2.5.0


