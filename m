Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f179.google.com (mail-wr0-f179.google.com
	[209.85.128.179])
	by mail.openembedded.org (Postfix) with ESMTP id 3D4F878093
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 12:43:38 +0000 (UTC)
Received: by mail-wr0-f179.google.com with SMTP id k67so32063957wrc.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 05:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=9wnQ3S9qu+XSENdqdCYmOucnOC/LKhaG1AFTbaAfVnI=;
	b=TsgaXZZCGFGgXlhZs+dKx6oKMRlCg9kENnNycredULQKqTkBWhhr8HzzNs9ZqdXkZe
	wM7vH1V9tiyVIgMiebulaSGW7f8ywDg1hOyDof3UreTzF5JXFh3kyfNfl5iUSd9OZ6eg
	6alz3c7N22D9YRzxh6KH74Iz/Wp5zPPIA8UxhbBfY11C9buWXrKUHQUUVjeXqByCEj/P
	WZhd5q86VcnQ4uq5T9rd8QgkPCIvL7lhHHV35xvdsqy4hIEhQXOEvuW390HQJiHzUvB1
	qru4QOc0dlemRmYWm5qSQpjOUMAkoNJ7jgWFkAaghC8H2TRLqZ15aydSeVooW8Hya8+o
	o+nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=9wnQ3S9qu+XSENdqdCYmOucnOC/LKhaG1AFTbaAfVnI=;
	b=TPcuQQ8w2fjIUKzXGT6jO+CpAU7LcsXDQiUfA8WamWQRCMBbleCg+PUyYfleCcoaH6
	Vzf6fcFID374h+cLg7WnlhkyB4xrJSCmOuBd5LtRgcB/eRf3jNEkKB4z8uPGKjgbzW/y
	hEP1E8tOYn4cB0e3YJX3s/anJWprCbi53C+fnhgI4ajeUTrhZZ/mAiF0vKRv7SjijSCK
	vDyX1G56++wKj70m5w+BDTgF9Pyz8jqPs3+Zb4YqSCQvfATg5UaJMhNob+qNapsgmSo0
	av/JEqdLigV3EHdlcJ6vaRABuXQ2B1BvXkiAfCy4VV6raQLTLUySRUWOD7JMkWyj+Ac4
	4VTA==
X-Gm-Message-State: AIVw112MjJslrYnhrLlm240FoRlr9si5W6KCmgSVCwJSnKNo/BvznkSK
	qlA0c/KaPStbcgfFbe8=
X-Received: by 10.223.128.42 with SMTP id 39mr2978360wrk.175.1499863419126;
	Wed, 12 Jul 2017 05:43:39 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	r70sm2800052wmb.16.2017.07.12.05.43.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Jul 2017 05:43:38 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Jul 2017 13:43:27 +0100
Message-Id: <20170712124331.12444-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/5] ccache: don't export CCACHE_DISABLE globally
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
X-List-Received-Date: Wed, 12 Jul 2017 12:43:39 -0000

CCACHE_DISABLE was added to bitbake.conf in oe-core dd2bab (June 2012) because
autogen-native exports HOME=/dev/null during the build, which is then used by a
host ccache to construct the path to it's cache (/dev/null/.ccache) and this
fails.

However we now always export CCACHE_DIR to solve the same problem in a more
efficient way so CCACHE_DISABLE can be deleted.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/ccache.bbclass | 1 -
 meta/conf/bitbake.conf      | 5 +----
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta/classes/ccache.bbclass b/meta/classes/ccache.bbclass
index d58c8f6e57a..9f1b1f45e34 100644
--- a/meta/classes/ccache.bbclass
+++ b/meta/classes/ccache.bbclass
@@ -1,6 +1,5 @@
 CCACHE = "${@bb.utils.which(d.getVar('PATH'), 'ccache') and 'ccache '}"
 export CCACHE_DIR ?= "${TMPDIR}/ccache/${MULTIMACH_TARGET_SYS}/${PN}"
-CCACHE_DISABLE[unexport] = "1"
 
 # We need to stop ccache considering the current directory or the
 # debug-prefix-map target directory to be significant when calculating
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 962eb437c7b..042a03cbf90 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -480,9 +480,6 @@ HOSTTOOLS_NONFATAL += "aws ccache gcc-ar gpg ld.bfd ld.gold nc sftp socat sudo"
 HOSTTOOLS_NONFATAL += "join nl size yes zcat"
 
 CCACHE ??= ""
-# Disable ccache explicitly if CCACHE is null since gcc may be a symlink
-# of ccache some distributions (e.g., Fedora 17).
-export CCACHE_DISABLE ??= "${@[0,1][d.getVar('CCACHE') == '']}"
 # ccache < 3.1.10 will create CCACHE_DIR on startup even if disabled, and
 # autogen sets HOME=/dev/null so in certain situations builds can fail.
 # Explicitly export CCACHE_DIR until we can assume ccache >3.1.10 on the host.
@@ -845,7 +842,7 @@ BB_HASHBASE_WHITELIST ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH BBSERVER DL_DI
     SSTATE_DIR THISDIR FILESEXTRAPATHS FILE_DIRNAME HOME LOGNAME SHELL TERM \
     USER FILESPATH STAGING_DIR_HOST STAGING_DIR_TARGET COREBASE PRSERV_HOST \
     PRSERV_DUMPDIR PRSERV_DUMPFILE PRSERV_LOCKDOWN PARALLEL_MAKE \
-    CCACHE_DIR EXTERNAL_TOOLCHAIN CCACHE CCACHE_DISABLE LICENSE_PATH SDKPKGSUFFIX \
+    CCACHE_DIR EXTERNAL_TOOLCHAIN CCACHE LICENSE_PATH SDKPKGSUFFIX \
     WARN_QA ERROR_QA WORKDIR STAMPCLEAN PKGDATA_DIR BUILD_ARCH SSTATE_PKGARCH \
     BB_WORKERCONTEXT BB_LIMITEDDEPS extend_recipe_sysroot DEPLOY_DIR"
 BB_HASHCONFIG_WHITELIST ?= "${BB_HASHBASE_WHITELIST} DATE TIME SSH_AGENT_PID \
-- 
2.11.0


