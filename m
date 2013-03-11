Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1UF0nW-00016H-9L
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Mar 2013 12:21:55 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r2BB542q005805
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2013 04:05:04 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.206) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Mon, 11 Mar 2013 04:05:04 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Mar 2013 19:04:41 +0800
Message-ID: <cc5937f7ababf2c585574eb480dbfdfe96ce9895.1362985569.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1362985569.git.hongxu.jia@windriver.com>
References: <cover.1362985569.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 17/17] populate_sdk_base.bbclass:fix toolchain relocation issues
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
X-List-Received-Date: Mon, 11 Mar 2013 11:21:59 -0000
Content-Type: text/plain

When run "autoreconf" in toolchain, there is an error if the host's perl's
version is not the same as the one in the SDK, the error says that the
executable perl mismatches the perl lib's version.

This is because most of the autotools' scripts use the "#!/usr/bin/perl -w"
which is host perl, but the gnu-configize uses "#! /usr/bin/env perl" which
invokes the perl wrapper in the SDK, and the wrapper will set the PERL5LIB to
the SDK which causes the mismatch. We can make all the perl scripts to use the
host perl or the SDK perl to fix this problem.

Cherry-pick commit aeb53bd78991af9fbb60d64176ec864cfc2ddbb9

[YOCTO #3984]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/populate_sdk_base.bbclass |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 3f2926c..6c55530 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -183,6 +183,13 @@ fi
 # replace ${SDKPATH} with the new prefix in all text files: configs/scripts/etc
 find $native_sysroot -type f -exec file '{}' \;|grep ":.*ASCII.*text"|cut -d':' -f1|xargs sed -i -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:g"
 
+# find out all perl scripts in $native_sysroot and modify them replacing the
+# host perl with SDK perl.
+for perl_script in $(grep "^#!.*perl" -rls $native_sysroot); do
+	sed -i -e "s:^#! */usr/bin/perl.*:#! /usr/bin/env perl:g" -e \
+		"s: /usr/bin/perl: /usr/bin/env perl:g" $perl_script
+done
+
 # change all symlinks pointing to ${SDKPATH}
 for l in $(find $native_sysroot -type l); do
 	ln -sfn $(readlink $l|sed -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:") $l
-- 
1.7.10.4



