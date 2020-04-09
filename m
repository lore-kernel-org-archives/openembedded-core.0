Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.web12.18483.1586464752910268989
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2020 13:39:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=ixGCQS/y;
 spf=pass (domain: ossystems.com.br, ip: 209.85.160.196, mailfrom: domarys.correa@ossystems.com.br)
Received: by mail-qt1-f196.google.com with SMTP id x2so1147953qtr.0
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2020 13:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=779tvUZvztZ3gFKtlhU8yajFQu0GqKFx+PJiNw62BVU=;
        b=ixGCQS/yYgvnhVI9rhEFxBpBapRIVVi45mFUpNVgZkaWDKy1aEAyqGa9xits2LN1ZE
         K+z+Q+qXj8XFTj/JOLfDIOgYE0zKkvQv5R5TRNhrrC+Kt7GAxbgKtm+w8/H2xOO01Ifw
         aUsyVVju+b35Tzp1VOHth1At/GQ55H73axYvnxkRdxEOmCTp+h7tCkQ6WOzogF5eqJE1
         drj1JJX3DjXLXzlL2YitN+oK7MW6psq9ZC30CnGv0nv0xj+rYWvViLt3TF6TKr11h1+1
         1CCEC4RpGJqzxo6NnCWw907yiVBcBaUZj4piZVCecN1xrP/sUbACtezJL2NCtMnnZ7Ud
         RfZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=779tvUZvztZ3gFKtlhU8yajFQu0GqKFx+PJiNw62BVU=;
        b=l3eznh3WyZCQ5Lzd+GdaZh34ORcWbbAVNEnBhY/POsQuTTbYv2WsvF0diyM+pbCMGV
         ZpcEt/0GMi0RMtDSWTF/fQHuU9DRUPRW5EPhRximmU7W/LSXuJA7zEU6ylCLpLmAuiYL
         GTNzmnpp2GMypbXqrYcEI6oVjbV9C7dtT7MYVikUNh42NlBu4cvISUX7fl3V5QofxktQ
         KAmakozsNlEoAvs3yztzK6YyWsXSjfkEPX6mRzi8ilF8Wb0mpu89kv0X9flcSlnmHYst
         Dq3eUnwXtka+DrfNMhozsIrzDT7uS4Ofvl3xixOxi7J73R7ocy2EUNgXVejBOYwfoL/K
         vlvw==
X-Gm-Message-State: AGi0PuboX87jOWhosL6TUi1Ar98eEw9caFnxAERzhq+e5+pZyxInmJp2
	bK8VZtwMCsOJ58s9hZLiDLnXoh2MQ6g=
X-Google-Smtp-Source: APiQypIfNY8ySRORRvBgQB3y982QUZbxrDhresDyVKRzs96nMjCoqgq3tD6UuIp34jU4ra0Im/qPKg==
X-Received: by 2002:ac8:6d31:: with SMTP id r17mr1396413qtu.68.1586464751822;
        Thu, 09 Apr 2020 13:39:11 -0700 (PDT)
Return-Path: <domarys.correa@ossystems.com.br>
Received: from localhost.localdomain ([2804:7f4:c193:45a1:2993:f0ba:b20a:e678])
        by smtp.gmail.com with ESMTPSA id x65sm22502670qkd.78.2020.04.09.13.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2020 13:39:10 -0700 (PDT)
From: "Domarys Correa" <domarys.correa@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Cc: Domarys Correa <domarys.correa@ossystems.com.br>
Subject: [PATCH] insane.bbclass: Add test for shebang line length
Date: Thu,  9 Apr 2020 17:38:49 -0300
Message-Id: <20200409203849.12014-1-domarys.correa@ossystems.com.br>
X-Mailer: git-send-email 2.17.1

Shebang lines longer than 128 characters can give an error
depending on the operating system.
This implements a test that signals an error when locating a
faulty shebang.

YOCTO: #11053

Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
---
 meta/classes/insane.bbclass | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 9605ac2bae..9a8ea54974 100644
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
@@ -82,6 +82,26 @@ def package_qa_add_message(messages, section, new_msg):
     else:
         messages[section] = messages[section] + "\n" + new_msg
 
+QAPATHTEST[shebang-size] = "package_qa_check_shebang_size"
+def package_qa_check_shebang_size(path, name, d, elf, messages):
+    if os.path.islink(path) or elf:
+        return
+
+    with open(path, 'rb') as f:
+        stanza = f.readline(130)
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

