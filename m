Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3A82E60777
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Sep 2017 19:25:45 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id o63so3170109qkb.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 03 Sep 2017 12:25:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=9KzEmmf0SmamUG4819cUqByl5Aqxbr3FsRelYMcNrSI=;
	b=Bqx+XYL6gKyM/5/xWEZWybqLsOvEiKHmMJb6tOSR57MmwFXlV32L0C10B09Idk+YCX
	yki55uq2i9w484KBF8irKrnDbs6EV9BuA/V1GsU1PDQeB3RtI7jPrNWqrKaSWRWby6yU
	I7SHybR8oInil7yboZtKXpnhEkdax1KBD3na59wyw4SP919eBvQvbSncYif+wmxg9//d
	0a06uox0WyGBy0O8MTHXy7dsaxSlLDx/nkX1K5sSO4L8YSfdcpj1JEJ0EXG1DPcM7oRg
	39pGdI6qtXIfJm/9hW4ZJKRRZCdayPCqKqE4d1yQ4UzrzugnKLczzYZ2QGJyN8V/aARF
	+Vzg==
X-Gm-Message-State: AHPjjUi1LHq90lLd8G2nBCXeKI0vsDRELS3jJe0RDQ/CInGaJVHe1kRg
	emxYTqPuDSOxTNWn
X-Google-Smtp-Source: ADKCNb5bU/hsu5+G7Hqf1JsM0/SFv+VY/iKH6WMoy64742jX7cTpIsxq04g1PjcaEByw4GuvQkkSPQ==
X-Received: by 10.55.25.94 with SMTP id k91mr10828292qkh.219.1504466746661;
	Sun, 03 Sep 2017 12:25:46 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id x5sm1241206qka.85.2017.09.03.12.25.43
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 03 Sep 2017 12:25:45 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Sun, 03 Sep 2017 16:25:37 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Sun,  3 Sep 2017 16:25:36 -0300
Message-Id: <20170903192536.491-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2] go-dep: Add 0.3.0 release
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
X-List-Received-Date: Sun, 03 Sep 2017 19:25:46 -0000

This is the Golang dependency management tool under development; it is
ready for production use and intended to be merged onto Golang
1.10. Until that, projects are starting to use it and making it
available on OE-Core reduces the Golang integration work for new
recipes.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v2:
- Update to 0.3.0

 meta/recipes-devtools/go/go-dep_0.3.0.bb | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-dep_0.3.0.bb

diff --git a/meta/recipes-devtools/go/go-dep_0.3.0.bb b/meta/recipes-devtools/go/go-dep_0.3.0.bb
new file mode 100644
index 0000000000..66e30acbd3
--- /dev/null
+++ b/meta/recipes-devtools/go/go-dep_0.3.0.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Dependency management tool for Golang"
+HOMEPAGE = "https://github.com/golang/dep"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=1bad315647751fab0007812f70d42c0d"
+
+GO_IMPORT = "github.com/golang/dep"
+SRC_URI = "git://${GO_IMPORT};destsuffix=${BPN}-${PV}/src/${GO_IMPORT};nobranch=1"
+
+# Points to 0.3.0 tag
+SRCREV = "7a91b794bbfbf1f3b8b79823799316451127801b"
+
+inherit go
+
+GO_INSTALL = "${GO_IMPORT}/cmd/dep"
+
+INSANE_SKIP_${PN} += "ldflags"
+
+BBCLASSEXTEND = "native nativesdk"
+
+RDEPENDS_${PN}-staticdev += "bash"
-- 
2.14.1


