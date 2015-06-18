Return-Path: <dbaryshkov@gmail.com>
Received: from mail-la0-f41.google.com (mail-la0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id A473B759E9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jun 2015 13:13:29 +0000 (UTC)
Received: by laka10 with SMTP id a10so54139592lak.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jun 2015 06:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=irn6ORqMcMwDcI8a7/GQvBKErSNr6p/6McAf4h8OKMs=;
	b=URyCnv6WcOU2OsX2aGJwljPIA0WiXUdZVsz6PDWFDmzWV/nZemkGU9aQk968v5IHmJ
	U85/1riiFOMLkS0tlw7HFDo/SWMp7DifnQmqOQCN2LPmW8MbmuNHBhpDWILtYK0ca3O5
	B8I46eaYr983dpUbGerKsoIN434TIKbDWlwNMWYJBsyWcd0RHPG16hmVXdpS92nSkmRi
	00/Ff4bGTeHWn+VUNF56W7tnUAiC6mDs6VenqEgVL1lo3ty2/2ngFRvGMw1AjP8+sXlR
	gesB32OStpyRkMqH48oONQLybE6xxgq5ZRq+1XHde9HtJjeZGleUKDKPpeQDFHv8m28Q
	vK5A==
X-Received: by 10.112.171.101 with SMTP id at5mr13112127lbc.66.1434633210236; 
	Thu, 18 Jun 2015 06:13:30 -0700 (PDT)
Received: from anuminas.rup.mentorg.com
	(ppp89-110-12-206.pppoe.avangarddsl.ru. [89.110.12.206])
	by mx.google.com with ESMTPSA id ja1sm1770636lbc.38.2015.06.18.06.13.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 18 Jun 2015 06:13:29 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Jun 2015 16:13:08 +0300
Message-Id: <1434633188-3434-3-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1434633188-3434-1-git-send-email-dbaryshkov@gmail.com>
References: <1434633188-3434-1-git-send-email-dbaryshkov@gmail.com>
Subject: [PATCH 3/3] cross.bbclass: override MULTIMACH_TARGET_SYS
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
X-List-Received-Date: Thu, 18 Jun 2015 13:13:30 -0000

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
2.1.4


