Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1UAFfS-0006e2-8A
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 09:13:43 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r1Q7vMP1012001
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2013 23:57:23 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.206) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.328.9; Mon, 25 Feb 2013 23:57:22 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Feb 2013 15:57:16 +0800
Message-ID: <6f7e1c603262f5e0d82d05981d131d189da4fa6b.1361864565.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1361864565.git.hongxu.jia@windriver.com>
References: <cover.1361864565.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] sstate-cache-management.sh: don't hardcode available sstate_suffixes
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
X-List-Received-Date: Tue, 26 Feb 2013 08:13:45 -0000
X-List-Received-Date: Tue, 26 Feb 2013 08:13:45 -0000
Content-Type: text/plain

Don't hardcode available sstate_suffixes(it misses `packagedata'), find them
dynamically in $sstate_list.

[YOCTO #3635]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 scripts/sstate-cache-management.sh |    9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/scripts/sstate-cache-management.sh b/scripts/sstate-cache-management.sh
index 2d4a2a3..90e6764 100755
--- a/scripts/sstate-cache-management.sh
+++ b/scripts/sstate-cache-management.sh
@@ -185,11 +185,16 @@ remove_duplicated () {
           | sed -e 's/-/_/g' -e 's/ /\n/g' | sort -u)
   echo "Done"
 
-  sstate_suffixes="deploy-rpm deploy-ipk deploy-deb deploy package populate-lic populate-sysroot"
-
   # Save all the sstate files in a file
   sstate_list=`mktemp` || exit 1
   find $cache_dir -name 'sstate-*.tgz' >$sstate_list
+
+  echo -n "Figuring out the suffixes in the sstate cache dir ... "
+  sstate_suffixes="`sed 's/.*_\([^_]*\)\.tgz$/\1/g' $sstate_list | sort -u`"
+  echo "Done"
+  echo "The following suffixes have been found in the cache dir:"
+  echo $sstate_suffixes
+
   echo -n "Figuring out the archs in the sstate cache dir ... "
   for arch in $all_archs; do
       grep -q "\-$arch-" $sstate_list
-- 
1.7.10.4



