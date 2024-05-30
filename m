Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAE46C27C50
	for <webhook@archiver.kernel.org>; Thu, 30 May 2024 18:38:26 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.4825.1717094300060631146
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 May 2024 11:38:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=S2BU+7i2;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1f44b594deeso9170955ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 30 May 2024 11:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1717094299; x=1717699099; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bbVdKYSF84uGAs5MvcYP0xuLW1UHX9MKy0aPio0h/j0=;
        b=S2BU+7i2uwejX4vu5b0t6U3aAIplLlBHo0qk6JL/8U8xHqJbnMnSxjJUXGWob6hPGt
         7lgkiE4svTD83bq7gbLGotkw1HhAbz14fqIytOeqtZYnqKgDMeaT5EYhAXx1dK5/Dz1B
         UiV0W0xub4PtZaCYywrcm+Ts7dOP5z1ZH+JRISEewWz2YgdaM/m3h59d5aWQkP8SBSS3
         JbHRmKUy5UvxYEgzYpfQiBEFy1NmGq5c3vNNZp4U4o0Wy57PtozjQEl51g4bE11BbArK
         83RV4ouD6YieB+pTcIwbNXkf+4Qq1WzEIkaEr5lGCXMr6sG+qqZ8gvMT1ykJG1b2lNS3
         tU9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717094299; x=1717699099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bbVdKYSF84uGAs5MvcYP0xuLW1UHX9MKy0aPio0h/j0=;
        b=QNnVbbJuXDcAsSZ7hq84gOKnBSVS/Luu5Q8R7s3M1n7hu5gyloZzQ1kLRHx4iuAlYA
         cde77oJTF0uI+DUAR+UgK8RnJJQw+uhmLLOVKrCZI7KrH077p1YWVGG2Ozl7636n42c7
         Y5/ETHxZmH+zrjWS+jLXJoXpoA6WREMJIc9Twq9bGLK2JE4dSgZPfV0oyumgj92VBNqc
         tRgwIV1OECoX05OfvUW1XnzEw4eSO5SijynKCYYiagot0uSqF5rTbzVIakkrqgf8SUsm
         Reqs/QLeaPSVhCKedlgoj2UMk0AzjHlZTyr0oiKVw7D7FcD5BlBJFhD5BYhv4+CNet4n
         4llg==
X-Gm-Message-State: AOJu0Yyusb8VRnb13H6wllzQl/ReM+NmKgXPdGBGVjiGJ2jxgKIKJj01
	E/GQuv6k+W+bWOQKuIjBM/l77K8yAJMRPk15GrcXbw3Rkh+DdOpA5THExaKmkvFe2XkV/xoc1lj
	I
X-Google-Smtp-Source: AGHT+IFYX9d6/ess7s1AddFGVJfLdfSP9zSUK/0fRK9gd8ZmtPi8BryW78Jk8xcD8Yz6YK8Btex7pQ==
X-Received: by 2002:a05:6a20:9154:b0:1af:a37e:367e with SMTP id adf61e73a8af0-1b264538040mr3351973637.15.1717094299126;
        Thu, 30 May 2024 11:38:19 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-702423dbfc4sm62005b3a.66.2024.05.30.11.38.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 11:38:18 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 4/7] ghostscript: fix CVE-2024-29510
Date: Thu, 30 May 2024 11:38:03 -0700
Message-Id: <18e03cadcad0b416ef9fe65627e2e5c2924e3f26.1717094145.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1717094145.git.steve@sakoman.com>
References: <cover.1717094145.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 May 2024 18:38:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200042

From: Archana Polampalli <archana.polampalli@windriver.com>

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ghostscript/CVE-2024-29510.patch          | 84 +++++++++++++++++++
 .../ghostscript/ghostscript_9.55.0.bb         |  1 +
 2 files changed, 85 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2024-29510.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-29510.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-29510.patch
new file mode 100644
index 0000000000..0234c79c7d
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-29510.patch
@@ -0,0 +1,84 @@
+From 3b1735085ecef20b29e8db3416ab36de93e86d1f Mon Sep 17 00:00:00 2001
+From: Ken Sharp <Ken.Sharp@artifex.com>
+Date: Thu, 21 Mar 2024 09:01:15 +0000
+Subject: [PATCH 4/5] Uniprint device - prevent string configuration changes
+ when SAFER
+
+Bug #707662
+
+We cannot sanitise the string arguments used by the Uniprint device
+because they can potentially include anything.
+
+This commit ensures that these strings are locked and cannot be
+changed by PostScript once SAFER is activated. Full configuration from
+the command line is still possible (see the *.upp files in lib).
+
+This addresses CVE-2024-29510
+
+CVE: CVE-2024-29510
+
+Upstream-Status: Backport [https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=3b1735085ecef20b29e]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ devices/gdevupd.c | 31 +++++++++++++++++++++++++++++++
+ 1 file changed, 31 insertions(+)
+
+diff --git a/devices/gdevupd.c b/devices/gdevupd.c
+index 6635984..7952165 100644
+--- a/devices/gdevupd.c
++++ b/devices/gdevupd.c
+@@ -1886,6 +1886,16 @@ out on this copies.
+       if(!upd_strings[i]) continue;
+       UPD_PARAM_READ(param_read_string,upd_strings[i],value,udev->memory);
+       if(0 == code) {
++        if (gs_is_path_control_active(udev->memory)) {
++            if (strings[i].size != value.size)
++              error = gs_error_invalidaccess;
++            else {
++                if (strings[i].data && memcmp(strings[i].data, value.data, strings[i].size) != 0)
++                    error = gs_error_invalidaccess;
++            }
++            if (error < 0)
++                goto exit;
++        }
+          if(0 <= error) error |= UPD_PUT_STRINGS;
+          UPD_MM_DEL_PARAM(udev->memory, strings[i]);
+          if(!value.size) {
+@@ -1903,6 +1913,26 @@ out on this copies.
+       if(!upd_string_a[i]) continue;
+       UPD_PARAM_READ(param_read_string_array,upd_string_a[i],value,udev->memory);
+       if(0 == code) {
++          if (gs_is_path_control_active(udev->memory)) {
++              if (string_a[i].size != value.size)
++                  error = gs_error_invalidaccess;
++              else {
++                  int loop;
++                  for (loop = 0;loop < string_a[i].size;loop++) {
++                      gs_param_string *tmp1 = (gs_param_string *)&(string_a[i].data[loop]);
++                      gs_param_string *tmp2 = (gs_param_string *)&value.data[loop];
++
++                      if (tmp1->size != tmp2->size)
++                          error = gs_error_invalidaccess;
++                      else {
++                          if (tmp1->data && memcmp(tmp1->data, tmp2->data, tmp1->size) != 0)
++                              error = gs_error_invalidaccess;
++                      }
++                  }
++              }
++            if (error < 0)
++                goto exit;
++          }
+          if(0 <= error) error |= UPD_PUT_STRING_A;
+          UPD_MM_DEL_APARAM(udev->memory, string_a[i]);
+          if(!value.size) {
+@@ -2097,6 +2127,7 @@ transferred into the device-structure. In the case of "uniprint", this may
+       if(0 > code) error = code;
+    }
+
++exit:
+    if(0 < error) { /* Actually something loaded without error */
+
+       if(!(upd = udev->upd)) {
+--
+2.40.0
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
index 36c5aa3285..1fd08d1cfe 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
@@ -48,6 +48,7 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
                 file://CVE-2024-33869-0002.patch \
                 file://CVE-2024-33871-0001.patch \
                 file://CVE-2024-33871-0002.patch \
+                file://CVE-2024-29510.patch \
 "
 
 SRC_URI = "${SRC_URI_BASE} \
-- 
2.34.1


