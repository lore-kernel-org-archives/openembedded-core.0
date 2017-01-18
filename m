Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DEA4471AD8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jan 2017 13:54:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v0IDshDA018758
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 18 Jan 2017 05:54:43 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 18 Jan 2017 05:54:43 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 18 Jan 2017 08:54:28 -0500
Message-ID: <7fdbf6137f68f008170006c2ba7bb99d4e1e8504.1484747560.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1484747560.git.bruce.ashfield@windriver.com>
References: <cover.1484747560.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 13/14] kern-tools: kconf_check: flag CONFIG options with invalid spaces
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
X-List-Received-Date: Wed, 18 Jan 2017 13:54:44 -0000
Content-Type: text/plain

Options with spacs around = signs will be droped/ignored by the
kernel.

The audit phase can detect this and warn the user:

    % kconf_check --report -o .kernel-meta/cfg/ \
      linux-qemux86-standard-build/.config `pwd` $cfgs

     [errors (3): .kernel-meta/cfg/fragment_errors.txt
       There are errors withing the config fragments.

    % cat .kernel-meta/cfg/fragment_errors.txt
       Warning: Ignoring "CONFIG_PARAVIRTT_CLOCK =y" -- spaces around equals are invalid
       Warning: Ignoring "CONFIG_PARAVIRTTT_CLOCK = y" -- spaces around equals are invalid
       Warning: Ignoring "CONFIG_PARAVIRTTTT_CLOCK= y" -- spaces around equals are invalid

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index 030c2d42d873..edf5cd93c0b4 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=a6c2fa8aef1b
 
 DEPENDS = "git-native"
 
-SRCREV = "be79004cb2535e79271822b3d74eda5ba12233d2"
+SRCREV = "bf2942f7559d114e96f7c7f1287bf7e5120632a"
 PR = "r12"
 PV = "0.2+git${SRCPV}"
 
-- 
2.5.0


