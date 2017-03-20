Return-Path: <anibal.limon@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 2FA5B779DF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 23:29:52 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga105.fm.intel.com with ESMTP; 20 Mar 2017 16:29:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,196,1486454400"; d="scan'208";a="69199743"
Received: from aklin-mobl.amr.corp.intel.com (HELO
	alimonb-mobl1.zpn.intel.com) ([10.255.72.95])
	by orsmga004.jf.intel.com with ESMTP; 20 Mar 2017 16:29:52 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Mar 2017 17:33:22 -0600
Message-Id: <1490052806-12100-3-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1490052806-12100-1-git-send-email-anibal.limon@linux.intel.com>
References: <1490052806-12100-1-git-send-email-anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com, patrick.ohly@gmx.de
Subject: [PATCH 3/7] scripts/yocto-compat-layer.py: Make output log argument optional
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
X-List-Received-Date: Mon, 20 Mar 2017 23:29:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Only create a log file when --output-log option is specified, since
logger is dumping to stdout by default is better to let the user
decide if a log needs to be created.

[YOCTO #11160]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 scripts/yocto-compat-layer.py | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/scripts/yocto-compat-layer.py b/scripts/yocto-compat-layer.py
index 8996fff..b96f3ca 100755
--- a/scripts/yocto-compat-layer.py
+++ b/scripts/yocto-compat-layer.py
@@ -26,9 +26,6 @@ from compatlayer import LayerType, detect_layers, add_layer, get_signatures
 from oeqa.utils.commands import get_bb_vars
 
 PROGNAME = 'yocto-compat-layer'
-DEFAULT_OUTPUT_LOG = '%s-%s.log' % (PROGNAME,
-        time.strftime("%Y%m%d%H%M%S"))
-OUTPUT_LOG_LINK = "%s.log" % PROGNAME
 CASES_PATHS = [os.path.join(os.path.abspath(os.path.dirname(__file__)),
                 'lib', 'compatlayer', 'cases')]
 logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
@@ -49,9 +46,7 @@ def main():
     parser.add_argument('layers', metavar='LAYER_DIR', nargs='+',
             help='Layer to test compatibility with Yocto Project')
     parser.add_argument('-o', '--output-log',
-            help='Output log default: %s' % DEFAULT_OUTPUT_LOG,
-            action='store', default=DEFAULT_OUTPUT_LOG)
-
+            help='File to output log (optional)', action='store')
     parser.add_argument('-d', '--debug', help='Enable debug output',
             action='store_true')
     parser.add_argument('-q', '--quiet', help='Print only errors',
@@ -63,16 +58,14 @@ def main():
 
     args = parser.parse_args()
 
-    fh = logging.FileHandler(args.output_log)
-    fh.setFormatter(logging.Formatter("%(levelname)s: %(message)s"))
-    logger.addHandler(fh)
+    if args.output_log:
+        fh = logging.FileHandler(args.output_log)
+        fh.setFormatter(logging.Formatter("%(levelname)s: %(message)s"))
+        logger.addHandler(fh)
     if args.debug:
         logger.setLevel(logging.DEBUG)
     elif args.quiet:
         logger.setLevel(logging.ERROR)
-    if os.path.exists(OUTPUT_LOG_LINK):
-        os.unlink(OUTPUT_LOG_LINK)
-    os.symlink(args.output_log, OUTPUT_LOG_LINK)
 
     if not 'BUILDDIR' in os.environ:
         logger.error("You must source the environment before run this script.")
-- 
2.1.4


