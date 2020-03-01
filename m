Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 6B0C46026D
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Mar 2020 20:26:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48VvtS33znz4x
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Mar 2020 21:26:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1583094368;
	bh=PEu6KMwu2WJT0i0BazTZKE7vAtiE2fTGfgpPXH/fNAQ=;
	h=From:To:Subject:Date:From;
	b=sxHjVhS+55bNR3cc9pE7PEjuDtXrrx/5afkkD3E6Dngb9kRKYQJo+hTO+IwwBdeVS
	1XrVbPsQC/ti6xZvno6oqaHPS09sL6CA+pLqhQXKIOUmdf42THViE15FHnqWMSxmMc
	ufPJ/QSSOeruTz/TkDPiFmzceVPOAjac26xhgK+u/AzWSSu6TnyBPq+m8myIAmBmcJ
	yTqrj4oC+AakQDdttM3ECq8Tm/aJEUyMzbhIHHcd+B6dWpljzZB5eQ/3hABHkgKvum
	GJ8MAvGHJ7PQIWFy+OzRwH1nPjIXrtumINBoPhXlXEubti0QOsQvvoj1yPTfcIU3xI
	vRRJIp4GQGfF8f0OO0jXFa6zMq8pWVDGiT8S2Vps2IVZL3L0LbRVdC6WeRShBCsQoS
	LQDCZaDdy4GvnWAuA0Nt1R2N8Z8ju4pOGcoVhqqgthS5iNka2eZlxdI4WwUAHqb+KW
	X/xtlyCx+RhKi3rHX//T3IACb3Mio3IC8jsP5i9iKsdVkpvrMOAAwST9Y3Wjm2X4fT
	qs3l+XRsbOdALphOfBV5yadM5hwIcrS03KGUUfA0qAaUpuBza7gvNR/Spd11lB/+h4
	TV2q1aj8/uOseXk76gxDnEgbmvxje9JnE/mB984+XOKTV+ZabmBhLxCxVrTBQUfcGV
	hcQcw99dlcPqrwRJVZGwLki0=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Sun,  1 Mar 2020 22:26:06 +0200
Message-Id: <20200301202606.27648-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] make: Use gziped sources
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
X-List-Received-Date: Sun, 01 Mar 2020 20:26:11 -0000

Building lzip-native just for being able to build make is not
worth saving 1 MB download, especially since this creates a
bottleneck for the whole build.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-devtools/make/make.inc    | 2 +-
 meta/recipes-devtools/make/make_4.3.bb | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/make/make.inc b/meta/recipes-devtools/make/make.inc
index 4142cf23d3..a0a72b6295 100644
--- a/meta/recipes-devtools/make/make.inc
+++ b/meta/recipes-devtools/make/make.inc
@@ -5,7 +5,7 @@ called the makefile, which lists each of the non-source files and how to compute
 HOMEPAGE = "http://www.gnu.org/software/make/"
 SECTION = "devel"
 
-SRC_URI = "${GNU_MIRROR}/make/make-${PV}.tar.lz \
+SRC_URI = "${GNU_MIRROR}/make/make-${PV}.tar.gz \
            "
 
 inherit autotools gettext pkgconfig texinfo
diff --git a/meta/recipes-devtools/make/make_4.3.bb b/meta/recipes-devtools/make/make_4.3.bb
index 70caf0ae16..cd0ecd4df2 100644
--- a/meta/recipes-devtools/make/make_4.3.bb
+++ b/meta/recipes-devtools/make/make_4.3.bb
@@ -12,7 +12,6 @@ SRC_URI += "\
 
 EXTRA_OECONF += "--without-guile"
 
-SRC_URI[md5sum] = "d5c40e7bd1e97a7404f5d3be982f479a"
-SRC_URI[sha256sum] = "de1a441c4edf952521db30bfca80baae86a0ff1acd0a00402999344f04c45e82"
+SRC_URI[sha256sum] = "e05fdde47c5f7ca45cb697e973894ff4f5d79e13b750ed57d7b66d8defc78e19"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


