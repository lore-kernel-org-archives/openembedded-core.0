Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
 by mx.groups.io with SMTP id smtpd.web10.85.1586888436301673228
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Apr 2020 11:20:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=CElFvpKH;
 spf=pass (domain: ossystems.com.br, ip: 209.85.219.68, mailfrom: domarys.correa@ossystems.com.br)
Received: by mail-qv1-f68.google.com with SMTP id s3so328867qvk.12
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2020 11:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=XHEfvtQdC2l7G62Qupqdj4lEYQO/YF3k80R52j46UGE=;
        b=CElFvpKHaTywhupjgEROHw4pLQ2h1QV10/5bZS3D2Lr/QF3uiz5UwHOz+AlK2O7yNi
         Y/Fry9+8WkJaDubk7kSG2iO8fM9z8rVsIq6Dv6zKaNCRzVw+p8Kfyo25YmHxi8LQ9pJw
         0cw3+TTjStxb4kxyjKtwfzmVL6hW/QsT5LwI+S64QFpX29JBRW8w5zJZwBZ8VRCTYs1d
         JDJqQbQsiYmLymOXpKxX3XYN3qx7xaNyDj3KjC18PJUlYH/Yon89vnH7x3XlkNClmhNJ
         UTWso51lyCZVSBmQcNkejYUTXDuqnkd+JBXToA1kz5fYSPSNeas2ZGdDNpsaQiFLZQRX
         fynQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=XHEfvtQdC2l7G62Qupqdj4lEYQO/YF3k80R52j46UGE=;
        b=C2fLZ/INSo0LhRVqvFT1dW/YwXY6tZwmTzbJVfHGjm3otpgIBjI57+jpmaoeadLEJi
         rm4SGucmWbA0gCH6oXNUusTpDF5DnhieX50mvl1g6rdrZoD7FRtL9ZFfEqfdmaeJIwur
         fgPvD5fq1SWr5SGlJhzsHnkkGnJYlYDSInU8FQcMMcBqEMNEG6nRPgFNmCLvim0El6T/
         CbEHSElQogO0rxp3B5DljSbG+CJclPzMLlRAlnwA37+eKSUzxkHkkXnvGe8NT7g0Rc9t
         XSi9nxeRBf/XkrbkXLOXUPTbq1a20GzUzTi8KPTDRLGEpmLI1zgxTO5tdlGjxMoE6K7G
         5SEg==
X-Gm-Message-State: AGi0Puaj2VU8Cwbv6yT4kyPsBVsH0nDApqvQW2TaHAHJ/52uGtG1XAL3
	rPWM0nzEtugQMRTZXEVBDb0tLPG2u/Y=
X-Google-Smtp-Source: APiQypIrqmGdPNwKiG95p3nXsQ2ncoffWfzV8Er5w3k+aRmT1iSc8BRd1ZOYZE8b1j5Tq82Rs2gjUQ==
X-Received: by 2002:a0c:8444:: with SMTP id l62mr1295720qva.239.1586888434947;
        Tue, 14 Apr 2020 11:20:34 -0700 (PDT)
Return-Path: <domarys.correa@ossystems.com.br>
Received: from localhost.localdomain ([2804:7f4:c192:859a:b8f6:f65e:fd7a:63fc])
        by smtp.gmail.com with ESMTPSA id j6sm11396511qti.25.2020.04.14.11.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 11:20:33 -0700 (PDT)
From: "Domarys Correa" <domarys.correa@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Cc: Domarys Correa <domarys.correa@ossystems.com.br>
Subject: [OE-core][PATCH v2] insane.bbclass: Add test for shebang line length
Date: Tue, 14 Apr 2020 15:20:20 -0300
Message-Id: <20200414182020.11777-1-domarys.correa@ossystems.com.br>
X-Mailer: git-send-email 2.17.1

Shebang lines longer than 128 characters can give an error
depending on the operating system.
This implements a test that signals an error when locating a
faulty shebang.

YOCTO: #11053

Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
---
 meta/classes/insane.bbclass | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 9605ac2bae..bcb1464c91 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -34,7 +34,7 @@ ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
             split-strip packages-list pkgv-undefined var-undefined \
             version-going-backwards expanded-d invalid-chars \
             license-checksum dev-elf file-rdeps configure-unsafe \
-            configure-gettext perllocalpod \
+            configure-gettext perllocalpod shebang-size \
             "
 # Add usrmerge QA check based on distro feature
 ERROR_QA_append = "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', ' usrmerge', '', d)}"
@@ -82,6 +82,29 @@ def package_qa_add_message(messages, section, new_msg):
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

