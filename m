Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SfFsH-0005l9-4w
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Jun 2012 21:38:33 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 14 Jun 2012 12:27:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="180153887"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.138])
	by fmsmga002.fm.intel.com with ESMTP; 14 Jun 2012 12:27:50 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jun 2012 12:27:12 -0700
Message-Id: <78cc008a5738ceda4d55e316270ebfd7666ce60b.1339701375.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1339701375.git.sgw@linux.intel.com>
References: <cover.1339701375.git.sgw@linux.intel.com>
In-Reply-To: <cover.1339701375.git.sgw@linux.intel.com>
References: <cover.1339701375.git.sgw@linux.intel.com>
Subject: [Consolidated Pull 08/17] pybootchartgui: Fix the filename and add a default format
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Jun 2012 19:38:33 -0000

From: Robert Yang <liezhi.yang@windriver.com>

* Fix teh output filename to make it easy to use
* Add a default output format (svg)
* Fix the usage message
* Fix the version to v1.0.0

Currently, the help messages are:

$ ./pybootchartgui.py --help
Usage: pybootchartgui.py [options] /path/to/tmp/buildstats/<recipe-machine>/<BUILDNAME>/

Options:
  --version             show program's version number and exit
  -h, --help            show this help message and exit
  -i, --interactive     start in active mode
  -f FORMAT, --format=FORMAT
                        image format: svg, pdf, png, [default: svg]
  -o PATH, --output=PATH
                        output path (file or directory) where charts are
                        stored
  -s NUM, --split=NUM   split the output chart into <NUM> charts, only works
                        with "-o PATH"
  -n, --no-prune        do not prune the process tree
  -q, --quiet           suppress informational messages
  --very-quiet          suppress all messages except errors
  --verbose             print all messages

[YOCTO #2403]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/pybootchartgui/pybootchartgui/main.py |   33 ++++++++++--------------
 1 files changed, 14 insertions(+), 19 deletions(-)

diff --git a/scripts/pybootchartgui/pybootchartgui/main.py b/scripts/pybootchartgui/pybootchartgui/main.py
index fce8dd3..e70ab13 100644
--- a/scripts/pybootchartgui/pybootchartgui/main.py
+++ b/scripts/pybootchartgui/pybootchartgui/main.py
@@ -8,13 +8,13 @@ import batch
 
 def _mk_options_parser():
 	"""Make an options parser."""
-	usage = "%prog [options] PATH, ..., PATH"
-	version = "%prog v0.0.0"
+	usage = "%prog [options] /path/to/tmp/buildstats/<recipe-machine>/<BUILDNAME>/"
+	version = "%prog v1.0.0"
 	parser = optparse.OptionParser(usage, version=version)
 	parser.add_option("-i", "--interactive", action="store_true", dest="interactive", default=False, 
 			  help="start in active mode")
-	parser.add_option("-f", "--format", dest="format", default = None,
-			  help="image format (...); default format ...")
+	parser.add_option("-f", "--format", dest="format", default="svg", choices=["svg", "pdf", "png"],
+			  help="image format: svg, pdf, png, [default: %default]")
 	parser.add_option("-o", "--output", dest="output", metavar="PATH", default=None,
 			  help="output path (file or directory) where charts are stored")
 	parser.add_option("-s", "--split", dest="num", type=int, default=1,
@@ -29,20 +29,15 @@ def _mk_options_parser():
 			  help="print all messages")
 	return parser
 
-def _get_filename(paths, options):
-	"""Construct a usable filename for outputs based on the paths and options given on the commandline."""
-	dir = ""
+def _get_filename(path):
+	"""Construct a usable filename for outputs"""
+	dir = "."
 	file = "bootchart"
-	if options.output != None and not(os.path.isdir(options.output)):
-		return options.output
-	if options.output != None:
-		dir = options.output
-	if len(paths) == 1:
-		if os.path.isdir(paths[0]):
-			file = os.path.split(paths[0])[-1]
-		elif os.path.splitext(paths[0])[1] in [".tar", ".tgz", ".tar.gz"]:
-			file = os.path.splitext(paths[0])[0]
-	return os.path.join(dir, file + "." + options.format)
+	if os.path.isdir(path):
+		dir = path
+	elif path != None:
+		file = path
+	return os.path.join(dir, file)
 
 def main(argv=None):
 	try:
@@ -57,10 +52,10 @@ def main(argv=None):
 			return 2
 
 		res = parsing.parse(args, options.prune)
-		if options.interactive or options.format == None:
+		if options.interactive or options.output == None:
 			gui.show(res)
 		else:
-			filename = _get_filename(args, options)
+			filename = _get_filename(options.output)
 			res_list = parsing.split_res(res, options.num)
 			n = 1
 			for r in res_list:
-- 
1.7.7.6



