Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1A19C369D1
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 13:20:46 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.8570.1745414446321966403
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Apr 2025 06:20:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=jf6c3D5f;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-736dd9c4b40so827332b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 06:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1745414445; x=1746019245; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y/ZSMv14eU0FWk1PXg2XdkPrzLYcKOsdZGFPmHXwtw0=;
        b=jf6c3D5f/pHteyxBNUbgikBnzLbaYPI1vdfaEsLi4jMqEh3Icy0zP6i6Ox/8fHQr4J
         +X1dMlQVAzXOqh5m1Q65J/T9pOAqwBGXWcAC8sfKmrIGBsfC/fZRoZe5aj5kZoyOMrFo
         E7L0VvYXMB+jtWLcon6Bp9qCGrIVnXdgscOUF0en+TS2LKw54G5iettLpIhMEOJ7Stlj
         uhyibDC8buufJJGXHyS6dOb9l8+6LXHYY0OnQm0N/IY47fO3hb5kMtud2WIxQf/EWZDu
         YgHcPnhovLrdLHRa695IxDvpDpELw2pF4MJlnQhp4tMmJInmW9yKXIAhXvqKPH97x/Lp
         ri9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745414445; x=1746019245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y/ZSMv14eU0FWk1PXg2XdkPrzLYcKOsdZGFPmHXwtw0=;
        b=JFiHO0ZVdvV/gmxxnWicYEuGTduSIW9Rle0dGs6KbohjrUrFSEr3bxMpoQXnAUFh47
         T83IGZ+gVWs/68oY8/3d6gq8gATsTH3efFcjF1m3Grbop12y6GXTq2yCJxXcDNpgjM/U
         x98oR8I8gd9o+kpQ0Tdpmr/FATYsIFLNBGr23PK2orJlOHprSk8a+zPL/5lYyHj0z2Wl
         Ck6MxrB31tsXk5XBiQE53GvlFfa9dYFkLFqzFS3Txvm3b2WYP7+F12Z27kTtA3XptUd5
         3Qqd4iLHgKVHVq5vigO+WxWbKwMaHbMbTPxIzQnYKGrYyCCjhWAiR7JBkGIeYjTlik0J
         NKrw==
X-Gm-Message-State: AOJu0Yw7M2eN9xMw2mnPpEFG4/O53tzV41Pcio1S73jAcbm1q+tds/fN
	qeZTx1+gdQdDc+76WabJ1gCgrYwXRYq9+ccUU58+fxz3qm9z10kDPOCyvLZwt64S9Lnr89txrl3
	e
X-Gm-Gg: ASbGnct49sEcJPmUHTwlCNt7wRZMbnDucMWI31u5iKyzYmO+2SY8hUESr3bZm7e0h58
	1zEMb0fVuGRVFP7f9mlev6a9nfjKV0Ooj+JUJxcxTgi9Y5NV22LpcA5oLnJsy81xhuTz0DwS+hY
	6g+upfa9FvvVrfExFAJEuLriHUM3dX4nWkVWjfPePz7MFOfbaO3TyWDZ5p3JBZKXLdP5Bhn7kyi
	+RozNK7x1+BCNVMv3a7yevn1maghOnDZMPiVB1Qnblr8G6IZdAvGQLr31hepcFEhsxPd8pwD5kh
	qrvtpKPizUe1kMw9kO/+uLXJyb7MAOk=
X-Google-Smtp-Source: AGHT+IHDiJtXyGYaqx1jW+c+nEYyjARk4b00/M6x+Wn419sKvQNlpzZiYQegayTyS+0646cH0SVNzg==
X-Received: by 2002:a05:6a00:a88b:b0:730:9637:b2ff with SMTP id d2e1a72fcca58-73e135c5945mr4049884b3a.7.1745414445538;
        Wed, 23 Apr 2025 06:20:45 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:371e:10cb:f3ce:33f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8e510bsm10898037b3a.66.2025.04.23.06.20.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 06:20:45 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/14] sqlite3: patch CVE-2025-3277
Date: Wed, 23 Apr 2025 06:20:18 -0700
Message-ID: <2f800295919ac337f038e1678f4c0abb2a6e7f95.1745356684.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745356684.git.steve@sakoman.com>
References: <cover.1745356684.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 13:20:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215300

From: Peter Marko <peter.marko@siemens.com>

Pick commit [1] mentioned in [2].

[1] https://sqlite.org/src/info/498e3f1cf57f164f
[2] https://nvd.nist.gov/vuln/detail/CVE-2025-3277

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../sqlite/sqlite3/CVE-2025-3277.patch        | 28 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.45.3.bb |  4 ++-
 2 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2025-3277.patch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2025-3277.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2025-3277.patch
new file mode 100644
index 0000000000..4e2ed5f1e0
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2025-3277.patch
@@ -0,0 +1,28 @@
+From d7f45414935e4ef6e3361f02a22876f1ee7a04aa Mon Sep 17 00:00:00 2001
+From: drh <>
+Date: Sun, 16 Feb 2025 10:57:25 +0000
+Subject: [PATCH] Add a typecast to avoid 32-bit integer overflow in the
+ concat_ws() function with an enormous separator values and many arguments.
+
+FossilOrigin-Name: 498e3f1cf57f164fbd8380e92bf91b9f26d6aa05d092fcd135d754abf1e5b1b5
+
+CVE: CVE-2025-3277
+Upstream-Status: Backport [https://sqlite.org/src/info/498e3f1cf57f164f]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ sqlite3.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index 08c593e55c..24d0d954d9 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -129594,7 +129594,7 @@ static void concatFuncCore(
+   for(i=0; i<argc; i++){
+     n += sqlite3_value_bytes(argv[i]);
+   }
+-  n += (argc-1)*nSep;
++  n += (argc-1)*(i64)nSep;
+   z = sqlite3_malloc64(n+1);
+   if( z==0 ){
+     sqlite3_result_error_nomem(context);
diff --git a/meta/recipes-support/sqlite/sqlite3_3.45.3.bb b/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
index 03d70bbd38..0e91167eef 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
@@ -3,6 +3,8 @@ require sqlite3.inc
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
-SRC_URI = "http://www.sqlite.org/2024/sqlite-autoconf-${SQLITE_PV}.tar.gz"
+SRC_URI = "http://www.sqlite.org/2024/sqlite-autoconf-${SQLITE_PV}.tar.gz \
+           file://CVE-2025-3277.patch \
+          "
 SRC_URI[sha256sum] = "b2809ca53124c19c60f42bf627736eae011afdcc205bb48270a5ee9a38191531"
 
-- 
2.43.0


