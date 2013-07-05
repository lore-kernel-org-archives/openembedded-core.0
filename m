Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f175.google.com (mail-ea0-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id E688D6B033
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jul 2013 01:29:04 +0000 (UTC)
Received: by mail-ea0-f175.google.com with SMTP id z7so1131069eaf.20
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jul 2013 18:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=+0d/3nfWjU2AZchD6oG6CYQ2MkEKQm/+DrdteM7qpK8=;
	b=T5WkFbeeYT679PmKTabvbMX3NZFSRg7c+a1ZtdQGFyfmkcGpL1TEX+VrRKjxyus/I0
	Aljuv60me/DfJ9j4YYv7wUoXlUjL4FnLJgzZ5nXwfUR2R7l4l6MOIvPNOhPfuy6mU8mJ
	drIfvYg8qqPsme/71AGH0VlGgEaPYGlguV86eyxJ4IrnLwGU1mGO18Y6rFYi9OP88chh
	2Op/A+Su2ScdtQQTgGtzV6QJpwxyaC3hyt1nK3A5g1kSV5+YRBGc0aDvXlpDceelI2x7
	Ep1bl4GxIJSXgbE3gOIQHMVEIO8GyMoX/QoGMv2QkAzdFTZE9gkbWyF7rWQW3hYgVA7C
	qG6A==
X-Received: by 10.15.43.11 with SMTP id w11mr327114eev.27.1372987745550;
	Thu, 04 Jul 2013 18:29:05 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	c44sm9696326eeb.8.2013.07.04.18.29.04 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 04 Jul 2013 18:29:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Jul 2013 03:28:57 +0200
Message-Id: <85ab132fefed784f12be04f659c41e9aaf0dae6f.1372987648.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <ccac3e9b6e275858355dff498555a1bdbbfb1052.1372987648.git.Martin.Jansa@gmail.com>
References: <ccac3e9b6e275858355dff498555a1bdbbfb1052.1372987648.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1372987648.git.Martin.Jansa@gmail.com>
References: <cover.1372987648.git.Martin.Jansa@gmail.com>
Subject: [PATCH 5/8] quota: inherit pkgconfig
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
X-List-Received-Date: Fri, 05 Jul 2013 01:29:05 -0000

* missing dependency on pkgconfig-native was causing
  that PKG_CHECK_MODULES(DBUS, dbus-1) stayed unexpanded in
  configure script:
  checking for ext2fs_initialize in -lext2fs... yes
  quota/4.01-r1/quota-tools/configure: line 3746: syntax error near unexpected token `DBUS,'
  quota/4.01-r1/quota-tools/configure: line 3746: `        PKG_CHECK_MODULES(DBUS, dbus-1)'
  Configure failed. The contents of all config.log files follows to aid debugging

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-extended/quota/quota_4.01.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/quota/quota_4.01.bb b/meta/recipes-extended/quota/quota_4.01.bb
index 4dc7e68..9835f06 100644
--- a/meta/recipes-extended/quota/quota_4.01.bb
+++ b/meta/recipes-extended/quota/quota_4.01.bb
@@ -17,7 +17,7 @@ S = "${WORKDIR}/quota-tools"
 
 DEPENDS = "gettext-native e2fsprogs"
 
-inherit autotools gettext
+inherit autotools gettext pkgconfig
 
 EXTRA_OEMAKE += 'STRIP=""'
 
-- 
1.8.2.1


