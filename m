Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.1606.1599028987337528081
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2020 23:43:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LJBnlrK7;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id s10so1378588plp.1
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2020 23:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RGCtXQBq5qF8gJiNsygs6udRSQ60CPmugxiigG4rSp8=;
        b=LJBnlrK7f00faYR8dH59rg2YSHqhDS4oysqai8g8tAcx4NgU/stNmpdF8cqYU/VCjD
         Plwm8IHvy6W6DBT30dhYQCpbLyPw6m1zmz9onJuijJf1tf7kM9H9y5yLc48taHQxVpCz
         qXUe86EoAkcv/z+m34LEWs6xIUVy6wr+ciccAhBVoMiem1Sv/uVJpm1QqFugT0ZRSTkP
         QtmkFwf4ivSkJs+IGbKx0HFqIdU2pZqFvELmWG+gtXT55Nt4nCiQ3CaMh05opy9Hy6oO
         Mg5CheAutlncvmlqmvtkZKpr/VbwIPFtrmv6q7Zq++UaWgBjaSMxNGb2lyMA35zCjRdN
         7c4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RGCtXQBq5qF8gJiNsygs6udRSQ60CPmugxiigG4rSp8=;
        b=T55AwCirWDMLpGSyAra10ej4qx/OA2+Ihvh0+iSDwBgVtJqSuILmF5RKlbYdZjCdUz
         FT4FPwCpbTrw2EcXBSWBe0oYaUA4wOt6F52Sx12gt3ebiMAlewNuywqLg5nzvErprPCz
         yn1CSIETm3wXBTreyDtN1i+J3Wwgu2hTjWgFhyiWXe4aQvcw7cJ8hzZI9p1AXaSLGaBG
         rTpzDfPl9I9LaiLr4nKPg7IagjTSC0bDT2kHyWdib/yH2sfxcvzniG10qIbF2LW+GoNu
         NnWSmiHB2S7Wm7TCpA3xfvMpnBgyn3kuxLGjdVNq8m6WjD0bK9YduRiXQRK0NfSZZtMp
         CDeA==
X-Gm-Message-State: AOAM5327VwJkcMd3wy5xXqQVXZAoH67YKfqK2bqih3HxueIKTtgT1OxZ
	snFcVw/5QMOntuEz2UTyLZZek5KEEq+C0g==
X-Google-Smtp-Source: ABdhPJxy4BqWULHbZYQsCwrPvvKThSTZokhSmVy9RMjPG6eCmZmk7LGh1wDOaHquwXsRiDT+SEBnJA==
X-Received: by 2002:a17:90b:208b:: with SMTP id hb11mr970164pjb.201.1599028986526;
        Tue, 01 Sep 2020 23:43:06 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e89d])
        by smtp.gmail.com with ESMTPSA id o23sm4591431pgm.18.2020.09.01.23.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 23:43:06 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] json-glib: Backport a build fix with clang
Date: Tue,  1 Sep 2020 23:43:02 -0700
Message-Id: <20200902064302.3265030-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...o-instead-of-cast-to-convert-pointer.patch | 33 +++++++++++++++++++
 .../json-glib/json-glib_1.4.4.bb              |  4 ++-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-gnome/json-glib/json-glib/0001-scanner-use-macro-instead-of-cast-to-convert-pointer.patch

diff --git a/meta/recipes-gnome/json-glib/json-glib/0001-scanner-use-macro-instead-of-cast-to-convert-pointer.patch b/meta/recipes-gnome/json-glib/json-glib/0001-scanner-use-macro-instead-of-cast-to-convert-pointer.patch
new file mode 100644
index 0000000000..2a834b674d
--- /dev/null
+++ b/meta/recipes-gnome/json-glib/json-glib/0001-scanner-use-macro-instead-of-cast-to-convert-pointer.patch
@@ -0,0 +1,33 @@
+From d60fcd5bd5c2675e4342775b910a2ea48ec0eccb Mon Sep 17 00:00:00 2001
+From: Dimitry Andric <dim@FreeBSD.org>
+Date: Wed, 19 Aug 2020 03:35:16 +0000
+Subject: [PATCH] scanner: use macro instead of cast to convert pointer to integer
+
+Clang 11 build failed due to a new warning (part of -Werror=pointer-to-int-cast):
+../json-glib/json-scanner.c:928:13: error: cast to smaller integer type 'GTokenType' from 'gpointer' (aka 'void *') [-Werror,-Wvoid-pointer-to-enum-cast]
+        *token_p = (GTokenType) value_p->v_symbol;
+                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/json-glib/-/commit/8c5fabe962b7337066dac7a697d23fce257a5d64]
+Signed-off-by: Jan Beich <jbeich@FreeBSD.org>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ json-glib/json-scanner.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/json-glib/json-scanner.c b/json-glib/json-scanner.c
+index 0c9919f..59dd29c 100644
+--- a/json-glib/json-scanner.c
++++ b/json-glib/json-scanner.c
+@@ -925,7 +925,7 @@ json_scanner_get_token_i (JsonScanner	*scanner,
+       
+     case G_TOKEN_SYMBOL:
+       if (scanner->config->symbol_2_token)
+-	*token_p = (GTokenType) value_p->v_symbol;
++	*token_p = GPOINTER_TO_INT (value_p->v_symbol);
+       break;
+       
+     case G_TOKEN_BINARY:
+-- 
+2.28.0
+
diff --git a/meta/recipes-gnome/json-glib/json-glib_1.4.4.bb b/meta/recipes-gnome/json-glib/json-glib_1.4.4.bb
index c999d761bd..add9ff41a1 100644
--- a/meta/recipes-gnome/json-glib/json-glib_1.4.4.bb
+++ b/meta/recipes-gnome/json-glib/json-glib_1.4.4.bb
@@ -14,7 +14,9 @@ DEPENDS = "glib-2.0"
 GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase lib_package gobject-introspection gtk-doc gettext ptest-gnome manpages upstream-version-is-even
 
-SRC_URI += "file://run-ptest"
+SRC_URI += "file://run-ptest \
+            file://0001-scanner-use-macro-instead-of-cast-to-convert-pointer.patch \
+"
 SRC_URI[archive.md5sum] = "4d4bb9837f6d31e32d0ce658ae135f68"
 SRC_URI[archive.sha256sum] = "720c5f4379513dc11fd97dc75336eb0c0d3338c53128044d9fabec4374f4bc47"
 
-- 
2.28.0

