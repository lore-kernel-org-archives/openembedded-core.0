Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web08.169.1617899555110959848
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Apr 2021 09:32:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=L1SrdF35;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.51, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f51.google.com with SMTP id w31-20020a9d36220000b02901f2cbfc9743so2871410otb.7
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Apr 2021 09:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=uQeoea4h73FSh6OAmyF7r32oEsrudxUpMa6DBpwoAWk=;
        b=L1SrdF35UgDh1BDBXIbd05/sZM1mhtMo1iorAqGVdlFZiTUk+eu41nQnm2mWJc1kMN
         N8Z54lY/oQFOM+9HbU2E5++0nySPA9Xt98EipfzWQlPgbWi/LO9Tq8nDTwY1KEACfc11
         A32J35Q0gXVhby8cNwFUg5hmUp/e7Iwoqw/Vw0ZDNwkO+LDhXA64G1ORzkO9SJduSMI7
         GaJlFgPpFRQMXJgj490zfxxWoYgq+kfqqfnKt64qLvEIjiTvgaOK6AzWdenYIX9YI0Zq
         X8JFL9nONilhJmImzuLl+RbGk/Azcr/RDo1qxaDujxXnHo+QaQWJopYJOJnMJe5+uiaq
         Wa+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uQeoea4h73FSh6OAmyF7r32oEsrudxUpMa6DBpwoAWk=;
        b=chVbcjo1UnwieKzGhdGpHHmfONy48gp8mQWx/gYYi47yXKWu1TgvuMNUxwe5M6a/JT
         vD0a+2yrRXQ9tZSgGdUKV0Tlm3Vk/v6Z3K2Xe29d2k9anZTJsju5yX1uNtSKrc2TasMN
         WWOR2iDYRLIJ94BT9JxvLigWhAWIFLCp8qvWNSdKvgj9Ix8aEzawwLtYDUKbKO/0R+ut
         bicYx3AkZgA4oGkq6CARZltMJHIinkPhpdhBXr3xJqFN1rG+fmcX9cLyRB7jzRkuh5Zy
         SDrkrMwmWmO4VtvY/aHEpg0+8UtRgk71g3xUVfkEvxP36hGu2UUgERQ+WI/SFJTU85pI
         OOfA==
X-Gm-Message-State: AOAM533We6j+By2C/sNEFzqQEBr2Np9ekE8eMBU77U+U7ujpKpilIlZg
	I2O+KWZI4hyIhV7gNOY3e0F8NfiSA9X5xHqHfh0=
X-Google-Smtp-Source: ABdhPJyXG8OsoZltfXih6Jk5qQpv5kZdIhc46u43SozMyr4PsV7E8gzKdTe82Oq0VFQQ5HM+C1IkTA==
X-Received: by 2002:a05:6830:55b:: with SMTP id l27mr8362491otb.260.1617899554021;
        Thu, 08 Apr 2021 09:32:34 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id j10sm5546705oos.27.2021.04.08.09.32.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:32:33 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/11] go_1.14: don't set -buildmode=pie when building for windows targets
Date: Thu,  8 Apr 2021 06:31:11 -1000
Message-Id: <85211463f398071364f4eb11e2fc47ba7ebe897a.1617899121.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1617899121.git.steve@sakoman.com>
References: <cover.1617899121.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Peter Morrow <pemorrow@linux.microsoft.com>

go 1.14 for windows targets does not support -buildmode=pie, disable it and use
the default buildmode instead. Support for -buildmode=pie for windows targets
is added with go 1.15 (https://golang.org/doc/go1.15) which is added to poky in
gatesgarth.

Signed-off-by: Peter Morrow <pemorrow@linux.microsoft.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/go.bbclass             | 8 ++++----
 meta/recipes-devtools/go/go_1.14.bb | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index e6c3591479..16e46398b1 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -145,11 +145,11 @@ FILES_${PN}-staticdev = "${libdir}/go/pkg"
 
 INSANE_SKIP_${PN} += "ldflags"
 
-# Add -buildmode=pie to GOBUILDFLAGS to satisfy "textrel" QA checking, but mips
-# doesn't support -buildmode=pie, so skip the QA checking for mips and its
-# variants.
+# Add -buildmode=pie to GOBUILDFLAGS to satisfy "textrel" QA checking, but
+# windows/mips/riscv doesn't support -buildmode=pie, so skip the QA checking
+# for windows/mips/riscv and their variants.
 python() {
-    if 'mips' in d.getVar('TARGET_ARCH') or 'riscv' in d.getVar('TARGET_ARCH'):
+    if 'mips' in d.getVar('TARGET_ARCH') or 'riscv' in d.getVar('TARGET_ARCH') or 'windows' in d.getVar('TARGET_GOOS'):
         d.appendVar('INSANE_SKIP_%s' % d.getVar('PN'), " textrel")
     else:
         d.appendVar('GOBUILDFLAGS', ' -buildmode=pie')
diff --git a/meta/recipes-devtools/go/go_1.14.bb b/meta/recipes-devtools/go/go_1.14.bb
index bc90a1329e..c17527998b 100644
--- a/meta/recipes-devtools/go/go_1.14.bb
+++ b/meta/recipes-devtools/go/go_1.14.bb
@@ -3,11 +3,11 @@ require go-target.inc
 
 export GOBUILDMODE=""
 export CGO_ENABLED_riscv64 = ""
-# Add pie to GOBUILDMODE to satisfy "textrel" QA checking, but mips/riscv
-# doesn't support -buildmode=pie, so skip the QA checking for mips/riscv and its
-# variants.
+# Add pie to GOBUILDMODE to satisfy "textrel" QA checking, but
+# windows/mips/riscv doesn't support -buildmode=pie, so skip the QA checking
+# for windows/mips/riscv and their variants.
 python() {
-    if 'mips' in d.getVar('TARGET_ARCH',True) or 'riscv' in d.getVar('TARGET_ARCH',True):
+    if 'mips' in d.getVar('TARGET_ARCH',True) or 'riscv' in d.getVar('TARGET_ARCH',True) or 'windows' in d.getVar('TARGET_GOOS', True):
         d.appendVar('INSANE_SKIP_%s' % d.getVar('PN',True), " textrel")
     else:
         d.setVar('GOBUILDMODE', 'pie')
-- 
2.25.1

