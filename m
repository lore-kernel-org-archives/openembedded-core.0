Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id A387775C4E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 08:52:45 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 30 Jun 2015 01:52:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,376,1432623600"; d="scan'208";a="597305086"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 30 Jun 2015 01:52:46 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 252B46A4005;
	Tue, 30 Jun 2015 01:52:06 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Jun 2015 11:51:33 +0300
Message-Id: <1435654312-18177-2-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1435654312-18177-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1435654312-18177-1-git-send-email-ed.bartosh@linux.intel.com>
Subject: [wic][PATCH v2 01/20] wic: Fix misleading message
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
X-List-Received-Date: Tue, 30 Jun 2015 08:52:46 -0000

Due to usage of incorrect variable wic produces strange message
"No image named None found, exiting." when specified canned .wks
doesn't exist.

Fixed by replacing wks_file -> argv[0]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>

diff --git a/scripts/wic b/scripts/wic
index f9be972..a39ec95 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -173,7 +173,7 @@ def wic_create_subcommand(args, usage_str):
     if not wks_file.endswith(".wks"):
         wks_file = engine.find_canned_image(scripts_path, wks_file)
         if not wks_file:
-            print "No image named %s found, exiting.  (Use 'wic list images' to list available images, or specify a fully-qualified OE kickstart (.wks) filename)\n" % wks_file
+            print "No image named %s found, exiting.  (Use 'wic list images' to list available images, or specify a fully-qualified OE kickstart (.wks) filename)\n" % args[0]
             sys.exit(1)
 
     image_output_dir = ""
-- 
2.1.4


