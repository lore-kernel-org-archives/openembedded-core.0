Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1Tbb6r-0000hY-Be
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Nov 2012 19:02:49 +0100
Received: from yow-bashfiel-d3.corp.ad.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qAMHmZW2022723;
	Thu, 22 Nov 2012 09:48:36 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Thu, 22 Nov 2012 12:48:29 -0500
Message-Id: <8bc50966172c15ad89a691ca22f4d4ed3958d24c.1353606229.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1353606229.git.bruce.ashfield@windriver.com>
References: <cover.1353606229.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1353606229.git.bruce.ashfield@windriver.com>
References: <cover.1353606229.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] kern-tools: report missing config fragments by name
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
X-List-Received-Date: Thu, 22 Nov 2012 18:02:49 -0000

If a configuration fragment was missing, the previous error output
was not clear about the error:

  | [INFO] doing kernel configme
  | [INFO] Configuring target/machine combo: "standard/atom-pc"
  | [INFO] collecting configs in ./meta/meta-series
  | ERROR: could not sanitize configuration fragments
  |    errors are logged in ... linux/meta/cfg/standard/atom-pc/config.log

but we know the name of the missing fragment and can improve the error
message to be this:

  | [ERROR] kernel configuration fragment fragment 'virto.cfg' cannot be found
  | ERROR. A meta series could not be created for branch yocto/standard/common-pc/atom-pc
  | ERROR. Could not locate meta series for atom-pc
  | ERROR. Could not apply patches for atom-pc.
  |        Patch failures can be resolved in the devshell (bitbake -c devshell linux-yocto)

[YOCTO #3473]

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index f2cd39f..635dfe6 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=d8d1d729a70c
 
 DEPENDS = "git-native guilt-native"
 
-SRCREV = "6f68c9473b43c3e39755a72aef8733cbd0bf1a59"
+SRCREV = "62c8807825ea923a18b1519375b0df67ad9daf2b"
 PR = "r12"
 PV = "0.1+git${SRCPV}"
 
-- 
1.7.10.4



