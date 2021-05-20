Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.514.1621543747602374085
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 May 2021 13:49:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SUF81EnH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id y14so16881657wrm.13
        for <openembedded-core@lists.openembedded.org>; Thu, 20 May 2021 13:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/mcphgtknTsDIxkKdkF+Wv7I/sjQvRds6QfZWmnYo54=;
        b=SUF81EnH8BCWKXrQeywmDInJkOnDmj8dVge+wNG+29tfrhucmfKQTY1ChBTE+XW1IC
         HIiY1W5jmc1kxgXjZHkZcL8fUITC54Fo0Am5kQ4Cf3Ho9vmliHkG70cQD/dQ8cJiUrjt
         FQ04Ru4X2zD2DCqNlZQMogEEPVSkg9P+AMhA0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/mcphgtknTsDIxkKdkF+Wv7I/sjQvRds6QfZWmnYo54=;
        b=kJzhm0nS0HYiuP4ukTkWZANaj5iqRPenUknRc6PfnI5k70vBZy6wLAfuxuQEBj+Bn2
         17AyWnwA7boIkzBtvKXDIvZe9x4i+oTs3DROqxj0D4ebWlYArvb9nxJIT5QrIWBfQgoG
         SSsD/V1bmE3tB6RR2Sci5ZESLUgcBfXyNA0JusvuIZuH5qlujmk05+7zXs8DG9TbRbUV
         vE6pXKIAih295u+wy358/USRxHAf4stsZwiTk+ZI6EmyU8i/W15KvutC8o2yHEh5izOb
         co31RPvH22s6S7uqJ/XvFqhXSSRPh+NR67ULxhE7AAU6ba7btNJFHq4k+wrhAhpLzSOr
         GRKQ==
X-Gm-Message-State: AOAM530UgMJ84trlWWmDr/AwHyR3NhIJPDb3uX0bAf4izUTJFm0/Td6O
	PzSzWOraGgJGYgkcG3FfRp7215G/8Fxc8w==
X-Google-Smtp-Source: ABdhPJzFi4Z0zjYsyUHHzKdEhBqbtMqqFy7fwYh4XrfFka/JI8aqZ9z6PREpeOW5YizHhaxRZZw2Fw==
X-Received: by 2002:a05:6000:1c2:: with SMTP id t2mr5903639wrx.424.1621543746108;
        Thu, 20 May 2021 13:49:06 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:c394:d896:3913:6568])
        by smtp.gmail.com with ESMTPSA id n189sm3768061wme.9.2021.05.20.13.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 13:49:05 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Tony Tascioglu <tony.tascioglu@windriver.com>
Subject: [hardknott] [PATCH 06/28] libxml2: fix CVE-2021-3517
Date: Thu, 20 May 2021 21:48:40 +0100
Message-Id: <20210520204902.2527687-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210520204902.2527687-1-richard.purdie@linuxfoundation.org>
References: <20210520204902.2527687-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tony Tascioglu <tony.tascioglu@windriver.com>

Fixes heap-based buffer overflow in xmlEncodeEntitiesInternal() in entities.c

CVE: CVE-2021-3517
Upstream-status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/bf22713507fe1fc3a2c4b525cf0a88c2dc87a3a2]

Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../libxml/libxml2/CVE-2021-3517.patch        | 54 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.10.bb    |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2021-3517.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2021-3517.patch b/meta/recipes-core/libxml/libxml2/CVE-2021-3517.patch
new file mode 100644
index 00000000000..b6204f655a9
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2021-3517.patch
@@ -0,0 +1,54 @@
+From df3de1376585f7a273d70023f92a530395957324 Mon Sep 17 00:00:00 2001
+From: Joel Hockey <joel.hockey@gmail.com>
+Date: Sun, 16 Aug 2020 17:19:35 -0700
+Subject: [PATCH 1/3] Validate UTF8 in xmlEncodeEntities
+
+Code is currently assuming UTF-8 without validating. Truncated UTF-8
+input can cause out-of-bounds array access.
+
+Adds further checks to partial fix in 50f06b3e.
+
+Fixes #178
+
+CVE: CVE-2021-3517
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/bf22713507fe1fc3a2c4b525cf0a88c2dc87a3a2]
+
+Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
+---
+ entities.c | 16 +++++++++++++++-
+ 1 file changed, 15 insertions(+), 1 deletion(-)
+
+diff --git a/entities.c b/entities.c
+index d575e9d1..7cdbc4de 100644
+--- a/entities.c
++++ b/entities.c
+@@ -666,11 +666,25 @@ xmlEncodeEntitiesInternal(xmlDocPtr doc, const xmlChar *input, int attr) {
+ 	    } else {
+ 		/*
+ 		 * We assume we have UTF-8 input.
++		 * It must match either:
++		 *   110xxxxx 10xxxxxx
++		 *   1110xxxx 10xxxxxx 10xxxxxx
++		 *   11110xxx 10xxxxxx 10xxxxxx 10xxxxxx
++		 * That is:
++		 *   cur[0] is 11xxxxxx
++		 *   cur[1] is 10xxxxxx
++		 *   cur[2] is 10xxxxxx if cur[0] is 111xxxxx
++		 *   cur[3] is 10xxxxxx if cur[0] is 1111xxxx
++		 *   cur[0] is not 11111xxx
+ 		 */
+ 		char buf[11], *ptr;
+ 		int val = 0, l = 1;
+ 
+-		if (*cur < 0xC0) {
++		if (((cur[0] & 0xC0) != 0xC0) ||
++		    ((cur[1] & 0xC0) != 0x80) ||
++		    (((cur[0] & 0xE0) == 0xE0) && ((cur[2] & 0xC0) != 0x80)) ||
++		    (((cur[0] & 0xF0) == 0xF0) && ((cur[3] & 0xC0) != 0x80)) ||
++		    (((cur[0] & 0xF8) == 0xF8))) {
+ 		    xmlEntitiesErr(XML_CHECK_NOT_UTF8,
+ 			    "xmlEncodeEntities: input not UTF-8");
+ 		    if (doc != NULL)
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/libxml/libxml2_2.9.10.bb b/meta/recipes-core/libxml/libxml2_2.9.10.bb
index 07ae68610c8..ad612379b3f 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.10.bb
@@ -24,6 +24,7 @@ SRC_URI = "http://www.xmlsoft.org/sources/libxml2-${PV}.tar.gz;name=libtar \
            file://CVE-2019-20388.patch \
            file://CVE-2020-24977.patch \
            file://fix-python39.patch \
+           file://CVE-2021-3517.patch \
            "
 
 SRC_URI[libtar.md5sum] = "10942a1dc23137a8aa07f0639cbfece5"
-- 
2.30.2

