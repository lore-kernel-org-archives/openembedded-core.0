Return-Path: <martinstolpe@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 4548665C9D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jun 2015 14:26:54 +0000 (UTC)
Received: by wiwd19 with SMTP id d19so50330649wiw.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jun 2015 07:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=aakoZrM8e16ngBvXq8LKRJCwpdBDElSbQIc7gtxg38M=;
	b=f9YR1kzIT3TIdfL+QqCdk3oRSM3+PgZUHM2zQy9TpX51/dTyPkbF/Txhjer8Vqx2zy
	p5Tr6pOpFSZqHtwr3XG9wZz2/FB+JCSVoB2Lo+TUYe6X8HLKmSqJp/eXJa+OPm+NiV3W
	4arL5mg27EUsy38uYAIQHEysrJlyiQp80aXR129qSU48LQKLLJSUZIqohWUJMxI3EyZs
	Jt6tjEUH9kFo9qzDOTm3xG4q+ZGFsjV4JUMDg9CicjHm0NStUla/AUHPw7aWyKrdD12f
	O4cGLfbXv5k2R9Z01s+d1Jv47qI9bVaWSL2uttL1fn/bvoL2QldkTnwYk+5mQ1BnAliP
	3N4g==
X-Received: by 10.194.62.228 with SMTP id b4mr6735881wjs.2.1433946415529;
	Wed, 10 Jun 2015 07:26:55 -0700 (PDT)
Received: from archlinux-vm.localdomain
	(dslb-188-099-229-087.188.099.pools.vodafone-ip.de. [188.99.229.87])
	by mx.google.com with ESMTPSA id
	jc17sm8204601wic.13.2015.06.10.07.26.54
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Jun 2015 07:26:54 -0700 (PDT)
From: Martin Stolpe <martinstolpe@gmail.com>
X-Google-Original-From: Martin Stolpe <martin.stolpe@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Jun 2015 16:26:06 +0200
Message-Id: <1433946366-54477-1-git-send-email-martin.stolpe@gmail.com>
X-Mailer: git-send-email 2.4.2
Cc: Martin Stolpe <martin.stolpe@gmail.com>
Subject: [PATCH] [fido] binutils: fix native builds when host has gcc5
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
X-List-Received-Date: Wed, 10 Jun 2015 14:26:56 -0000

Problem is that when building binutils using GCC >=5.0
warnings will be treated as errors which will cause
the build to fail.

Signed-off-by: Martin Stolpe <martin.stolpe@gmail.com>
---
 meta/recipes-devtools/binutils/binutils_2.24.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils_2.24.bb b/meta/recipes-devtools/binutils/binutils_2.24.bb
index 738aaee..bc34a14 100644
--- a/meta/recipes-devtools/binutils/binutils_2.24.bb
+++ b/meta/recipes-devtools/binutils/binutils_2.24.bb
@@ -7,12 +7,15 @@ EXTRA_OECONF += "--with-sysroot=/ \
                 --enable-install-libbfd \
                 --enable-install-libiberty \
                 --enable-shared \
+                --disable-werror \
                 "
 
 EXTRA_OECONF_class-native = "--enable-targets=all \
                              --enable-64-bit-bfd \
                              --enable-install-libiberty \
-                             --enable-install-libbfd"
+                             --enable-install-libbfd \
+                             --disable-werror \
+                             "
 
 do_install_class-native () {
 	autotools_do_install
-- 
2.4.2


