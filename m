Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1ScCmt-0001qB-5z
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Jun 2012 11:44:23 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q569XtxV006896
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Jun 2012 02:33:55 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Wed, 6 Jun 2012 02:33:55 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 6 Jun 2012 17:34:32 +0800
Message-ID: <31994e4735ba2fa4a88f92bd02a1675a5c697b03.1338963552.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1338963552.git.liezhi.yang@windriver.com>
References: <cover.1338963552.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 5/5] pybootchartgui: Fix the filename and add a default format
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
X-List-Received-Date: Wed, 06 Jun 2012 09:44:23 -0000
Content-Type: text/plain

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
1.7.1



