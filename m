Return-Path: <armccurdy@gmail.com>
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
	[209.85.210.178])
	by mail.openembedded.org (Postfix) with ESMTP id 6F3C67F3AD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 20:53:05 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id w2so7240217pfi.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 13:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wMLdN19vqirQ8boSryC2BSxzGXtt5gMo7CnFI2t4bx0=;
	b=r/iWoci9WGklw4v1bFuXHMhRa9DGDb+XHlV+9+vm8taEs4i9XrBO/zi5F3RTw9uGuf
	uTKNKL64eipWPaHtbePFL3XzoMdCVIAjabmiOcGDkGI9FY+uxwQe7qie4py5bhB2/rKU
	orea++1/RS0NLzVOGEgA1cb5n1cijlFxcT+HS5a/2uSAKhtFRdFs+RpYdQVwj5M6wY+s
	kKLm24x4oCVmnAEqIoiPeAbbIbiOHbXnldSIQgl5Xccq5o0PVu87SsSFKcH/GIIKTa3m
	ndrVUG6112X0DMGlzTdP+WkE0BVovYZC7SigpRZ7eXLVxFLDRJCivYPlH1JxSbU81az4
	eDHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=wMLdN19vqirQ8boSryC2BSxzGXtt5gMo7CnFI2t4bx0=;
	b=giQbnIGa9U/IegbvTFKPv6uVfKI063JUTvLfjttTTYHwI5VgS/HgG9V/UkniETwsl7
	ke/vxEmYPaGkP/CRgqztOgECAxvx/Hsfvw+fS8P/zeAGwPplnrmc2E3ZQ288hUu8zk8Z
	DaX4047XFqrpjvViTfdJoFghZXPqfoMkY/Dl2QuByHwAYcF5oK9Xg5Exj8ooyBesgyWV
	J5DGyhKH7H6EtnGiAuNPClrBxF9dejNGcH+r68ut7EhSMdFvWEb/Din/N4keDWnv5JiY
	pFl4QhEKxwTyd9rOjwk7A+Rn92B9BdY9KdL+fkv6oijAcJi1gQCmA+gxWU3X0S3Bx3k5
	tbHg==
X-Gm-Message-State: APjAAAWY8hqxWcP/Lo8EGpV3YSUmjE2FJzMsDMod2hW1Hu6lIDOVx5nG
	CEI4xxgs0uoaNFSTI35no0Q+D5b4
X-Google-Smtp-Source: APXvYqxX7abzn/MiNiHIgc9+WUPu+px55mA7NEAquFa68HEAimDMh5ktydOYQfMxYMz4fX0puM5uug==
X-Received: by 2002:a62:f245:: with SMTP id y5mr7464517pfl.156.1566593586344; 
	Fri, 23 Aug 2019 13:53:06 -0700 (PDT)
Received: from localhost.localdomain ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id h9sm2688314pgh.51.2019.08.23.13.53.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 23 Aug 2019 13:53:05 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Aug 2019 13:51:44 -0700
Message-Id: <1566593504-21918-13-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1566593504-21918-1-git-send-email-armccurdy@gmail.com>
References: <1566593504-21918-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 13/13] sqlite3: explicitly set target endian-ness
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
X-List-Received-Date: Fri, 23 Aug 2019 20:53:05 -0000

Unless SQLITE_BYTEORDER is predefined, the code falls back to build
time huristics - which are not always correct (e.g. in sqlite 3.28.0
big-endian ARM is mis-detected).

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-support/sqlite/sqlite3.inc | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-support/sqlite/sqlite3.inc
index 044af5e..4af1e09 100644
--- a/meta/recipes-support/sqlite/sqlite3.inc
+++ b/meta/recipes-support/sqlite/sqlite3.inc
@@ -19,7 +19,7 @@ UPSTREAM_CHECK_REGEX = "releaselog/(?P<pver>(\d+[\.\-_]*)+)\.html"
 
 CVE_PRODUCT = "sqlite"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig siteinfo
 
 # enable those which are enabled by default in configure
 PACKAGECONFIG ?= "fts4 fts5 json1 rtree dyn_ext"
@@ -52,6 +52,10 @@ CFLAGS_append = " -DUSE_PREAD"
 # Provide column meta-data API
 CFLAGS_append = " -DSQLITE_ENABLE_COLUMN_METADATA"
 
+# Unless SQLITE_BYTEORDER is predefined, the code falls back to build time
+# huristics, which are not always correct
+CFLAGS_append = " ${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'le', '-DSQLITE_BYTEORDER=1234', '-DSQLITE_BYTEORDER=4321', d)}"
+
 PACKAGES = "lib${BPN} lib${BPN}-dev lib${BPN}-doc ${PN}-dbg lib${BPN}-staticdev ${PN}"
 
 FILES_${PN} = "${bindir}/*"
-- 
1.9.1


