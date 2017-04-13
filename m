Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id C116077E20
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 12:28:11 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Apr 2017 05:28:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,194,1488873600"; d="scan'208";a="845454153"
Received: from tranm-mobl.ccr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.255.175.125])
	by FMSMGA003.fm.intel.com with ESMTP; 13 Apr 2017 05:28:11 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Apr 2017 00:28:04 +1200
Message-Id: <3003597a57f08ebc6bdf443a405734f5dd33f280.1492086458.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1492086458.git.paul.eggleton@linux.intel.com>
References: <cover.1492086458.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/3] devtool: modify: add --keep-temp option for debugging
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
X-List-Received-Date: Thu, 13 Apr 2017 12:28:12 -0000

Most of the other extract-based commands have this option but oddly I
left it out for modify - I guess because if I was debugging an issue here
I just used devtool extract to do so, but there's no reason why we can't
have it here and it is useful.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 1e84ae4..34525b4 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -791,7 +791,7 @@ def modify(args, config, basepath, workspace):
         initial_rev = None
         commits = []
         if not args.no_extract:
-            initial_rev = _extract_source(srctree, False, args.branch, False, rd, tinfoil)
+            initial_rev = _extract_source(srctree, args.keep_temp, args.branch, False, rd, tinfoil)
             if not initial_rev:
                 return 1
             logger.info('Source tree extracted to %s' % srctree)
@@ -1851,6 +1851,7 @@ def register_commands(subparsers, context):
     group.add_argument('--same-dir', '-s', help='Build in same directory as source', action="store_true")
     group.add_argument('--no-same-dir', help='Force build in a separate build directory', action="store_true")
     parser_modify.add_argument('--branch', '-b', default="devtool", help='Name for development branch to checkout (when not using -n/--no-extract) (default "%(default)s")')
+    parser_modify.add_argument('--keep-temp', help='Keep temporary directory (for debugging)', action="store_true")
     parser_modify.set_defaults(func=modify)
 
     parser_extract = subparsers.add_parser('extract', help='Extract the source for an existing recipe',
-- 
2.9.3


