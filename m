Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E723E71DEE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 May 2017 16:13:13 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v4BGDDJ7000493
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 11 May 2017 17:13:14 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1d8qiH-0006Rl-0A; Thu, 11 May 2017 17:13:13 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 May 2017 17:13:06 +0100
Message-Id: <1494519187-24730-3-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1494519187-24730-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1494519187-24730-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Thu, 11 May 2017 17:13:14 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH 3/4] sstate: Ensure native/cross recipes have relocation of HOSTTOOLS_DIR
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
X-List-Received-Date: Thu, 11 May 2017 16:13:14 -0000

The previous change to relocate HOSTTOOLS wasn't complete as some files,
particularly in gcc stashed build directories were not being correctly
relocated. This patch addresses the issue.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sstate.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index ddc442c..0a12935 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -33,7 +33,7 @@ SSTATE_DUPWHITELIST += "${DEPLOY_DIR_SRC}"
 
 SSTATE_SCAN_FILES ?= "*.la *-config *_config postinst-*"
 SSTATE_SCAN_CMD ??= 'find ${SSTATE_BUILDDIR} \( -name "${@"\" -o -name \"".join(d.getVar("SSTATE_SCAN_FILES").split())}" \) -type f'
-SSTATE_SCAN_CMD_NATIVE ??= 'grep -Irl -e ${RECIPE_SYSROOT} -e ${RECIPE_SYSROOT_NATIVE} ${SSTATE_BUILDDIR}'
+SSTATE_SCAN_CMD_NATIVE ??= 'grep -Irl -e ${RECIPE_SYSROOT} -e ${RECIPE_SYSROOT_NATIVE} -e ${HOSTTOOLS_DIR} ${SSTATE_BUILDDIR}'
 
 BB_HASHFILENAME = "False ${SSTATE_PKGSPEC} ${SSTATE_SWSPEC}"
 
-- 
2.7.4


