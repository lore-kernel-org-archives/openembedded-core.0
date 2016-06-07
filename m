Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3F8B7605FE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jun 2016 11:59:20 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga102.fm.intel.com with ESMTP; 07 Jun 2016 04:59:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,432,1459839600"; d="scan'208";a="117488870"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga004.fm.intel.com with ESMTP; 07 Jun 2016 04:59:21 -0700
Received: from ed.fi.intel.com (ed.fi.intel.com [10.237.72.179])
	by linux.intel.com (Postfix) with ESMTP id 97E116A4007;
	Tue,  7 Jun 2016 05:46:47 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Jun 2016 14:59:13 +0300
Message-Id: <1465300753-5904-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Subject: [PATCH] oe-pkgdata-util: fix AttributeError
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
X-List-Received-Date: Tue, 07 Jun 2016 11:59:21 -0000

The default arparse behaviour in Python 2 and early versions of Python 3
was to print usage message if no subcommands provided by user.
In Python >= 3.2.3 subparser has to have attribute 'required' set to
True to behave similar way.

By default subparser.required attribute is set to False, usage message is
not printed and code continues to be executed.

oe-pkgdata-util code raises AttributeError exception in
this case:
    AttributeError: 'Namespace' object has no attribute 'func'

Fixed this by setting subparser.required to True.

[YOCTO #9711]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/oe-pkgdata-util | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index b16ecc9..9b90982 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -437,6 +437,7 @@ def main():
     parser.add_argument('-d', '--debug', help='Enable debug output', action='store_true')
     parser.add_argument('-p', '--pkgdata-dir', help='Path to pkgdata directory (determined automatically if not specified)')
     subparsers = parser.add_subparsers(title='subcommands', metavar='<subcommand>')
+    subparsers.required = True
 
     parser_lookup_pkg = subparsers.add_parser('lookup-pkg',
                                           help='Translate between recipe-space package names and runtime package names',
-- 
2.6.6


