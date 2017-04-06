Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3FEBA77AC7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Apr 2017 10:06:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v36A67cJ008548
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Apr 2017 03:06:07 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 6 Apr 2017 03:06:07 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 6 Apr 2017 03:05:56 -0700
Message-ID: <a0bd1f8fd81a076edbc5bb632e06fc272f761415.1491473008.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.11.0.rc2.dirty
In-Reply-To: <cover.1491473008.git.liezhi.yang@windriver.com>
References: <cover.1491473008.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 7/7] kmod: set ac_cv_path_DOLT_BASH to /usr/bin/env bash
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
X-List-Received-Date: Thu, 06 Apr 2017 10:06:06 -0000
Content-Type: text/plain

The shebang's length is usually 128 as defined in /usr/include/linux/binfmts.h:
  #define BINPRM_BUF_SIZE 128

So there would be errors when /path/to/hosttools/bash is longer than 128:

/bin/sh: ./doltcompile: [snip]: bad interpreter: No such file or directory

Set ac_cv_path_DOLT_BASH to "/usr/bin/env bash" to fix the problem.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-kernel/kmod/kmod.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/kmod/kmod.inc b/meta/recipes-kernel/kmod/kmod.inc
index cfa409dbb3..ba80fc57a3 100644
--- a/meta/recipes-kernel/kmod/kmod.inc
+++ b/meta/recipes-kernel/kmod/kmod.inc
@@ -30,6 +30,8 @@ S = "${WORKDIR}/git"
 EXTRA_AUTORECONF += "--install --symlink"
 EXTRA_OECONF +=" --enable-tools --with-zlib"
 
+CACHED_CONFIGUREVARS += "ac_cv_path_DOLT_BASH='/usr/bin/env bash'"
+
 PACKAGECONFIG[debug] = "--enable-debug,--disable-debug"
 PACKAGECONFIG[logging] = " --enable-logging,--disable-logging"
 PACKAGECONFIG[manpages] = "--enable-manpages, --disable-manpages, libxslt-native xmlto-native"
-- 
2.11.0.rc2.dirty


