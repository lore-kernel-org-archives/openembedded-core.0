Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 825CE6AC33
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Mar 2015 06:39:47 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t296dmpK029476
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 8 Mar 2015 23:39:48 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.236) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Sun, 8 Mar 2015 23:39:48 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 9 Mar 2015 14:39:48 +0800
Message-ID: <9c5ff4936540de659b192873b0082c93c678ff3e.1425883091.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1425883091.git.Qi.Chen@windriver.com>
References: <cover.1425883091.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] nativesdk.bbclass: set PKGDATA_DIR explicitly
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
X-List-Received-Date: Mon, 09 Mar 2015 06:39:47 -0000
Content-Type: text/plain

For now, if we enable 'multilib' and execute `bitbake uninative-tarball
-c populate_sdk', the command would fail, complaining nativesdk-glibc not
found in package feed.

The problem is that PKGDATA_DIR is not set correctly for nativesdk packages
when multilib is enabled.

For now, we have:
meta/conf/bitbake.conf:PKGDATA_DIR = "${STAGING_DIR_HOST}/pkgdata"

The above is overriden by the following is multilib is enabled.
meta/conf/multilib.conf:PKGDATA_DIR = "${STAGING_DIR}/${MACHINE}/pkgdata"

This is correct for normal packages. However, for nativesdk packages, this
is not correctly. This is because nativesdk.bbclass set STAGING_DIR_HOST as
follows.

meta/classes/nativesdk.bbclass:STAGING_DIR_HOST = "${STAGING_DIR}/${MULTIMACH_HOST_SYS}"

The above overrides the value in multilib.conf.

That's why we need to also set PKGDATA_DIR explicitly in nativesdk.bbclass.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/nativesdk.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/nativesdk.bbclass b/meta/classes/nativesdk.bbclass
index 5e78116..30bcdfe 100644
--- a/meta/classes/nativesdk.bbclass
+++ b/meta/classes/nativesdk.bbclass
@@ -25,6 +25,7 @@ EXTRANATIVEPATH += "chrpath-native"
 
 STAGING_DIR_HOST = "${STAGING_DIR}/${MULTIMACH_HOST_SYS}"
 STAGING_DIR_TARGET = "${STAGING_DIR}/${MULTIMACH_TARGET_SYS}"
+PKGDATA_DIR = "${STAGING_DIR_HOST}/pkgdata"
 
 HOST_ARCH = "${SDK_ARCH}"
 HOST_VENDOR = "${SDK_VENDOR}"
-- 
1.9.1


