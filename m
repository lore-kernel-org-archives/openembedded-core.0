Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web08.1660.1603817317916132865
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2020 09:48:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZpTjOG+Y;
 spf=pass (domain: gmail.com, ip: 209.85.221.66, mailfrom: yann.morin.1998@gmail.com)
Received: by mail-wr1-f66.google.com with SMTP id e17so2656253wru.12
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2020 09:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fe27zZeRhaFf13E3mjEw+5OqsILmZ5bX7d/P+hvaF6c=;
        b=ZpTjOG+YtfF3+Rxg71f7k9TJYSa5Xjaq2BZGmkiNJCukk5/ORzeMNby5fB89XhXN3O
         meykRbO0F1YfMz4ZYvEGyQVJHFOd8ZGwL/E+jvjcLvwuegGyYFt3O7W8+fPdpeHROia2
         hjrFJChMXzkmZYBbK5GJbBQt/63ALiq/9UxMiVnir0+ODlUTQJG6UyDiXAKdbFR3mzLX
         2Ar3+CsWut3DNdmdbL/I2CVlDYfZubq4g6Ssux5Ab0KY7lyiy5p3i2iqT+R3mZ0vc8QT
         utWN62kPQHakv4HWPc/2SNYSyy+cHmk9Kx387JJ+9XwSUaTcd+6OW9r073aQbCSxyCX0
         ptBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=fe27zZeRhaFf13E3mjEw+5OqsILmZ5bX7d/P+hvaF6c=;
        b=A/kK9IbPaV7qlUF8EUeFXxNtdQFxuQC3WA6wzCKAlAjy5Cq6pghRCBFXxZZC1pT0tc
         2rbvizr1E/h4utVS6NBTQku7QaxWdJh088GgU1VooGLDnxsAsRCxQGMDyZC/5enbcyW/
         gsMcjR4ZvEiIJc7oT0AY5eJ/0cOcYBEe2Eo+x2n1uPon+Of/ikv51eSSB5vrQ3zsFEMk
         huWPbWn4b4rnyKNX934qt9kjYsCa3bY8CmDRXRMwY4j/WwgHlPh67oLIDE0F58JlTWUT
         a2fInInY/GQC+6wLa8hCwV8gjYMaJLybgq60BoqdzY+fH74/TWKOIESdJrwXdNw+SBYp
         KUSA==
X-Gm-Message-State: AOAM5318TOqVKfAZrx1JGIQuSRGu2Bf5wngNsGEdnsLjgtwD3Y6BC6fD
	Vg0VaQUZcu9v17pu28XHaWHb81/0smQ=
X-Google-Smtp-Source: ABdhPJyzm24O4uJGMzo/kqgBmlDSUYSgZIuVzg7LgUYQSE7n8d7UHLUt2zBHtaI2R6/TIFjCSL9CWg==
X-Received: by 2002:a5d:654d:: with SMTP id z13mr3951955wrv.6.1603817316056;
        Tue, 27 Oct 2020 09:48:36 -0700 (PDT)
Return-Path: <yann.morin.1998@gmail.com>
Received: from localhost.localdomain ([2a01:cb19:8b51:cb00:7188:385:c7b6:319])
        by smtp.gmail.com with ESMTPSA id v9sm2441972wmh.23.2020.10.27.09.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 09:48:35 -0700 (PDT)
Sender: "Yann E. MORIN" <yann.morin.1998@gmail.com>
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: openembedded-core@lists.openembedded.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Alexandre BELLONI <alexandre.belloni@bootlin.com>
Subject: [PATCH] recipes-core/busybox: fixup licensing information
Date: Tue, 27 Oct 2020 17:48:31 +0100
Message-Id: <20201027164831.3297010-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 7d32417b4d (busybox: Correct the name of the bzip2 license)
changes the licesne from 'bzip2' to 'bzip2-1.0.6' on the rationale
that the 'bzip2 license was renamed from "bzip2" to "bzip2-1.0.6"
[...] to match the official SPDX identifier.'

Though the above is true for the bzip2 and pbzip2 packages, the bzip2
code bundled in busybox is a copy from the bzip2 1.0.4 version, not the
1.0.6 version.

As such, using bzip2-1.0.6 is wrong.

Unfortunately, there is no official SPDX license identifier for this
bzip2 1.0.4 version, so we just mimick the existing ones (bzip2-1.0.5
and bzip2-1.0.6) by using bzip2-1.0.4.

Also, there is a license file attached to that, so we add it to the
list.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alexandre BELLONI <alexandre.belloni@bootlin.com>

---
Respin, as I was not yet subscribed to the list...
Sorry for any duplicates...
---
 meta/recipes-core/busybox/busybox.inc | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 45aaa2b41c..e0522be729 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -5,10 +5,11 @@ BUGTRACKER = "https://bugs.busybox.net/"
 
 DEPENDS += "kern-tools-native virtual/crypt"
 
-# bzip2 applet in busybox is based on lightly-modified bzip2 source
+# bzip2 applet in busybox is based on lightly-modified bzip2-1.0.4 source
 # the GPL is version 2 only
-LICENSE = "GPLv2 & bzip2-1.0.6"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=de10de48642ab74318e893a61105afbb"
+LICENSE = "GPLv2 & bzip2-1.0.4"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=de10de48642ab74318e893a61105afbb \
+                    file://archival/libarchive/bz/LICENSE;md5=28e3301eae987e8cfe19988e98383dae"
 
 SECTION = "base"
 
-- 
2.25.1

