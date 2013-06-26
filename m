Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 294976AC48
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2013 04:38:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5Q4csl8006448
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2013 21:38:54 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Tue, 25 Jun 2013 21:38:52 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Jun 2013 12:38:46 +0800
Message-ID: <70ff7a743c4864d8ff3edb81da5bf71e86dd07db.1372215660.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1372215660.git.hongxu.jia@windriver.com>
References: <cover.1372215660.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] adt_installer_internal: fix perl modules relocated failed on older distributions
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
X-List-Received-Date: Wed, 26 Jun 2013 04:38:51 -0000
Content-Type: text/plain

The perl module for automake has an embedded path in it, this needs
to be relocated.

Older versions of 'file' do not return the "ASCII" text in the output for
a perl module file. Hence, the regex pattern didn't match perl module and
they were not getting relocated at all on older distributions.

1) On CentOS release 6.4, the version of file is 5.04
$ file /usr/lib/perl5/Config_heavy.pl
$ /usr/lib/perl5/Config_heavy.pl: Perl5 module source text

2) On Ubuntu 13.04, the version of file is 5.11
$ file /usr/lib/perl/5.14/Config_heavy.pl
$ /usr/lib/perl/5.14/Config_heavy.pl: C source, ASCII text, with very long lines

[YOCTO #4550]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../installer/adt-installer/scripts/adt_installer_internal            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal b/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
index 4322964..25c955a 100755
--- a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
+++ b/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
@@ -212,8 +212,8 @@ check_result
 env_setup_script=$(find $NATIVE_INSTALL_DIR/ -name "environment-setup-*")
 $SUDO sed -i -e "s:$DEFAULT_INSTALL_FOLDER:$NATIVE_INSTALL_DIR:g" $env_setup_script
 
-find $OECORE_NATIVE_SYSROOT -type f -exec file '{}' \;|grep ":.*\(ASCII\|script\).*text"|cut -d':' -f1|\
-    xargs $SUDO sed -i -e "s:$DEFAULT_INSTALL_FOLDER:$NATIVE_INSTALL_DIR:g"
+find $OECORE_NATIVE_SYSROOT -type f -exec file '{}' \; | grep ":.*\(ASCII\|script\|source\).*text" | \
+    cut -d':' -f1 | xargs $SUDO sed -i -e "s:$DEFAULT_INSTALL_FOLDER:$NATIVE_INSTALL_DIR:g"
 
 # change all symlinks pointing to /opt/${DISTRO}/${SDK_VERSION}
 for l in $(find $NATIVE_INSTALL_DIR -type l); do
-- 
1.8.1.2


