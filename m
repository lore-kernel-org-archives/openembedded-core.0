Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TvuKL-0006Z3-45
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Jan 2013 19:36:38 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 17 Jan 2013 10:20:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,486,1355126400"; d="scan'208";a="273375532"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by orsmga002.jf.intel.com with ESMTP; 17 Jan 2013 10:21:11 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Jan 2013 20:21:09 +0200
Message-Id: <1358446869-16665-1-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] update-rc.d: fix failure on target
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
X-List-Received-Date: Thu, 17 Jan 2013 18:36:38 -0000

The problem happened because the variables given to -n were not
surounded by quotes.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../update-rc.d/check-if-symlinks-are-valid.patch  |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/update-rc.d/update-rc.d/check-if-symlinks-are-valid.patch b/meta/recipes-core/update-rc.d/update-rc.d/check-if-symlinks-are-valid.patch
index 4476e91..6f402dd 100644
--- a/meta/recipes-core/update-rc.d/update-rc.d/check-if-symlinks-are-valid.patch
+++ b/meta/recipes-core/update-rc.d/update-rc.d/check-if-symlinks-are-valid.patch
@@ -24,10 +24,10 @@ Index: git/update-rc.d
  shift
  
 +sn=$initd/$bn
-+if [ -L "$sn" -a -n $root ]; then
++if [ -L "$sn" -a -n "$root" ]; then
 +	readlink=$(which readlink)
 +
-+	if [ -n $readlink ]; then
++	if [ -n "$readlink" ]; then
 +		sn=$($readlink "$sn")
 +		case "$sn" in
 +			/*) sn=${root}${sn} ;;
-- 
1.7.9.5



