Return-Path: <asharma@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3780FC4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 06:31:01 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web11.4736.1699338659458578172
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Nov 2023 22:30:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=THoLT4t/;
 spf=pass (domain: mvista.com, ip: 209.85.210.52, mailfrom: asharma@mvista.com)
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-6ce2eaf7c2bso3466311a34.0
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 22:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1699338658; x=1699943458; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JLZ7YWjby9z3dyIZdd7AArGRcUsQ7X1/1zireoXdS0Q=;
        b=THoLT4t/Cg4yaaV86e9qk2t2EyBcoo7zYkF6ex+OzFQJkPN+RCdTBAZ6LU/yjKfxpY
         W/BWDYq2Cysm3B3utA72nZTvofJlnNqAjWgQm4GC4i0E3rFcM3zX/Gs4bc1l43fyBqCb
         QxH6wNaoVbuQYjDItj6nFEqgt+SCOl6R7djs8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699338658; x=1699943458;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JLZ7YWjby9z3dyIZdd7AArGRcUsQ7X1/1zireoXdS0Q=;
        b=uY1vPxAn2PFtCVu3xy/jv7HiBdA06Z87/oE3fjoVNkp7qGm2turRu43UeyNAZetjIP
         6M1hxG6updeZ32ic4DOMypMttXgYtfzr6SvJ0ouBUUVUhz0u7+BT05TxEHk2yDnVGq49
         tNdyna5hTzmybZ6Bsv+rFJ+kas2fFoJjvgWDch0foVuKUdeCMUMytVS90PPJNSvmEVkF
         sw4h3c6nXbOD9Ko6yMgcjCfG2urby/1Fnb9QddPYlmctm+vmf+4fjCrrMCCliQMvJBVw
         1GV0YrT2zgmZKt2mU2FcrFQzRkntpUSryGI4HFK6OYU9J3E3WkO9sV6MbUKMfF/JGs8w
         YUSw==
X-Gm-Message-State: AOJu0Yz9/G0FYzoOEAT/xr1yl0odzt+ogBSo4212fX1QRie/A7M4XvY6
	B0rBvOTz7eTpLkQejG5SQz98U10o15yWkgurPE8=
X-Google-Smtp-Source: AGHT+IEg9Eo8fn9H5c4ZpBfwGZBDkLGX4dQfvpcE33VfJ3RQO3AHS80WL9dPKeOdr+mEIHVbArb0eg==
X-Received: by 2002:a05:6830:18d6:b0:6cd:8c3:5b4c with SMTP id v22-20020a05683018d600b006cd08c35b4cmr33210593ote.16.1699338658527;
        Mon, 06 Nov 2023 22:30:58 -0800 (PST)
Received: from asharma-Latitude-3400 ([223.190.83.79])
        by smtp.gmail.com with ESMTPSA id b7-20020a62cf07000000b0068842ebfd10sm6790284pfg.160.2023.11.06.22.30.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Nov 2023 22:30:58 -0800 (PST)
Received: by asharma-Latitude-3400 (sSMTP sendmail emulation); Tue, 07 Nov 2023 11:58:42 +0530
From: Ashish Sharma <asharma@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Ashish Sharma <asharma@mvista.com>
Subject: [OE-core][dunfell][PATCH] zlib: Backport fix for CVE-2023-45853
Date: Tue,  7 Nov 2023 11:58:36 +0530
Message-Id: <20231107062836.23804-1-asharma@mvista.com>
X-Mailer: git-send-email 2.24.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Nov 2023 06:31:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190254

Upstream-Status: Backport from [https://github.com/madler/zlib/commit/73331a6a0481067628f065ffe87bb1d8f787d10c]

Signed-off-by: Ashish Sharma <asharma@mvista.com>
---
 .../zlib/zlib/CVE-2023-45853.patch            | 40 +++++++++++++++++++
 meta/recipes-core/zlib/zlib_1.2.11.bb         |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-core/zlib/zlib/CVE-2023-45853.patch

diff --git a/meta/recipes-core/zlib/zlib/CVE-2023-45853.patch b/meta/recipes-core/zlib/zlib/CVE-2023-45853.patch
new file mode 100644
index 00000000000..654579eb815
--- /dev/null
+++ b/meta/recipes-core/zlib/zlib/CVE-2023-45853.patch
@@ -0,0 +1,40 @@
+From 73331a6a0481067628f065ffe87bb1d8f787d10c Mon Sep 17 00:00:00 2001
+From: Hans Wennborg <hans@chromium.org>
+Date: Fri, 18 Aug 2023 11:05:33 +0200
+Subject: [PATCH] Reject overflows of zip header fields in minizip.
+
+This checks the lengths of the file name, extra field, and comment
+that would be put in the zip headers, and rejects them if they are
+too long. They are each limited to 65535 bytes in length by the zip
+format. This also avoids possible buffer overflows if the provided
+fields are too long.
+
+Upstream-Status: Backport from [https://github.com/madler/zlib/commit/73331a6a0481067628f065ffe87bb1d8f787d10c]
+CVE: CVE-2023-45853
+Signed-off-by: Ashish Sharma <asharma@mvista.com>
+---
+ contrib/minizip/zip.c | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/contrib/minizip/zip.c b/contrib/minizip/zip.c
+index 3d3d4cadd..0446109b2 100644
+--- a/contrib/minizip/zip.c
++++ b/contrib/minizip/zip.c
+@@ -1043,6 +1043,17 @@ extern int ZEXPORT zipOpenNewFileInZip4_64(zipFile file, const char* filename, c
+       return ZIP_PARAMERROR;
+ #endif
+ 
++    // The filename and comment length must fit in 16 bits.
++    if ((filename!=NULL) && (strlen(filename)>0xffff))
++        return ZIP_PARAMERROR;
++    if ((comment!=NULL) && (strlen(comment)>0xffff))
++        return ZIP_PARAMERROR;
++    // The extra field length must fit in 16 bits. If the member also requires
++    // a Zip64 extra block, that will also need to fit within that 16-bit
++    // length, but that will be checked for later.
++    if ((size_extrafield_local>0xffff) || (size_extrafield_global>0xffff))
++        return ZIP_PARAMERROR;
++
+     zi = (zip64_internal*)file;
+ 
+     if (zi->in_opened_file_inzip == 1)
diff --git a/meta/recipes-core/zlib/zlib_1.2.11.bb b/meta/recipes-core/zlib/zlib_1.2.11.bb
index bf99c2a3f98..6ba168ed10b 100644
--- a/meta/recipes-core/zlib/zlib_1.2.11.bb
+++ b/meta/recipes-core/zlib/zlib_1.2.11.bb
@@ -12,6 +12,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/libpng/${BPN}/${PV}/${BPN}-${PV}.tar.xz \
            file://CVE-2018-25032.patch \
            file://run-ptest \
 	    file://CVE-2022-37434.patch \
+           file://CVE-2023-45853.patch \
            "
 UPSTREAM_CHECK_URI = "http://zlib.net/"
 
-- 
2.24.4


