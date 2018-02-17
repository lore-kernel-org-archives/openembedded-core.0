Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id CB4127875C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Feb 2018 01:36:32 +0000 (UTC)
Received: by mail-qk0-f178.google.com with SMTP id z197so6076948qkb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Feb 2018 17:36:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=0lcXIf5fOgGMW0QB43Tj0dq2qAg5/iFGsfOio9hk8Go=;
	b=TtoEKAwidihbxvWq519JLNsefkmQ/yq+lIzeZnoAtdigZ5ETjbiCe0wHg5NjUupevg
	Zy9UN/Zh4YURsMyw01zHA13KQTOiUHkH83WKUZv/ocqbRHK0gYHKSv9A6Mb61gCoc2Z4
	XhsZjy7ChawIDZ2UFxcXy1tppJjCKlXCz8zRCRhClQ6hAS6i3UtXa3k+4oCqM0FxL9vm
	HkMKFo+3KkllpY4Xhl2bA5/mj3HgPtVmSnn3f848AOVog+t/dR3aNY1dhhLwyg5E9u5N
	IENewkWoURqnqFkbPf0whVtQqndgjDBY6cypTH0miahIl/qYR/ChELGDDtF9Nhx0tmIS
	9thA==
X-Gm-Message-State: APf1xPA/8RJVqggwf9JeB8EVOdcqKtXrY4HG0/KHPOhpSpEv459iA/LR
	PcXjuzm8oco1pryklQnsWXjYIA==
X-Google-Smtp-Source: AH8x225Y3hj2tiab/UXCFgkz3Aa9aArzZVJfFOi+o0WAapmR/SORjzaRnYtRIKYHwvAoPmD1VyJ41A==
X-Received: by 10.55.163.201 with SMTP id m192mr15328qke.144.1518831393256;
	Fri, 16 Feb 2018 17:36:33 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	c21sm12880302qkg.78.2018.02.16.17.36.30
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 16 Feb 2018 17:36:32 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Fri, 16 Feb 2018 23:36:25 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri, 16 Feb 2018 23:36:23 -0200
Message-Id: <20180217013623.13881-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.16.1
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] go-dep: Upgrade 0.3.2 -> 0.4.1
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
X-List-Received-Date: Sat, 17 Feb 2018 01:36:33 -0000

The release was announced in Jan 24th 2018 and provides a number of
features and bug fixes.

The 0.4.1 restores the `dep prune` command support, which was dropped
on 0.4.0, so existing scripts will continue to work. That said, it is
advisable to change the scripts to use the new features of `dep
ensure` as `dep prune` will be removed in future.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 ...er-constant-that-hopefully-works-the-same.patch | 33 ----------------------
 .../go/{go-dep_0.3.2.bb => go-dep_0.4.1.bb}        |  5 ++--
 2 files changed, 2 insertions(+), 36 deletions(-)
 delete mode 100644 meta/recipes-devtools/go/go-dep/0001-use-a-smaller-constant-that-hopefully-works-the-same.patch
 rename meta/recipes-devtools/go/{go-dep_0.3.2.bb => go-dep_0.4.1.bb} (72%)

diff --git a/meta/recipes-devtools/go/go-dep/0001-use-a-smaller-constant-that-hopefully-works-the-same.patch b/meta/recipes-devtools/go/go-dep/0001-use-a-smaller-constant-that-hopefully-works-the-same.patch
deleted file mode 100644
index 2a7bc43cdb0..00000000000
--- a/meta/recipes-devtools/go/go-dep/0001-use-a-smaller-constant-that-hopefully-works-the-same.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 73e8dd479420bb90a46cf9d99ca62289fab3677e Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 23 Sep 2017 08:43:58 -0700
-Subject: [PATCH] use a smaller constant that hopefully works the same.
-
-This test uses a constant that is too big for 32bit systems.
-
-Backported from
-https://github.com/boltdb/bolt/issues/645
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Submitted
-
- vendor/github.com/boltdb/bolt/db_test.go | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/vendor/github.com/boltdb/bolt/db_test.go b/vendor/github.com/boltdb/bolt/db_test.go
-index 3034d4f4..035f5a5f 100644
---- a/vendor/github.com/boltdb/bolt/db_test.go
-+++ b/vendor/github.com/boltdb/bolt/db_test.go
-@@ -370,7 +370,7 @@ func TestDB_Open_InitialMmapSize(t *testing.T) {
- 	path := tempfile()
- 	defer os.Remove(path)
- 
--	initMmapSize := 1 << 31  // 2GB
-+	initMmapSize := 1 << 29  // 512MB
- 	testWriteSize := 1 << 27 // 134MB
- 
- 	db, err := bolt.Open(path, 0666, &bolt.Options{InitialMmapSize: initMmapSize})
--- 
-2.14.1
-
diff --git a/meta/recipes-devtools/go/go-dep_0.3.2.bb b/meta/recipes-devtools/go/go-dep_0.4.1.bb
similarity index 72%
rename from meta/recipes-devtools/go/go-dep_0.3.2.bb
rename to meta/recipes-devtools/go/go-dep_0.4.1.bb
index cdf6da15938..d82e6372058 100644
--- a/meta/recipes-devtools/go/go-dep_0.3.2.bb
+++ b/meta/recipes-devtools/go/go-dep_0.4.1.bb
@@ -5,12 +5,11 @@ LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=1bad315647751fab0007812f
 
 GO_IMPORT = "github.com/golang/dep"
 SRC_URI = "git://${GO_IMPORT} \
-           file://0001-use-a-smaller-constant-that-hopefully-works-the-same.patch;patchdir=src/github.com/golang/dep \
            file://0001-Add-support-for-mips-mips64.patch;patchdir=src/github.com/golang/dep \
           "
 
-# Points to 0.3.2 tag
-SRCREV = "8ddfc8afb2d520d41997ebddd921b52152706c01"
+# Points to 0.4.1 tag
+SRCREV = "37d9ea0ac16f0e0a05afc3b60e1ac8c364b6c329"
 
 inherit go
 
-- 
2.16.1


