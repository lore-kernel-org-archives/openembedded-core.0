Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9565DC3DA42
	for <webhook@archiver.kernel.org>; Tue,  9 Jul 2024 19:30:19 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web10.4648.1720553411946324630
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jul 2024 12:30:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=EuOiqGnY;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-767506e1136so68669a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jul 2024 12:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1720553411; x=1721158211; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tku0P874C6x3JdCQfpvSaumX2wl4mEi4nJ2AyXCkXlw=;
        b=EuOiqGnYUVcZ4TPeAd/12ytVPdBIA90C//QFuANuLxbM1/WTBylLSDwqbyj9vALUpC
         whIBngsHNHVn1zXs/eO7c2EFPztNBQ1QSOpShDgPJtvQBh+BG837D/+3XmW5eqoXsVlN
         qnS0OrA+bOjMhsX5PUeCVVgbGjSqwyw2Aql6IwgFaBqFuNhMcaocqGafpsZy6eFmiD4f
         OhVQDC6vZZqqGbJnxAnOxTAxVOzRXh0kPhoKOL0DKvwFWCXD7Jiusdlm68EJlWQrDgqW
         6+d5IQmeWg85m4e7p3OiAubj6x1DvnbfjO2sRCn8LmEMnpGhbQ+wGa6ObDNxZpy52Hvo
         h+Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720553411; x=1721158211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tku0P874C6x3JdCQfpvSaumX2wl4mEi4nJ2AyXCkXlw=;
        b=vVgxXquWmDdUWzPi49Ixiowzgmz3fZfoyvgk/cChh3+iO3LcdKXPRdaizXBW3eH6O5
         E3h7zwcadf0+8kPJ4Wd9kimTezCrqiOXcWB2XTd8Z/ftDZ9QEXRYXaj3r+jLNQz9I4Kr
         FXBUaDYo0ZwkwIZySCpzeQGEPelENQMucWRoptDzYIjx3lo+HxpQs7ZDYQ3W7JVW96JP
         TWpejFp56C+9NqHpOzS97WXxiGTel1/SokxaB2rWH6v0Vh4uyhvgsHfOuuY2CLY0eRiy
         6HPMycSK03UcFM13m1jtXLi2KHbzTLQm5ecsp9rx/MwgBDQOGduxf77vf4GEki10ZC/N
         jCQQ==
X-Gm-Message-State: AOJu0YzNiCMwVrcOYXOqb7fvwrAC3sBExlFTK+WJ+Jvxrr8VMOIiKbVZ
	/Fysn2o6KBQqKbkCVOZQZQMlA1FCCRs0tpxwvJ9ZtOShKGvKfRl6XaCMJUMoi1SI3QbB16A4VUk
	d
X-Google-Smtp-Source: AGHT+IGlDNXH2dEhVZvyc/8sL/70P1ktBcsK6V9WZ17Tsbem3OYpdF8SI965RNl4RN0FxqOdziLBEA==
X-Received: by 2002:a05:6a20:8423:b0:1c2:a29b:efb4 with SMTP id adf61e73a8af0-1c2a29bf269mr2727641637.24.1720553411047;
        Tue, 09 Jul 2024 12:30:11 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b438995a8sm2282780b3a.10.2024.07.09.12.30.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 12:30:10 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 4/7] apt: runtime error: filename too long (tmpdir length)
Date: Tue,  9 Jul 2024 12:29:57 -0700
Message-Id: <dafdf9bb9e9d944b9f455c2be8cf698496200717.1720553275.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720553275.git.steve@sakoman.com>
References: <cover.1720553275.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jul 2024 19:30:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201677

From: Changqing Li <changqing.li@windriver.com>

when the tmpdir dir is longer than 220, there is no files saved in
tmp/sysroots/x86_64-linux/var/lib/apt/lists/ after run apt-get update,
this is because apt-get uses the path as the file name, but the file
name can't be longer than 255 according to /usr/include/linux/limits.h.

[YOCTO #2688]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>

Take back from https://git.openembedded.org/openembedded-core/commit/?id=9a0c0393871eda4bbcecfdd4b595f0c1b8e42edf
Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...he-filename-can-t-be-longer-than-255.patch | 40 +++++++++++++++++++
 meta/recipes-devtools/apt/apt_2.6.1.bb        |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-devtools/apt/apt/0001-strutl.cc-the-filename-can-t-be-longer-than-255.patch

diff --git a/meta/recipes-devtools/apt/apt/0001-strutl.cc-the-filename-can-t-be-longer-than-255.patch b/meta/recipes-devtools/apt/apt/0001-strutl.cc-the-filename-can-t-be-longer-than-255.patch
new file mode 100644
index 0000000000..311c3664ad
--- /dev/null
+++ b/meta/recipes-devtools/apt/apt/0001-strutl.cc-the-filename-can-t-be-longer-than-255.patch
@@ -0,0 +1,40 @@
+From 918295aa1320718d342116f76c98d2289d377800 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Tue, 18 Jun 2024 10:32:55 +0800
+Subject: [PATCH] strutl.cc: the filename can't be longer than 255
+
+The URItoFileName translates the path into the filename, but the
+filename can't be longer than 255 according to
+/usr/include/linux/limits.h.
+
+Truncate it when it is longer than 240 (leave some spaces for
+".Packages" and "._Release" suffix)
+
+Upstream-Status: Submitted [https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1073591]
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ apt-pkg/contrib/strutl.cc | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/apt-pkg/contrib/strutl.cc b/apt-pkg/contrib/strutl.cc
+index 67100f1..5076b35 100644
+--- a/apt-pkg/contrib/strutl.cc
++++ b/apt-pkg/contrib/strutl.cc
+@@ -565,7 +565,12 @@ string URItoFileName(const string &URI)
+    // "\x00-\x20{}|\\\\^\\[\\]<>\"\x7F-\xFF";
+    string NewURI = QuoteString(U,"\\|{}[]<>\"^~_=!@#$%^&*");
+    replace(NewURI.begin(),NewURI.end(),'/','_');
+-   return NewURI;
++
++   // Truncate from the head when it is longer than 240
++   if(NewURI.length() > 240)
++       return NewURI.substr(NewURI.length() - 240, NewURI.length() - 1);
++   else
++       return NewURI;
+ }
+ 									/*}}}*/
+ // Base64Encode - Base64 Encoding routine for short strings		/*{{{*/
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/apt/apt_2.6.1.bb b/meta/recipes-devtools/apt/apt_2.6.1.bb
index e688d30cae..1eec7fe7a6 100644
--- a/meta/recipes-devtools/apt/apt_2.6.1.bb
+++ b/meta/recipes-devtools/apt/apt_2.6.1.bb
@@ -14,6 +14,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/a/apt/${BPN}_${PV}.tar.xz \
            file://0001-Hide-fstatat64-and-prlimit64-defines-on-musl.patch \
            file://0001-aptwebserver.cc-Include-array.patch \
            file://0001-Remove-using-std-binary_function.patch \
+           file://0001-strutl.cc-the-filename-can-t-be-longer-than-255.patch \
            "
 
 SRC_URI:append:class-native = " \
-- 
2.34.1


