Return-Path: <kergoth@gmail.com>
Received: from mail-ie0-f175.google.com (mail-ie0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 0EFDE73B10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jun 2015 22:17:51 +0000 (UTC)
Received: by iecvh10 with SMTP id vh10so42850042iec.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jun 2015 15:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=k//QpB4dKYtI78MqV5eRdjsbCL5PsdREJ2laUE18gH8=;
	b=oPzf2HIYVGSnEf+5mYMF/+xPQFkITS94mCTSCzgTAEF6SlWMm1f5bO+1czolT+gYGp
	tDV7IWoGcPNe0WGQyh3xdZi/+bgAolIsaeVMLv6GUyANeTWrktk/CnqgQlMTAc6D2XzQ
	Q3qRsq3Pw0kviIfhXbZpwpwDoUUiBO8b4K7nlF1dhvb/sfJRWAn/oCAEylwdzro9XSSh
	S9T+aYiGG6FQl0Iu0J2x/IHLTdCk0RWFnLsZXIrTu+kNZk/QVHcG3IcNoFiaFDIPBPw/
	meWnlTmwpsns7Ph8nZBJfUiCLZnXvOCx+Z1Z7moSPjnCrIRpUuO/zTiQw19zrzUV/2TF
	7bxA==
X-Received: by 10.42.131.202 with SMTP id a10mr40510810ict.49.1435184273146;
	Wed, 24 Jun 2015 15:17:53 -0700 (PDT)
Received: from quark.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id
	l128sm18213097iol.1.2015.06.24.15.17.51
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Jun 2015 15:17:52 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Jun 2015 15:17:46 -0700
Message-Id: <2aaecd9338356aaa02f112b132d4260609f0f40b.1435183929.git.kergoth@gmail.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <ff01786ba6d44a8f8e92e43260d08ffaba0490a7.1435183929.git.kergoth@gmail.com>
References: <ff01786ba6d44a8f8e92e43260d08ffaba0490a7.1435183929.git.kergoth@gmail.com>
In-Reply-To: <cover.1435183929.git.kergoth@gmail.com>
References: <cover.1435183929.git.kergoth@gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 2/3] recipetool.append: use argparse types for validation
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
X-List-Received-Date: Wed, 24 Jun 2015 22:17:52 -0000

This validates the arguments early, when argparse is parsing the arguments, in
a consistent way.

Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 scripts/lib/recipetool/append.py | 45 ++++++++++++++++++++++------------------
 1 file changed, 25 insertions(+), 20 deletions(-)

diff --git a/scripts/lib/recipetool/append.py b/scripts/lib/recipetool/append.py
index ed4ce4a..0aca2ca 100644
--- a/scripts/lib/recipetool/append.py
+++ b/scripts/lib/recipetool/append.py
@@ -245,21 +245,6 @@ def check_do_install(rd, targetpath):
 def appendfile(args):
     import oe.recipeutils
 
-    if not args.targetpath.startswith('/'):
-        logger.error('Target path should start with /')
-        return 2
-
-    if os.path.isdir(args.newfile):
-        logger.error('Specified new file "%s" is a directory' % args.newfile)
-        return 2
-
-    if not os.path.exists(args.destlayer):
-        logger.error('Destination layer directory "%s" does not exist' % args.destlayer)
-        return 2
-    if not os.path.exists(os.path.join(args.destlayer, 'conf', 'layer.conf')):
-        logger.error('conf/layer.conf not found in destination layer "%s"' % args.destlayer)
-        return 2
-
     stdout = ''
     try:
         (stdout, _) = bb.process.run('LANG=C file -b %s' % args.newfile, shell=True)
@@ -349,13 +334,33 @@ def appendfile(args):
         return 3
 
 
+def layer(layerpath):
+    if not os.path.exists(os.path.join(layerpath, 'conf', 'layer.conf')):
+        raise argparse.ArgumentTypeError('{0!r} must be a path to a valid layer'.format(layerpath))
+    return layerpath
+
+
+def existing_file(filepath):
+    if not os.path.exists(filepath):
+        raise argparse.ArgumentTypeError('{0!r} must be an existing path'.format(filepath))
+    elif os.path.isdir(filepath):
+        raise argparse.ArgumentTypeError('{0!r} must be a file, not a directory'.format(filepath))
+    return filepath
+
+
+def target_path(targetpath):
+    if not os.path.isabs(targetpath):
+        raise argparse.ArgumentTypeError('{0!r} must be an absolute path, not relative'.format(targetpath))
+    return targetpath
+
+
 def register_command(subparsers):
     parser_appendfile = subparsers.add_parser('appendfile',
-                                                help='Create/update a bbappend to replace a file',
-                                                description='Creates a bbappend (or updates an existing one) to replace the specified file that appears in the target system, determining the recipe that packages the file and the required path and name for the bbappend automatically. Note that the ability to determine the recipe packaging a particular file depends upon the recipe\'s do_packagedata task having already run prior to running this command (which it will have when the recipe has been built successfully, which in turn will have happened if one or more of the recipe\'s packages is included in an image that has been built successfully).')
-    parser_appendfile.add_argument('destlayer', help='Base directory of the destination layer to write the bbappend to')
-    parser_appendfile.add_argument('targetpath', help='Path to the file to be replaced (as it would appear within the target image, e.g. /etc/motd)')
-    parser_appendfile.add_argument('newfile', help='Custom file to replace the target file with')
+                                              help='Create/update a bbappend to replace a file',
+                                              description='Creates a bbappend (or updates an existing one) to replace the specified file that appears in the target system, determining the recipe that packages the file and the required path and name for the bbappend automatically. Note that the ability to determine the recipe packaging a particular file depends upon the recipe\'s do_packagedata task having already run prior to running this command (which it will have when the recipe has been built successfully, which in turn will have happened if one or more of the recipe\'s packages is included in an image that has been built successfully).')
+    parser_appendfile.add_argument('destlayer', help='Base directory of the destination layer to write the bbappend to', type=layer)
+    parser_appendfile.add_argument('targetpath', help='Path to the file to be replaced (as it would appear within the target image, e.g. /etc/motd)', type=target_path)
+    parser_appendfile.add_argument('newfile', help='Custom file to replace the target file with', type=existing_file)
     parser_appendfile.add_argument('-r', '--recipe', help='Override recipe to apply to (default is to find which recipe already packages the file)')
     parser_appendfile.add_argument('-m', '--machine', help='Make bbappend changes specific to a machine only', metavar='MACHINE')
     parser_appendfile.add_argument('-w', '--wildcard-version', help='Use wildcard to make the bbappend apply to any recipe version', action='store_true')
-- 
2.2.1


