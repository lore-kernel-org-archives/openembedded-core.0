Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B002C072AB
	for <webhook@archiver.kernel.org>; Sat, 11 Nov 2023 15:03:24 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.52965.1699715003746938728
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Nov 2023 07:03:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=wDaG7xeU;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1cc68c1fac2so26573135ad.0
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Nov 2023 07:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1699715002; x=1700319802; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WkZK9M5tj2KC2wgtvXppRw+ZgeYvryLLhaSDeXXceBU=;
        b=wDaG7xeUV9z9K2TsalkVuf+FWyfO9KuTbn4K/y2W9RMchkjRyEZLesciA4uCtvx9m/
         X4Y+XCcaLgWIP/Uu5PcnYDK3Vz6GrzJWy6R5IGmfWNPvEBd2hU3WUVkPzB+M942YiVu0
         odB4zOVImI+x2+sWE8iPThiCyp7bEyH9NRajp2OJpZZbz7hO66K8trxCTagxx8Cq/nBE
         TtfWWqcqCCliprCwUO067DzF2VV2pzVOWJUU0PyY01hzNaL96owED2sBvxfVGPlL+/zI
         pgcXnGWlA+ZS8DdPchSaLx8c4IkDYswaEA9rGIT3AV0Oyn5ir7uL/X2sNIoDf9nGkuhq
         480A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699715002; x=1700319802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WkZK9M5tj2KC2wgtvXppRw+ZgeYvryLLhaSDeXXceBU=;
        b=qnaL1oZrBSp992bKNog01HkGKFP9E2UdwC5Yo4gJC+i0fUNfmKqrsfawLySSzmO8tL
         znhMWVcsPwp9oMB60JlW2gbGz8Vv8n8w79ez79QORsAxv4k0wYW22/a9mD24K0/3XULE
         X/i5iJmDHdUlEgSdt8D/9JTm19CXJqNgl2gHly3cz0Y0OcW3MyJL9k/MsyRyZlHeozjU
         /KoE1HPHNDNOR5Nr68nKK5NIzDtpWVhGhwCdSTu3/6YqFrTPhCpaz2NGotmpaWPwpTO1
         chPS9PFVenot52qWut31ycvwee9Kuv1Qr58WLpce3eRoztR55IjPq4xge/udPWZ/gseq
         ujrw==
X-Gm-Message-State: AOJu0YyzijqiSKgONmkLCBPl14su6TaR2wHIMMRVFkZukYpRZFInUiZB
	/q5LX0PyfyY9U+TFQTOA9UuPyz2ryTibYDyB87l3zw==
X-Google-Smtp-Source: AGHT+IG3l4HHkg4/AYSpYymvLkR7ckZGFcTWh1zP2+2OpncV7comLVMF9w+iGIEA+abXqocMD0vx5Q==
X-Received: by 2002:a17:902:ecc5:b0:1cc:bfb4:2db8 with SMTP id a5-20020a170902ecc500b001ccbfb42db8mr3059118plh.55.1699715002395;
        Sat, 11 Nov 2023 07:03:22 -0800 (PST)
Received: from hexa.lan (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id y18-20020a1709027c9200b001b53c8659fesm1379200pll.30.2023.11.11.07.03.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Nov 2023 07:03:22 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/15] zlib: Backport fix for CVE-2023-45853
Date: Sat, 11 Nov 2023 05:02:55 -1000
Message-Id: <37daba797d27bd980874e9a633863ba711bfb63f.1699714834.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1699714834.git.steve@sakoman.com>
References: <cover.1699714834.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Nov 2023 15:03:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190421

From: Ashish Sharma <asharma@mvista.com>

Upstream-Status: Backport from [https://github.com/madler/zlib/commit/73331a6a0481067628f065ffe87bb1d8f787d10c]

Signed-off-by: Ashish Sharma <asharma@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../zlib/zlib/CVE-2023-45853.patch            | 40 +++++++++++++++++++
 meta/recipes-core/zlib/zlib_1.2.11.bb         |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-core/zlib/zlib/CVE-2023-45853.patch

diff --git a/meta/recipes-core/zlib/zlib/CVE-2023-45853.patch b/meta/recipes-core/zlib/zlib/CVE-2023-45853.patch
new file mode 100644
index 0000000000..654579eb81
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
index e2fbc12bd8..910fc2ec17 100644
--- a/meta/recipes-core/zlib/zlib_1.2.11.bb
+++ b/meta/recipes-core/zlib/zlib_1.2.11.bb
@@ -11,6 +11,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/libpng/${BPN}/${PV}/${BPN}-${PV}.tar.xz \
            file://CVE-2018-25032.patch \
            file://run-ptest \
 	    file://CVE-2022-37434.patch \
+           file://CVE-2023-45853.patch \
            "
 UPSTREAM_CHECK_URI = "http://zlib.net/"
 
-- 
2.34.1


