Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 3A0E071B99
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 08:57:43 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga105.jf.intel.com with ESMTP; 19 Apr 2017 01:57:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,220,1488873600"; d="scan'208";a="89627745"
Received: from nbayani-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.255.141.108])
	by orsmga005.jf.intel.com with ESMTP; 19 Apr 2017 01:57:42 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Apr 2017 20:57:29 +1200
Message-Id: <da6a19e856be1b305483c212b837652c824f0cf2.1492592223.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1492592223.git.paul.eggleton@linux.intel.com>
References: <cover.1492592223.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/3] ext-sdk-prepare.py: use quiet mode when preparing sysroot
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
X-List-Received-Date: Wed, 19 Apr 2017 08:57:43 -0000

In order to have a shared sysroot usable within the eSDK after recipe
specific sysroots were implemented, we need to run
bitbake build-sysroots as a separate call. However, unlike the first
call, --quiet wasn't being specified and that somewhat undermined the
earlier effort to clean up the eSDK installation output. Make this
second call quiet as well so that the output is tidier.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/files/ext-sdk-prepare.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/files/ext-sdk-prepare.py b/meta/files/ext-sdk-prepare.py
index ef09639..96c5212 100644
--- a/meta/files/ext-sdk-prepare.py
+++ b/meta/files/ext-sdk-prepare.py
@@ -54,7 +54,7 @@ def main():
 
         ret = run_command_interruptible('BB_SETSCENE_ENFORCE=1 bitbake --quiet %s' % ' '.join(sdk_targets))
         if not ret:
-            ret = run_command_interruptible('bitbake build-sysroots')
+            ret = run_command_interruptible('bitbake --quiet build-sysroots')
         lastlog = get_last_consolelog()
         if lastlog:
             with open(lastlog, 'r') as f:
-- 
2.9.3


