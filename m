Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id A657D606BF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Feb 2015 21:35:31 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id bs8so6617808wib.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Feb 2015 13:35:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=pWXMzPT+AR8f4pB9NgRJyot8hYMkOM3nP88Q2Bb8JRA=;
	b=Sy8KKWsVOj55ppLG8BgUBAjPLTlIYZ/gVih2a/gqYJVbW6CZrqbvyDwojY8BlaxJAp
	5mOlSwGjw4eMAG+j/08skS9H5SsRqI+YgDVAaHbaGU2kic6CrGvy3D919yxxAh1teOWI
	uiP5hhU3SNFX9TZKSjx5zr8VcOFkUBr28kS7W/LyRwX27BQNs5aTDvcxxCQROnQcbJPZ
	uVl9scX873b5SYS843LTXuBLJ96BZ4Y6eK5ECl1ZjDST5TKEdEszq7oRjBTbOukYmttl
	aDQzeLogbbRVugP1UeMiYKQ+F5dynM2PWXR/QttMyqCUbwvn5jW07NVDgh/4Qg5nSfus
	bP2w==
X-Gm-Message-State: ALoCoQl05V33M4Fp5ZAdgvP+YuMGxn78zCWHX9+nNK5YiMOcXos7fy6vDLMIuCq2igan2vtm9nrY
X-Received: by 10.180.75.102 with SMTP id b6mr8476877wiw.75.1423085732788;
	Wed, 04 Feb 2015 13:35:32 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id n6sm4443036wjy.8.2015.02.04.13.35.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Feb 2015 13:35:32 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Feb 2015 21:33:36 +0000
Message-Id: <1423085616-6729-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] Revert "bitbake.conf: don't remove WARN_QA and ERROR_QA from hashes"
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
X-List-Received-Date: Wed, 04 Feb 2015 21:35:36 -0000

It turns out that changing WARN_QA and ERROR_QA results in do_configure's QA
postfunc re-executing, so changing a QA test results in a complete rebuild.

This is just too much and the lesser evil of needing to do a full rebuild to
verify changed QA flags is preferable to an enforced full rebuild.

This reverts commit daecfc3438122b5d146a59a5053e57006d55ccc4.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/bitbake.conf |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 907ed1e..b5b54b7 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -774,7 +774,7 @@ BB_HASHBASE_WHITELIST ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH DL_DIR \
     USER FILESPATH STAGING_DIR_HOST STAGING_DIR_TARGET COREBASE PRSERV_HOST \
     PRSERV_DUMPDIR PRSERV_DUMPFILE PRSERV_LOCKDOWN PARALLEL_MAKE \
     CCACHE_DIR EXTERNAL_TOOLCHAIN CCACHE CCACHE_DISABLE LICENSE_PATH SDKPKGSUFFIX \
-    WORKDIR STAMPCLEAN PKGDATA_DIR"
+    WARN_QA ERROR_QA WORKDIR STAMPCLEAN PKGDATA_DIR"
 BB_HASHCONFIG_WHITELIST ?= "${BB_HASHBASE_WHITELIST} DATE TIME SSH_AGENT_PID \
     SSH_AUTH_SOCK PSEUDO_BUILD BB_ENV_EXTRAWHITE DISABLE_SANITY_CHECKS \
     PARALLEL_MAKE BB_NUMBER_THREADS BB_ORIGENV BB_INVALIDCONF BBINCLUDED"
-- 
1.7.10.4


