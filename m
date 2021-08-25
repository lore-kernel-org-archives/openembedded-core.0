Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.10648.1629867326289843878
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Aug 2021 21:55:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=S3gDNIy0;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: ranjitsinhrathod1991@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id q21so4605042plq.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Aug 2021 21:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=UMXzAZ3Pa/4+zix9XUdLpqmayQvFyp90aMw5WpbZ/6A=;
        b=S3gDNIy0LiNhQXeGufD6r5Sn5U8hQGizO5llieI4YumR3jf+eO0e3csRAR4l4V3O5k
         Qn8LGU6KCIG7UEUTQsPrBoa832kaPpcMtSNZKxIxG+Ten435w5trmRH4pPM+VJgS0Ksl
         wQcABhanuCsSSaHBWFLTPuS5OlM5/Xzma304TVkINmmrGvSl1iJBghNG7hAurIHd6rdC
         9aBNwigYqlQv5+aHsxgFsaNOp41Pp4dyKmXxdaPzojWs1ZAk5YbU7uVQYcInV+r3A/Z6
         kjXZVqgTK4QJSNIEQKXn0sHoW3VdLAs+Od+U7A/bdVbAm2YP6gvOqjaLtpqXpw4edc6X
         fI7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=UMXzAZ3Pa/4+zix9XUdLpqmayQvFyp90aMw5WpbZ/6A=;
        b=G/+vP76iehNrqdfRi4Nj4UZUn0ECdNaLr8DuR2AncwKtM+356qZSzBy4ly8AOsRN8e
         zRNYIijRKQXD5hhPMF3fvhoPuS1onyRkfDzmZs2dWd15eRp9SbYhrUCiWXPzje2lD4xB
         f1A6/K8+cs9rIUkqXGIRE79gQXP/a2hoM/lOfOfFBrG6ETC0U4+kOqAzJRlBsMc1Fe/7
         siBuKAaCMDaPTplTSqZwPtOgftnqtof1rvKnPqubE7K9525rUTA9R4lJDa8+6Ymk0G0d
         sWmNsrE24+VG1uVPMv4LCqB8utBeIDtqahLFUtB6cbA6rd5Ez6iUh60/yKhaWwZmZfAx
         77LA==
X-Gm-Message-State: AOAM532piV4xUD694IFsL38nwNPv4fIUMiL9F4TAsUpf/sdIMT63tmNJ
	c3kNQYXqh7Ry8UXaT6pLXsjalDxY4VrmMQ==
X-Google-Smtp-Source: ABdhPJyOmGQh30CxlRHkM08npCru+Va/kEt56yHqBen6eXj9IdGfVEVfcnnullBYHXOdUSVoGq1AIg==
X-Received: by 2002:a17:90a:a0a:: with SMTP id o10mr8569980pjo.231.1629867325392;
        Tue, 24 Aug 2021 21:55:25 -0700 (PDT)
Return-Path: <ranjitsinhrathod1991@gmail.com>
Received: from localhost.localdomain ([103.85.11.25])
        by smtp.gmail.com with ESMTPSA id n13sm19910422pff.164.2021.08.24.21.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 21:55:25 -0700 (PDT)
From: ranjitsinhrathod1991@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Subject: [meta][dunfell][PATCH v3] rpm: Add fix for CVE-2021-20266
Date: Wed, 25 Aug 2021 10:25:09 +0530
Message-Id: <20210825045509.21335-1-ranjitsinhrathod1991@gmail.com>
X-Mailer: git-send-email 2.17.1

From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>

Adding fix for CVE-2021-20266
Upstream-Status: Backport [https://github.com/rpm-software-management/rpm/pull/1587/commits/9646711891df851dfbf7ef54cc171574a0914b15]

Note: Hunk#2 and Hunk#3 refreshed to apply patch and match value of
dl_max variable to make it with current version
All Hunks are refreshed to solve patch-fuzz

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
---
 .../rpm/files/CVE-2021-20266.patch            | 109 ++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_4.14.2.1.bb     |   1 +
 2 files changed, 110 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/files/CVE-2021-20266.patch

diff --git a/meta/recipes-devtools/rpm/files/CVE-2021-20266.patch b/meta/recipes-devtools/rpm/files/CVE-2021-20266.patch
new file mode 100644
index 0000000000..f2fc47e321
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/CVE-2021-20266.patch
@@ -0,0 +1,109 @@
+From ebbf0f0133c498d229e94ecf2ed0b41d6e6a142a Mon Sep 17 00:00:00 2001
+From: Demi Marie Obenour <athena@invisiblethingslab.com>
+Date: Mon, 8 Feb 2021 16:05:01 -0500
+Subject: [PATCH] hdrblobInit() needs bounds checks too
+
+Users can pass untrusted data to hdrblobInit() and it must be robust
+against this.
+
+Backported from commit 8f4b3c3cab8922a2022b9e47c71f1ecf906077ef
+
+Upstream-Status: Backport [https://github.com/rpm-software-management/rpm/pull/1587/commits/9646711891df851dfbf7ef54cc171574a0914b15]
+CVE: CVE-2021-20266
+Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
+
+---
+ lib/header.c | 48 +++++++++++++++++++++++++++++++-----------------
+ 1 file changed, 31 insertions(+), 17 deletions(-)
+
+diff --git a/lib/header.c b/lib/header.c
+index 5b09f8352..ad5b6dc57 100644
+--- a/lib/header.c
++++ b/lib/header.c
+@@ -11,6 +11,7 @@
+ #include "system.h"
+ #include <netdb.h>
+ #include <errno.h>
++#include <inttypes.h>
+ #include <rpm/rpmtypes.h>
+ #include <rpm/rpmstring.h>
+ #include "lib/header_internal.h"
+@@ -1890,6 +1891,25 @@ hdrblob hdrblobFree(hdrblob blob)
+     return NULL;
+ }
+ 
++static rpmRC hdrblobVerifyLengths(rpmTagVal regionTag, uint32_t il, uint32_t dl,
++				  char **emsg) {
++    uint32_t il_max = HEADER_TAGS_MAX;
++    uint32_t dl_max = HEADER_DATA_MAX;
++    if (regionTag == RPMTAG_HEADERSIGNATURES) {
++	il_max = 32;
++	dl_max = 8192;
++    }
++    if (hdrchkRange(il_max, il)) {
++	rasprintf(emsg, _("hdr tags: BAD, no. of tags(%" PRIu32 ") out of range"), il);
++	return RPMRC_FAIL;
++    }
++    if (hdrchkRange(dl_max, dl)) {
++	rasprintf(emsg, _("hdr data: BAD, no. of bytes(%" PRIu32 ") out of range"), dl);
++	return RPMRC_FAIL;
++    }
++    return RPMRC_OK;
++}
++
+ rpmRC hdrblobRead(FD_t fd, int magic, int exact_size, rpmTagVal regionTag, hdrblob blob, char **emsg)
+ {
+     int32_t block[4];
+@@ -1902,13 +1922,6 @@ rpmRC hdrblobRead(FD_t fd, int magic, int exact_size, rpmTagVal regionTag, hdrbl
+     size_t nb;
+     rpmRC rc = RPMRC_FAIL;		/* assume failure */
+     int xx;
+-    int32_t il_max = HEADER_TAGS_MAX;
+-    int32_t dl_max = HEADER_DATA_MAX;
+-
+-    if (regionTag == RPMTAG_HEADERSIGNATURES) {
+-	il_max = 32;
+-	dl_max = 8192;
+-    }
+ 
+     memset(block, 0, sizeof(block));
+     if ((xx = Freadall(fd, bs, blen)) != blen) {
+@@ -1921,15 +1934,9 @@ rpmRC hdrblobRead(FD_t fd, int magic, int exact_size, rpmTagVal regionTag, hdrbl
+ 	goto exit;
+     }
+     il = ntohl(block[2]);
+-    if (hdrchkRange(il_max, il)) {
+-	rasprintf(emsg, _("hdr tags: BAD, no. of tags(%d) out of range"), il);
+-	goto exit;
+-    }
+     dl = ntohl(block[3]);
+-    if (hdrchkRange(dl_max, dl)) {
+-	rasprintf(emsg, _("hdr data: BAD, no. of bytes(%d) out of range"), dl);
++    if (hdrblobVerifyLengths(regionTag, il, dl, emsg))
+ 	goto exit;
+-    }
+ 
+     nb = (il * sizeof(struct entryInfo_s)) + dl;
+     uc = sizeof(il) + sizeof(dl) + nb;
+@@ -1973,11 +1980,18 @@ rpmRC hdrblobInit(const void *uh, size_t uc,
+ 		struct hdrblob_s *blob, char **emsg)
+ {
+     rpmRC rc = RPMRC_FAIL;
+-
+     memset(blob, 0, sizeof(*blob));
++    if (uc && uc < 8) {
++	rasprintf(emsg, _("hdr length: BAD"));
++	goto exit;
++    }
++
+     blob->ei = (int32_t *) uh; /* discards const */
+-    blob->il = ntohl(blob->ei[0]);
+-    blob->dl = ntohl(blob->ei[1]);
++    blob->il = ntohl((uint32_t)(blob->ei[0]));
++    blob->dl = ntohl((uint32_t)(blob->ei[1]));
++    if (hdrblobVerifyLengths(regionTag, blob->il, blob->dl, emsg) != RPMRC_OK)
++	goto exit;
++
+     blob->pe = (entryInfo) &(blob->ei[2]);
+     blob->pvlen = sizeof(blob->il) + sizeof(blob->dl) +
+ 		  (blob->il * sizeof(*blob->pe)) + blob->dl;
diff --git a/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb b/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
index 018b2f8700..c93654aa8f 100644
--- a/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
@@ -45,6 +45,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.14.x \
            file://0001-Rip-out-partial-support-for-unused-MD2-and-RIPEMD160.patch \
            file://0001-rpmplugins.c-call-dlerror-prior-to-dlsym.patch \
            file://CVE-2021-3421.patch \
+           file://CVE-2021-20266.patch \
            "
 
 PE = "1"
-- 
2.17.1

