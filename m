Return-Path: <maxin.john@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E60697719E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jun 2016 13:25:58 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP; 01 Jun 2016 06:25:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,401,1459839600"; d="scan'208";a="114122135"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga004.fm.intel.com with ESMTP; 01 Jun 2016 06:25:59 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 85E706A4007;
	Wed,  1 Jun 2016 07:13:26 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Jun 2016 16:25:55 +0300
Message-Id: <1464787556-5848-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 1/2] iw: update to version 4.7
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
X-List-Received-Date: Wed, 01 Jun 2016 13:26:00 -0000

4.3 -> 4.7

Refreshed the patch for new version:
    1) 0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 ....sh-don-t-use-git-describe-for-versioning.patch | 42 ++++++++++++----------
 .../iw/{iw_4.3.bb => iw_4.7.bb}                    |  4 +--
 2 files changed, 26 insertions(+), 20 deletions(-)
 rename meta/recipes-connectivity/iw/{iw_4.3.bb => iw_4.7.bb} (86%)

diff --git a/meta/recipes-connectivity/iw/iw/0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch b/meta/recipes-connectivity/iw/iw/0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch
index 2e52c80..715b88d 100644
--- a/meta/recipes-connectivity/iw/iw/0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch
+++ b/meta/recipes-connectivity/iw/iw/0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch
@@ -7,27 +7,33 @@ Upstream-Status: Pending
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 Signed-off-by: Maxin B. John <maxin.john@intel.com>
 ---
-diff -Naur iw-4.3-origin/version.sh iw-4.3/version.sh
---- iw-4.3-origin/version.sh	2015-11-20 16:37:58.762077162 +0200
-+++ iw-4.3/version.sh	2015-11-20 16:52:05.526491150 +0200
-@@ -3,21 +3,7 @@
- VERSION="4.3"
- OUT="$1"
+diff -Naur iw-4.7-orig/version.sh iw-4.7/version.sh
+--- iw-4.7-orig/version.sh	2016-05-31 12:52:46.000000000 +0300
++++ iw-4.7/version.sh	2016-06-01 11:21:58.307409060 +0300
+@@ -15,27 +15,7 @@
+ SRC_DIR=$(cd ${SRC_DIR}; pwd)
+ cd "${SRC_DIR}"
  
+-v=""
 -if [ -d .git ] && head=`git rev-parse --verify HEAD 2>/dev/null`; then
--	git update-index --refresh --unmerged > /dev/null
--	descr=$(git describe --match=v*)
--
--	# on git builds check that the version number above
--	# is correct...
--	[ "${descr%%-*}" = "v$VERSION" ] || exit 2
+-    git update-index --refresh --unmerged > /dev/null
+-    descr=$(git describe --match=v* 2>/dev/null)
+-    if [ $? -eq 0 ]; then
+-        # on git builds check that the version number above
+-        # is correct...
+-        if [ "${descr%%-*}" = "v$VERSION" ]; then
+-            v="${descr#v}"
+-            if git diff-index --name-only HEAD | read dummy ; then
+-                v="$v"-dirty
+-            fi
+-        fi
+-    fi
+-fi
 -
--	v="${descr#v}"
--	if git diff-index --name-only HEAD | read dummy ; then
--		v="$v"-dirty
--	fi
--else
--	v="$VERSION"
+-# set to the default version when failed to get the version
+-# information with git
+-if [ -z "${v}" ]; then
+-    v="$VERSION"
 -fi
 +v="$VERSION"
  
diff --git a/meta/recipes-connectivity/iw/iw_4.3.bb b/meta/recipes-connectivity/iw/iw_4.7.bb
similarity index 86%
rename from meta/recipes-connectivity/iw/iw_4.3.bb
rename to meta/recipes-connectivity/iw/iw_4.7.bb
index 6865e7a..e9f4141 100644
--- a/meta/recipes-connectivity/iw/iw_4.3.bb
+++ b/meta/recipes-connectivity/iw/iw_4.7.bb
@@ -14,8 +14,8 @@ SRC_URI = "http://www.kernel.org/pub/software/network/iw/${BP}.tar.gz \
            file://separate-objdir.patch \
 "
 
-SRC_URI[md5sum] = "5ca622a270687d6862c9024fab266871"
-SRC_URI[sha256sum] = "2a853d95ffbd2b06c058b40ef4e6fa76a52c2709b05fb1976761fe13e9d9e39f"
+SRC_URI[md5sum] = "19d1edd276b2ac0c6cccfc7ae8d2b732"
+SRC_URI[sha256sum] = "758092229f13d691968060a0ad41364ba8eb8da4503626c20233a5b1eb33b4d9"
 
 inherit pkgconfig
 
-- 
2.4.0


