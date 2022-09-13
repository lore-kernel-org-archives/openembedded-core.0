Return-Path: <florin.diaconescu009@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7910C6FA82
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 12:48:39 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.4147.1663073311965405184
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 05:48:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VVuA9ke5;
 spf=pass (domain: gmail.com, ip: 209.85.218.42,
 mailfrom: florin.diaconescu009@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id wc11so12710646ejb.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 05:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=RQI/eoOdSHPTRN5OFJqz2GqrbMYy+7XNCRgcXKcX5Ug=;
        b=VVuA9ke54yNkiqVe25r/msozI8qm1VfCBKokxSm7m6DgZDPw+eZ8ElHnslVN+1y85k
         4Gbo1AYRFHPgeGZ8vlEVa1Y1lP7/NkBVwFkLvTZXxyuX25hEVh35dGYupIcGb5hPCME2
         Sg7z6Z5elF6wmyeqwcsVfyCtEh8ioK2PyQSL8XBmvCVwpjxqb9gjeK4ZQ/fZDTOguV0/
         nEVNchPi+DX0eVh6qFhCvkOjxb1PAKVcbMeA0NWmsIEwbRVNIcYsxJDYWGG+rr6/a351
         eqEiF0fjber89wXRoBwDwrnX2DWwYoNsHuc/lV4iTg1n+bSmQOMWslDetgoyrbmY+k+4
         T7Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=RQI/eoOdSHPTRN5OFJqz2GqrbMYy+7XNCRgcXKcX5Ug=;
        b=hXKm/n0cAGbenkILDkX0YYfzcTNxGfG9EAMjvtgzSYaKy0atZ6B+JRyyuP8u0hZrgl
         dcXDqq7n2X37zUiWBx6jhEMVxpGk0K3ooPQ+DJLenGqZxENCX1IzhYLQlUSXHRmyp1lt
         v0NvGjuNg9YtPuitYNItGM1ugO9W5Jj8kd3rpZ10N6+DFOenZMxsCL+RNNFIkZeYpqAj
         NQ4spCYvq2ujjf0YPNV9Z6BxuALxhfAiMLh15XoWr+sakGyvpvAXDDmex5s008xX9b1u
         amKrvXLuN+6ZStW3xQcA4Wn0nnqnqgCI3Rgo5RhXrDN2GuKbyzlo+GK9rRsgEE1RYM4W
         jRsQ==
X-Gm-Message-State: ACgBeo2NcUS+F+QF2aqI8McLlCHNNd2XeQdvhXF0ONsUAhNAxuMRnh92
	7bbF8CNCucX4pOrZULGIS/qfq2TY49OA8w==
X-Google-Smtp-Source: 
 AA6agR5bN+N+JiUxSSWl7glUGLsm0hqy4GbAbcQi4+Ym2Ic6ywplZQJP4Jl2EPh7+XCjR96Ik9NpTw==
X-Received: by 2002:a17:907:3daa:b0:77a:3e30:bad0 with SMTP id
 he42-20020a1709073daa00b0077a3e30bad0mr13527537ejc.144.1663073309789;
        Tue, 13 Sep 2022 05:48:29 -0700 (PDT)
Received: from FDIACONESCU-KS0.lenovo.com ([84.232.223.213])
        by smtp.gmail.com with ESMTPSA id
 kx25-20020a170907775900b0073d70df6e56sm6013472ejc.138.2022.09.13.05.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 05:48:29 -0700 (PDT)
From: Florin Diaconescu <florin.diaconescu009@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Florin Diaconescu <florin.diaconescu009@gmail.com>
Subject: [dunfell][PATCH] binutils : CVE-2022-38533
Date: Tue, 13 Sep 2022 15:45:43 +0300
Message-Id: <20220913124542.1403-1-florin.diaconescu009@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Sep 2022 12:48:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170577

Upstream-Status: Backport
[https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=ef186fe54aa6d281a3ff8a9528417e5cc614c797]

Signed-off-by: Florin Diaconescu <florin.diaconescu009@gmail.com>
---
 .../binutils/binutils-2.34.inc                |  1 +
 .../binutils/binutils/CVE-2022-38533.patch    | 37 +++++++++++++++++++
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2022-38533.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.34.inc b/meta/recipes-devtools/binutils/binutils-2.34.inc
index 6a55de2d45..ff0d467132 100644
--- a/meta/recipes-devtools/binutils/binutils-2.34.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.34.inc
@@ -52,5 +52,6 @@ SRC_URI = "\
      file://CVE-2021-3549.patch \
      file://CVE-2020-16593.patch \
      file://0001-CVE-2021-45078.patch \
+     file://CVE-2022-38533.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2022-38533.patch b/meta/recipes-devtools/binutils/binutils/CVE-2022-38533.patch
new file mode 100644
index 0000000000..102d65f8a6
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2022-38533.patch
@@ -0,0 +1,37 @@
+From ef186fe54aa6d281a3ff8a9528417e5cc614c797 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Sat, 13 Aug 2022 15:32:47 +0930
+Subject: [PATCH] PR29482 - strip: heap-buffer-overflow
+
+	PR 29482
+	* coffcode.h (coff_set_section_contents): Sanity check _LIB.
+
+CVE: CVE-2022-38533
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=ef186fe54aa6d281a3ff8a9528417e5cc614c797]
+
+Signed-off-by: Florin Diaconescu <florin.diaconescu009@gmail.com>
+
+---
+ bfd/coffcode.h | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/bfd/coffcode.h b/bfd/coffcode.h
+index dec2e9c6370..75c18d88602 100644
+--- a/bfd/coffcode.h
++++ b/bfd/coffcode.h
+@@ -4170,10 +4170,13 @@ coff_set_section_contents (bfd * abfd,
+ 
+ 	rec = (bfd_byte *) location;
+ 	recend = rec + count;
+-	while (rec < recend)
++	while (recend - rec >= 4)
+ 	  {
++	    size_t len = bfd_get_32 (abfd, rec);
++	    if (len == 0 || len > (size_t) (recend - rec) / 4)
++	      break;
++	    rec += len * 4;
+ 	    ++section->lma;
+-	    rec += bfd_get_32 (abfd, rec) * 4;
+ 	  }
+ 
+ 	BFD_ASSERT (rec == recend);
-- 
2.25.1


