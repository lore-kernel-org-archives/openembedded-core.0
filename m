Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39A5FCCA482
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 16:23:42 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web09.27529.1656606214171091060
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 09:23:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=E1RPjZV6;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id y141so784176pfb.7
        for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 09:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=X2lASPNIM3GENAnXfLUDW63G/RlsVize69KUba40Bkw=;
        b=E1RPjZV61ptXdS1RRgXhaOnbOHSiIWAYxOdN91ycwUGFAAkznmxPXkXtnZHhJkEAGS
         ZpIIYNljw7u8LG0FGp+m5avsjXS2bumBsdVQamVVV1xDRMgkBzWS3MsSQneNYjEnxcET
         cpBqlH11IKL3KlIZYyG0HXhGEPST9nEpshhtC3fSq+7j201r0vrAe3C7kC7zKC9lNYHw
         rFlcGtYJI47evgOhpybbiTbJbFjPzf4ig7MAFjvr1gsCCfLrc86tKj3jd08bXW4HdQ+K
         rbisMY4kFS6RhCdqrG5UCj098FKQyq0+LR8x7S/jpEiGc9WChL8pTlL3Y2gfRtqKCFTe
         WMxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=X2lASPNIM3GENAnXfLUDW63G/RlsVize69KUba40Bkw=;
        b=JM/Z0IymKSn50aF366OkrABe8fb+1H/0dC5jENX+PWL0UE5na9/rG+Yw0gMSkb7eaQ
         LUeZvENXMs4oQ7HxIoAdvAwghIHMVBT6KD7K+iX91XnXqkzAWvgy3MZ8TDsycgIESUtV
         sYgquOXFwxGdPYwQdtP/rlFD9IRcdVDEq0ShBSVcZOLqnrCJlTDtxJRJ8m7BX2EvVD1B
         JrPAtKqkWMz+Xw/cgboAUed2asp6pe0ZbPNjieK0l20dSff6ihNBieO7vBCwXEIEgfa6
         z0pbEONIntyYlg75OxsNbQEWZrvCGmmFhf7unXUgCBh/gtTcojhfYv36Jx05PT4rHo7L
         UNGw==
X-Gm-Message-State: AJIora/qycDT8ymynfHnmsOlXYGUiW578LlL1kiQqoKfVAQ4v13c9NQy
	0FkKgdjikWN4RpneJTqF0gmGKbq9yUZIIKiM
X-Google-Smtp-Source: 
 AGRyM1tJTI75Lo8P0UmxueOFyTf6Dghka+nDttTpbCMGj5Z+FhJ4Y7fvB0cT4mgSn/Z5N8AelsDoOA==
X-Received: by 2002:a63:545:0:b0:40d:8232:c36f with SMTP id
 66-20020a630545000000b0040d8232c36fmr8284364pgf.622.1656606212934;
        Thu, 30 Jun 2022 09:23:32 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 t129-20020a625f87000000b005259578e8fcsm10517611pfb.181.2022.06.30.09.23.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 09:23:32 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/12] unzip: Port debian fixes for two CVEs
Date: Thu, 30 Jun 2022 06:23:04 -1000
Message-Id: 
 <097469513f6dea7c678438e71a152f4e77fe670d.1656605800.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1656605800.git.steve@sakoman.com>
References: <cover.1656605800.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jun 2022 16:23:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167420

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Add two fixes from debian for two CVEs. From:

https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1010355

I wans't able to get the reproducers to work but the added error
checking isn't probably a bad thing.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 054be00a632c2918dd1f973e76514e459fc6f017)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../unzip/unzip/CVE-2022-0529.patch           | 39 +++++++++++++++++++
 .../unzip/unzip/CVE-2022-0530.patch           | 33 ++++++++++++++++
 meta/recipes-extended/unzip/unzip_6.0.bb      |  2 +
 3 files changed, 74 insertions(+)
 create mode 100644 meta/recipes-extended/unzip/unzip/CVE-2022-0529.patch
 create mode 100644 meta/recipes-extended/unzip/unzip/CVE-2022-0530.patch

diff --git a/meta/recipes-extended/unzip/unzip/CVE-2022-0529.patch b/meta/recipes-extended/unzip/unzip/CVE-2022-0529.patch
new file mode 100644
index 0000000000..1c1e120deb
--- /dev/null
+++ b/meta/recipes-extended/unzip/unzip/CVE-2022-0529.patch
@@ -0,0 +1,39 @@
+https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1010355
+
+CVE: CVE-2022-0529
+Upstream-Status: Inactive-Upstream [need a new release]
+
+diff --git a/process.c b/process.c
+index d2a846e..99b9c7b 100644
+--- a/process.c
++++ b/process.c
+@@ -2507,13 +2507,15 @@ char *wide_to_local_string(wide_string, escape_all)
+   char buf[9];
+   char *buffer = NULL;
+   char *local_string = NULL;
++  size_t buffer_size;
+ 
+   for (wsize = 0; wide_string[wsize]; wsize++) ;
+ 
+   if (max_bytes < MAX_ESCAPE_BYTES)
+     max_bytes = MAX_ESCAPE_BYTES;
+ 
+-  if ((buffer = (char *)malloc(wsize * max_bytes + 1)) == NULL) {
++  buffer_size = wsize * max_bytes + 1;
++  if ((buffer = (char *)malloc(buffer_size)) == NULL) {
+     return NULL;
+   }
+ 
+@@ -2552,7 +2554,11 @@ char *wide_to_local_string(wide_string, escape_all)
+       /* no MB for this wide */
+         /* use escape for wide character */
+         char *escape_string = wide_to_escape_string(wide_string[i]);
+-        strcat(buffer, escape_string);
++        size_t buffer_len = strlen(buffer);
++        size_t escape_string_len = strlen(escape_string);
++        if (buffer_len + escape_string_len + 1 > buffer_size)
++          escape_string_len = buffer_size - buffer_len - 1;
++        strncat(buffer, escape_string, escape_string_len);
+         free(escape_string);
+     }
+   }
diff --git a/meta/recipes-extended/unzip/unzip/CVE-2022-0530.patch b/meta/recipes-extended/unzip/unzip/CVE-2022-0530.patch
new file mode 100644
index 0000000000..363dafddc9
--- /dev/null
+++ b/meta/recipes-extended/unzip/unzip/CVE-2022-0530.patch
@@ -0,0 +1,33 @@
+https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1010355
+
+CVE: CVE-2022-0530
+Upstream-Status: Inactive-Upstream [need a new release]
+
+diff --git a/fileio.c b/fileio.c
+index 6290824..77e4b5f 100644
+--- a/fileio.c
++++ b/fileio.c
+@@ -2361,6 +2361,9 @@ int do_string(__G__ length, option)   /* return PK-type error code */
+                   /* convert UTF-8 to local character set */
+                   fn = utf8_to_local_string(G.unipath_filename,
+                                             G.unicode_escape_all);
++                  if (fn == NULL)
++                    return PK_ERR;
++
+                   /* make sure filename is short enough */
+                   if (strlen(fn) >= FILNAMSIZ) {
+                     fn[FILNAMSIZ - 1] = '\0';
+diff --git a/process.c b/process.c
+index d2a846e..715bc0f 100644
+--- a/process.c
++++ b/process.c
+@@ -2605,6 +2605,8 @@ char *utf8_to_local_string(utf8_string, escape_all)
+   int escape_all;
+ {
+   zwchar *wide = utf8_to_wide_string(utf8_string);
++  if (wide == NULL)
++    return NULL;
+   char *loc = wide_to_local_string(wide, escape_all);
+   free(wide);
+   return loc;
+
diff --git a/meta/recipes-extended/unzip/unzip_6.0.bb b/meta/recipes-extended/unzip/unzip_6.0.bb
index 3e253afe65..fa57c8f5bd 100644
--- a/meta/recipes-extended/unzip/unzip_6.0.bb
+++ b/meta/recipes-extended/unzip/unzip_6.0.bb
@@ -27,6 +27,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/infozip/UnZip%206.x%20%28latest%29/UnZip%206.0/
 	file://CVE-2019-13232_p2.patch \
 	file://CVE-2019-13232_p3.patch \
         file://CVE-2021-4217.patch \
+        file://CVE-2022-0529.patch \
+        file://CVE-2022-0530.patch \
 "
 UPSTREAM_VERSION_UNKNOWN = "1"
 
-- 
2.25.1


