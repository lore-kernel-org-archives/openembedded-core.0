Return-Path: <paul.betafive@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 640386E760
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2014 15:15:33 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id e4so705797wiv.16
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2014 07:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=QBbRebyb12n0c45hNDbnpe2XeLEneJiPeB/5plhbv8I=;
	b=fhjA7+WQbZmRcTW0gCmw7DqxAVkH9es45WO8ZnTqKQJKDlCwY0xluJpJUVEDG+qDOF
	ix331ncG666wbschPP0ot8Z0gJS0nHdDuF/b+oOxHsOCPj0/qcXEqsep4wtLIIsLKC8M
	mlK4R3qJhmiXRS2YbXZOqUdjHE2I5XGqlx2ckN9AKTLJ33PDGroSCsvSqolaklEFuvD3
	YTMzoHmlvzCzP9gFAUa+I9Nq1D4YL5eYEwB2gps7mQwRHN/U/m52Biua/NahfhHw9SG4
	HaJeB6L92WY3+/hLtzNRGZ/SgIj3r/LbCTNhDYptB1QFI6F3vet6xwn9QM5r2Q7SuBVP
	Hm4Q==
X-Received: by 10.194.22.232 with SMTP id h8mr3528950wjf.53.1392822933579;
	Wed, 19 Feb 2014 07:15:33 -0800 (PST)
Received: from desktop.lan (2e4099b1.skybroadband.com. [46.64.153.177])
	by mx.google.com with ESMTPSA id ju6sm1251538wjc.1.2014.02.19.07.15.31
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 19 Feb 2014 07:15:32 -0800 (PST)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Feb 2014 15:15:17 +0000
Message-Id: <1392822917-23688-1-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.9.0
Cc: Saul Wold <saul.wold@intel.com>
Subject: [PATCH v2] opkg: Fix add-exclude.patch
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
X-List-Received-Date: Wed, 19 Feb 2014 15:15:35 -0000

The case statement for ARGS_OPT_ADD_EXCLUDE added to the argument handling
switch statement in opkg was missing a "break;" at the end, so it was falling
through into the handler for ARGS_OPT_NOACTION. Thus when "--add-exclude" was
specified on the command line it was as if "--noaction" was also being
specified. This appears to be the root cause of YP bug 5311.

Tested using the case described by Alexandru Georgescu in YP bug 5311:

    MACHINE ??= "qemux86"
    IMAGE_INSTALL_append = " man"
    PACKAGE_EXCLUDE = "man"
    PACKAGE_CLASSES ?= "package_ipk"

Built image and boot tested on qemu, ensured that man was not installed but the
rest of the system was installed correctly.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
Cc: Mark Hatle <mark.hatle@windriver.com>
Cc: Saul Wold <saul.wold@intel.com>
Cc: Alexandru Georgescu <alexandru.c.georgescu@intel.com>
---
Changes:

V2: Used 'editdiff' to ensure the patch offsets were updated.

 meta/recipes-devtools/opkg/opkg/add-exclude.patch | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/opkg/opkg/add-exclude.patch b/meta/recipes-devtools/opkg/opkg/add-exclude.patch
index 8489058..8d328d5 100644
--- a/meta/recipes-devtools/opkg/opkg/add-exclude.patch
+++ b/meta/recipes-devtools/opkg/opkg/add-exclude.patch
@@ -84,7 +84,7 @@ Index: trunk/src/opkg-cl.c
  	{"test", 0, 0, ARGS_OPT_NOACTION},
  	{"tmp-dir", 1, 0, 't'},
  	{"tmp_dir", 1, 0, 't'},
-@@ -198,6 +200,17 @@ args_parse(int argc, char *argv[])
+@@ -198,6 +200,18 @@ args_parse(int argc, char *argv[])
  			}
  			free(tuple);
  			break;
@@ -99,10 +99,11 @@ Index: trunk/src/opkg-cl.c
 +				conf->exclude_list = realloc(conf->exclude_list, sizeof(char *) * conf->exclude_count);
 +				conf->exclude_list[conf->exclude_count - 1] = tuple;
 +			}
++			break;
  		case ARGS_OPT_NOACTION:
  			conf->noaction = 1;
  			break;
-@@ -282,6 +295,7 @@ usage()
+@@ -282,6 +296,7 @@ usage()
  	printf("\t--offline-root <dir>	offline installation of packages.\n");
  	printf("\t--add-arch <arch>:<prio>	Register architecture with given priority\n");
  	printf("\t--add-dest <name>:<path>	Register destination with given path\n");
-- 
1.9.0


