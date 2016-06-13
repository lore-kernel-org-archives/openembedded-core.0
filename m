Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D827C612E5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2016 04:44:14 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 12 Jun 2016 21:44:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,465,1459839600"; d="scan'208";a="996301617"
Received: from ctan5-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.176.32])
	by orsmga002.jf.intel.com with ESMTP; 12 Jun 2016 21:44:14 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Jun 2016 16:43:41 +1200
Message-Id: <21633d8f3c95add3368d782ad8fb4cb2540e97f2.1465791249.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1465791249.git.paul.eggleton@linux.intel.com>
References: <cover.1465791249.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1465791249.git.paul.eggleton@linux.intel.com>
References: <cover.1465791249.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/3] scripts: ensure not specifying subcommand shows help text
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
X-List-Received-Date: Mon, 13 Jun 2016 04:44:15 -0000

With Python 2, argparse subparsers behaviour in Python 2 was to print
the usage information if the subparsers argument wasn't specified.
However, with Python 3.2.3 and later a subparsers argument is not
required by default, leading to errors when no arguments are specified:

  AttributeError: 'Namespace' object has no attribute 'func'

Restore the previous desired behaviour of showing the help text for
devtool, recipetool and the devtool-stress script by setting
subparsers.required to True.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/contrib/devtool-stress.py | 1 +
 scripts/devtool                   | 1 +
 scripts/recipetool                | 1 +
 3 files changed, 3 insertions(+)

diff --git a/scripts/contrib/devtool-stress.py b/scripts/contrib/devtool-stress.py
index 2723491..ab77a2d 100755
--- a/scripts/contrib/devtool-stress.py
+++ b/scripts/contrib/devtool-stress.py
@@ -213,6 +213,7 @@ def main():
     parser.add_argument('-s', '--skip', help='Skip specified recipes (comma-separated without spaces, wildcards allowed)', metavar='PNLIST')
     parser.add_argument('-c', '--skip-classes', help='Skip recipes inheriting specified classes (comma-separated) - default %(default)s', metavar='CLASSLIST', default='native,nativesdk,cross,cross-canadian,image,populate_sdk,meta,packagegroup')
     subparsers = parser.add_subparsers(title='subcommands', metavar='<subcommand>')
+    subparsers.required = True
 
     parser_modify = subparsers.add_parser('modify',
                                           help='Run "devtool modify" followed by a build with bitbake on matching recipes',
diff --git a/scripts/devtool b/scripts/devtool
index 63d2ef9..a93a11f 100755
--- a/scripts/devtool
+++ b/scripts/devtool
@@ -301,6 +301,7 @@ def main():
         tinfoil.shutdown()
 
     subparsers = parser.add_subparsers(dest="subparser_name", title='subcommands', metavar='<subcommand>')
+    subparsers.required = True
 
     subparsers.add_subparser_group('sdk', 'SDK maintenance', -2)
     subparsers.add_subparser_group('advanced', 'Advanced', -1)
diff --git a/scripts/recipetool b/scripts/recipetool
index 0e8bffb..17233d4 100755
--- a/scripts/recipetool
+++ b/scripts/recipetool
@@ -60,6 +60,7 @@ def main():
     parser.add_argument('-h', '--help', action='help', default=argparse.SUPPRESS,
                         help='show this help message and exit')
     subparsers = parser.add_subparsers(title='subcommands', metavar='<subcommand>')
+    subparsers.required = True
 
     if global_args.debug:
         logger.setLevel(logging.DEBUG)
-- 
2.5.5


