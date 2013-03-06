Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1UD6hR-0007h8-6x
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Mar 2013 06:15:34 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r264x2H4000509
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Mar 2013 20:59:02 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.206) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Tue, 5 Mar 2013 20:59:02 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 6 Mar 2013 12:58:47 +0800
Message-ID: <4ba83b30f38d2d0ae34192a1b2afb55716c4fead.1362545190.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1362545190.git.hongxu.jia@windriver.com>
References: <cover.1362545190.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com
Subject: [danny][PATCH 2/2] populate_sdk_base.bbclass:fix toolchain relocation issues
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Mar 2013 05:15:36 -0000
Content-Type: text/plain

When run "autoreconf" in toolchain, there is an error if the host's perl's
version is not the same as the one in the SDK, the error says that the
executable perl mismatches the perl lib's version.

This is because most of the autotools' scripts use the "#!/usr/bin/perl -w"
which is host perl, but the gnu-configize uses "#! /usr/bin/env perl" which
invokes the perl wrapper in the SDK, and the wrapper will set the PERL5LIB to
the SDK which causes the mismatch. We can make all the perl scripts to use the
host perl or the SDK perl to fix this problem.

[YOCTO #3984]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/populate_sdk_base.bbclass |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 6eb6726..6a34e58 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -174,6 +174,13 @@ fi
 # replace ${SDKPATH} with the new prefix in all text files: configs/scripts/etc
 find $native_sysroot -type f -exec file '{}' \;|grep ":.*ASCII.*text"|cut -d':' -f1|xargs sed -i -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:g"
 
+# find out all perl scripts in $native_sysroot and modify them replacing the
+# host perl with SDK perl.
+for perl_script in $(grep "^#!.*perl" -rl $native_sysroot); do
+	sed -i -e "s:^#! */usr/bin/perl.*:#! /usr/bin/env perl:g" -e \
+		"s: /usr/bin/perl: /usr/bin/env perl:g" $perl_script
+done
+
 # change all symlinks pointing to ${SDKPATH}
 for l in $(find $native_sysroot -type l); do
 	ln -sf $(readlink $l|sed -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:") $l
-- 
1.7.10.4



