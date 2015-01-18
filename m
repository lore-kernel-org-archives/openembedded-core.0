Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f179.google.com (mail-we0-f179.google.com
	[74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id 2FC3560017
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Jan 2015 16:12:08 +0000 (UTC)
Received: by mail-we0-f179.google.com with SMTP id q59so4042682wes.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Jan 2015 08:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=2Yk/cfGXKeispj8wwtcZlTMVi63unZ8xkbVBQB9pYPA=;
	b=jApSZHlUOacVVM76+GcGm9TKpXcU8Youk0bNu+omHWgUUwIehEnsXDmokmYB1w/miz
	9OaHASzCEq8rMG3BhqLxVnIWCN2JZjj5FnXklyM0/c5sXcoZBH/gohAJ6tM5KzeYDuNm
	/c15AzNtuM76hL585PDxcNYVsh8Q0DjSkZUHRMDe3vwWFVkuEF0BJmcgA0SS8gNMCMub
	cH4AXLpjuslD8Icra4rzw8op7U1qpmjYKAYB4nyenRa4+49yHWfcKKOobiodVEsQKzAq
	VexgEPBSkWvDQQ+4Jl0aFqpyT8yUO51h0RhmrAeNvnVOJkkK9vPgSMp8CkTTnHiwnNpd
	UT7A==
X-Received: by 10.180.13.7 with SMTP id d7mr26561647wic.57.1421597529124;
	Sun, 18 Jan 2015 08:12:09 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ej10sm10842760wib.2.2015.01.18.08.12.07
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 18 Jan 2015 08:12:07 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 18 Jan 2015 17:12:13 +0100
Message-Id: <1421597533-7850-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.2.1
Subject: [dizzy][PATCH] package.bbclass: Fix support for private libs
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
X-List-Received-Date: Sun, 18 Jan 2015 16:12:12 -0000

* n is a tuple since this commit:
  commit d3aa7668a9f001044d0a0f1ba2de425a36056102
  Author: Richard Purdie <richard.purdie@linuxfoundation.org>
  Date:   Mon Jul 7 18:41:23 2014 +0100
  Subject package.bbclass: Improve shlibs needed data structure

  since then 'n in private_libs' was always false and private libs
  were always processed
* this is bad when we have libfoo in private libs, but also some package
  providing libfoo, that way we ship own libfoo.so, but together with
  runtime dependency on package providing libfoo

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/package.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 96d7fd9..4685cd2 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1572,7 +1572,7 @@ python package_do_shlibs() {
             # /opt/abc/lib/libfoo.so.1 and contains /usr/bin/abc depending on system library libfoo.so.1
             # but skipping it is still better alternative than providing own
             # version and then adding runtime dependency for the same system library
-            if private_libs and n in private_libs:
+            if private_libs and n[0] in private_libs:
                 bb.debug(2, '%s: Dependency %s covered by PRIVATE_LIBS' % (pkg, n[0]))
                 continue
             if n[0] in shlib_provider.keys():
-- 
2.2.1


