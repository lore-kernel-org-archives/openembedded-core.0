Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 92CAE60557
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 16:04:24 +0000 (UTC)
Received: by pdjz10 with SMTP id z10so8540665pdj.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Feb 2015 08:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=CFDUQGK82S5rTYc3YgUOHebjl3V1hYldmwJnMEQFL6U=;
	b=qGeaWv5QgTA4Zjv+ySbHrzt9bK/HOkGpNeUoqn0OCZdWkOIPEzrpg/5BxdxeiFdGA9
	PiCQ+MHwizYMh2G8B0wqlTHPDaM4Y6OloL5p+ysST6X2SmNY2H412f5JaioOk6cI1Jrg
	AqfsFHF9yEMp86egj1fOpGvrlToaHiahzB3xjFP8AALH3eJi5N47TVa9/FhypEac03Pt
	W4wEkGn2PpwN71ulB1Z8UGQwTmoTp9xbhTurZ50bnwPUzdprtab87jI5h/fvcccwgANN
	3lnIdcVB8M4lGHUX3vSoMf8v65r5LHFt/7ZejawpHR93l67oN9YAshybO2TG4OeBvD1M
	oudg==
X-Received: by 10.66.235.137 with SMTP id um9mr6621789pac.89.1423152265784;
	Thu, 05 Feb 2015 08:04:25 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id uq7sm5468848pbc.48.2015.02.05.08.04.23
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Feb 2015 08:04:24 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Feb 2015 08:03:14 -0800
Message-Id: <74e51a88e741317bffb60148eb31dbfbe38e194a.1423150739.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
References: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
In-Reply-To: <cover.1423150737.git.akuster808@gmail.com>
References: <cover.1423150737.git.akuster808@gmail.com>
Subject: [PATCH 06/61] bitbake.conf: add PKGDATA_DIR to BB_HASHBASE_WHITELIST
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
X-List-Received-Date: Thu, 05 Feb 2015 16:04:24 -0000

From: Ting Liu <b28495@freescale.com>

In meta/conf/bitbake.conf, PKGDATA_DIR is default to:
PKGDATA_DIR = "${STAGING_DIR_HOST}/pkgdata"

But in meta/conf/multilib.conf, PKGDATA_DIR is set as:
PKGDATA_DIR = "${STAGING_DIR}/${MACHINE}/pkgdata"

When multilib enabled, linux-libc-headers cache will be machine
specific:
$ bitbake-diffsigs sstate-cache/1a/sstate:linux-libc-headers:ppce6500-poky-linux:3.17.7:r0:ppce6500:3:1a0c3934d91479fd7242a5b1d407d155_package.tgz.siginfo sstate-cache/28/sstate:linux-libc-headers:ppce6500-poky-linux:3.17.7:r0:ppce6500:3:28c918e8f9f4a4cfceb3a38b258f7501_package.tgz.siginfo
basehash changed from 8d3158bbddcee612fa30badd05f47b8e to 68ac258fc6c8e489f360fde3123a5894
Variable MACHINE value changed from 'b4420qds' to 'b4860qds'

Signed-off-by: Ting Liu <ting.liu@freescale.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 74813a2..90b64b0 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -771,7 +771,7 @@ BB_HASHBASE_WHITELIST ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH DL_DIR \
     USER FILESPATH STAGING_DIR_HOST STAGING_DIR_TARGET COREBASE PRSERV_HOST \
     PRSERV_DUMPDIR PRSERV_DUMPFILE PRSERV_LOCKDOWN PARALLEL_MAKE \
     CCACHE_DIR EXTERNAL_TOOLCHAIN CCACHE CCACHE_DISABLE LICENSE_PATH SDKPKGSUFFIX \
-    WARN_QA ERROR_QA WORKDIR STAMPCLEAN"
+    WARN_QA ERROR_QA WORKDIR STAMPCLEAN PKGDATA_DIR"
 BB_HASHCONFIG_WHITELIST ?= "${BB_HASHBASE_WHITELIST} DATE TIME SSH_AGENT_PID \
     SSH_AUTH_SOCK PSEUDO_BUILD BB_ENV_EXTRAWHITE DISABLE_SANITY_CHECKS \
     PARALLEL_MAKE BB_NUMBER_THREADS BB_ORIGENV BB_INVALIDCONF BBINCLUDED"
-- 
1.9.1


