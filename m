Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 642A7C27C52
	for <webhook@archiver.kernel.org>; Sat,  1 Jun 2024 12:25:06 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.36158.1717244705110497156
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jun 2024 05:25:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=DSLsdH/o;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1f480624d0dso23686295ad.1
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Jun 2024 05:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1717244704; x=1717849504; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QdSzq2A82jghBt4zQBv3GyrK83FFWGl9ksvAlOrMydA=;
        b=DSLsdH/oACgz9oLD322xM5jVhwYIpq3GfXkAZcNBR4QixfoDy6N+/UXnDjk0yN5xzQ
         tZywRDyrWG7dM0GGL91Lu6Wf4kpZUEcXKCD58J5dFDDQsdKmMpZZZgp13GQqFkhoKLbY
         6qPXVqi7WEsAHQNpQiyYTKspqHqe1SCHoEvuI6ZJfXYz7+DriC5rzUcpk3oOI2hLHnRN
         noFnvkRXxkLHPnCuFLiil3RuR++NIlzdMrUXEPfMgzca9h9+BZ+ZnG/gjjXtqPujIBpX
         hdFdP4wUehaxbThCa3ggviElmool/3DnAGXA9vSEkMmxLoqq9FVq1g8S43unMcCrN7Ww
         91LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717244704; x=1717849504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QdSzq2A82jghBt4zQBv3GyrK83FFWGl9ksvAlOrMydA=;
        b=aWx3eucLw2iSDETuowE5uNDoFKzsoNvNvkVCfYGwBIdoiF6QftmhMhWgzfzNZ1k1sQ
         LJjHEOgWvWUEbN10G02xizc9pA3+7yEDT1Trzq2deubnGNDkDgGmDS7eM6rwU+h1glxK
         TNbIVcBacU+H8536pjbJSGGysDhZ8QKIXnzgvDIrBMAqHP5qYil3Ikyz9oj+xVgiPrp7
         kTZolxaC2yUQ1YfsfPWSXAGYJow1WEtZgEtco+Qnv1QJZ6lcKMSV1HCw8BLFlYRitvfo
         Y4BkCDqZCWWCiSmZlrvydBk2irYhOCnViOqece/wiNUoLJMDcpd5PlOLzvH5phX5Yxq2
         A/3g==
X-Gm-Message-State: AOJu0YxG5wT2q7vUOSuAaJc/+XF381rseJhoOt3qHbvgbSpTTKcdGO5o
	Et5+O8yJzJ2B9AreOYD+aNZlBVofzDVS25KbzGdPOoXplc4y7Cs77UH9SuUeUdytGCYZxmfKOQG
	c
X-Google-Smtp-Source: AGHT+IFvtGW9HX11neLpD7MccjmUT47uCA9qOHcLgE+wTz0gEGA3nfLxuKAwKJm16wGFQ9VtT3P+XA==
X-Received: by 2002:a17:902:e846:b0:1f2:f63b:4795 with SMTP id d9443c01a7336-1f636fc56e3mr56920375ad.14.1717244704262;
        Sat, 01 Jun 2024 05:25:04 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f63241d4d9sm31804165ad.296.2024.06.01.05.25.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jun 2024 05:25:04 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/21] ghostscript: fix CVE-2024-29510
Date: Sat,  1 Jun 2024 05:24:33 -0700
Message-Id: <202b2b0a5c447baf7d84c19b7829a81a846413d9.1717243719.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1717243719.git.steve@sakoman.com>
References: <cover.1717243719.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jun 2024 12:25:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200103

From: Archana Polampalli <archana.polampalli@windriver.com>

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ghostscript/CVE-2024-29510.patch          | 84 +++++++++++++++++++
 .../ghostscript/ghostscript_10.02.1.bb        |  1 +
 2 files changed, 85 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2024-29510.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-29510.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-29510.patch
new file mode 100644
index 0000000000..692d35157f
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-29510.patch
@@ -0,0 +1,84 @@
+From 3b1735085ecef20b29e8db3416ab36de93e86d1f Mon Sep 17 00:00:00 2001
+From: Ken Sharp <Ken.Sharp@artifex.com>
+Date: Thu, 21 Mar 2024 09:01:15 +0000
+Subject: [PATCH 5/5] Uniprint device - prevent string configuration changes
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
+index 740dae0..a50571a 100644
+--- a/devices/gdevupd.c
++++ b/devices/gdevupd.c
+@@ -1887,6 +1887,16 @@ out on this copies.
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
+@@ -1904,6 +1914,26 @@ out on this copies.
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
+@@ -2098,6 +2128,7 @@ transferred into the device-structure. In the case of "uniprint", this may
+       if(0 > code) error = code;
+    }
+
++exit:
+    if(0 < error) { /* Actually something loaded without error */
+
+       if(!(upd = udev->upd)) {
+--
+2.40.0
diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.02.1.bb b/meta/recipes-extended/ghostscript/ghostscript_10.02.1.bb
index 8bda4404cc..db9481816a 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.02.1.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.02.1.bb
@@ -30,6 +30,7 @@ SRC_URI = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/downlo
            file://CVE-2024-33869-0001.patch \
            file://CVE-2024-33869-0002.patch \
            file://CVE-2024-33871.patch \
+           file://CVE-2024-29510.patch \
            "
 
 SRC_URI[sha256sum] = "e429e4f5b01615a4f0f93a4128e8a1a4d932dff983b1774174c79c0630717ad9"
-- 
2.34.1


