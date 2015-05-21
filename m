Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id AF14E609B2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 May 2015 14:28:40 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1YvRSj-0006ib-Bd from Awais_Belal@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Thu, 21 May 2015 07:28:41 -0700
Received: from awais-Precision-M4700.world.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server id 14.3.224.2; Thu, 21 May 2015 15:28:39 +0100
From: Awais Belal <awais_belal@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 May 2015 19:28:34 +0500
Message-ID: <1432218514-28700-1-git-send-email-awais_belal@mentor.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH v2] initrdscripts: make boot drive detection more generic
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
X-List-Received-Date: Thu, 21 May 2015 14:28:40 -0000
Content-Type: text/plain

The init script that invokes install and install-efi scripts
passes the first parameter that identifies the boot drive but
in cases when this disk is labeled and kernel configurations
allow disk labeling under /run/media/ this would pass the disk
label.
The earlier implementation considered that the drive name will
be passed and in case the label is passed it fails and provides
the boot drive as an option for installation driver.
We now use a more generic approach to identify the boot drive
which can handle both drive name as well as label if passed.

Signed-off-by: Awais Belal <awais_belal@mentor.com>
---
 meta/recipes-core/initrdscripts/files/init-install-efi.sh | 3 ++-
 meta/recipes-core/initrdscripts/files/init-install.sh     | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi.sh b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
index 329586d..8dd2749 100644
--- a/meta/recipes-core/initrdscripts/files/init-install-efi.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
@@ -16,7 +16,8 @@ swap_ratio=5
 
 # Get a list of hard drives
 hdnamelist=""
-live_dev_name=${1%%/*}
+live_dev_name=`cat /proc/mounts | grep ${1%/} | awk '{print $1}'`
+live_dev_name=${live_dev_name#\/dev/}
 live_dev_name=${live_dev_name%%[0-9]*}
 
 echo "Searching for hard drives ..."
diff --git a/meta/recipes-core/initrdscripts/files/init-install.sh b/meta/recipes-core/initrdscripts/files/init-install.sh
index fb537ee..cb26163 100644
--- a/meta/recipes-core/initrdscripts/files/init-install.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install.sh
@@ -15,7 +15,8 @@ swap_ratio=5
 
 # Get a list of hard drives
 hdnamelist=""
-live_dev_name=${1%%/*}
+live_dev_name=`cat /proc/mounts | grep ${1%/} | awk '{print $1}'`
+live_dev_name=${live_dev_name#\/dev/}
 live_dev_name=${live_dev_name%%[0-9]*}
 
 echo "Searching for hard drives ..."
-- 
1.9.1


