Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.1505.1588648828241795886
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2020 20:20:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=zfO+Uxkw;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id 145so195333pfw.13
        for <openembedded-core@lists.openembedded.org>; Mon, 04 May 2020 20:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=El4KXtogO5bUlBYbLzguW7g5G0Ueciz0LK5eNvv+xg8=;
        b=zfO+UxkwfHlA/dM//4zgKVhxdvUB5DGBsRr0jgmZbYs66Xl323wbwE9KxrACw+eKNb
         TB/3vyA9NqxarkIRtFtBZnD078aQt1FIkZJZjxdjyaHySF1xdi2t+1MOkEnRC+qFUNN/
         803pZ5HVNuJc3n/BUoxr3EvbaPguxuDCRTohXQT+MFvPeYEOISkmKENYQLhAieVhHBq/
         66ej3QGZ5O/mJw3/B77q4VAgscZ2VdFggBpOxsHmm+ZkztOK1bcMw4i21F1ieR4j3A5q
         ZRYNQ0qAItDo9evXtSp0zZEGdkz5Yg/2touLK0kaOodVx1ZNOCDu5+Vh11wV2btKoLGk
         wduw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=El4KXtogO5bUlBYbLzguW7g5G0Ueciz0LK5eNvv+xg8=;
        b=fREvQpJti+DflbIpByk1rYKBSJW7tjxoX/o68dbaaZ6jZeT7d2GIg5kQw0TZwBrfYR
         yKydIAolGK7x1VHxk0eiWY1Ow9L2T+EjJA9b+VcFPB1C78KKwQk/wMvPx96fec28TlHV
         6oHWxw5BRBJnuKPos0LRlYx+OHcRA49FkF3z8AsT805gwjmWavbJH2ROAv/QcgM6YXyA
         GsTLfaQaTQxlkgGQ88jiYvRSucqdQ1aqgROGSt/dha4kDSM0UMz7Ty7YF8vls3LvdSmr
         ppmyqRiL0jf2H0hCXEKLsav5G0gjeSVli+i10UTxqj3YpSWDBhjC+DT+UMfntYNAy4zf
         UIjg==
X-Gm-Message-State: AGi0PuaSj9sq71wRbJHeAXPkjZHcWUb29/srA6xZ2cuHYCtreJVKp9g1
	/Gy/JydaqAfL10T86D5Xd3LS2DSrLZOIWA==
X-Google-Smtp-Source: APiQypL4tSyZDFPHxkYUhjxLGy8Zbb5k35PTuvBCj0ihtaRMDa19Qy1TsG1cYXwPoyCgQ1eBAE0QmQ==
X-Received: by 2002:a63:6747:: with SMTP id b68mr1274969pgc.142.1588648827304;
        Mon, 04 May 2020 20:20:27 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 20sm503379pfx.116.2020.05.04.20.20.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 20:20:26 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/28] insane.bbclass: Add test for shebang line length
Date: Mon,  4 May 2020 17:19:05 -1000
Message-Id: <9ed54437b00aed1d41993f7658820d8adfb09282.1588638879.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1588638879.git.steve@sakoman.com>
References: <cover.1588638879.git.steve@sakoman.com>

From: Domarys Correa <domarys.correa@ossystems.com.br>

Shebang lines longer than 128 characters can give an error
depending on the operating system.
This implements a test that signals an error when locating a
faulty shebang.

YOCTO: #11053

Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/insane.bbclass | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 478240fa57..7fc8f33a98 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -35,7 +35,7 @@ ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
             split-strip packages-list pkgv-undefined var-undefined \
             version-going-backwards expanded-d invalid-chars \
             license-checksum dev-elf file-rdeps configure-unsafe \
-            configure-gettext perllocalpod \
+            configure-gettext perllocalpod shebang-size \
             "
 # Add usrmerge QA check based on distro feature
 ERROR_QA_append = "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', ' usrmerge', '', d)}"
@@ -83,6 +83,29 @@ def package_qa_add_message(messages, section, new_msg):
     else:
         messages[section] = messages[section] + "\n" + new_msg
 
+QAPATHTEST[shebang-size] = "package_qa_check_shebang_size"
+def package_qa_check_shebang_size(path, name, d, elf, messages):
+    if os.path.islink(path) or elf:
+        return
+
+    try:
+        with open(path, 'rb') as f:
+            stanza = f.readline(130)
+    except IOError:
+        return
+
+    if stanza.startswith(b'#!'):
+        #Shebang not found
+        try:
+            stanza = stanza.decode("utf-8")
+        except UnicodeDecodeError:
+            #If it is not a text file, it is not a script
+            return
+
+        if len(stanza) > 129:
+            package_qa_add_message(messages, "shebang-size", "%s: %s maximum shebang size exceeded, the maximum size is 128." % (name, package_qa_clean_path(path, d)))
+            return
+
 QAPATHTEST[libexec] = "package_qa_check_libexec"
 def package_qa_check_libexec(path,name, d, elf, messages):
 
-- 
2.17.1

