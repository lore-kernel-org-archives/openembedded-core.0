Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 290A86AE79
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2013 04:38:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5Q4crIL024072
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2013 21:38:53 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Tue, 25 Jun 2013 21:38:53 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Jun 2013 12:38:47 +0800
Message-ID: <6ddc350b819c49dafaf0b5c6879ad96479052b0b.1372215660.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1372215660.git.hongxu.jia@windriver.com>
References: <cover.1372215660.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] adt_installer_internal:fix perl lib version mismatch
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
X-List-Received-Date: Wed, 26 Jun 2013 04:38:52 -0000
Content-Type: text/plain

When run "autoreconf" in toolchain, there is an error if the host's perl's
version is not the same as the one in the SDK, the error says that the
executable perl mismatches the perl lib's version.

This is because most of the autotools' scripts use the "#!/usr/bin/perl -w"
which is host perl, but the gnu-configize uses "#! /usr/bin/env perl" which
invokes the perl wrapper in the SDK, and the wrapper will set the PERL5LIB to
the SDK which causes the mismatch. We can make all the perl scripts to use the
host perl or the SDK perl to fix this problem.

[YOCTO #4758]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../installer/adt-installer/scripts/adt_installer_internal         | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal b/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
index 25c955a..16677e7 100755
--- a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
+++ b/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
@@ -220,6 +220,13 @@ for l in $(find $NATIVE_INSTALL_DIR -type l); do
     $SUDO ln -sfn $(readlink $l|sed -e "s:$DEFAULT_INSTALL_FOLDER:$NATIVE_INSTALL_DIR:") $l
 done
 
+# find out all perl scripts in $OECORE_NATIVE_SYSROOT and modify them
+# replacing the host perl with SDK perl.
+for perl_script in $($SUDO grep -m 1 "^#!.*perl" -rl $OECORE_NATIVE_SYSROOT); do
+    $SUDO sed -i -e "s:^#! */usr/bin/perl.*:#! /usr/bin/env perl:g" -e \
+        "s: /usr/bin/perl: /usr/bin/env perl:g" $perl_script
+done
+
 echo_info "\nSuccessfully installed selected native ADT!"
 }
 
-- 
1.8.1.2


