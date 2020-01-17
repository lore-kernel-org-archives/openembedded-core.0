Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 1A2EB7FBE2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 17:04:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47znV15vqsz3w
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 18:04:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1579280666;
	bh=mHZK3ldVkmW5X8rgEgvdJOviTNDLEpS0VkdgG2Ycu9Y=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=WHgwcBBcYdjjXyTRyAzKxyA6Y/NDjmyAMq1/nNP+gtNiiHxKvo+ABU34em+xta96+
	eJwvxIbxP9eFPxUaciTCGwE5ifU507LlVfrhINbp38ZsgAlufFoXqkj5XW9kxOjWa3
	zmBN4oTs5Xdnt+7dp2VTYJNwRE8Vc5lCIUl16EJwRxTeEYoCxTFeWpYiNuzUnTzsBN
	0hCBcz1xcUcTwQthG3l6063Q5F7snpq5wbVjDylUdF2CFyvUcqFfwIiVQMzBuymAW+
	DXWw3HAS75VFsDvD3Fwbb2El27LIx3Z1ydWexKNY2o18SfDqYiRVCJR1GZDdDwTX6e
	kO11eAIQqKetTzc91Kc3HKWKKPgQGmCfPRWPs/vDKuBy1zd/2aL77l3zAAg94CXyrg
	0xy3+yxf1FdfarbdVZd6Jvz+2SUsCf/DfN0SAsFaqcxVYMGykgC1Hp6YMiAW0yTtsC
	UMnxlRRyKUQXlNfWwccqkLU1QHXYJKwdM904ZTll0t2yoXKlGRjXSLT9xQxA/R3k+N
	nGlvQz7rFGUQ5IgG7JAdWOVmiW7SnNoCgUgOeKLEcjNG3r6BXvxtUCHX+pspDCYblr
	Gpn/9pJ8dFMOz/KepLyPfRzle4xX6qI7rvWScmjqhZ8q+o1QL9jAUmtcSJT+Nd4ck3
	PFX1Uy/RuyTEFkEjCWJS1ocg=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jan 2020 19:04:23 +0200
Message-Id: <20200117170423.2990-4-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200117170423.2990-1-bunk@stusta.de>
References: <20200117170423.2990-1-bunk@stusta.de>
Subject: [warrior][PATCH] python3: RDEPEND on libgcc
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
X-List-Received-Date: Fri, 17 Jan 2020 17:04:25 -0000

From: Joshua Watt <jpewhacker@gmail.com>

Python uses features of glibc that require it to dynamically load (i.e.
dlopen()) libgcc_s at runtime. However, since this isn't a link time
dependency, it doesn't get picked up automatically by bitbake so
manually add it to RDEPENDS.

There is an outstanding bug in Python to make it explicitly link against
libgcc at link time which would remove the need for this. See:
https://bugs.python.org/issue37395

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
[ merged the fix to make it glibc only ]
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-devtools/python/python3_3.7.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3_3.7.6.bb b/meta/recipes-devtools/python/python3_3.7.6.bb
index 7a569f9ca7..3efd3bcac8 100644
--- a/meta/recipes-devtools/python/python3_3.7.6.bb
+++ b/meta/recipes-devtools/python/python3_3.7.6.bb
@@ -308,6 +308,8 @@ FILES_${PN}-misc = "${libdir}/python${PYTHON_MAJMIN} ${libdir}/python${PYTHON_MA
 PACKAGES += "${PN}-man"
 FILES_${PN}-man = "${datadir}/man"
 
+# See https://bugs.python.org/issue18748 and https://bugs.python.org/issue37395
+RDEPENDS_libpython3_append_libc-glibc = " libgcc"
 RDEPENDS_${PN}-ptest = "${PN}-modules ${PN}-tests unzip bzip2 libgcc tzdata-europe coreutils sed"
 RDEPENDS_${PN}-ptest_append_libc-glibc = " locale-base-tr-tr.iso-8859-9"
 RDEPENDS_${PN}-tkinter += "${@bb.utils.contains('PACKAGECONFIG', 'tk', 'tk tk-lib', '', d)}"
-- 
2.17.1


