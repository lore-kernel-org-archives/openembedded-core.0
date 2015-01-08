Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 0D8B372498
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jan 2015 17:11:16 +0000 (UTC)
Received: by mail-wi0-f181.google.com with SMTP id r20so4684601wiv.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Jan 2015 09:11:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=NJk5+tAw4+kMvvVxOwxZXh2ZeW1brOA9opdzQg8lruc=;
	b=vgry3nN3bYWRNctnxK81KMgIprzKBfEPLTKaLgUyo6y6RLYRTQKRb/S7Ozlr6yZqv8
	mOCBDr0ex3kNkkLYiJuNqEOv17YbuctcHP7NUCL300xbinvpaSPsIZqkw1nQQLGC6yu/
	/uYYymeeOPsfapDL2HZbjOl3Z45T/oTZvgxDeukyGLGWUxguHKcYmW11MZ5MhIE5sqwP
	fplJrUj6wjJCSTfmTGogppiDXKCHt8q0oE9m0/XMLnuSPUFojuHDGhZElcUfLeR6l4Vn
	QK8IqWSSO5Q+PIFDwHnDfvIv8gRFUF3icDN1JJV5FrBARhWw705y4FocWwLNIfou3FiO
	/MFg==
X-Received: by 10.180.97.196 with SMTP id ec4mr21343405wib.71.1420737077333;
	Thu, 08 Jan 2015 09:11:17 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	l9sm22577103wic.21.2015.01.08.09.11.15
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Jan 2015 09:11:16 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Jan 2015 18:11:18 +0100
Message-Id: <1420737078-24121-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.2.1
Subject: [PATCH] package.bbclass: Fix support for private libs
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
X-List-Received-Date: Thu, 08 Jan 2015 17:11:25 -0000

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
index fc501fc..31c9e08 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1574,7 +1574,7 @@ python package_do_shlibs() {
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


