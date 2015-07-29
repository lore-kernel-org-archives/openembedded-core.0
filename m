Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 798E47645E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 21:54:23 +0000 (UTC)
Received: by pabkd10 with SMTP id kd10so11934295pab.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 14:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=BXE44dMvSfjHaTpbUjs9blPabZiHupdFN8Bw7PSpirU=;
	b=aRUUIMRD22s4UyOBiUFHiA4zy4BNsJUjywkzNsT/seWX8+PpuRjDLNlo84VsAOX0li
	t+EDvuJwS9SmdeWU7vEeNdqK61IvXGwjvOTzRbnk/v+GAIaF8hFbNAzGWe/hBq2HY1Ph
	b7jKTf/xSt9k/L46vPSkgnD3b98C0OFGstn22/cpp2ARUg1ChnAuhPOWhsMamcHFQ8PP
	dFtrwYUPaYLL6TYKUMJqK4XzhEQOrkidh1NozUOVYGGSdVnKOIwwpbYm+0H2xum5B9Mf
	7FEYE6NRwx0s3NKaOKwR1AMNVDqpFCsKL7JCAN5W8Ocp5M1I17StOg4JlRDe3ZpXrGfy
	HY6w==
X-Received: by 10.66.121.74 with SMTP id li10mr97457705pab.73.1438206863506;
	Wed, 29 Jul 2015 14:54:23 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	i5sm42780938pat.42.2015.07.29.14.54.21
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 29 Jul 2015 14:54:22 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jul 2015 14:54:13 -0700
Message-Id: <d57eef6373f517bc1b14c1a7b42331a3776ee63b.1438206555.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <e64dd77c8bbab29e1ba0b0b44e97e2e6a3393349.1438206555.git.chris_larson@mentor.com>
References: <e64dd77c8bbab29e1ba0b0b44e97e2e6a3393349.1438206555.git.chris_larson@mentor.com>
In-Reply-To: <cover.1438206555.git.chris_larson@mentor.com>
References: <cover.1438206555.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 2/3] devtool: add --bbpath argument
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
X-List-Received-Date: Wed, 29 Jul 2015 21:54:23 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 scripts/devtool | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/scripts/devtool b/scripts/devtool
index 557a830..4a1f2d6 100755
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
@@ -239,13 +240,19 @@ def main():
 
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
-    tinfoil.cooker.shutdown(force=True)
-    tinfoil.cooker.unlockBitbake()
+
+    if tinfoil:
+        tinfoil.cooker.shutdown(force=True)
+        tinfoil.cooker.unlockBitbake()
 
     subparsers = parser.add_subparsers(dest="subparser_name", title='subcommands', metavar='<subcommand>')
 
-- 
2.2.1


