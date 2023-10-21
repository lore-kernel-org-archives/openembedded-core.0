Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 726C6C004C0
	for <webhook@archiver.kernel.org>; Sat, 21 Oct 2023 15:28:47 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web11.81417.1697902125484784363
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Oct 2023 08:28:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=IxnY2EGk;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.48, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-6c63588b554so1190577a34.0
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Oct 2023 08:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697902124; x=1698506924; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cbglZcwR368AGT0nFCr5fLqVKHL1v6q49fhePQ2poG8=;
        b=IxnY2EGk6sDhEtxaDBPga5JEPTz/w9mfu+xwryAV0Gv86EU0eyroGjnpbMIeNyBG6A
         IpfgCyPmkTjCVLIeZxfM/Qsh+uBE9qo/EB7CkEdOmqwPZcaVzQQC4hKm491+8FMX7KOH
         a+kQyunN66P9VkIYewTnlif1jGrTEbAkjm11LtP58vgBmCe7BCPPsllI6tRBeATu29gA
         vXdSFn7eUxU3heht+H8yWVGl6RjRp3A3dDCiuW4UkdNqBFW1hvi45dF+wrWzKpxCikPY
         X9Q0/F1xRmjbuNX4Z0wPIl5wvSJtMqNdBrOye2Es35gNNHoeWRe0GWZR4N3nYhyRZmn4
         9XQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697902124; x=1698506924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cbglZcwR368AGT0nFCr5fLqVKHL1v6q49fhePQ2poG8=;
        b=K8bVImwyz50VjXNQqvZvk5xMeDQUTDrzNslz+xiiA559YYv+JGAeGRuAfdnb7vzat1
         oVwGIoyGJdg2j4dyhvDyc+oWiovCXpGAJTiPYkWztbAmDNRJFsIKdz0ZZ4pUsDM9YI7L
         t3yhEFiL271Wkg18eeAY4BZAZFGp5E8Cmg7TT7+E2nLf5uKoN9q3A/0jn/mVVOBAwXpu
         y7KrfwFGPJOiYbaNqdYvmzGpHgAWcP1vwBhexF9IyKgAUXhAYZ2jvoJPNE0ijCyITV3X
         JOowYPM+v3gjwFPTrRSMuaRSjDa3BI4RUjAK+0QJYfE2w1EFBmJguZnIqbt64qFpX6XR
         7kTQ==
X-Gm-Message-State: AOJu0YwFZOsXioJQUNHy5IHD3pQEnE1cqfern6DZWNFMX3s1NM2zpqsh
	Zl6DkqJdN5p0PRJqxFWdMNDk3Z8vXqQG60ZOAqE=
X-Google-Smtp-Source: AGHT+IGMF4WrnoPXHOLv20vAOfyP/A4HDiY/CpMYzBg4DIPMRf8+gAuCU95DY2U1TmNrDHHkEGTLVg==
X-Received: by 2002:a05:6830:25d6:b0:6b9:6481:8e33 with SMTP id d22-20020a05683025d600b006b964818e33mr7335044otu.13.1697902124332;
        Sat, 21 Oct 2023 08:28:44 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id by2-20020a056a02058200b0058c1383fa8bsm2876515pgb.0.2023.10.21.08.28.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Oct 2023 08:28:43 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 3/6] zlib: patch CVE-2023-45853
Date: Sat, 21 Oct 2023 05:28:29 -1000
Message-Id: <6e265e44febbb6fdf85c7926b9a64b731c98d814.1697901991.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697901991.git.steve@sakoman.com>
References: <cover.1697901991.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Oct 2023 15:28:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189590

From: Peter Marko <peter.marko@siemens.com>

Backport commit merged to develop branch from PR linked in NVD report:
* https://nvd.nist.gov/vuln/detail/CVE-2023-45853
* https://github.com/madler/zlib/pull/843

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../zlib/zlib/CVE-2023-45853.patch            | 42 +++++++++++++++++++
 meta/recipes-core/zlib/zlib_1.2.11.bb         |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-core/zlib/zlib/CVE-2023-45853.patch

diff --git a/meta/recipes-core/zlib/zlib/CVE-2023-45853.patch b/meta/recipes-core/zlib/zlib/CVE-2023-45853.patch
new file mode 100644
index 0000000000..ba3709249b
--- /dev/null
+++ b/meta/recipes-core/zlib/zlib/CVE-2023-45853.patch
@@ -0,0 +1,42 @@
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
+CVE: CVE-2023-45853
+Upstream-Status: Backport [https://github.com/madler/zlib/commit/73331a6a0481067628f065ffe87bb1d8f787d10c]
+
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+
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
index f768b41988..d75474dcb6 100644
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
2.34.1


