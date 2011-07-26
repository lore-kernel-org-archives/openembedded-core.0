Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237] helo=rex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@tim.rpsys.net>) id 1QlpdD-0007sc-37
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 23:57:39 +0200
Received: by rex (Postfix, from userid 1000)
	id 697CA20D65; Tue, 26 Jul 2011 22:53:17 +0100 (BST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jul 2011 22:53:10 +0100
Message-Id: <ed492b5beb3b49540ba355341a51b017282032c5.1311716946.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <e393d2644b26b14f2b3b4b8e12177644921076b9.1311716946.git.richard.purdie@linuxfoundation.org>
References: <e393d2644b26b14f2b3b4b8e12177644921076b9.1311716946.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1311716946.git.richard.purdie@linuxfoundation.org>
References: <cover.1311716946.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 3/8] do_split_packages: revise for multilib case
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Jul 2011 21:57:39 -0000

From: Yu Ke <ke.yu@intel.com>

in multilib case, the PACKAGE_DYNAMIC is overrided with multilib
prefix. Take multilib:lib64-perl as example. the "perl-module-*"
will become "lib64-perl-module-*"

the output_pattern in do_split_packages is designed to work with
PACKAGE_DYNAMIC, so it should be applied with the same logic, i.e.
overriding with multilib prefix. otherwise the do_split_package will
split incorrect files

this patch implements the mulitlib override logic for do_split_packages

Signed-off-by: Yu Ke <ke.yu@intel.com>
Signed-off-by: Xu Dongxiao <dongxiao.xu@intel.com>
---
 meta/classes/package.bbclass |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index ea8ad05..99c60e8 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -70,6 +70,10 @@ def do_split_packages(d, root, file_regex, output_pattern, description, postinst
 	given package, usually plugins or modules.
 	"""
 
+	ml = d.getVar("MLPREFIX", True)
+	if ml and not output_pattern.startswith(ml):
+		output_pattern = ml + output_pattern
+
 	dvar = bb.data.getVar('PKGD', d, True)
 
 	packages = bb.data.getVar('PACKAGES', d, True).split()
-- 
1.7.4.1



