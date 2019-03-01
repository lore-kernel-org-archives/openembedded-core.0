Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
	[209.85.214.169])
	by mail.openembedded.org (Postfix) with ESMTP id 5D66D7CD22
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Mar 2019 03:21:21 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id b65so7730567plb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 19:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=yyaKd5ciArmS2wzuk8+FRSthTFeumlrOd2/sSgWxBSs=;
	b=eEBS7PeKXRFsDDSZKxFvIWhlu9Kc/2Oe5ZScDh8CwLvU9gfRwLpzPALrYuadnwiETg
	V0nsFB79qeuhocDkipgi5IoQ4OUuoV1pjnqdmGEwnbcxfBPsrhMJtVFhOGzsAN0DfB8P
	BF1Va+AC4d1BMKV88ax5Jfp8v6Oeiij9201Oyhz91TFHZFzc1n9o/WJ7Alm6qR1o5eWW
	VzOD4aR3oUeEjOtC6UsSXbiFZzPEwwW6uONJS0+SwwoWdQiYZTX1AlVb3RhoaElP55SA
	Muw2soB2lhk399+IHSpJE4o/gYLK7AEUjsv/qSuqWwsVWoNLlwMHQ1W/DA7YSrJN8LvF
	rV5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=yyaKd5ciArmS2wzuk8+FRSthTFeumlrOd2/sSgWxBSs=;
	b=WSqvWUWE60jRbZUYKu8/ERivWe8v2HHOBRO+PlqhmDD8Xdk0+nqb49CLB47+qkeu85
	Ev2ucbFsOuQJMA2+VyC91mafwo3AuBjgddGdWZCnpqeu70e2U9MQA+OJT9NuCcnZCis8
	UF7IJF/Tpjii9jeaysi+Ib+0oNiAmQVNbR+8GDidHqkRrqymPE2XxqcVZNw3/e7XGBfX
	vAZJc2GrYimXVXXnFF0bPblaxzkizvHxFdfvc5oKrQbTBgCeZVLFQYOrbAWKhqFYspcG
	C6CagucrjaJV/Hd0ePGOAOvzmb4AO1GxoDQ+Qeamg6fC0Wu5bLe+3wxOiGCuP2HPQIPx
	+KiA==
X-Gm-Message-State: APjAAAURsfOsE12inYVa7l9V/JkslKHYRROFJWFMjANeDhZbHszzuoAf
	05ZnGV4errLD6ZieojEveGpJvKGG
X-Google-Smtp-Source: APXvYqw3fdEuHCOk1RN4v0SmgmGNNVkfCGErkPyCANbFqa9SdbKWW8ub5J12rYEV2UyKAxugmsJLjA==
X-Received: by 2002:a17:902:a612:: with SMTP id
	u18mr3032171plq.145.1551410481881; 
	Thu, 28 Feb 2019 19:21:21 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::5fa3])
	by smtp.gmail.com with ESMTPSA id
	z127sm37612096pfb.80.2019.02.28.19.21.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Feb 2019 19:21:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Feb 2019 19:21:08 -0800
Message-Id: <20190301032112.38191-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH V3 1/5] bitbake.conf: Use -Og in DEBUG_OPTIMIZATION
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
X-List-Received-Date: Fri, 01 Mar 2019 03:21:21 -0000
Content-Transfer-Encoding: 8bit

-Og is for optimized debugging experience.
this makes this consistent across different compilers especially gcc and
clang, -O in clang is equal to -O2 where as in gcc its similar to -O1
so it was not giving consistent debugging experience across compilers

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Change documentation to reflect the change and also build host flags
v3: Rebase

 meta/conf/bitbake.conf       | 4 ++--
 meta/conf/documentation.conf | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 1c5369ec98..85aab98462 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -610,10 +610,10 @@ DEBUG_FLAGS ?= "-g -feliminate-unused-debug-types ${DEBUG_PREFIX_MAP}"
 
 # Disabled until the option works properly -feliminate-dwarf2-dups
 FULL_OPTIMIZATION = "-O2 -pipe ${DEBUG_FLAGS}"
-DEBUG_OPTIMIZATION = "-O -fno-omit-frame-pointer ${DEBUG_FLAGS} -pipe"
+DEBUG_OPTIMIZATION = "-Og -fno-omit-frame-pointer ${DEBUG_FLAGS} -pipe"
 SELECTED_OPTIMIZATION = "${@d.getVar(oe.utils.vartrue('DEBUG_BUILD', 'DEBUG_OPTIMIZATION', 'FULL_OPTIMIZATION', d))}"
 SELECTED_OPTIMIZATION[vardeps] += "FULL_OPTIMIZATION DEBUG_OPTIMIZATION DEBUG_BUILD"
-BUILD_OPTIMIZATION = "${@oe.utils.vartrue('DEBUG_BUILD', '-O -g -feliminate-unused-debug-types -fno-omit-frame-pointer', '-O2', d)} -pipe"
+BUILD_OPTIMIZATION = "${@oe.utils.vartrue('DEBUG_BUILD', '-Og -g -feliminate-unused-debug-types -fno-omit-frame-pointer', '-O2', d)} -pipe"
 BUILD_OPTIMIZATION[vardeps] += "DEBUG_BUILD"
 
 ##################################################################
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 4d2a707563..c2c96ecf1e 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -125,7 +125,7 @@ D[doc] = "The destination directory."
 DATE[doc] = "The date the build was started using YMD format."
 DATETIME[doc] = "The date and time the build was started."
 DEBUG_BUILD[doc] = "Specifies to build packages with debugging information. This influences the value of the SELECTED_OPTIMIZATION variable."
-DEBUG_OPTIMIZATION[doc] = "The options to pass in TARGET_CFLAGS and CFLAGS when compiling a system for debugging. This variable defaults to '-O -fno-omit-frame-pointer ${DEBUG_FLAGS} -pipe'."
+DEBUG_OPTIMIZATION[doc] = "The options to pass in TARGET_CFLAGS and CFLAGS when compiling a system for debugging. This variable defaults to '-Og -fno-omit-frame-pointer ${DEBUG_FLAGS} -pipe'."
 DEFAULT_PREFERENCE[doc] = "Specifies a weak bias for recipe selection priority."
 DEPENDS[doc] = "Lists a recipe's build-time dependencies (i.e. other recipe files)."
 DEPLOY_DIR[doc] = "Points to the general area that the OpenEmbedded build system uses to place images, packages, SDKs and other output files that are ready to be used outside of the build system."
-- 
2.21.0


