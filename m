Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id D490F7014A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 13:47:05 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id u63so24609322wmu.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 05:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=TkYBslMUmQ8SvKcMmACy/pwoI5hmMAk7VW19RENvZxU=;
	b=y0wMsd0SMVRvW/nxuLMUbE3kDW6VZkbmla6ZwVSIGrrEc3pjMCR0vfW66468mfOeU2
	7IqQab36HD3tPStmgwjYSLlD2XGk3CS/lXCvTzpp+9N19TCX2/noUrq2jblSvXllaXVx
	UvhEAVCzQxTmHx3knTRc6QvEVXTlkh6b02g3pH3gU530GIPd2P3wJCAmkHi+/wiHBNHz
	fZVqyCu5s/AoUwW8VvIecMjy/0k3MuAdq32C2VLxioeT2Rn3T3NQkeTi+c7eANYmdl5H
	Uw54JDWMrkUGf22ZpZNXjUspcRPre1y4rqHGG4m9NYmiT6g9GEFzv+YcMD7tGVU1ycCT
	rIHw==
X-Received: by 10.28.23.136 with SMTP id 130mr44615203wmx.94.1449755226511;
	Thu, 10 Dec 2015 05:47:06 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	e83sm13005082wmc.23.2015.12.10.05.47.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Dec 2015 05:47:05 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 10 Dec 2015 14:48:32 +0100
Message-Id: <1449755316-17611-11-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <cover.1449754341.git.Martin.Jansa@gmail.com>
References: <cover.1449754341.git.Martin.Jansa@gmail.com>
Subject: [PATCH 11/11] texinfo: don't create dependency on INHERIT variable
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
X-List-Received-Date: Thu, 10 Dec 2015 13:47:06 -0000

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
 meta/recipes-extended/texinfo/texinfo_6.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/texinfo/texinfo_6.0.bb b/meta/recipes-extended/texinfo/texinfo_6.0.bb
index 8fb715a..a8702cf 100644
--- a/meta/recipes-extended/texinfo/texinfo_6.0.bb
+++ b/meta/recipes-extended/texinfo/texinfo_6.0.bb
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


