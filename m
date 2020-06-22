Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com [209.85.210.66])
 by mx.groups.io with SMTP id smtpd.web11.416.1592848889335092524
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 11:01:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=nO2LrOgA;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.66, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f66.google.com with SMTP id k15so13810154otp.8
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2020 11:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=5pN5T3uJDgUYW/q1XSBuWzG5jzCiyA09PDW2GDTDgTs=;
        b=nO2LrOgADRSe5VPUtFhnrMqz/LvbzHTylWxtOqR8o0R6VQUsT78WBZcsO25Hp9cCV6
         btd7Ix2Lg6mK6tHB2Kivv1hUEQOjbnRGF0g18StNOuwKeCN36IqN5ljLzrKf4sbHKZk9
         zJVEiz06yWRxr5LPsLVIN4gNJkom0+6NXwxKDay5QQvuTWlu9I7cB9l8v5tVg3avZyRy
         tmra8aU2iFoHZWytNnRqJJPsLUqPzRNq57Oqfkm3nbS6LBT7BWpogtVARf94cn0of7mV
         k+stxm9Wu6i+JiA4QliKoKoIwQYyVw5asxXi+npbPedlRTNOdrbtT8bnOxYXBATW6NZR
         6Mgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=5pN5T3uJDgUYW/q1XSBuWzG5jzCiyA09PDW2GDTDgTs=;
        b=JxCMtriHDHT4wjdL/adasYJ7TYi2iJtp8ngM1r42cNqpIj/eMCOheQkDlTJT6SAPDP
         6BZjB0zwLhzaI8NoTcE19itlpaBzj8llEFZFZkgXzJxcSvWpKsR/ikNHVyUZGJsBuFTh
         7GgTKRbqSJimBNYge84g/HfwjNiM3APwK7klMBWiwltbCkS6caMUZubz0C69O9JEiLK4
         QgGWnapjOCnJbVRcZKZX9Cfyl/wqu+o3+DXHzZEGgBTHv7vbrlZCrftZwUdq1vY50l8u
         Eps88/lKzsOFkOaYFpsCacV+F3aSf+sr+bpV4JtIOKGQrXF4vH44tFuPN6mW7exUgYJe
         WE9g==
X-Gm-Message-State: AOAM5329J+GP8TFVKnEU7J/r+x5hQtWwEQfWotkRh/orHmHsFyV95it8
	tUydSo6UyXDEt+OaBptcyCtsFNVw4p64Bg==
X-Google-Smtp-Source: ABdhPJx/22eU2YeqT+t3gG1PBPcllVfeSLji7byTOCqUKcNf1NXXhxnd3yuOaS75bq9XIKFQy9ANYg==
X-Received: by 2002:a9d:7f8c:: with SMTP id t12mr15275275otp.66.1592848888190;
        Mon, 22 Jun 2020 11:01:28 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id n60sm3422659otn.75.2020.06.22.11.01.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 11:01:27 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 25/33] go-mod.bbclass: Add class for `go mod` support
Date: Mon, 22 Jun 2020 07:58:19 -1000
Message-Id: <a151d210f14f5126ff5c089df917aa9945b064df.1592848337.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1592848337.git.steve@sakoman.com>
References: <cover.1592848337.git.steve@sakoman.com>

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.17.1

