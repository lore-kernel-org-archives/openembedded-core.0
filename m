Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web11.6223.1590114174520665921
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2020 19:22:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id i5so9326606qkl.12
        for <openembedded-core@lists.openembedded.org>; Thu, 21 May 2020 19:22:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :organization:content-transfer-encoding;
        bh=V9NXd5pfSt53uk0xN/BK+DCz/YixhqU3YA7IUwNnACM=;
        b=XnX6d1yFjC2ryerOeRVptsH2fm9p0oXvEsLYWK6PyrrxrMQZ8Il+1bhZlJ9i+XklVc
         lc7fJerd9636ZX2Cf2vtS9eib4BlWZ6E6mLh+RAsqsDeLqEUrjucGD64+QHB8dK6O9+2
         OyTOfccPohTfJcSl67YUQVQoiBf7XDmTyHdikYkoL66LoIxevSIfJD4sZM2RJ1txT69y
         T9X6opWo6HL/yOX6ueuLbf3p9mrmglUDMmp3mNPLDi5KQsPYrt6QG1UqeGhocWCA/Xnz
         HrtQ0u9eJXMfFf2WT68VvMkqQ/Mft0ZSkwVcGi0kEgoyrsVrY0lwcQt8iGIX7NRY0iZg
         Qhdw==
X-Gm-Message-State: AOAM533SyV1ZEEixInJXVpSH0QpM16UmiNPtluo6CWoiWtTVIZUWJv87
	gECak2CKb2gZOIJ8D4lVn2KgGtwN9x4=
X-Google-Smtp-Source: ABdhPJxc+c9UBTd6SSIfiVdMg/G4vJzbm4jWBPKzSAMrwZBMh7N2N5LdMeYhJVWsecwjuuJFxZR5BQ==
X-Received: by 2002:a37:4a8f:: with SMTP id x137mr9799846qka.184.1590114173338;
        Thu, 21 May 2020 19:22:53 -0700 (PDT)
Return-Path: <otavio.salvador@gmail.com>
Received: from localhost ([181.220.84.90])
        by smtp.gmail.com with ESMTPSA id n42sm6625620qtf.51.2020.05.21.19.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 19:22:52 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@gmail.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 1/4] go-mod.bbclass: Add class for `go mod` support
Date: Thu, 21 May 2020 23:22:34 -0300
Message-Id: <20200522022237.3568393-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit

When using Go Modules, the the current working directory MUST be at or
below the location of the 'go.mod' file when the go tool is used, and
there is no way to tell it to look elsewhere.  It will automatically
look upwards for the file, but not downwards.

To support this use case, we provide the `GO_WORKDIR` variable, which
defaults to `GO_IMPORT` but allows for easy override.

[YOCTO #13883]

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/classes/go-mod.bbclass | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta/classes/go-mod.bbclass

diff --git a/meta/classes/go-mod.bbclass b/meta/classes/go-mod.bbclass
new file mode 100644
index 0000000000..5871d02506
--- /dev/null
+++ b/meta/classes/go-mod.bbclass
@@ -0,0 +1,20 @@
+# Handle Go Modules support
+#
+# When using Go Modules, the the current working directory MUST be at or below
+# the location of the 'go.mod' file when the go tool is used, and there is no
+# way to tell it to look elsewhere.  It will automatically look upwards for the
+# file, but not downwards.
+#
+# To support this use case, we provide the `GO_WORKDIR` variable, which defaults
+# to `GO_IMPORT` but allows for easy override.
+#
+# Copyright 2020 (C) O.S. Systems Software LTDA.
+
+# The '-modcacherw' option ensures we have write access to the cached objects so
+# we avoid errors during clean task as well as when removing the TMPDIR.
+export GOBUILDFLAGS ?= "-v ${GO_LDFLAGS} -modcacherw"
+
+inherit go
+
+GO_WORKDIR ?= "${GO_IMPORT}"
+do_compile[dirs] += "${B}/src/${GO_WORKDIR}"
-- 
2.26.2

