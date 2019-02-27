Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
	[209.85.210.173])
	by mail.openembedded.org (Postfix) with ESMTP id 19D016C197
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2019 20:50:51 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id q17so8562107pfh.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2019 12:50:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=a6Ht2doan4wEB6xJCRQlZ0gT2BMTOs1Y4IndVGzKrlk=;
	b=TdzG+HtrM18u6Ghx/zy0aShVov2E2MKQzg/YP9ALUPRaQHxCo9Mg6GcRO6P/5IK0eJ
	7AEfdXPWAk5569IvbrIAtPS17UZFNFiL+IeCxIDAErnqjiie8jM26rvKzpGGo8XLS2Nt
	FvGQUhrqpLRcBrtXBmADQkYR/TjP+5NXL0CG4Fcem8EcpJHMC+kNH9gFeyhiwO11Yj5f
	Qax4W3V8xofascHqhzgb1ND7RvxwDBJez32tRDJYO8PlShjU+hNxlQKh0nWq92gNo0PR
	BziYfwJvJ8O6SJxPDkd2iB0elEWQC+IJ1rML2vos6kJ8npwVQyHicx7Y8V4GS3K97r2q
	+TiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=a6Ht2doan4wEB6xJCRQlZ0gT2BMTOs1Y4IndVGzKrlk=;
	b=V1bpwV7IVK76PMWdOlTMHH7egX9v45FvtQm7RRGyU30GcrciJlsa9B/KTpuwhevN3d
	vPsrqLNltScLNRQcAxMaTjVmDWQYQKyFJ0djAZNaMsKeiNHz3YGieRLdl92YPE2CDHbc
	PZVHZev276uZXCww03SkWx0kkscUVMr+gTWWzjGqFa63NxzuMmUGZPibxsZ9QIYqk4db
	gJPYWHz9dDwZYgLs/UUKylyUpkI9aU0q0EorenQIC1xCkAq9/P1R3W5RcKAAo/o5j+h3
	7TUbvPGxspgRn4TK9E3UKBFSsj3A54nGLETBjkmSdioAYJ6LzjERfdEH+J/WLmzmPC7F
	p+lA==
X-Gm-Message-State: AHQUAubYShG8ltSc71+fMKFhUJhseCgzf8IUyQbwssf40miXbG8Be0NC
	SMeRR6yDT3Z7Fm2Z8BghABElaTOE
X-Google-Smtp-Source: AHgI3IYjzBolQyv+bI8/gdc4yOgG3yFEQGX4SO4Umt56MHFGJ0rZ19LJOWMhKxU+YAjjqr7hNw1C1A==
X-Received: by 2002:a63:b0b:: with SMTP id 11mr4878656pgl.187.1551300652590;
	Wed, 27 Feb 2019 12:50:52 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::5fa3])
	by smtp.gmail.com with ESMTPSA id
	l12sm27913766pgn.83.2019.02.27.12.50.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Feb 2019 12:50:51 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Feb 2019 12:50:41 -0800
Message-Id: <20190227205042.44813-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH V2 1/2] bitbake.conf: Use -Og in DEBUG_OPTIMIZATION
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
X-List-Received-Date: Wed, 27 Feb 2019 20:50:52 -0000
Content-Transfer-Encoding: 8bit

-Og is for optimized debugging experience.
this makes this consistent across different compilers especially gcc and
clang, -O in clang is equal to -O2 where as in gcc its similar to -O1
so it was not giving consistent debugging experience across compilers

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Change documentation to reflect the change and also build host flags

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


