Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9C27B71AB4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Feb 2018 11:48:39 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id w50so29251047wrc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Feb 2018 03:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=IZi3uIirjxfZ2EwvKJRjeYv9OFCt1Ch48EM5fialjOY=;
	b=eT1XJneyCyOsVsGklCBTGvYph8ZVqX5RU6DwNMHrDODttfuRF0+9lcjss6u0oT5pUj
	18U3kUklIcIHfKgJw9gZgc+pdGaHp+XOVuJABtICp7lgUAsMovqeYUEZAVBXhKjo3mwd
	1NrCArAl0j4VlnKPiXIJyZLAZMnu1uRG8wNazrvvZo/PcrdpLzHuP7rq62M4qmHoTFhC
	YSRZevs+ZkXTpFBfgySF+41sKPOCy6VSIUzOB2THlQCwruKV0vtZ3cTBU1NFIejl4aqL
	m9lRSp+r1nVoqR1PyLXrpTwPJZjA02vgvGvzMzHitrT4nh6tf6r54+/qdnA9qw/V47yM
	kBpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=IZi3uIirjxfZ2EwvKJRjeYv9OFCt1Ch48EM5fialjOY=;
	b=sO0hTT72II6fiy7xKlYXv5ENmRSymMRpJyy8D33C6pJwdUJ1Uztxr8Ns7X9GZtblkS
	sQ49QkkrbkcMy50Fmtd35GzFWts9FGEWV8FcIhC1vU2tynw1WIZMlp/BR6SK4y/JfqPI
	CNXqbj+ZfRFSlu0998KFzL4tnEThBn6aB6biSMBz+0BPqbBSFPb2nWsg/btTt9rQfN4Z
	314rrxO3PLUPXRzMKkOLFPb/wZE51A96VII0prdGkRmGibOw0yx0BWO+1VgKc30l0RCz
	aJF6Q3FyZ/6tzMSIuSH33sJe2sJZc3GzhSyeACjKsbbYUf1qKjZz0463MkWRdFUBP6pA
	fhFg==
X-Gm-Message-State: AKwxyteGR3s+WzcDJNaUlXH76AcbO73BE3IkHcXRkNxxb+uaoNlkjX2f
	I81YgJwWhDoTB/fT0JZtSQ+X6V4I
X-Google-Smtp-Source: AH8x2261atq1a/faRMKge62IGkYb5VirhYp+OncFWLetTIivxRL+W/irBR+Kei9XHVftSHI6PC7PUw==
X-Received: by 10.223.171.3 with SMTP id q3mr12486812wrc.64.1517831320085;
	Mon, 05 Feb 2018 03:48:40 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	f19sm4680754wmf.23.2018.02.05.03.48.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Feb 2018 03:48:39 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Feb 2018 11:48:37 +0000
Message-Id: <20180205114837.19922-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] oe-pkgdata-util: add --long option to list-pkg-files to show sizes
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
X-List-Received-Date: Mon, 05 Feb 2018 11:48:39 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 scripts/oe-pkgdata-util | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index 78b3d7bcb83..aea8a575166 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -435,7 +435,7 @@ def list_pkgs(args):
 
 def list_pkg_files(args):
     import json
-    def parse_pkgdatafile(pkgdatafile):
+    def parse_pkgdatafile(pkgdatafile, long=False):
         with open(pkgdatafile, 'r') as f:
             found = False
             for line in f:
@@ -443,8 +443,13 @@ def list_pkg_files(args):
                     found = True
                     val = line.split(':', 1)[1].strip()
                     dictval = json.loads(val)
-                    for fullpth in sorted(dictval):
-                        print("\t%s" % fullpth)
+                    if long:
+                        width = max(map(len, dictval), default=0)
+                        for fullpth in sorted(dictval):
+                            print("\t{:{width}}\t{}".format(fullpth, dictval[fullpth], width=width))
+                    else:
+                        for fullpth in sorted(dictval):
+                            print("\t%s" % fullpth)
                     break
             if not found:
                 logger.error("Unable to find FILES_INFO entry in %s" % pkgdatafile)
@@ -479,7 +484,7 @@ def list_pkg_files(args):
                     continue
                 logger.error("Unable to find any built runtime package named %s" % pkg)
                 sys.exit(1)
-            parse_pkgdatafile(pkgdatafile)
+            parse_pkgdatafile(pkgdatafile, args.long)
 
         else:
             providepkgpath = os.path.join(args.pkgdata_dir, "runtime-rprovides", pkg)
@@ -488,13 +493,13 @@ def list_pkg_files(args):
                     if f != pkg:
                         print("%s is in the RPROVIDES of %s:" % (pkg, f))
                     pkgdatafile = os.path.join(args.pkgdata_dir, "runtime", f)
-                    parse_pkgdatafile(pkgdatafile)
+                    parse_pkgdatafile(pkgdatafile, args.long)
                 continue
             pkgdatafile = os.path.join(args.pkgdata_dir, "runtime", pkg)
             if not os.path.exists(pkgdatafile):
                 logger.error("Unable to find any built recipe-space package named %s" % pkg)
                 sys.exit(1)
-            parse_pkgdatafile(pkgdatafile)
+            parse_pkgdatafile(pkgdatafile, args.long)
 
 def find_path(args):
     import json
@@ -548,6 +553,7 @@ def main():
     parser_list_pkg_files.add_argument('-r', '--runtime', help='Specified package(s) are runtime package names instead of recipe-space package names', action='store_true')
     parser_list_pkg_files.add_argument('-p', '--recipe', help='Report on all packages produced by the specified recipe')
     parser_list_pkg_files.add_argument('-u', '--unpackaged', help='Include unpackaged (i.e. empty) packages (only useful with -p/--recipe)', action='store_true')
+    parser_list_pkg_files.add_argument('-l', '--long', help='Show more information per file', action='store_true')
     parser_list_pkg_files.set_defaults(func=list_pkg_files)
 
     parser_lookup_recipe = subparsers.add_parser('lookup-recipe',
-- 
2.11.0


