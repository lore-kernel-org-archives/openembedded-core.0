Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A60AC433EF
	for <webhook@archiver.kernel.org>; Sun,  3 Jul 2022 19:36:26 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.63994.1656876984055619540
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Jul 2022 12:36:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=8FIXIU7+;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id o15so2884233pjh.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Jul 2022 12:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=QdGyJHuYju6tYqVzJtYtiahpMlu3fVWgYyw8TBmSkUM=;
        b=8FIXIU7+8tlSnNK7mgAtf0l79CYPsNqx+TswMTaRlhdgj+/t8YD7mbS+bnJTgZXwsF
         TG9ywCNiMnwfbEevMhc/s19QAWQjNe3W9uaxexwKBQWXfNiKtdMz+G1Z4DVI8xGpV80Z
         zTVZJHXn8Qso5SYMXJ/+VK6XhPAHhjL8NjTew2w5hCHVB0dehc7mFuRA6sam2Gu+wIi0
         xZ/EZyPP9ZxqDgQaxDJbUcJ1zMjULYaOgboGX2TWXQ95e54DhGJq2MsIBMOhcltUWhuc
         680xsp/SId9DJaURhVFEmMagzEoBzyNi9BigukY/aELHwizf7ML94OUhZsG/xHlT50w8
         aq/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QdGyJHuYju6tYqVzJtYtiahpMlu3fVWgYyw8TBmSkUM=;
        b=WoorHsj/W+1X1mjkPq2ENKJKDq7C0PkbMcyKuq8MR6gvEu7i6Uf8Hq6jkF1zcCaM82
         u61eC9hQmZBKRV1ci1XHj3DVA7QvCAFa2CS72X8prJ8uVu/g8sQJSxfILfA1DB+KrRn8
         M0jTO1im9SIIU+He9BPHerdM3tgKZawMSTLdPlwj3mucmuULAUNA727bUHaOeOUkygAD
         udlo758JyRFOQ6keTaKDLDtsACnrwFz7KzrNXL2JRkrl7cr7Hy1xbSKY/IMybFcEFHl7
         htI75/SGHiMBvpvCODeFI8P/zpAREDkG6MIh8qhf85Wlshbm/eVFcTZPtXuWp9VR3LvC
         qOVQ==
X-Gm-Message-State: AJIora9/34H/e9rWqiqJcB4/jNBttWt1sDgx4aCk1peqR0VTl0++bhLC
	GA2lT03D6D0NVGoa36iqHwmQRz554kYk5G8j
X-Google-Smtp-Source: 
 AGRyM1smG1oSyREYBo9nx8YWdWF0DIro0HTOVQUysgiYCPnnZuoWXzXP+28D7ba/fHZRlBuxVPIZMA==
X-Received: by 2002:a17:90a:6b45:b0:1e3:3cfa:3104 with SMTP id
 x5-20020a17090a6b4500b001e33cfa3104mr32926071pjl.113.1656876983050;
        Sun, 03 Jul 2022 12:36:23 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 d4-20020a170902654400b00168aed83c63sm19441739pln.237.2022.07.03.12.36.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jul 2022 12:36:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/30] unzip: Port debian fixes for two CVEs
Date: Sun,  3 Jul 2022 09:35:36 -1000
Message-Id: 
 <6a277ba7964c0ce029e1097f061007484f63bcf5.1656876825.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1656876825.git.steve@sakoman.com>
References: <cover.1656876825.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Jul 2022 19:36:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167561

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
index c222a684b4..f35856cf61 100644
--- a/meta/recipes-extended/unzip/unzip_6.0.bb
+++ b/meta/recipes-extended/unzip/unzip_6.0.bb
@@ -29,6 +29,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/infozip/UnZip%206.x%20%28latest%29/UnZip%206.0/
 	file://unzip_optimization.patch \
         file://0001-configure-Pass-LDFLAGS-to-tests-doing-link-step.patch \
         file://CVE-2021-4217.patch \
+        file://CVE-2022-0529.patch \
+        file://CVE-2022-0530.patch \
 "
 UPSTREAM_VERSION_UNKNOWN = "1"
 
-- 
2.25.1


