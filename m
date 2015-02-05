Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id AA39172E24
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 16:04:58 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id eu11so10894225pac.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Feb 2015 08:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=fLJE9KAacdgLXYx7Vp/g0ziQHDfYjFDZz7ZKDqsp/qU=;
	b=XwQQcBcYQUcyj79uBUogwwd2LEKD/fc5mEwFbB0MDUH4bXdGbqOZARHaPIav381R+3
	6owWda+m4XtK8eC2oF/Rd+BedJkxxPyp41mawJ7Vuv/jsfvMfr7diw2GbUExyAJ7d01N
	mMgWSyN0l1YercTPXCXujvOJBMabY6Zegyj1OOgQQd4mbYQUAL73v1R63RYwYBM8ROrX
	Rip3PptpQyO98LcnugAOLi4RwVEkolj7ViKC/Z0LZqFMl3761IpeuVezXJsXpr/gAnR8
	k+HSHfzsirux2Xr9u4Yfq8V9NidQOeJsHdpRFtOhtx20mx1gURMG+rJEjnII2smqkTd+
	hhLQ==
X-Received: by 10.66.66.40 with SMTP id c8mr6619244pat.139.1423152299914;
	Thu, 05 Feb 2015 08:04:59 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id uq7sm5468848pbc.48.2015.02.05.08.04.57
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Feb 2015 08:04:58 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Feb 2015 08:03:31 -0800
Message-Id: <066ff0a9580ac773dcd03ebc1a8a3ca31e0d9545.1423150739.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
References: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
In-Reply-To: <cover.1423150737.git.akuster808@gmail.com>
References: <cover.1423150737.git.akuster808@gmail.com>
Subject: [PATCH 23/61] package.bbclass: Fix support for private libs
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
X-List-Received-Date: Thu, 05 Feb 2015 16:05:03 -0000

From: Martin Jansa <martin.jansa@gmail.com>

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

(From OE-Core rev: ec1d379683cedca4be1c252475d02c8041227142)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
1.9.1


