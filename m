Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1637A72369
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 10:34:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sBAAYRRp005478
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Wed, 10 Dec 2014 02:34:27 -0800 (PST)
Received: from yow-bashfiel-d4.corp.ad.wrs.com (128.224.20.249) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 10 Dec 2014 02:34:23 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 10 Dec 2014 05:34:07 -0500
Message-ID: <2f996847f963521229b85ccf635564a85a41ee1e.1418207154.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1418207154.git.bruce.ashfield@windriver.com>
References: <cover.1418207154.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/7] kernel-yocto: fix non-git builds
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
X-List-Received-Date: Wed, 10 Dec 2014 10:34:28 -0000
Content-Type: text/plain

The ability to build non-git repositories was broken by two changes:

 - The existence of an empty 'patches' directory created during the
   unpack phase. This dir was incorrectly identified as a valid meta
   directory and broke the build. By ensuring that it is removed before
   creating the empty repository, it will no longer be found instead of
   the real meta directory.

 - The attempt to reset the git repository to a specific SRCREV when
   no SRCREV was provided. By checking for a SRCREV of 'INVALID', we
   avoid any processing and failed git operations.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 45bdc9670afe..5706a9e4e338 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -179,9 +179,11 @@ do_kernel_checkout() {
 			bberror "S is not set to the linux source directory. Check "
 			bbfatal "the recipe and set S to the proper extracted subdirectory"
 		fi
+		rm -f .gitignore
 		git init
 		git add .
 		git commit -q -m "baseline commit: creating repo for ${PN}-${PV}"
+		git clean -d -f
 	fi
 	# end debare
 
@@ -287,7 +289,7 @@ do_validate_branches() {
 	if [ "${machine_srcrev}" = "AUTOINC" ]; then
 		bbnote "SRCREV validation is not required for AUTOREV"
 	elif [ "${machine_srcrev}" = "" ]; then
-		if [ "${SRCREV}" != "AUTOINC" ]; then
+		if [ "${SRCREV}" != "AUTOINC" ] && [ "${SRCREV}" != "INVALID" ]; then
 		       # SRCREV_machine_<MACHINE> was not set. This means that a custom recipe
 		       # that doesn't use the SRCREV_FORMAT "machine_meta" is being built. In
 		       # this case, we need to reset to the give SRCREV before heading to patching
-- 
2.1.0


