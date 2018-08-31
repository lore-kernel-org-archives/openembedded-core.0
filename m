Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 44D7C790AB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2018 12:10:18 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id v90-v6so11021952wrc.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2018 05:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=PR1LgIGmjHjhDGDBinJ28siEVEhxwRys2oXVigNDNXY=;
	b=JmWzcytO6upuxkOVg5g1TqIL/gmOXvu1C+Oj+ORApps17wO2q9044Q00xvrUTryeQD
	rHmV08Tvps+BJxBfI6KaEh8s5YBpFP7goPloU67nApS1U0BSyTofUoUANqr6pzQzsOz7
	6Yj/bUTss7/iv4Uc2SoUX6LV1WLFNFpQHusmTRj4WbHwVrduC+JuRKuG+cCUwhi+lbjZ
	O2SVJP+usXLJRL1g9VEM4b77c4wDskYrq3GwIPbKmUt/p1w0vt0LGKStcr0MEJROEQtb
	zPnK5mCXM/+cSeEQmamBQJ5gIKx2/zLGtMhRWUvMrzCvQssVNPQb2vtVyiRyDYzOkrua
	zQLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=PR1LgIGmjHjhDGDBinJ28siEVEhxwRys2oXVigNDNXY=;
	b=GoXc5rS7DQuhEis0tpDddIhUgqMrmeYfzMOQlUGo+amXNLgBkV4k3aXqYeZcMyHtgC
	e3V6rvyf+hJGlOBx7FP5Rf8fxfj7LtrYOY0xJRjZLrK8PDv4v701v0nQqipGOAk69bAS
	fIvkhpRFU3V+IisfTVYqpG77IQ+YLnNLwE/8qEMvnCAb54ukNSOKnv+6zjMWCQvHEflj
	VfANV0HL3ninKMiWJRjPIRMpLFD34BBguCbOJoXvwinJ5gyALDRFIPmhVXeaGe+HvoNV
	dbEK6IoXMZkyZtVCc2qg4myBGjK7A77PhL8qzp5If4GScon9bDV6HP2KV1cc+sBiNEgp
	Q8iA==
X-Gm-Message-State: APzg51Avjj+p6WleI2p/kURjy635IwdbICbsjqeegvztgX7jS5spKYEJ
	OQYzRZbfQw0Z7Mu30O3NqFM5CKSDkYM=
X-Google-Smtp-Source: ANB0VdZbrJqZY7R6EH2oA7LeogRIEjPUlsL7HT21TCJCuDFLt6drfkSlqqvAZPqyfghAhJ3pzjbAHw==
X-Received: by 2002:adf:a789:: with SMTP id
	j9-v6mr10708539wrc.277.1535717418491; 
	Fri, 31 Aug 2018 05:10:18 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	k5-v6sm14587334wrm.96.2018.08.31.05.10.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Aug 2018 05:10:17 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 Aug 2018 13:10:15 +0100
Message-Id: <20180831121015.28985-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] oe-pkgdata-util: improve resiliance of lookup-recipe
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
X-List-Received-Date: Fri, 31 Aug 2018 12:10:18 -0000

If we can't find the pkgdata for a package, instead of erroring out just emit a
message and continue.

This makes it possible to pass long lists of packages to oe-pkgdata-util and
process the output.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 scripts/oe-pkgdata-util | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index e6c9df94e83..53739b0bfc5 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -279,10 +279,14 @@ def lookup_recipe(args):
                 parse_pkgdatafile(pkgdatafile)
             continue
         pkgdatafile = os.path.join(args.pkgdata_dir, 'runtime-reverse', pkg)
-        if not os.path.exists(pkgdatafile):
-            logger.error("The following packages could not be found: %s" % pkg)
-            sys.exit(1)
-        parse_pkgdatafile(pkgdatafile)
+        if os.path.exists(pkgdatafile):
+            parse_pkgdatafile(pkgdatafile)
+        else:
+            if args.carryon:
+                print("The following packages could not be found: %s" % pkg)
+            else:
+                logger.error("The following packages could not be found: %s" % pkg)
+                sys.exit(1)
 
 def package_info(args):
     def parse_pkgdatafile(pkgdatafile):
@@ -558,6 +562,7 @@ def main():
                                           help='Find recipe producing one or more packages',
                                           description='Looks up the specified runtime package(s) to see which recipe they were produced by')
     parser_lookup_recipe.add_argument('pkg', nargs='+', help='Runtime package name to look up')
+    parser_lookup_recipe.add_argument('-c', '--continue', dest="carryon", help='Continue looking up recipes even if we can not find one', action='store_true')
     parser_lookup_recipe.set_defaults(func=lookup_recipe)
 
     parser_package_info = subparsers.add_parser('package-info',
-- 
2.11.0


