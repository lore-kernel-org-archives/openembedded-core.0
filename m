Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id 0ED9B73232
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 May 2015 21:06:35 +0000 (UTC)
Received: by igbpi8 with SMTP id pi8so97641361igb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 May 2015 14:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=gsHc3me4LTFf31IeTxW7E09aqJnHNQntkfTgWa9BTjY=;
	b=cl3fCP+Iw66SVXYAEWTnZHMtQ9V+K+oDXuXv1g7xnUS8W0zcNU+Bnc5Nfk+YsnwrHq
	EVMKWuvhxlRG1q6o0kSGG/DlmTQN1QEdDx31Bgf5W7Q5H3r8e3Eovf82mXXUeccqARvf
	9F60S2EugszG0Pt89SimSaej0iD9GwxEQuesI8FfnZ2LRrYE5t0WatrXjvKH7bmsrFiJ
	i4BJERBM4XYypHtSobamCZuqg2QSJWFVBue0frvREd6ei1A7eAbiEfUE8rdHKGrIWurN
	TFIO4mjaezkjzWNzfyGL0agixH7AaAoLrQYkJtbaRjApD85a8K4A1Mk4JiZH9jNaB7yQ
	IO/w==
X-Received: by 10.50.64.147 with SMTP id o19mr6909121igs.33.1432760796807;
	Wed, 27 May 2015 14:06:36 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id ot6sm2656466igb.11.2015.05.27.14.06.35
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 27 May 2015 14:06:36 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 May 2015 14:06:13 -0700
Message-Id: <1432760773-16671-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1432760773-16671-1-git-send-email-armccurdy@gmail.com>
References: <1432760773-16671-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH v2 3/3] binutils.inc: make gnu-configize ignore errors from autoconf
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
X-List-Received-Date: Wed, 27 May 2015 21:06:36 -0000

Recent changes to gnu-configize mean that errors returned when running
autoconf are now reported by default. bintils do_configure seems to be
a special case which relies on errors being ignored.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-devtools/binutils/binutils.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
index a304867..1e1faa7 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -102,7 +102,7 @@ export CC_FOR_BUILD = "LD_LIBRARY_PATH= ${BUILD_CC}"
 MULTIARCH := "${@bb.utils.contains("DISTRO_FEATURES", "multiarch", "yes", "no", d)}"
 do_configure[vardeps] += "MULTIARCH"
 do_configure () {
-	(cd ${S}; gnu-configize) || die "Failed to run gnu-configize"
+	(cd ${S}; gnu-configize --continue) || die "Failed to run gnu-configize"
 	oe_runconf
 #
 # must prime config.cache to ensure the build of libiberty
-- 
1.9.1


