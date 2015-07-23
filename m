Return-Path: <kergoth@gmail.com>
Received: from mail-pd0-f176.google.com (mail-pd0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id C0CDD761D6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 19:57:22 +0000 (UTC)
Received: by pdrg1 with SMTP id g1so1219281pdr.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 12:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=eLimOvryW0PDQYa8uJHPZe3RhNvMML4CFSpA2Aer+Hk=;
	b=iSqXdorDsVxHZXwXkdGiIuNgXUJC6bsoA67XSjCpP5MDZRqVDT6vPLdL0V8haBBwb9
	Df2T4xFAn+IEqcuMpiruQhmyNl2xsYDtDRR/PnM02aRv7C2Jctsof4drpCgycXQt2540
	EA/BWqbRjTWNCtP8lsNnUTWYw4n2fuYSsysII7qQrZSZVFmdqToRHY4bq9hAEX+8FCLD
	1QdNA2XtoItoQbJvw4rhq3mg/EF5TQ/WZPmMyGQ78/SxVdQUNsuxhk7ZjIJmPngW6m4T
	u12UvSVM6mmOv6LRtvxACTvRS17N7GBPVNbWFpkIy0VJLYkQyE6M3Cmbmdo+fBf5AaEf
	ltDA==
X-Received: by 10.70.54.7 with SMTP id f7mr21603496pdp.75.1437681442809;
	Thu, 23 Jul 2015 12:57:22 -0700 (PDT)
Received: from quark.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id j9sm5019734pdl.65.2015.07.23.12.57.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Jul 2015 12:57:21 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Jul 2015 12:58:09 -0700
Message-Id: <25483885e6e65ef03a96ed42c93d9fa35eb1de96.1437663603.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <38fd16a3ab690b57f0b920bb961881ccdef04fb2.1437663603.git.chris_larson@mentor.com>
References: <38fd16a3ab690b57f0b920bb961881ccdef04fb2.1437663603.git.chris_larson@mentor.com>
In-Reply-To: <cover.1437663603.git.chris_larson@mentor.com>
References: <cover.1437663603.git.chris_larson@mentor.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Christopher Larson <chris_larson@mentor.com>
Subject: [PATCHv3 4/7] recipetool: parse global args early
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
X-List-Received-Date: Thu, 23 Jul 2015 19:57:22 -0000

From: Christopher Larson <chris_larson@mentor.com>

This separates the argument parsing into two steps, which lets us apply global
settings like enabling debugging before the plugins load, so we can see the
paths where plugins are being loaded.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 scripts/recipetool | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/scripts/recipetool b/scripts/recipetool
index 37c2dd3..87fb35e 100755
--- a/scripts/recipetool
+++ b/scripts/recipetool
@@ -46,12 +46,25 @@ def main():
         sys.exit(1)
 
     parser = argparse.ArgumentParser(description="OpenEmbedded recipe tool",
+                                     add_help=False,
                                      epilog="Use %(prog)s <subcommand> --help to get help on a specific command")
     parser.add_argument('-d', '--debug', help='Enable debug output', action='store_true')
     parser.add_argument('-q', '--quiet', help='Print only errors', action='store_true')
     parser.add_argument('--color', choices=['auto', 'always', 'never'], default='auto', help='Colorize output (where %(metavar)s is %(choices)s)', metavar='COLOR')
+
+    global_args, unparsed_args = parser.parse_known_args()
+
+    # Help is added here rather than via add_help=True, as we don't want it to
+    # be handled by parse_known_args()
+    parser.add_argument('-h', '--help', action='help', default=argparse.SUPPRESS,
+                        help='show this help message and exit')
     subparsers = parser.add_subparsers(title='subcommands', metavar='<subcommand>')
 
+    if global_args.debug:
+        logger.setLevel(logging.DEBUG)
+    elif global_args.quiet:
+        logger.setLevel(logging.ERROR)
+
     import scriptpath
     bitbakepath = scriptpath.add_bitbake_lib_path()
     if not bitbakepath:
@@ -59,6 +72,8 @@ def main():
         sys.exit(1)
     logger.debug('Found bitbake path: %s' % bitbakepath)
 
+    scriptutils.logger_setup_color(logger, global_args.color)
+
     tinfoil = tinfoil_init(False)
     for path in ([scripts_path] +
                  tinfoil.config_data.getVar('BBPATH', True).split(':')):
@@ -77,14 +92,7 @@ def main():
         logger.error("No commands registered - missing plugins?")
         sys.exit(1)
 
-    args = parser.parse_args()
-
-    if args.debug:
-        logger.setLevel(logging.DEBUG)
-    elif args.quiet:
-        logger.setLevel(logging.ERROR)
-
-    scriptutils.logger_setup_color(logger, args.color)
+    args = parser.parse_args(unparsed_args, namespace=global_args)
 
     try:
         if getattr(args, 'parserecipes', False):
-- 
2.2.1


