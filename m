Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 16C14616EA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2013 19:47:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r86JlXgF004848
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 6 Sep 2013 12:47:33 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.147.67) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Fri, 6 Sep 2013 12:47:32 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 6 Sep 2013 15:47:28 -0400
Message-ID: <998009b65352ed645e0bb15678dd918c92c33399.1378496685.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1378496685.git.bruce.ashfield@windriver.com>
References: <cover.1378496685.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] kernel-yocto: improve error checking on non-git repos
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
X-List-Received-Date: Fri, 06 Sep 2013 19:47:34 -0000
Content-Type: text/plain

While non-git kernel repos are not the preferred format for a kernel upstream,
they are supported. Depending on the creator of the archive the expanded
source directory name varies. If the recipe for the kernel doesn't properly
set S to the right value, a cryptic git error message is produced. We can
detect the situation and offer some advice on how to fix the issue.

A second check is also added in this commit for archive based kernel repos
which won't have a SRCREV to validate. If we have no SRCREV or SRCREV is
INVALID, we can exit the branch validation step immediately. This saves yet
another cryptic git error message and simplifies a custom tgz based recipe.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass |   13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 26d449a..97a5fa7 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -176,7 +176,17 @@ do_kernel_checkout() {
 		# case 3: we have no git repository at all. 
 		# To support low bandwidth options for building the kernel, we'll just 
 		# convert the tree to a git repo and let the rest of the process work unchanged
+		
+		# if ${S} hasn't been set to the proper subdirectory a default of "linux" is 
+		# used, but we can't initialize that empty directory. So check it and throw a
+		# clear error
+
 	        cd ${S}
+		if [ ! -f "Makefile" ]; then
+			echo "[ERROR]: S is not set to the linux source directory. Check "
+			echo "         the recipe and set S to the proper extracted subdirectory"
+			exit 1
+		fi
 		git init
 		git add .
 		git commit -q -m "baseline commit: creating repo for ${PN}-${PV}"
@@ -288,7 +298,8 @@ do_validate_branches() {
 	set +e
 	# if SRCREV is AUTOREV it shows up as AUTOINC there's nothing to
 	# check and we can exit early
-	if [ "${SRCREV_machine}" = "AUTOINC" ]; then
+	if [ "${SRCREV_machine}" = "AUTOINC" ] || "${SRCREV_machine}" = "INVALID" ] ||
+	   [ "${SRCREV_machine}" = "" ]; then
 		return
 	fi
 
-- 
1.7.10.4


