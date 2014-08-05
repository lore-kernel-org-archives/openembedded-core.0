Return-Path: <nitin.a.kamble@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 6090E65D5E
	for <Openembedded-core@lists.openembedded.org>;
	Tue,  5 Aug 2014 21:35:48 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 05 Aug 2014 14:35:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,807,1400050800"; d="scan'208";a="554234797"
Received: from yocto-hm1.jf.intel.com ([10.23.232.34])
	by orsmga001.jf.intel.com with ESMTP; 05 Aug 2014 14:35:50 -0700
From: nitin.a.kamble@intel.com
To: richard.purdie@linuxfoundation.org, saul.wold@intel.com,
	darren.hart@intel.com, Openembedded-core@lists.openembedded.org
Date: Tue,  5 Aug 2014 14:39:57 -0700
Message-Id: <e02335b6134805d1806b77cba830c134231bd925.1407274547.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <56edbd5eccdf7ebf4255142b52bf88b5a30f5040.1407274547.git.nitin.a.kamble@intel.com>
References: <56edbd5eccdf7ebf4255142b52bf88b5a30f5040.1407274547.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1407274547.git.nitin.a.kamble@intel.com>
References: <cover.1407274547.git.nitin.a.kamble@intel.com>
Subject: [PATCH 2/2] code cleanup for INITRD variable handing
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
X-List-Received-Date: Tue, 05 Aug 2014 21:35:50 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

* Remove an unnecessary check
* Instead of ignoring, report the errors

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/classes/boot-directdisk.bbclass | 4 +++-
 meta/classes/bootimg.bbclass         | 2 ++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/boot-directdisk.bbclass b/meta/classes/boot-directdisk.bbclass
index 995d3e7..5107d7f 100644
--- a/meta/classes/boot-directdisk.bbclass
+++ b/meta/classes/boot-directdisk.bbclass
@@ -76,8 +76,10 @@ boot_direct_populate() {
 		rm -f $dest/initrd
 		for fs in ${INITRD}
 		do
-			if [ -n "${fs}" ] && [ -s "${fs}" ]; then
+			if [ -s "${fs}" ]; then
 				cat ${fs} >> $dest/initrd
+			else
+				bbfatal "${fs} is invalid. initrd image creation failed."
 			fi
 		done
 		chmod 0644 $dest/initrd
diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
index 7b3ce65..859d517 100644
--- a/meta/classes/bootimg.bbclass
+++ b/meta/classes/bootimg.bbclass
@@ -75,6 +75,8 @@ populate() {
 		do
 			if [ -s "${fs}" ]; then
 				cat ${fs} >> ${DEST}/initrd
+			else
+				bbfatal "${fs} is invalid. initrd image creation failed."
 			fi
 		done
 		chmod 0644 ${DEST}/initrd
-- 
1.8.1.4


