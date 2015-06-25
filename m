Return-Path: <anibal.limon@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D8AD975843
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jun 2015 18:19:37 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 25 Jun 2015 11:19:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,678,1427785200"; d="scan'208";a="514251222"
Received: from alimon-thinkpad-w540.zpn.intel.com ([10.219.4.55])
	by FMSMGA003.fm.intel.com with ESMTP; 25 Jun 2015 11:19:21 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Jun 2015 13:21:16 -0500
Message-Id: <eb50993f797a1f1b5a221bc06383d9d78559743d.1435255972.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1435255972.git.anibal.limon@linux.intel.com>
References: <cover.1435255972.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1435255972.git.anibal.limon@linux.intel.com>
References: <cover.1435255972.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] run-postinsts: Fix ipk package management detection
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
X-List-Received-Date: Thu, 25 Jun 2015 18:19:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

run-postinsts always mark ipk package management as true, causing
problems when try to execute opkg-cl and isn't present.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
index f547a7b..ac9cee6 100755
--- a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
+++ b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
@@ -27,7 +27,10 @@ for pm in $backend_list; do
 			;;
 
 		"ipk")
-			pm_installed=true
+			if [ -s "/var/lib/opkg/status" ]; then
+				pm_installed=true
+				break
+			fi
 			;;
 	esac
 done
-- 
1.9.1


