Return-Path: <kergoth@gmail.com>
Received: from mail-ie0-f170.google.com (mail-ie0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id C3EAE6AC1E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jun 2015 22:17:53 +0000 (UTC)
Received: by ieqy10 with SMTP id y10so42912823ieq.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jun 2015 15:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=jnIu/2uUyvEsSwZv9NgtnBoHAYq1HoJrjQdAV5Ei7R0=;
	b=hZqi5fj980bASakILqYJijSYSM65867U/1Xlg+LRynXVU/b0FP0WpI/YsN0cfaMZ8J
	Nl9miYIPxPwQsNBIY8rbHcDWcq2HPwZ0n9oppLZMt08aKHnq0zorA1ZuFxHGTtXG9/m9
	PgDFeTT0xITZjVpVUuHN9mKReZNMA4Wdtqd7Ue/tj/yrAAcZdzBbkn+D0Qquy9pXh/ta
	pJHhyvGVhYzlCCZDxji4gMgkCidnHFaHaVi6MtWMQCN+oqLlowOQey+DbYwz6x2g8QfF
	hl5mA4XxPd9UjK/GddhH6N2qOaM0zVUlXius4z6FLfGui3rl2mHEV342sKTktRIF23l5
	Czew==
X-Received: by 10.42.207.129 with SMTP id fy1mr47430158icb.34.1435184274992;
	Wed, 24 Jun 2015 15:17:54 -0700 (PDT)
Received: from quark.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id
	l128sm18213097iol.1.2015.06.24.15.17.53
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Jun 2015 15:17:53 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Jun 2015 15:17:47 -0700
Message-Id: <375bea6b623a20b529a2d26c226c55785a21f9e8.1435183929.git.kergoth@gmail.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <ff01786ba6d44a8f8e92e43260d08ffaba0490a7.1435183929.git.kergoth@gmail.com>
References: <ff01786ba6d44a8f8e92e43260d08ffaba0490a7.1435183929.git.kergoth@gmail.com>
In-Reply-To: <cover.1435183929.git.kergoth@gmail.com>
References: <cover.1435183929.git.kergoth@gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 3/3] recipetool: add appendsrcfile(s) sub-commands
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
X-List-Received-Date: Wed, 24 Jun 2015 22:17:53 -0000

This adds the `appendsrcfile` and `appendsrcfiles` sub-commands, which let the
user add or replace one or more files in the recipe sources, either in a path
relative to `S` or `WORKDIR`. Each file gets added to `SRC_URI` as a file://
URI, using the subdir= parameter to specify the destination directory.

Examples:

    # Adds our defconfig as file://defconfig. If it's already in SRC_URI, it
    # won't be duplicated.
    recipetool appendsrcfile --workdir meta-mylayer linux-mel defconfig
    recipetool appendsrcfiles --workdir meta-mylayer linux-mel defconfig

    # Does the same, handling the different local filename
    recipetool appendsrcfile --workdir meta-mylayer linux-mel defconfig.mine defconfig

    # Adds our device tree files to the source tree
    recipetool appendsrcfiles --destdir arch/arm/boot/dts meta-mylayer linux-mel *.dts

Of course, for the latter example to be of use, the new dts files would need
to be added to `KERNEL_DEVICETREE` as well, and depending on the kernel,
`DEFCONFIG` or `KERNEL_DEFCONFIG` may need to be set.

Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 scripts/lib/recipetool/append.py | 110 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 104 insertions(+), 6 deletions(-)

diff --git a/scripts/lib/recipetool/append.py b/scripts/lib/recipetool/append.py
index 0aca2ca..9903871 100644
--- a/scripts/lib/recipetool/append.py
+++ b/scripts/lib/recipetool/append.py
@@ -334,20 +334,95 @@ def appendfile(args):
         return 3
 
 
+def appendsrc(args, files, rd):
+    import oe.recipeutils
+
+    srcdir = rd.getVar('S', True)
+    workdir = rd.getVar('WORKDIR', True)
+
+    import bb.fetch
+    simplified = {}
+    src_uri = rd.getVar('SRC_URI', True).split()
+    for uri in src_uri:
+        simple_uri = bb.fetch.URI(uri)
+        simple_uri.params = {}
+        simplified[simple_uri] = uri
+
+    copyfiles = {}
+    extralines = []
+    for newfile, srcfile in files.iteritems():
+        src_destdir = os.path.dirname(srcfile)
+        if not args.use_workdir:
+            src_destdir = os.path.join(os.path.relpath(srcdir, workdir), src_destdir)
+        src_destdir = os.path.normpath(src_destdir)
+
+        source_uri = 'file://{0}'.format(os.path.basename(srcfile))
+        if src_destdir and src_destdir != '.':
+            source_uri += ';subdir={0}'.format(src_destdir)
+
+        simple = bb.fetch.URI(source_uri)
+        simple.params = {}
+        if simple in simplified:
+            existing = simplified[simple]
+            if uri != existing:
+                logger.warn('{0!r} is already in SRC_URI, with different parameters: {1!r}, not adding'.format(source_uri, existing))
+            else:
+                logger.warn('{0!r} is already in SRC_URI, not adding'.format(source_uri))
+        else:
+            extralines.append('SRC_URI += {0}'.format(source_uri))
+        copyfiles[newfile] = srcfile
+
+    oe.recipeutils.bbappend_recipe(rd, args.destlayer, copyfiles, None, wildcardver=args.wildcard_version, machine=args.machine, extralines=extralines)
+
+
+def appendsrcfiles(parser, args):
+    recipedata = _parse_recipe(args.recipe, tinfoil)
+    if not recipedata:
+        parser.error('RECIPE must be a valid recipe name')
+
+    files = dict((f, os.path.join(args.destdir, os.path.basename(f)))
+                 for f in args.files)
+    return appendsrc(args, files, recipedata)
+
+
+def appendsrcfile(parser, args):
+    recipedata = _parse_recipe(args.recipe, tinfoil)
+    if not recipedata:
+        parser.error('RECIPE must be a valid recipe name')
+
+    if not args.destfile:
+        args.destfile = os.path.basename(args.file)
+    elif args.destfile.endswith('/'):
+        args.destfile = os.path.join(args.destfile, os.path.basename(args.file))
+
+    return appendsrc(args, {args.file: args.destfile}, recipedata)
+
+
 def layer(layerpath):
     if not os.path.exists(os.path.join(layerpath, 'conf', 'layer.conf')):
         raise argparse.ArgumentTypeError('{0!r} must be a path to a valid layer'.format(layerpath))
     return layerpath
 
 
-def existing_file(filepath):
+def existing_path(filepath):
     if not os.path.exists(filepath):
         raise argparse.ArgumentTypeError('{0!r} must be an existing path'.format(filepath))
-    elif os.path.isdir(filepath):
+    return filepath
+
+
+def existing_file(filepath):
+    filepath = existing_path(filepath)
+    if os.path.isdir(filepath):
         raise argparse.ArgumentTypeError('{0!r} must be a file, not a directory'.format(filepath))
     return filepath
 
 
+def destination_path(destpath):
+    if os.path.isabs(destpath):
+        raise argparse.ArgumentTypeError('{0!r} must be a relative path, not absolute'.format(destpath))
+    return destpath
+
+
 def target_path(targetpath):
     if not os.path.isabs(targetpath):
         raise argparse.ArgumentTypeError('{0!r} must be an absolute path, not relative'.format(targetpath))
@@ -355,13 +430,36 @@ def target_path(targetpath):
 
 
 def register_command(subparsers):
+    common = argparse.ArgumentParser(add_help=False)
+    common.add_argument('-m', '--machine', help='Make bbappend changes specific to a machine only', metavar='MACHINE')
+    common.add_argument('-w', '--wildcard-version', help='Use wildcard to make the bbappend apply to any recipe version', action='store_true')
+    common.add_argument('destlayer', metavar='DESTLAYER', help='Base directory of the destination layer to write the bbappend to', type=layer)
+
     parser_appendfile = subparsers.add_parser('appendfile',
-                                              help='Create/update a bbappend to replace a file',
+                                              parents=[common],
+                                              help='Create/update a bbappend to replace a target file',
                                               description='Creates a bbappend (or updates an existing one) to replace the specified file that appears in the target system, determining the recipe that packages the file and the required path and name for the bbappend automatically. Note that the ability to determine the recipe packaging a particular file depends upon the recipe\'s do_packagedata task having already run prior to running this command (which it will have when the recipe has been built successfully, which in turn will have happened if one or more of the recipe\'s packages is included in an image that has been built successfully).')
-    parser_appendfile.add_argument('destlayer', help='Base directory of the destination layer to write the bbappend to', type=layer)
     parser_appendfile.add_argument('targetpath', help='Path to the file to be replaced (as it would appear within the target image, e.g. /etc/motd)', type=target_path)
     parser_appendfile.add_argument('newfile', help='Custom file to replace the target file with', type=existing_file)
     parser_appendfile.add_argument('-r', '--recipe', help='Override recipe to apply to (default is to find which recipe already packages the file)')
-    parser_appendfile.add_argument('-m', '--machine', help='Make bbappend changes specific to a machine only', metavar='MACHINE')
-    parser_appendfile.add_argument('-w', '--wildcard-version', help='Use wildcard to make the bbappend apply to any recipe version', action='store_true')
     parser_appendfile.set_defaults(func=appendfile, parserecipes=True)
+
+    common_src = argparse.ArgumentParser(add_help=False, parents=[common])
+    common_src.add_argument('-W', '--workdir', help='Unpack file into WORKDIR rather than S', dest='use_workdir', action='store_true')
+    common_src.add_argument('recipe', metavar='RECIPE', help='Override recipe to apply to')
+
+    parser = subparsers.add_parser('appendsrcfiles',
+                                   parents=[common_src],
+                                   help='Create/update a bbappend to add or replace source files',
+                                   description='Creates a bbappend (or updates an existing one) to add or replace the specified file in the recipe sources, either those in WORKDIR or those in the source tree. This command lets you specify multiple files with a destination directory, so cannot specify the destination filename. See the `appendsrcfile` command for the other behavior.')
+    parser.add_argument('-d', '--destdir', help='Destination directory (relative to S or WORKDIR, defaults to ".")', default='', type=destination_path)
+    parser.add_argument('files', nargs='+', metavar='FILE', help='File(s) to be added to the recipe sources (WORKDIR or S)', type=existing_path)
+    parser.set_defaults(func=lambda a: appendsrcfiles(parser, a), parserecipes=True)
+
+    parser = subparsers.add_parser('appendsrcfile',
+                                   parents=[common_src],
+                                   help='Create/update a bbappend to add or replace a source file',
+                                   description='Creates a bbappend (or updates an existing one) to add or replace the specified files in the recipe sources, either those in WORKDIR or those in the source tree. This command lets you specify the destination filename, not just destination directory, but only works for one file. See the `appendsrcfiles` command for the other behavior.')
+    parser.add_argument('file', metavar='FILE', help='File to be added to the recipe sources (WORKDIR or S)', type=existing_path)
+    parser.add_argument('destfile', metavar='DESTFILE', nargs='?', help='Destination path (relative to S or WORKDIR, optional)', type=destination_path)
+    parser.set_defaults(func=lambda a: appendsrcfile(parser, a), parserecipes=True)
-- 
2.2.1


