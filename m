Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1UF0nU-00016A-5W
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Mar 2013 12:21:55 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r2BB51gW018235
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2013 04:05:01 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.206) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Mon, 11 Mar 2013 04:05:01 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Mar 2013 19:04:39 +0800
Message-ID: <5d7015385718e86cdf212ebacbda9be700fd0274.1362985569.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1362985569.git.hongxu.jia@windriver.com>
References: <cover.1362985569.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 15/17] populate_sdk_base: tarball installer: SDK overwrite warning
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Mar 2013 11:21:59 -0000
Content-Type: text/plain

This patch contains two fixes:
* if the user wants to install the SDK in a directory that already
  contains a SDK for the same architecture, a warning will be shown;
* when the symbolic links are relocated use -n option. Otherwise,
  symbolic links to existing directories will be created in the
  directory itself;

Cherry-pick commit b751ec137d0228b40a90e9e32b24f5cb5732225b

[YOCTO #3401]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/populate_sdk_base.bbclass |   15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 6eb6726..3f2926c 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -132,11 +132,20 @@ else
 	target_sdk_dir=$(readlink -m $target_sdk_dir)
 fi
 
-printf "You are about to install the SDK to \"$target_sdk_dir\". Proceed[Y/n]?"
+if [ -e "$target_sdk_dir/environment-setup-${REAL_MULTIMACH_TARGET_SYS}" ]; then
+	echo "The directory \"$target_sdk_dir\" already contains a SDK for this architecture."
+	printf "If you continue, existing files will be overwritten! Proceed[y/N]?"
+
+	default_answer="n"
+else
+	printf "You are about to install the SDK to \"$target_sdk_dir\". Proceed[Y/n]?"
+
+	default_answer="y"
+fi
 read answer
 
 if [ "$answer" = "" ]; then
-	answer="y"
+	answer="$default_answer"
 fi
 
 if [ "$answer" != "Y" -a "$answer" != "y" ]; then
@@ -176,7 +185,7 @@ find $native_sysroot -type f -exec file '{}' \;|grep ":.*ASCII.*text"|cut -d':'
 
 # change all symlinks pointing to ${SDKPATH}
 for l in $(find $native_sysroot -type l); do
-	ln -sf $(readlink $l|sed -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:") $l
+	ln -sfn $(readlink $l|sed -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:") $l
 done
 
 echo done
-- 
1.7.10.4



