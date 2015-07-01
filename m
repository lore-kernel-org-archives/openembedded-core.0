Return-Path: <dbaryshkov@gmail.com>
Received: from mail-lb0-f182.google.com (mail-lb0-f182.google.com
	[209.85.217.182])
	by mail.openembedded.org (Postfix) with ESMTP id 19F1165CBF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jul 2015 14:02:44 +0000 (UTC)
Received: by lbnk3 with SMTP id k3so13536495lbn.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Jul 2015 07:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=vmjPVswUvOlkPnO0c9Duzxzi91mbJYaI4oQLniOENvc=;
	b=Xx6XyI+Nuykj5GfbWpXuWb6788CzoiZMWwTr48X1278WvgjHr2nUgEPl9udEq95noc
	yLjyBKZplVVXh25EhDFNKlJwm2sCsWP7ZHRwyWndJ3ZZaYCUGUe6dNswV5MJJQkOFPLR
	VbndnRs0AoMZBDExuSJBfQBRRhBm6wwPdP2MZbyfTynQWrilkBcvmv+XoenT3bkyAZxJ
	s//rMOh3FNMVGgAeCCqEYz0N461rUgxDfBI12D8MUMpqtboVKbPJq81znfvrga+k94Zo
	Llu+OvMAR4mT7PAaoJIg8icqnKyWYQ45AaEr81Xgr2DoZ7igHiUaULQsXs+4xZbPg7S+
	Vt2w==
X-Received: by 10.112.10.166 with SMTP id j6mr23145713lbb.120.1435759363699;
	Wed, 01 Jul 2015 07:02:43 -0700 (PDT)
Received: from anuminas.office.auriga.msk ([37.153.55.32])
	by mx.google.com with ESMTPSA id du2sm533722lbc.44.2015.07.01.07.02.42
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 01 Jul 2015 07:02:42 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Jul 2015 17:02:21 +0300
Message-Id: <1435759342-5312-4-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1435759342-5312-1-git-send-email-dbaryshkov@gmail.com>
References: <1435759342-5312-1-git-send-email-dbaryshkov@gmail.com>
Subject: [PATCH 3/4] cross.bbclass: override MULTIMACH_TARGET_SYS
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
X-List-Received-Date: Wed, 01 Jul 2015 14:02:44 -0000

Cross packages are built for BUILD_VENDOR/BUILD_OS, rather than
TARGET_VENDOR/TARGET_OS. E.g. there is no point in hardcoding the
target's LIBCEXTENSION and ABIEXTENSION into the STAMPDIR/WORKDIR
variables (set using MULTIMACH_TARGET_SYS).

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 meta/classes/cross.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/cross.bbclass b/meta/classes/cross.bbclass
index 28fd211..5ee32b2 100644
--- a/meta/classes/cross.bbclass
+++ b/meta/classes/cross.bbclass
@@ -21,6 +21,8 @@ STAGING_DIR_HOST = "${STAGING_DIR}/${HOST_ARCH}${HOST_VENDOR}-${HOST_OS}"
 
 PACKAGE_ARCH = "${BUILD_ARCH}"
 
+MULTIMACH_TARGET_SYS = "${PACKAGE_ARCH}${BUILD_VENDOR}-${BUILD_OS}"
+
 export PKG_CONFIG_DIR = "${exec_prefix}/lib/pkgconfig"
 export PKG_CONFIG_SYSROOT_DIR = ""
 
-- 
1.9.1


