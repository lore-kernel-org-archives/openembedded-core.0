Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 730677557D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jun 2018 07:28:32 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id az12-v6so7773228plb.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jun 2018 00:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=xxoJ43N+1e60WKZ21gLpUDFO3f2qqO2EGPCiq3cbh+c=;
	b=MiV7AIPbNaNk/gQ5/WeOE31AZKda2lNp3lxmC0Qt9SQl/2GZ5/l8sjvEezbqg3e1Cp
	2SlcmDhgyT0d0AtoHtk1OwexSpNn/9s59nv/kK5DxtAIBblu83DRMIN7QwsS1kRQ/tcG
	5foVPEOuD0Y4iqcFQRlhGCYB+bCb3GqfRsAlaobFHdi6Gv5oote43g/lIz/eWZmKZV3N
	mMBrool8E3l0m+QKdczgDLD+zuWAgC01kLzMVfXHIgCQVgVOgz2C40lSRyoZ0NenZkZp
	IsCzADRS7xxWtH++NRWJuNYBs6dsnVzfOAeO4rwVYsOtrZhXqiAEy8ZwCR6vZ5J3Ltzq
	wF3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=xxoJ43N+1e60WKZ21gLpUDFO3f2qqO2EGPCiq3cbh+c=;
	b=TpYlEvAuTEupPCLW48FxPol6C0VaEZm2w0QrUtEC0A30JpUsLfwo/GOxFw58jpvNsf
	5jx8PU4zqOeQ6rXIZC99Fl+qtjhV6o1FmTb9ILSpPUAtCPVN35Akj963GOzIac1BHufV
	nuq+TD66zDjaknvEygRbUCyqrvlluJMdakj4DSzywnf4JgvHiUZqz5jcm1UU/7SCzUsm
	PYRCy9kmvJJETob3x+xLSUo0xpiDkxgXY4+BpESH2ggV4vRqP1lrULtq2hrEomktAsNR
	LcceTDNR7ZuG2j6NK6FjLFWLM54HqjyTjw6EpmQrZMdbBo+NCMQspbvOJVGBbNIDNH/M
	pQMA==
X-Gm-Message-State: APt69E3kMkdiznjb/UwCICL1hZNDXrXp11UJzMdGJk44KeYQQKPUqk37
	zKClGBqVjscpyfTZobhjEMTTyw==
X-Google-Smtp-Source: ADUXVKIP2bFEImZ2gaF8PuF0GCVHNFAxrU3ZE7P66dW+G2diG3ytCyn87YdhauGjKLlOSxphBsPQAA==
X-Received: by 2002:a17:902:8f8b:: with SMTP id
	z11-v6mr5341622plo.203.1528442913298; 
	Fri, 08 Jun 2018 00:28:33 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	v15-v6sm33935578pfk.12.2018.06.08.00.28.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Jun 2018 00:28:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jun 2018 00:28:25 -0700
Message-Id: <747f38fd2c9e7c94d8b5c8e4427413ed44826a45.1528442551.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1528442551.git.raj.khem@gmail.com>
References: <cover.1528442551.git.raj.khem@gmail.com>
Subject: [PATCH 5/7] gcc-runtime_8.1.bb: disable ifuncs in libatomic for arm arch
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
X-List-Received-Date: Fri, 08 Jun 2018 07:28:32 -0000

This will solve the mcpu/march conflicts we get when -mcpu=cortex-a7
is passed on cmdline since it will become incompatible with default
ifuncs in libatomic which is using armv7-a

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-runtime_8.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime_8.1.bb b/meta/recipes-devtools/gcc/gcc-runtime_8.1.bb
index 8f31e7792e..fe787174e8 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime_8.1.bb
+++ b/meta/recipes-devtools/gcc/gcc-runtime_8.1.bb
@@ -1,6 +1,9 @@
 require recipes-devtools/gcc/gcc-${PV}.inc
 require gcc-runtime.inc
 
+# Disable ifuncs for libatomic on arm conflicts -march/-mcpu
+EXTRA_OECONF_append_arm = " libat_cv_have_ifunc=no "
+
 FILES_libgomp-dev += "\
     ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/openacc.h \
 "
-- 
2.17.1


