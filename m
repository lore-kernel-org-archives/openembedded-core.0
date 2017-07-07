Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id ED04077E7F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jul 2017 12:25:59 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v67CPvru026370
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 7 Jul 2017 13:25:58 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1dTSKb-0007GU-Qz; Fri, 07 Jul 2017 13:25:57 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Jul 2017 13:25:56 +0100
Message-Id: <1499430356-27888-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Fri, 07 Jul 2017 13:25:59 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH] staging: Ensure a clean recipe sysroot removes addto_recipe_sysroot stamps
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
X-List-Received-Date: Fri, 07 Jul 2017 12:26:01 -0000

The commands:

bitbake nodejs-native;
bitbake nodejs-native -c clean;
bitbake nodejs-native;
bitbake -c addto_recipe_sysroot nodejs-native;
bitbake -c devshell nodejs-native;
bitbake -c addto_recipe_sysroot nodejs-native;
bitbake -c devshell nodejs-native;

never result in npm in the sysroot within devshell. The reason is the
addto_recipe_sysroot stamp isn't removed when do_fetch is run but the sysroot
is cleaned.

With this patch, the second devshell will contain npm, which I think is probably
the best outcome we can hope for here.

[YOCTO #11461]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/staging.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index fe82294..8f470d5 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -559,6 +559,9 @@ addtask do_prepare_recipe_sysroot before do_configure after do_fetch
 # Clean out the recipe specific sysroots before do_fetch
 # (use a prefunc so we can order before extend_recipe_sysroot if it gets added)
 python clean_recipe_sysroot() {
+    # We remove these stamps since we're removing any content they'd have added with
+    # cleandirs. This removes the sigdata too, likely not a big deal,
+    oe.path.remove(d.getVar("STAMP") + "*addto_recipe_sysroot*")
     return
 }
 clean_recipe_sysroot[cleandirs] += "${RECIPE_SYSROOT} ${RECIPE_SYSROOT_NATIVE}"
-- 
2.7.4


