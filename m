Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.web10.25373.1591983222273001551
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2020 10:33:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.160.196, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qt1-f196.google.com with SMTP id e16so7758950qtg.0
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2020 10:33:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:organization:content-transfer-encoding;
        bh=kUvKnKnBUbRQJxJ6gxoH3MrnoKuMniMP20y/6YjjGBc=;
        b=YXOyUe1okuims0L8z4ofErI8CpYmMZQGvnxynRMz8IxIHOGiqm/Z1UczbRIhglUlLX
         K8KrR037vDq1oWvtPDJZFHr2Ho+JoF4Z4KHtsZL/TZehJcO3KJ9BTVqYPYULrwEhcMLK
         gO3yIh90n/VBHojClFgNrnDW+GU7Ay6vOJYHpY9xxKV9SmHyzEsj0Lyem+KIol2ZxiCV
         jHwmAJorbEXGlAAYJlw1z7/kuom4yzVywMiEzLfOhdiT6pSMR+MAq+0tukhcarp1pJiL
         Eky1IrufpFiTDjSuwDyQYhwTYAJ5bjBEkLRh3JHHHyNU8YQy6ax+UgGDbCJ8JFFkL/pr
         bjew==
X-Gm-Message-State: AOAM533r2e0wLQwXm4ytO3kAuJVhdNonKy2I3iZrM6QbZi/kqDDLegS1
	iiYkRFen2BadAgfXOmGOKS5dfyK+Dbc=
X-Google-Smtp-Source: ABdhPJyKNPGHvbFgi02CfV06JEbNHFWOZrjt5l++OwC+A+lELwYUkfDYvIKiFATeIIS1uouwd2iAtQ==
X-Received: by 2002:ac8:78d:: with SMTP id l13mr4132334qth.37.1591983221159;
        Fri, 12 Jun 2020 10:33:41 -0700 (PDT)
Return-Path: <otavio.salvador@gmail.com>
Received: from localhost ([181.220.84.90])
        by smtp.gmail.com with ESMTPSA id h64sm4736174qkf.46.2020.06.12.10.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 10:33:40 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@gmail.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Cc: Otavio Salvador <otavio.salvador@gmail.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [dunfell-backport PATCH 5/9] go-mod.bbclass: Add class for `go mod` support
Date: Fri, 12 Jun 2020 14:33:14 -0300
Message-Id: <20200612173318.103232-5-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200612173318.103232-1-otavio@ossystems.com.br>
References: <20200612173318.103232-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit

From: Otavio Salvador <otavio.salvador@gmail.com>

When using Go Modules, the the current working directory MUST be at or
below the location of the 'go.mod' file when the go tool is used, and
there is no way to tell it to look elsewhere.  It will automatically
look upwards for the file, but not downwards.

To support this use case, we provide the `GO_WORKDIR` variable, which
defaults to `GO_IMPORT` but allows for easy override.

[YOCTO #13883]

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 11c2b06ac98cc5064640705712bffa156519f450)
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
2.27.0

