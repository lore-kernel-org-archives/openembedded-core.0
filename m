Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 646C17865E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 17:54:47 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id o77so576745qke.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 10:54:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=jrMSv1grJGaWVmy8xU1HEGutMv4kr0NdDtPXMfFWH+o=;
	b=judGeX1zZah/RsGN03/kGX3guusSUkbh3apJ/NVZ3U88ttsg5O5ZFls/Hk2/JtQwh2
	lU8vc2gLF8oUes7B/9eNnWRcWvS43+Uzir1pC1Z3TQd1s6JMiW0koE4YS58JEHEOQRq6
	c6X6AzQe11HAqwyAosIk77PqaZ6k9F6W/IjXwq4oID501hfpJ++tzKnh2FQwKlDbswQw
	UFkWmCZErh2YTxXJDuZYNvMfuX6epdbz/gDnLUT/E4zj4+oOQqLYzQc/GsKbZTN3i8CQ
	T4WebUHEi5uHJuK8IqJ/WH9yCTiQUqdE1Ttx03QOGAOIwIr9CT99R4vxmqmXkcUq1a90
	zZXw==
X-Gm-Message-State: AHPjjUiKQ0jjmOeUXGhSBP7NHvb70I5NiprKymaNFD1zG871MQnE6euI
	jDStpzOlBt28p+J+
X-Google-Smtp-Source: AOwi7QA33J1PCjDCVRd7FbOj390WxuVC8TLGT5LMpV4P/tUd8byy8UH92rNfEO/kVOrvH3EE0MIX7g==
X-Received: by 10.55.66.22 with SMTP id p22mr15108875qka.78.1505325288953;
	Wed, 13 Sep 2017 10:54:48 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	o5sm10173520qtc.16.2017.09.13.10.54.44
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 13 Sep 2017 10:54:48 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Wed, 13 Sep 2017 14:54:39 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Sep 2017 14:54:04 -0300
Message-Id: <20170913175410.23041-4-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170913175410.23041-1-otavio@ossystems.com.br>
References: <20170913175410.23041-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v8 3/9] go-1.8: add patch for set soname in ELF shared objects
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
X-List-Received-Date: Wed, 13 Sep 2017 17:54:48 -0000

From: Matt Madison <matt@madison.systems>

The go link tool does not set the soname by default, which
prevents package.bbclass's shlibs processing from seeing
shared libraries built with go.

This patch passes appropriate options to go's linker and
the external linker to set the soname.

Signed-off-by: Matt Madison <matt@madison.systems>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v9:
- new patch

 meta/recipes-devtools/go/go-1.8.inc                |  1 +
 ...06-linker-add-soname-to-shareable-objects.patch | 44 ++++++++++++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.8/0006-linker-add-soname-to-shareable-objects.patch

diff --git a/meta/recipes-devtools/go/go-1.8.inc b/meta/recipes-devtools/go/go-1.8.inc
index 141c0994c3..8c4b71e428 100644
--- a/meta/recipes-devtools/go/go-1.8.inc
+++ b/meta/recipes-devtools/go/go-1.8.inc
@@ -16,6 +16,7 @@ SRC_URI += "\
        file://gotooldir.patch \
        file://make-goroot-precious.patch \
        file://set-gotooldir-during-bootstrap.patch \
+       file://0006-linker-add-soname-to-shareable-objects.patch \
 "
 SRC_URI[main.md5sum] = "64e9380e07bba907e26a00cf5fcbe77e"
 SRC_URI[main.sha256sum] = "5f5dea2447e7dcfdc50fa6b94c512e58bfba5673c039259fd843f68829d99fa6"
diff --git a/meta/recipes-devtools/go/go-1.8/0006-linker-add-soname-to-shareable-objects.patch b/meta/recipes-devtools/go/go-1.8/0006-linker-add-soname-to-shareable-objects.patch
new file mode 100644
index 0000000000..74e1f2459e
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.8/0006-linker-add-soname-to-shareable-objects.patch
@@ -0,0 +1,44 @@
+From 81e9e322297d83f57f02548689c71859bfce10ee Mon Sep 17 00:00:00 2001
+From: Matt Madison <matt@madison.systems>
+Date: Sun, 15 Jan 2017 05:24:49 -0800
+Subject: [PATCH 6/6] linker: add soname to shareable objects
+
+Shared library handling in OE builds works better when shared
+libraries are tagged with SONAMEs.
+
+Upstream-Status: Pending
+Signed-off-by: Matt Madison <matt@madison.systems>
+---
+ src/cmd/link/internal/ld/lib.go | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/cmd/link/internal/ld/lib.go b/src/cmd/link/internal/ld/lib.go
+index 74d79d3..6d03005 100644
+--- a/src/cmd/link/internal/ld/lib.go
++++ b/src/cmd/link/internal/ld/lib.go
+@@ -1040,12 +1040,14 @@ func (l *Link) hostlink() {
+ 			// Pass -z nodelete to mark the shared library as
+ 			// non-closeable: a dlclose will do nothing.
+ 			argv = append(argv, "-shared", "-Wl,-z,nodelete")
++			argv = append(argv, fmt.Sprintf("-Wl,-soname,%s", filepath.Base(*flagOutfile)))
+ 		}
+ 	case BuildmodeShared:
+ 		if UseRelro() {
+ 			argv = append(argv, "-Wl,-z,relro")
+ 		}
+ 		argv = append(argv, "-shared")
++		argv = append(argv, fmt.Sprintf("-Wl,-soname,%s", filepath.Base(*flagOutfile)))
+ 	case BuildmodePlugin:
+ 		if Headtype == obj.Hdarwin {
+ 			argv = append(argv, "-dynamiclib")
+@@ -1054,6 +1056,7 @@ func (l *Link) hostlink() {
+ 				argv = append(argv, "-Wl,-z,relro")
+ 			}
+ 			argv = append(argv, "-shared")
++			argv = append(argv, fmt.Sprintf("-Wl,-soname,%s", filepath.Base(*flagOutfile)))
+ 		}
+ 	}
+ 
+-- 
+2.7.4
+
-- 
2.14.1


