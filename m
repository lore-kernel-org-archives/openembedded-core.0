Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8933970034
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 06:30:24 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTP id uAF6UP49002576
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 22:30:25 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.209) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Mon, 14 Nov 2016 22:30:25 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Nov 2016 14:31:06 +0800
Message-ID: <77d67e1026284cb6061e1e3e785b4d30b6b0192c.1479191367.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1479191367.git.Qi.Chen@windriver.com>
References: <cover.1479191367.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] rpm: fix multilib macro installation
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
X-List-Received-Date: Tue, 15 Nov 2016 06:30:24 -0000
Content-Type: text/plain

For now, the rpm macro for multilib is not installed correctly. For
example, in x86-64 lib32 situation, the macro is installed under
tmp/work/x86-pokymllib32-linux/rpm/5.4.16-r0/image/usr/lib/rpm/poky/i686-linux/.

The directory is even not under WORKDIR. And it will of course not be
packaged.

We need to save necessary values before updating the localdata and restore
them so that the macros could be installed into the correct directory.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-devtools/rpm/rpm_5.4.16.bb | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm_5.4.16.bb b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
index 85eb5fe..182818e 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.16.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
@@ -626,8 +626,9 @@ def multilib_rpmmacros(d):
     localdata.delVar('TOOLCHAIN_OPTIONS')
 
     # Set 'localdata' values to be consistent with 'd' values.
-    localdata.setVar('distromacrodir', d.getVar('distromacrodir', True))
-    localdata.setVar('WORKDIR', d.getVar('WORKDIR', True))
+    distromacrodirVal = d.getVar('distromacrodir', True)
+    workdirVal = d.getVar('WORKDIR', True)
+    dval = d.getVar('D', True)
 
     ret = gen_arch_macro(localdata)
 
@@ -639,6 +640,9 @@ def multilib_rpmmacros(d):
         localdata.setVar("OVERRIDES", overrides)
         localdata.setVar("MLPREFIX", item + "-")
         bb.data.update_data(localdata)
+        localdata.setVar('WORKDIR', workdirVal)
+        localdata.setVar('distromacrodir', distromacrodirVal)
+        localdata.setVar('D', dval)
         ret += gen_arch_macro(localdata)
     return ret
 
-- 
1.9.1


