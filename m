Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCBF3C79FBD
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 07:30:23 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6449.1788939021763239327
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 00:30:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ZQxI1wdB;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-484362f5c4aso6642261f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 00:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788939020; x=1789543820; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OIrW2dBnPtmt/VxBTERJa09xdj8lkDL1J2BAWWkvQbg=;
        b=ZQxI1wdBwh8howlDtO09VaOtbr4EVYjvdePeh5r52DvdbF6qBAqdkgp/28+N/kFr+t
         PUmjWVBxYD9xUseuSVm2r2Vtf68mwCJfiiXlJmesOjRnzmTMBQ6ctWBV4bOmbSFZLr6Q
         9MZCBdXBhvUM2kre5LB9vcnaFE9H8hKK3xA3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788939020; x=1789543820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=OIrW2dBnPtmt/VxBTERJa09xdj8lkDL1J2BAWWkvQbg=;
        b=mErpm0VCugteD9BWY66fFo2AoCHIrw5Swl67ISFAMV2Tp9t1qSy0DmQFB26gfMBqqX
         O/hLnFkBRbIz1apu+Fh5ZQbXLBuqpsc6THNWTOfd07uG8con6hi/ClmIqTtUb1PbBX2N
         SDLMCJ6Q7jDmAlOg5AGdphwOz4IDQQT4H6NqjrSTHsxY6UZMEHdw4SYFFiOTtufMeJey
         D/U+R85rgH45Hn/II4Kjw9PvZihpHm56dtF2h6fMuWd180DzBcgcr8mNy24Pzx2oeUwo
         RfwrnxIzxvj+IDpclTfaaZlk73g+VjS+FvRwjW6PiVR+I6iO+IReXMPDxitXRdFG46Wt
         lNcQ==
X-Gm-Message-State: AFuF++l7urhd80X2ZXk2EoqjTFKDNyaK7ULOxe/Oh5xgILuhf+pI4cDu
	DB64EKzhv9emBT703MqGxnZs07SqK5kRwDFDN5nZ7BY/gIr6/85tvyMIlMcWnSJ1WvBQlYgCgLf
	tLktHs60=
X-Gm-Gg: AYBFou28LMaLoXu5DFw7vyadgby0Ch9hK8izKw8EwPw3F7wTBCAN496WnhZV3u1dpVW
	V/GdeZn8ovE1tT6zjYiye3xiezH5Vxa/R5pjEkA4L/utODFzDZSA1ctu1gLNZyNsnC4jsiWvle9
	d7uhVsM6v3mDIb9n/boNSg57r+f8NB8hn41J7GmBF17ouaWWSKkvGnYvbmozxq9yj4eNocwNXJC
	t9OX7D7KNM9C/uem2Lie5h5lp1vC2FpneJXE+tu7uzKOx0YuQOaJ7ooJ8ibMNYqzRS/dw4Ea/Ek
	EqVYLre5b5fJo0FMS+2pYssj2EA4MWPxMj9CcLIJrNUCIYnK6CiawFyDwZ59WtHGbw862zA9lIm
	H1DmiwccC5qNSV1Acq+iedTuQjNz76qljSg4FIc+7AEgUujEwFDgyVAaCOqCd83MglZyBjUgpKc
	2hyQooHqDjBlMAIlxQtp1KuOcTVeHS8Rm/FeqDmYa7sHfXEVlvgpHTHFoPOxfi+k9l4zjsT+b95
	VggZJ6uWHikPNGETVdnLxj6AfAkmAYqT/aHCz/PLqJk4xMacqWm1ANCkPU7OnnpzjwyPLXzodI=
X-Received: by 2002:a05:6000:4a0f:b0:485:ac48:f873 with SMTP id ffacd0b85a97d-485ac48fe3cmr6366129f8f.11.1788939019862;
        Wed, 09 Sep 2026 00:30:19 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858ac2b4cdsm40624310f8f.16.2026.09.09.00.30.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 00:30:19 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 36/38] wget: Fix CVE-2026-58470
Date: Wed,  9 Sep 2026 09:29:35 +0200
Message-ID: <491affe9154d35254e2111d220482ffa47864ad9.1788938909.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788938908.git.yoann.congal@smile.fr>
References: <cover.1788938908.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 07:30:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245445

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].
It also includes the upstream follow-up in [3],
which preserves 64-bit wgint parsing on 32-bit targets.

[1] https://gitlab.com/gnuwget/wget/-/commit/43d3ba9336bc94937e6fae2365c6ffd30c34ffcf
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-58470
[3] https://gitlab.com/gnuwget/wget/-/commit/01ff771caac1958662ca8665eed2021ec386a7af

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

(cherry picked from commit 9b2b418a1546ae4bd6d044474765fa817e9a95f8)
Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../wget/wget/CVE-2026-58470-regression.patch | 48 +++++++++++
 .../wget/wget/CVE-2026-58470.patch            | 79 +++++++++++++++++++
 meta/recipes-extended/wget/wget_1.25.0.bb     |  2 +
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
index 00000000000..5d864c5fda6
--- /dev/null
+++ b/meta/recipes-extended/wget/wget/CVE-2026-58470.patch
@@ -0,0 +1,79 @@
+From 8740efcdd0d9e7eb04122f63bdb151f1f4d94af8 Mon Sep 17 00:00:00 2001
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
+index 07af1867..ea2e591b 100644
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
diff --git a/meta/recipes-extended/wget/wget_1.25.0.bb b/meta/recipes-extended/wget/wget_1.25.0.bb
index 95845d695a9..26f5c84e5a7 100644
--- a/meta/recipes-extended/wget/wget_1.25.0.bb
+++ b/meta/recipes-extended/wget/wget_1.25.0.bb
@@ -22,6 +22,8 @@ SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://CVE-2026-58472.patch \
            file://CVE-2026-58472-regression.patch \
            file://CVE-2026-16599.patch \
+           file://CVE-2026-58470.patch \
+           file://CVE-2026-58470-regression.patch \
            "
 
 SRC_URI[sha256sum] = "766e48423e79359ea31e41db9e5c289675947a7fcf2efdcedb726ac9d0da3784"

