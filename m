Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 448667BE38
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Jan 2019 16:03:37 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id q1so9206823pfi.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Jan 2019 08:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=O+wJ4WPtMzp5wV34IjwKZplzaWT4iLPfGBeNNzlRiGA=;
	b=fnMb3YaMe+9F/iOZgW/o5naHMZkGZEhk6fdPZQi8paZthHgtLTmGRUnnE42P4CE5OS
	Hdv0oVkijXLxjiMdvpfJaeGSU45WQ0auIECGzR4BjlVvJPdDx63V6eEarElIy+1R9BNn
	04LNdjutvj3ze9U1ibWG2Jwan4F1TC1NnzXb+xwqK8+NeXED+O3cFIf8pvBL75T6tmhB
	60XlGCnr2jJA6Nxo+qBUxTDKMZ21t7qFfNA59XLVFZFtQbGbaeN3AATOKuCRQsT26eKQ
	kuxe/XK36fKcHEF0DeCbY6H3uJdVd7eT2kwK6Fo/rKivvSYcRDNDNqs81eUSUowBZJwE
	16qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=O+wJ4WPtMzp5wV34IjwKZplzaWT4iLPfGBeNNzlRiGA=;
	b=Lh9hjWKgWUJDho9/t49/glysw4v60MBslnWvP/UK/rRFLfQ/cfPONgftR7cH4q8Hur
	sIOmlmLx3+P6lAOlex3bzx8322wEw0PRgK73VLBTE8w5aXx1SOlkuKzdEBJ1ftvp++Rm
	Sh8dU8U9YcObCkWUHHuD79qy79hRvEvt+3bNxKq14BPO8+pvQGvoGsY2Nyq6w75tW+PC
	3zgsfQ7RsOcml+oseOWxWzNrL4Q2KEGEHSV3tk/bbcSAuYNyMGLnH/l1LCH7MOEcnbZ6
	7GdtiCYZmMzWmk8xS8mZs53PSF/bzL5tD2ELZEr5VWwppNiK69yNFbnPOSm82ByA93QC
	DyOg==
X-Gm-Message-State: AJcUukfpcVJ6V7VlGoihWktqFWfh5yNYIt8MC+SmOwCIjcbOMWBPC6iR
	W/XZA7WAt4w+QJF4kGFBGlMVGgrIiyM=
X-Google-Smtp-Source: ALg8bN6k/HSZdiR6MPAFIu6WqhUVrCGRXOG23/wTmuld06vobfJVyjxC7zM0N3IcYbcOJr2q4V/PpQ==
X-Received: by 2002:a62:31c1:: with SMTP id
	x184mr22686619pfx.204.1547395417910; 
	Sun, 13 Jan 2019 08:03:37 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::4107])
	by smtp.gmail.com with ESMTPSA id
	128sm126293810pfu.129.2019.01.13.08.03.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 13 Jan 2019 08:03:37 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 13 Jan 2019 08:03:28 -0800
Message-Id: <20190113160328.27660-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] python3-pbr: Move src uri checksums out of .inc file
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
X-List-Received-Date: Sun, 13 Jan 2019 16:03:37 -0000
Content-Transfer-Encoding: 8bit

python2 version of pbr is in meta-python and uses the same inc file but
is not updated synchronously, which ends up breaking it, either we move
py2 version into OE-core as well and then ensure that both recipes are
updated atomically, or we move the checksums into recipe files

Fixes errors like
http://errors.yoctoproject.org/Errors/Details/216253/

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/python/python-pbr.inc       | 3 ---
 meta/recipes-devtools/python/python3-pbr_5.1.1.bb | 3 +++
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/python/python-pbr.inc b/meta/recipes-devtools/python/python-pbr.inc
index bfe3030b07..0e64501c32 100644
--- a/meta/recipes-devtools/python/python-pbr.inc
+++ b/meta/recipes-devtools/python/python-pbr.inc
@@ -5,9 +5,6 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
 
-SRC_URI[md5sum] = "dbc94417a8ff0432d6244501a7f1bd49"
-SRC_URI[sha256sum] = "f59d71442f9ece3dffc17bc36575768e1ee9967756e6b6535f0ee1f0054c3d68"
-
 inherit pypi
 
 RDEPENDS_${PN} += "${PYTHON_PN}-pip"
diff --git a/meta/recipes-devtools/python/python3-pbr_5.1.1.bb b/meta/recipes-devtools/python/python3-pbr_5.1.1.bb
index 97e7361b16..95d3d2bd4f 100644
--- a/meta/recipes-devtools/python/python3-pbr_5.1.1.bb
+++ b/meta/recipes-devtools/python/python3-pbr_5.1.1.bb
@@ -1,2 +1,5 @@
 inherit setuptools3
 require python-pbr.inc
+SRC_URI[md5sum] = "dbc94417a8ff0432d6244501a7f1bd49"
+SRC_URI[sha256sum] = "f59d71442f9ece3dffc17bc36575768e1ee9967756e6b6535f0ee1f0054c3d68"
+
-- 
2.20.1


