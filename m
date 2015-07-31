Return-Path: <kergoth@gmail.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 7E8E37663F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 15:19:19 +0000 (UTC)
Received: by pdrg1 with SMTP id g1so44313367pdr.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 08:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=CTDImbUQbYXeZHQxn7ObGkV2udyvWTmOWMYDLfN429g=;
	b=O3CNrWN/h9PHCwu6xuYiS6uTEWZ4I6Q9Cw66v5xjZO1ujxVO+n7JSFwW/a1xNCLtoc
	DL0PTgPApkj3QRbSEPd2h9NDSE0Ltk10rhfWlXKtsua1JeaAzhdxq9htDCAH7Vg9sqPD
	/JT5bdRltb5BACTpQFzS22OqnOkiMEDbpCuNGSCqJLBjbGwUb9J4nVCwAye+Wf/S7gQO
	bGZ8fAS/FH/ZSLjk6iUrOf5A/ln4WSxSv1vSXf3BjBahVQT+8Xboev63NPo56JpiFJax
	8MvxoVdiCFsjPGLy9JwC/dsADUcQepjaCQwjQo5tZMUZTkTu/kIDHKLSCqOTNL03adnL
	VAXQ==
X-Received: by 10.70.65.99 with SMTP id w3mr8075172pds.132.1438355960511;
	Fri, 31 Jul 2015 08:19:20 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id v9sm8225967pdr.96.2015.07.31.08.19.19
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 31 Jul 2015 08:19:19 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 Jul 2015 08:19:13 -0700
Message-Id: <b38a7a90147ca23548f316e36a97a1418ccd8936.1438355747.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <746de2e112499d4a1188beea9aea9f96571183ac.1438355747.git.chris_larson@mentor.com>
References: <746de2e112499d4a1188beea9aea9f96571183ac.1438355747.git.chris_larson@mentor.com>
In-Reply-To: <cover.1438355747.git.chris_larson@mentor.com>
References: <cover.1438355747.git.chris_larson@mentor.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Christopher Larson <chris_larson@mentor.com>
Subject: [PATCHv2 2/3] devtool: add --bbpath argument
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
X-List-Received-Date: Fri, 31 Jul 2015 15:19:21 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 scripts/devtool | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/scripts/devtool b/scripts/devtool
index 5d37d3b..1c22438 100755
--- a/scripts/devtool
+++ b/scripts/devtool
@@ -189,6 +189,7 @@ def main():
                                      add_help=False,
                                      epilog="Use %(prog)s <subcommand> --help to get help on a specific command")
     parser.add_argument('--basepath', help='Base directory of SDK / build directory')
+    parser.add_argument('--bbpath', help='Explicitly specify the BBPATH, rather than getting it from the metadata')
     parser.add_argument('-d', '--debug', help='Enable debug output', action='store_true')
     parser.add_argument('-q', '--quiet', help='Print only errors', action='store_true')
     parser.add_argument('--color', choices=['auto', 'always', 'never'], default='auto', help='Colorize output (where %(metavar)s is %(choices)s)', metavar='COLOR')
@@ -239,12 +240,18 @@ def main():
 
     scriptutils.logger_setup_color(logger, global_args.color)
 
-    tinfoil = setup_tinfoil(config_only=True)
-    for path in ([scripts_path] +
-                 tinfoil.config_data.getVar('BBPATH', True).split(':')):
+    if global_args.bbpath is None:
+        tinfoil = setup_tinfoil(config_only=True)
+        global_args.bbpath = tinfoil.config_data.getVar('BBPATH', True)
+    else:
+        tinfoil = None
+
+    for path in [scripts_path] + global_args.bbpath.split(':'):
         pluginpath = os.path.join(path, 'lib', 'devtool')
         scriptutils.load_plugins(logger, plugins, pluginpath)
-    tinfoil.shutdown()
+
+    if tinfoil:
+        tinfoil.shutdown()
 
     subparsers = parser.add_subparsers(dest="subparser_name", title='subcommands', metavar='<subcommand>')
 
-- 
2.2.1


