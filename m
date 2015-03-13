Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-we0-f182.google.com (mail-we0-f182.google.com
	[74.125.82.182])
	by mail.openembedded.org (Postfix) with ESMTP id 4738B6013D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2015 17:00:51 +0000 (UTC)
Received: by wesw55 with SMTP id w55so24653821wes.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2015 10:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:reply-to:subject:date:message-id:organization:user-agent
	:mime-version:content-transfer-encoding:content-type;
	bh=aZSFV5omNhMMeck+GR2mLf0jsm/iIG22dLAUx0RJvMM=;
	b=COxPli6pLpnGKtnZa2PrdVEbvLwtbMGKU6DzRYIDYcDcRdmKukDkznG9wCSXpePIQ7
	imoRftGqKKFlfXtXDbrgmUa6GNWqgHGr6sh6dvclb+4wE7jJVXBHilgWCaAul2/0mhPT
	vaL8SW0UnZFG+mc54i98F3AISL1oElfIB3+Dv13i9bQuD6oLxPhLcMeBnRbIif7vjwUY
	7r+KvVYAHTF5Phvht3sW+xs7LaMXA4rHhfhHS+ySaLGr8LKnMpwb8KaAYaSdWi4ZEV9X
	IApOfu7EoCOQaX0qEeiophM4OY2RXyHwr1jm/ugRbm0sBACGbdqlt0qKN2pTNyn7DZt6
	Hjsg==
X-Received: by 10.180.74.47 with SMTP id q15mr56675157wiv.90.1426266050513;
	Fri, 13 Mar 2015 10:00:50 -0700 (PDT)
Received: from chl500346.localnet (mail.neratec.com. [46.140.151.2])
	by mx.google.com with ESMTPSA id ch6sm3620159wjc.3.2015.03.13.10.00.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 13 Mar 2015 10:00:49 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Mar 2015 18:00:48 +0100
Message-ID: <1739289.9di16dJmm8@chl500346>
Organization: Privat
User-Agent: KMail/4.13.3 (Linux/3.13.0-46-generic; KDE/4.13.3; x86_64; ; )
MIME-Version: 1.0
Subject: Add archiver folder to SSTATE_DUPWHITELIST
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: adrian.freihofer@gmail.com
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Mar 2015 17:00:51 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Bitbake fails with an error message such as "The recipe bla is trying to install files into a shared area when those files already exist."
Conditions:
 - The archiver class is active
 - Bitbake is called more than once e.g. to compile two images for different architectures

At least for me, the patch bellow seems to solve the issue...


From 5ca1a06c7e004f9ecda2e34c49e0cf5ad490582a Mon Sep 17 00:00:00 2001
From: Adrian <adrian.freihofer@gmail.com>
Date: Fri, 13 Mar 2015 17:39:45 +0100
Subject: [PATCH] Add archiver folder to SSTATE_DUPWHITELIST

Without this patch the source archiver class is not allowed to
archive the same source archive for different builds.

Signed-off-by: Adrian <adrian.freihofer@gmail.com>
---
 meta/classes/sstate.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index ace6bdb..2f0632a 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -25,6 +25,8 @@ SSTATE_EXTRAPATH[vardepvalue] = ""
 SSTATE_DUPWHITELIST = "${DEPLOY_DIR_IMAGE}/ ${DEPLOY_DIR}/licenses/ ${DEPLOY_DIR_RPM}/all/"
 # Avoid docbook/sgml catalog warnings for now
 SSTATE_DUPWHITELIST += "${STAGING_ETCDIR_NATIVE}/sgml ${STAGING_DATADIR_NATIVE}/sgml"
+# Archive the sources for many architectures in one deploy folder
+SSTATE_DUPWHITELIST += "${DEPLOY_DIR_SRC}"

 SSTATE_SCAN_FILES ?= "*.la *-config *_config"
 SSTATE_SCAN_CMD ?= 'find ${SSTATE_BUILDDIR} \( -name "${@"\" -o -name \"".join(d.getVar("SSTATE_SCAN_FILES", True).split())}" \) -type f'
-- 
1.9.1

