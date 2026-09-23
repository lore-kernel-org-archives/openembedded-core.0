Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BB05C982FA
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 09:11:44 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2823.1790154699684732864
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 02:11:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=JSo6oVlV;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso8676615e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 02:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790154698; x=1790759498; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tNvNV43hsG539j6oZEnTLX+KVcPCkVJmgxVQb+hpJ2w=;
        b=JSo6oVlVcEJU5FS82V26ZTHxe3MMUDHr2M3YQIderDxj7Xwr10MyY5oFNI1UtelyMy
         0e6FDfp/dxmNNpLNActIkKWIyk52Qz0bIQSUkhB/ulm8BpKqi1/QXF4ZFyYcT5pUu9a9
         GXaRzT0pD26niTJpRMyiLVlm8rtu7DFnaTSoo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790154698; x=1790759498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tNvNV43hsG539j6oZEnTLX+KVcPCkVJmgxVQb+hpJ2w=;
        b=iEAV8G9Vw3uRUc2q9zwR5ZypSIIp2JYfKrUPDWeQZXvJ1noBpjFmYoOcbPN2bd4UjG
         YfjyQhHdNKlNBtPrgUpOTTYNYXVK8ofMDANNbaggrlKENrVkWS04GUl5E0ffg7BVBuOK
         w+DIMtDjU/yrbAVi1LZnXVIEQLSa5BGM1IOAkZ8woWnhRt5sj+AAzw03LO9QufIVcvFY
         5N04Qg69Kx50CtRGDOuJQUC+pgFPnypDKZLqWZMDUL0vQRSV+96tVxgJMSMWAI7D4GzN
         FM+BBBF0MEZ0ThZC7nSMoQPYGVeWyj8ku/ZyKLMzyMGISw9Nfpc0e2KhMC1FcXVIwyr5
         X9YA==
X-Gm-Message-State: AFuF++l3O8epiVzy6UyUzpsSKyMLPzOWkpFd1IQ5hWB1t2Nq2eJOzL/H
	Ay2lkeDps/UcQfEw9Y/PTSTj/ig4LFe2NpXkTDYHpLaeE8B1KqZb8DVF3//xHMQA6FwKRsCHC4g
	rdn9RJbw=
X-Gm-Gg: AYBFou0LtmppG8FcO7yQ3ZLzU6O+0Nka4nuaCyIf9sIVHaMRz0fnYc0JkQzb3v8XxeK
	7RaLPMOXb2IdCnkhqXxnYZa7Ys7PqgZ12+qkdSHiJYlPS6jEbk0o4YWzyhw1aGoJxzFH+3u73/O
	zV4fKDEfrdRtaSoB7D0AA9vBgPe+MSosU6YJEPPwmnVZwpUZoNphJMYzustNZTVq3SL2UkHRrZd
	Z8wBoGjS1tva7e5q2dItOAveEDiPhY+iHxkGuZ13q1sxDXW+A+Qoi1io9lkZg/bP5i7VxUpPTXb
	e4ji5qogzkloBGHMwvCjIDtzXFUJpfjD9gFLAio8xDTKwuJJsmzYenOuicJu6706wVSwKhBZRRx
	/+pqEIUJC5o1hRtZEyG0EUXM/BRV43bEfEEo/MFGeDaT3v3MNgfvikN1zleM/Df+RnYtMwBdOab
	D1ey6jtqxKKe2SQUoDfqVWMv47D2h8kRWQ3LZmQqOAYes1coYv9b6JZtIS9YM9GMvif2BtL75xZ
	9a+SAHcJ663Bkg4+tiPgSs8IctsJ/O9pT2c4/gFRhcIZC6jh/qDPVV+KZWWIJD3Pm8VJUT8
X-Received: by 2002:a05:600c:19d2:b0:49c:cee0:e7c1 with SMTP id 5b1f17b1804b1-49fdf1370bcmr24496285e9.16.1790154697889;
        Wed, 23 Sep 2026 02:11:37 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a02-8440-b519-f416-8bed-8817-19fd-ccf7.rev.sfr.net. [2a02:8440:b519:f416:8bed:8817:19fd:ccf7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe2730da9sm14251525e9.4.2026.09.23.02.11.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 02:11:37 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 18/48] wget: Fix CVE-2026-58470
Date: Wed, 23 Sep 2026 11:10:20 +0200
Message-ID: <ee6588c4285e10d0784421b1c77bab09c1638aa1.1790154074.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790154074.git.yoann.congal@smile.fr>
References: <cover.1790154074.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 09:11:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246480

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].
It also includes the upstream regression patch from commit
shown in [3] which changes all three Content-Range conversions to strtoll().

[1] https://gitlab.com/gnuwget/wget/-/commit/43d3ba9336bc94937e6fae2365c6ffd30c34ffcf
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-58470
[3] https://gitlab.com/gnuwget/wget/-/commit/01ff771caac1958662ca8665eed2021ec386a7af

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../wget/wget/CVE-2026-58470-regression.patch | 48 +++++++++++
 .../wget/wget/CVE-2026-58470.patch            | 79 +++++++++++++++++++
 meta/recipes-extended/wget/wget_1.21.4.bb     |  2 +
 3 files changed, 129 insertions(+)
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58470-regression.patch
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58470.patch

diff --git a/meta/recipes-extended/wget/wget/CVE-2026-58470-regression.patch b/meta/recipes-extended/wget/wget/CVE-2026-58470-regression.patch
new file mode 100644
index 00000000000..c452261a9ac
--- /dev/null
+++ b/meta/recipes-extended/wget/wget/CVE-2026-58470-regression.patch
@@ -0,0 +1,48 @@
+From 01ff771caac1958662ca8665eed2021ec386a7af Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Tim=20R=C3=BChsen?= <tim.ruehsen@gmx.de>
+Date: Wed, 12 Aug 2026 19:45:21 +0200
+Subject: [PATCH] * src/http.c (parse_content_range): Use strtoll instead of
+ strtol.
+
+CVE: CVE-2026-58470
+Upstream-Status: Backport [https://gitlab.com/gnuwget/wget/-/commit/01ff771caac1958662ca8665eed2021ec386a7af]
+
+(cherry picked from commit 01ff771caac1958662ca8665eed2021ec386a7af)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/http.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/http.c b/src/http.c
+index e5e75ee695..8170a43c27 100644
+--- a/src/http.c
++++ b/src/http.c
+@@ -949,7 +949,7 @@ parse_content_range (const char *hdr, wgint *first_byte_ptr,
+     return false;
+ 
+   errno = 0;
+-  num = strtol(hdr, &end, 10);
++  num = strtoll(hdr, &end, 10);
+   if (errno == ERANGE)
+     return false;
+   hdr = end;
+@@ -959,7 +959,7 @@ parse_content_range (const char *hdr, wgint *first_byte_ptr,
+   *first_byte_ptr = num;
+ 
+   errno = 0;
+-  num = strtol(hdr, &end, 10);
++  num = strtoll(hdr, &end, 10);
+   if (errno == ERANGE)
+     return false;
+   hdr = end;
+@@ -976,7 +976,7 @@ parse_content_range (const char *hdr, wgint *first_byte_ptr,
+   else
+     {
+       errno = 0;
+-      num = strtol(hdr, NULL, 10);
++      num = strtoll(hdr, NULL, 10);
+       if (errno == ERANGE)
+         return false;
+     }
+-- 
+2.35.6
diff --git a/meta/recipes-extended/wget/wget/CVE-2026-58470.patch b/meta/recipes-extended/wget/wget/CVE-2026-58470.patch
new file mode 100644
index 00000000000..7ee4e87344e
--- /dev/null
+++ b/meta/recipes-extended/wget/wget/CVE-2026-58470.patch
@@ -0,0 +1,79 @@
+From bfbab29e0a94160b283a8101e122d07684104955 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Tim=20R=C3=BChsen?= <tim.ruehsen@gmx.de>
+Date: Mon, 29 Jun 2026 18:57:54 +0200
+Subject: [PATCH] * src/http.c (parse_content_range): Fix integer overflow
+
+Reported-by: TristanInSec@gmail.com
+
+CVE: CVE-2026-58470
+Upstream-Status: Backport [https://gitlab.com/gnuwget/wget/-/commit/43d3ba9336bc94937e6fae2365c6ffd30c34ffcf]
+
+(cherry picked from commit 43d3ba9336bc94937e6fae2365c6ffd30c34ffcf)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/http.c | 35 ++++++++++++++++++++++++-----------
+ 1 file changed, 24 insertions(+), 11 deletions(-)
+
+diff --git a/src/http.c b/src/http.c
+index 116a93a3..4dc6b70f 100644
+--- a/src/http.c
++++ b/src/http.c
+@@ -914,6 +914,7 @@ parse_content_range (const char *hdr, wgint *first_byte_ptr,
+                      wgint *last_byte_ptr, wgint *entity_length_ptr)
+ {
+   wgint num;
++  char *end;
+ 
+   /* Ancient versions of Netscape proxy server, presumably predating
+      rfc2068, sent out `Content-Range' without the "bytes"
+@@ -932,27 +933,39 @@ parse_content_range (const char *hdr, wgint *first_byte_ptr,
+     }
+   if (!c_isdigit (*hdr))
+     return false;
+-  for (num = 0; c_isdigit (*hdr); hdr++)
+-    num = 10 * num + (*hdr - '0');
+-  if (*hdr != '-' || !c_isdigit (*(hdr + 1)))
++
++  errno = 0;
++  num = strtol(hdr, &end, 10);
++  if (errno == ERANGE)
++    return false;
++  hdr = end;
++
++  if (*hdr++ != '-' || !c_isdigit (*hdr))
+     return false;
+   *first_byte_ptr = num;
+-  ++hdr;
+-  for (num = 0; c_isdigit (*hdr); hdr++)
+-    num = 10 * num + (*hdr - '0');
+-  if (*hdr != '/')
++
++  errno = 0;
++  num = strtol(hdr, &end, 10);
++  if (errno == ERANGE)
++    return false;
++  hdr = end;
++
++  if (*hdr++ != '/')
+     return false;
+   *last_byte_ptr = num;
+-  if (!(c_isdigit (*(hdr + 1)) || *(hdr + 1) == '*'))
++  if (!(c_isdigit (*hdr) || *hdr == '*'))
+     return false;
+   if (*last_byte_ptr < *first_byte_ptr)
+     return false;
+-  ++hdr;
+   if (*hdr == '*')
+     num = -1;
+   else
+-    for (num = 0; c_isdigit (*hdr); hdr++)
+-      num = 10 * num + (*hdr - '0');
++    {
++      errno = 0;
++      num = strtol(hdr, NULL, 10);
++      if (errno == ERANGE)
++        return false;
++    }
+   *entity_length_ptr = num;
+   if ((*entity_length_ptr <= *last_byte_ptr) && *entity_length_ptr != -1)
+     return false;
diff --git a/meta/recipes-extended/wget/wget_1.21.4.bb b/meta/recipes-extended/wget/wget_1.21.4.bb
index 8ae0bcf1f05..6ae0fc75b17 100644
--- a/meta/recipes-extended/wget/wget_1.21.4.bb
+++ b/meta/recipes-extended/wget/wget_1.21.4.bb
@@ -8,6 +8,8 @@ SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://CVE-2026-58471.patch \
            file://CVE-2026-58472.patch \
            file://CVE-2026-58472-regression.patch \
+           file://CVE-2026-58470.patch \
+           file://CVE-2026-58470-regression.patch \
           "
 
 SRC_URI[sha256sum] = "81542f5cefb8faacc39bbbc6c82ded80e3e4a88505ae72ea51df27525bcde04c"

