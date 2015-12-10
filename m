Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 5BBED6FFFB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 13:46:44 +0000 (UTC)
Received: by wmec201 with SMTP id c201so25499743wme.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 05:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=7fXFxHA4hS0zledKNDq/5BroBpadEPvEJshgtMAG4PA=;
	b=w1Ekc+BkkP2AqjAk2VvpCdL64IxbUyACiAEZZd9o/SSCjNQYKkcqxExH4y/l4FTloz
	rDvzFrv4GuQqb2HAtCK+sw/zFyusBKap4kq6/ePMbwPJzh27euk6enaKI1Lt6qGaHS+Y
	yI1Q/I3JO6+nyJx5cXpbdnvLgGT4x3GqLo7glBUITkrikWtAFxggPOzLE2Km++fvdCy1
	NmgmApbFfua9tpU5j08QHLM3+QoKlaLz+Cdx/Sulm3fcJcWvFZM126YTlVe5Guls58Q7
	I8AmP2fbFGThOYg8/Q7ABIdlV68XDZPYZk6aaGkLZPQ9n212GIiRxg7mOjF2KvWr78oK
	ELLQ==
X-Received: by 10.194.246.132 with SMTP id xw4mr13182854wjc.75.1449755204973; 
	Thu, 10 Dec 2015 05:46:44 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id t64sm911142wmf.23.2015.12.10.05.46.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Dec 2015 05:46:44 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: Joshua Lock <joshua.lock@collabora.co.uk>,
	openembedded-core@lists.openembedded.org
Date: Thu, 10 Dec 2015 14:48:20 +0100
Message-Id: <7e6b70331d609496c4e21884682c2e93af0347a7.1449754339.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <cover.1449754339.git.Martin.Jansa@gmail.com>
References: <cover.1449754339.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1449754339.git.Martin.Jansa@gmail.com>
References: <cover.1449754339.git.Martin.Jansa@gmail.com>
Subject: [PATCH][fido][RESEND 4/5] texinfo: don't create dependency on INHERIT variable
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
X-List-Received-Date: Thu, 10 Dec 2015 13:46:44 -0000

* we don't want the do_package signature depending on INHERIT variable
* e.g. just adding the own-mirrors causes texinfo to rebuild:
  # bitbake-diffsigs BUILD/sstate-diff/*/*/texinfo/*do_package.sig*
  basehash changed from 015df2fd8e396cc1e15622dbac843301 to 9f1d06c4f238c70a99ccb6d8da348b6a
  Variable INHERIT value changed from
  ' rm_work blacklist blacklist report-error ${PACKAGE_CLASSES} ${USER_CLASSES} ${INHERIT_DISTRO} ${INHERIT_BLACKLIST} sanity'
  to
  ' rm_work own-mirrors blacklist blacklist report-error ${PACKAGE_CLASSES} ${USER_CLASSES} ${INHERIT_DISTRO} ${INHERIT_BLACKLIST} sanity'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-extended/texinfo/texinfo_5.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/texinfo/texinfo_5.2.bb b/meta/recipes-extended/texinfo/texinfo_5.2.bb
index 8dbcaa1..c9ac182 100644
--- a/meta/recipes-extended/texinfo/texinfo_5.2.bb
+++ b/meta/recipes-extended/texinfo/texinfo_5.2.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 PROVIDES_append_class-native = " texinfo-replacement-native"
 
 def compress_pkg(d):
-    if "compress_doc" in (d.getVar("INHERIT", True) or "").split():
+    if bb.data.inherits_class('compress_doc', d):
          compress = d.getVar("DOC_COMPRESS", True)
          if compress == "gz":
              return "gzip"
-- 
2.6.3


