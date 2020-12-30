Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web11.14028.1609368269796327471
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Dec 2020 14:44:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=XqJs4tto;
 spf=pass (domain: konsulko.com, ip: 209.85.222.171, mailfrom: scott.murray@konsulko.com)
Received: by mail-qk1-f171.google.com with SMTP id d14so15112981qkc.13
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Dec 2020 14:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=8inzQ0h3vNJfL8vXDkHLEj6K9nrUceVzS5EirQ/Z43o=;
        b=XqJs4ttoGJcbu9JEkAlWpk3Pz3HjQMbMBim/VcRnHy4O0chaxJPK7TB6oLbYvWJfmy
         /mIVOlq7CZ4I6V7z9GWG6LykQdzpIB/UiIVUJXcM4R4NuSBnlExwxuouj1/wNPgo+UmT
         h3VVpPy6ixwdi2Sj9p7UWRcNr3iP53gJ51D5g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8inzQ0h3vNJfL8vXDkHLEj6K9nrUceVzS5EirQ/Z43o=;
        b=A/Lr2F79HtM+V6YCthgQnm5iepvB031BbLtTurQKp4ZAPs6egI6jKLijBONULd79iP
         i6YKLBT7ztc7M5pf20AjkK2EmOmGRXK/DHEw+7q3Per38df5A6qg8bW9IE98A8lN846d
         Xu2w1daRYcBZKacO6AQo0pjyuxMlYUzk4TwJ4v76FPq41TwDOvsEL/SfwtZOCukBBk6j
         3+ewbUKOKJwHaj7jbFcEfPXRFjdMbCIPYRMf3Loa627LqGEBp0GCUoqlx25N2MR9I418
         hjPwgOOnbhF296OhlPIFxYyajvr04T/kd7yRJEuzTglVKPe6Rao9RMKcYOleN8FRTdVj
         0KwQ==
X-Gm-Message-State: AOAM53009gGt9gvPM1T1QK4emgh8FikZeJgjpAVZOUUfjEUcO0jMPffS
	aUxEuE72dnH2Y0vVrmUhcyDwjuHukJQITA==
X-Google-Smtp-Source: ABdhPJxmTOsJKN/Ps26iegssZ4F5ct2AlFLMczfEAgkqXx5gocacxAz1ukmb0TCkU77xBR2L/4gASw==
X-Received: by 2002:a37:9583:: with SMTP id x125mr21611463qkd.75.1609368268691;
        Wed, 30 Dec 2020 14:44:28 -0800 (PST)
Return-Path: <scott.murray@konsulko.com>
Received: from ghidorah.spiteful.org (198-84-179-103.cpe.teksavvy.com. [198.84.179.103])
        by smtp.gmail.com with ESMTPSA id a77sm28315573qkg.77.2020.12.30.14.44.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Dec 2020 14:44:28 -0800 (PST)
From: "Scott Murray" <scott.murray@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] patch: fix CVE-2019-20633
Date: Wed, 30 Dec 2020 17:44:18 -0500
Message-Id: <d2f33bcd09b6f55f6f562672753f435a19291cab.1609367977.git.scott.murray@konsulko.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1609367977.git.scott.murray@konsulko.com>
References: <cover.1609367977.git.scott.murray@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* CVE detail: https://nvd.nist.gov/vuln/detail/CVE-2019-20633

* upstream tracking: https://savannah.gnu.org/bugs/index.php?56683

* Fixes potential for double free after incomplete fix for CVE-2018-6952
  - src/pch.c (another_hunk): Avoid invalid memory access in context format
    diffs.

Signed-off-by: Scott Murray <scott.murray@konsulko.com>
---
 .../patch/patch/CVE-2019-20633.patch          | 31 +++++++++++++++++++
 meta/recipes-devtools/patch/patch_2.7.6.bb    |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-devtools/patch/patch/CVE-2019-20633.patch

diff --git a/meta/recipes-devtools/patch/patch/CVE-2019-20633.patch b/meta/recipes-devtools/patch/patch/CVE-2019-20633.patch
new file mode 100644
index 0000000000..03988a179c
--- /dev/null
+++ b/meta/recipes-devtools/patch/patch/CVE-2019-20633.patch
@@ -0,0 +1,31 @@
+From 15b158db3ae11cb835f2eb8d2eb48e09d1a4af48 Mon Sep 17 00:00:00 2001
+From: Andreas Gruenbacher <agruen@gnu.org>
+Date: Mon, 15 Jul 2019 19:10:02 +0200
+Subject: Avoid invalid memory access in context format diffs
+
+* src/pch.c (another_hunk): Avoid invalid memory access in context format
+diffs.
+
+CVE: CVE-2019-20633
+Upstream-Status: Backport[https://git.savannah.gnu.org/cgit/patch.git/patch/?id=15b158db3ae11cb835f2eb8d2eb48e09d1a4af48]
+Signed-off-by: Scott Murray <scott.murray@konsulko.com>
+
+---
+ src/pch.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/pch.c b/src/pch.c
+index a500ad9..cb54e03 100644
+--- a/src/pch.c
++++ b/src/pch.c
+@@ -1328,6 +1328,7 @@ another_hunk (enum diff difftype, bool rev)
+ 		  ptrn_prefix_context = context;
+ 		ptrn_suffix_context = context;
+ 		if (repl_beginning
++		    || p_end <= 0
+ 		    || (p_end
+ 			!= p_ptrn_lines + 1 + (p_Char[p_end - 1] == '\n')))
+ 		  {
+-- 
+cgit v1.2.1
+
diff --git a/meta/recipes-devtools/patch/patch_2.7.6.bb b/meta/recipes-devtools/patch/patch_2.7.6.bb
index b5897b357a..1997af0c25 100644
--- a/meta/recipes-devtools/patch/patch_2.7.6.bb
+++ b/meta/recipes-devtools/patch/patch_2.7.6.bb
@@ -10,6 +10,7 @@ SRC_URI += "file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
             file://0001-Invoke-ed-directly-instead-of-using-the-shell.patch \
             file://0001-Don-t-leak-temporary-file-on-failed-ed-style-patch.patch \
             file://0001-Don-t-leak-temporary-file-on-failed-multi-file-ed.patch \
+            file://CVE-2019-20633.patch \
 "
 
 SRC_URI[md5sum] = "4c68cee989d83c87b00a3860bcd05600"
-- 
2.26.2

