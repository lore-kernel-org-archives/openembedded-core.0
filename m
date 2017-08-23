Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6C3977823D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 19:20:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7NJKL4v021179
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 23 Aug 2017 12:20:21 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Wed, 23 Aug 2017 12:20:21 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 23 Aug 2017 15:20:20 -0400
Message-ID: <1503516020-21385-1-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] kernel-yocto: relax BSP definition test
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
X-List-Received-Date: Wed, 23 Aug 2017 19:20:24 -0000
Content-Type: text/plain

commit 44aea7b873 [kernel-yocto: ensure that only valid BSPs are built]
introduced a new check to ensure that a valid BSP definition was found,
rather than building something that 'closely' matched the current
MACHINE.

This check breaks valid configurations which do not have a bsp
definition but are otherwise completely configured machines.

To allow both elements to co-exist (and not add warnings or errors
to otherwise valid builds), we first check to see if an empty bsp
definition was found, but then check to see if a defconfig was
provided.

If a defconfig has been provided, that is a sign that the board
configuration is complete and we should continue the build without
otherwise bothering the user.

Tested on meta-raspberrypi and linux-yocto*

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---

v2: fixed the badly placed -q

 meta/classes/kernel-yocto.bbclass | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 3c6df92131bc..20b4942320d6 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -143,8 +143,11 @@ do_kernel_metadata() {
 
 	# expand kernel features into their full path equivalents
 	bsp_definition=$(spp ${includes} --find -DKMACHINE=${KMACHINE} -DKTYPE=${LINUX_KERNEL_TYPE})
-	if [ $? -ne 0 ] || [ -z "${bsp_definition}" ]; then
-		bbfatal_log "Could not locate BSP definiton for ${KMACHINE}/${LINUX_KERNEL_TYPE}."
+	if [ -z "$bsp_definition" ]; then
+		echo "$sccs" | grep -q defconfig
+		if [ $? -ne 0 ]; then
+			bberror "Could not locate BSP definition for ${KMACHINE}/${LINUX_KERNEL_TYPE} and no defconfig was provided"
+		fi
 	fi
 	meta_dir=$(kgit --meta)
 
-- 
2.5.0


