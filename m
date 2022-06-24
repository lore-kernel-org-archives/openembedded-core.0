Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5591C433EF
	for <webhook@archiver.kernel.org>; Fri, 24 Jun 2022 17:01:28 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web08.10414.1656090080035994825
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jun 2022 10:01:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YEmBcnh0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id s1so3903852wra.9
        for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jun 2022 10:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NCqTNJNP9ySns/CC5wwXTKkmE7OFhFJGAyUEFqTRe0A=;
        b=YEmBcnh0OJcy/MzH9ZVMqYTW0lnlTKmF8/dWwj295sssSzjLYAhkh5TxoSPQLoBj8y
         rhuJqfn9W1ixETo/0HcpPGaZcdd1bj+s3m59FZDRBUalUzF+1BSBhOCd5YGgjrJh25c3
         +1+twUMcuLIUhVekGMqDu/TUFSneLjwXB0IuA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NCqTNJNP9ySns/CC5wwXTKkmE7OFhFJGAyUEFqTRe0A=;
        b=yldxQk/pe2W/JvLoB2WIyOgDG1pQNCIPClByHyoBzMwhzFB3A8GaK0QRSI4JqROKDh
         sAqGfmZRIc8kzVd/IfCrz7oOzonnH5P0pRoyE5mY4TtuofktA2FUIRgeYW8VxfKfQ6u0
         scdoYsClhj2cyeHyWNNkXm7HZ/RmaOL2ss5doY8BJZQpnlYHdeYUiRmdvF+mBv1XLDn1
         JA3Pvjv09/3QIXJ4XaRKaZmbFr7hMTiwvnoYnPN+ZbJPnKqKt9o/9vQNMBbVKJk41iBj
         JnYuWhJ3kF2/Mz9tk2qRAPJYVi9VRnGX1cMf3JgQLG5PTuJi6GCb1CxGKesMLMcfr5fO
         aDBQ==
X-Gm-Message-State: AJIora/PJtOQJy14TUKX9evH79EhdcQZb/ZunTplYVC51YROV1NmJCXI
	04R4uaaay8HVOMoXFInsfeEBKg+cIVOXxA==
X-Google-Smtp-Source: 
 AGRyM1u6Ka76a+cvlvepyZ54a0JpQt15hPEEP4lUZYmvAQ15TsHZmwj2ar6LoBWGMq9MF2OoTVQIJg==
X-Received: by 2002:a5d:4246:0:b0:21b:8ed0:51c with SMTP id
 s6-20020a5d4246000000b0021b8ed0051cmr144146wrr.62.1656090077982;
        Fri, 24 Jun 2022 10:01:17 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9f36:46c7:838f:1b87])
        by smtp.gmail.com with ESMTPSA id
 o14-20020a05600c4fce00b00397122e63b6sm3194098wmq.29.2022.06.24.10.01.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jun 2022 10:01:17 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] unzip: Port debian fixes for two CVEs
Date: Fri, 24 Jun 2022 18:01:16 +0100
Message-Id: <20220624170116.266210-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jun 2022 17:01:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167295

Add two fixes from debian for two CVEs. From:

https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1010355

I wans't able to get the reproducers to work but the added error
checking isn't probably a bad thing.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../unzip/unzip/CVE-2022-0529.patch           | 39 +++++++++++++++++++
 .../unzip/unzip/CVE-2022-0530.patch           | 33 ++++++++++++++++
 meta/recipes-extended/unzip/unzip_6.0.bb      |  2 +
 3 files changed, 74 insertions(+)
 create mode 100644 meta/recipes-extended/unzip/unzip/CVE-2022-0529.patch
 create mode 100644 meta/recipes-extended/unzip/unzip/CVE-2022-0530.patch

diff --git a/meta/recipes-extended/unzip/unzip/CVE-2022-0529.patch b/meta/recipes-extended/unzip/unzip/CVE-2022-0529.patch
new file mode 100644
index 00000000000..1c1e120deb6
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
index 00000000000..363dafddc94
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
index c222a684b4c..f35856cf617 100644
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
2.34.1


