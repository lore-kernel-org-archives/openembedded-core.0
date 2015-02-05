Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f170.google.com (mail-pd0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 971D172E76
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 16:05:48 +0000 (UTC)
Received: by pdbft15 with SMTP id ft15so8553061pdb.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Feb 2015 08:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=O6B07JoZnsvZwMu+KV8vy8vz6faJ9snlUPCuUOd9tDI=;
	b=kazQPxQksDGxcOlFSzuVRuiUoXdlJpMz8RU9MoIENMKxkISWWWgMtctUB2K56OyVAy
	M67D/a7Hgdkpno6oK85i/VGziVxvtEYj68M2I2OZWzLxQ/XqCvjMI9vFSLtc1qZKg2KC
	Yrkds0DU9y2ciy5QTEcDFt9hQzxpBMEMd7YWjB2DVGomSrBQTJVmhwLC1oVmaBDA+SxV
	iFyJVUYdQFEUYs2qbkxIiB5mq4ng5v5ObUlUQkYui1+ZDJb4gQ3oBQbrQ/BY/YJvV1NE
	OfAuzSu/qit+nhrMB8LYfiTNfxEzKjyOquDxZKIzlRDbWoA+u9LZBc4vZuPA5VXG19fC
	dbvQ==
X-Received: by 10.70.22.66 with SMTP id b2mr6793536pdf.9.1423152350125;
	Thu, 05 Feb 2015 08:05:50 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id uq7sm5468848pbc.48.2015.02.05.08.05.48
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Feb 2015 08:05:49 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Feb 2015 08:03:56 -0800
Message-Id: <b4dcfa8324e9fa7a2c5ba02d41318eaa70e4d889.1423150740.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
References: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
In-Reply-To: <cover.1423150737.git.akuster808@gmail.com>
References: <cover.1423150737.git.akuster808@gmail.com>
Subject: [PATCH 48/61] packagegroup-self-hosted: package all of Python
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
X-List-Received-Date: Thu, 05 Feb 2015 16:05:48 -0000

From: Paul Gortmaker <paul.gortmaker@windriver.com>

Based on commit 745dfbc869fd593d1b92e2bc9c01d589ab21ade3
"buildtools-tarball: package all of Python", we do the same here
for packagegroup-self-hosted.

The switch to the fetcher where it added BeautifulSoup revealed
a shortcoming in the python packaged for the self hosting (missing
htmlentitydefs).  Here we fix it in the same way as what was done
for buildtools-tarball and include python-modules vs. all the
individual little chunks.

(From OE-Core rev: 4afbc5f7b2b8a6587110b16cda90e72c3e73a506)

Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../packagegroups/packagegroup-self-hosted.bb      | 28 +---------------------
 1 file changed, 1 insertion(+), 27 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index f95ce77..af57fac0 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -154,37 +154,11 @@ RDEPENDS_packagegroup-self-hosted-extended = "\
     perl-pod \
     ${PTH} \
     python \
-    python-compile \
     python-compiler \
-    python-compression \
-    python-core \
-    python-curses \
-    python-datetime \
-    python-difflib \
-    python-distutils \
-    python-elementtree \
-    python-email \
-    python-fcntl \
     python-git \
-    python-json \
-    python-logging \
     python-misc \
-    python-mmap \
-    python-multiprocessing \
-    python-netclient \
-    python-netserver \
-    python-pickle \
-    python-pkgutil \
-    python-pprint \
-    python-re \
+    python-modules \
     python-rpm \
-    python-shell \
-    python-sqlite3 \
-    python-subprocess \
-    python-textutils \
-    python-unittest \
-    python-unixadmin \
-    python-xmlrpc \
     quota \
     readline \
     rpm \
-- 
1.9.1


