Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B44B8C4332F
	for <webhook@archiver.kernel.org>; Fri, 10 Nov 2023 09:05:43 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.23962.1699607140222468550
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Nov 2023 01:05:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=E4jHXcEm;
 spf=pass (domain: mvista.com, ip: 209.85.214.181, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1cc4f777ab9so15615515ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Nov 2023 01:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1699607139; x=1700211939; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DIJnKGPegHEW0ud4qtSMmGeEIqPe5avbYTPhtugY09Y=;
        b=E4jHXcEmgORmPSRed/ppbsZgp56bIAmZRBdRdImGBjgMOyH9IjAP6AFamBC2J1TbyG
         MpTZWOlC5MzbVsIGkQ9EcPvztubO+Y+0pGF0/UZOvW3qrLzBGlst1pYF0fGt5euzAqBg
         IOegV6jCeCk4BFC0aTI+wnh+LKRESyN2bATXs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699607139; x=1700211939;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DIJnKGPegHEW0ud4qtSMmGeEIqPe5avbYTPhtugY09Y=;
        b=op0v/up2YwK9rLm/lb4vuP6aeO9Fwb8iNaZbUG2BqcdWyQg4Ygbb0BzP3FzMuT/8WY
         VFi8sAHJLFXSsynqrSaSKNsstCxD+xWd6y4VacjOuozyVM3tbxeOB6Wwa/5iOzzNdxr/
         QZks2ZiMlM11AP/AZI5rnEy841T1NDGb7QVulYfJskcQlg9SoaKKgPBoorOM70m9iaoV
         pWnNE8jIy4UlU10G2XObJMSaSfYYIMWd8UEytGm3E9kikJpHKZV45vvW+lOaNSbNy9YZ
         vWstReiXoMYbOaV6f6VTZA7I+CPPeLxPIQ65QtjdGKtq8gLEmATmpQolkTZZNmtjigoe
         +GAQ==
X-Gm-Message-State: AOJu0Yz5hZEiYIV2CU4nvqK4KpvhvCrvLUIffB6bt8+uA7kZAoVkVsz7
	UbFGO1WBLWQEn1sE/P7ecOAA23z2F6tuBmxK3ss=
X-Google-Smtp-Source: AGHT+IH5r2cyBRzdVnCys8uFKDlw6G+NQcbGPP8RvHSkb1FfRH9QZVBiXEkWb6fPvCCbm5NFPG34hw==
X-Received: by 2002:a17:903:41c8:b0:1c7:755d:ccc8 with SMTP id u8-20020a17090341c800b001c7755dccc8mr8400112ple.29.1699607138657;
        Fri, 10 Nov 2023 01:05:38 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c01c:7c68:a6ae:3849:3b89:f5a3])
        by smtp.gmail.com with ESMTPSA id e12-20020a170902d38c00b001b9da42cd7dsm4875468pld.279.2023.11.10.01.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Nov 2023 01:05:38 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][dunfell][PATCH] tiff: backport Debian patch to fix CVE-2023-41175
Date: Fri, 10 Nov 2023 14:35:30 +0530
Message-Id: <20231110090530.3116884-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Nov 2023 09:05:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190402

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport [import from debian security.debian.org/debian-security/pool/updates/main/t/tiff/tiff_4.1.0+git191117-2~deb10u8.debian.tar.xz
Upstream commit https://gitlab.com/libtiff/libtiff/-/commit/6e2dac5f904496d127c92ddc4e56eccfca25c2ee]

Reference: https://security-tracker.debian.org/tracker/CVE-2023-41175

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../libtiff/files/CVE-2023-41175.patch        | 67 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.1.0.bb |  1 +
 2 files changed, 68 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2023-41175.patch

diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2023-41175.patch b/meta/recipes-multimedia/libtiff/files/CVE-2023-41175.patch
new file mode 100644
index 0000000000..3f44a42012
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2023-41175.patch
@@ -0,0 +1,67 @@
+From 4cc97e3dfa6559f4d17af0d0687bcae07ca4b73d Mon Sep 17 00:00:00 2001
+From: Arie Haenel <arie.haenel@jct.ac.il>
+Date: Wed, 19 Jul 2023 19:40:01 +0000
+Subject: raw2tiff: fix integer overflow and bypass of the check (fixes #592)
+
+Upstream-Status: Backport [import from debian security.debian.org/debian-security/pool/updates/main/t/tiff/tiff_4.1.0+git191117-2~deb10u8.debian.tar.xz
+Upstream commit https://gitlab.com/libtiff/libtiff/-/commit/6e2dac5f904496d127c92ddc4e56eccfca25c2ee]
+CVE: CVE-2023-41175
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ tools/raw2tiff.c | 26 ++++++++++++++++++++++++++
+ 1 file changed, 26 insertions(+)
+
+diff --git a/tools/raw2tiff.c b/tools/raw2tiff.c
+index ab36ff4e..a905da52 100644
+--- a/tools/raw2tiff.c
++++ b/tools/raw2tiff.c
+@@ -35,6 +35,7 @@
+ #include <sys/types.h>
+ #include <math.h>
+ #include <ctype.h>
++#include <limits.h>
+ 
+ #ifdef HAVE_UNISTD_H
+ # include <unistd.h>
+@@ -101,6 +102,7 @@ main(int argc, char* argv[])
+ 	int	fd;
+ 	char	*outfilename = NULL;
+ 	TIFF	*out;
++	uint32  temp_limit_check = 0;
+ 
+ 	uint32 row, col, band;
+ 	int	c;
+@@ -212,6 +214,30 @@ main(int argc, char* argv[])
+ 	if (guessSize(fd, dtype, hdr_size, nbands, swab, &width, &length) < 0)
+ 		return 1;
+ 
++	if ((width == 0) || (length == 0) ){
++		fprintf(stderr, "Too large nbands value specified.\n");
++		return (EXIT_FAILURE);
++	}
++
++	temp_limit_check = nbands * depth;
++
++	if ( !temp_limit_check || length > ( UINT_MAX / temp_limit_check ) )  {
++		fprintf(stderr, "Too large length size specified.\n");
++		return (EXIT_FAILURE);
++	}
++	temp_limit_check = temp_limit_check * length;
++
++	if ( !temp_limit_check || width > ( UINT_MAX / temp_limit_check ) )  {
++		fprintf(stderr, "Too large width size specified.\n");
++		return (EXIT_FAILURE);
++	}
++	temp_limit_check = temp_limit_check * width;
++
++	if ( !temp_limit_check || hdr_size > ( UINT_MAX - temp_limit_check ) )  {
++		fprintf(stderr, "Too large header size specified.\n");
++		return (EXIT_FAILURE);
++	}
++
+ 	if (outfilename == NULL)
+ 		outfilename = argv[optind+1];
+ 	out = TIFFOpen(outfilename, "w");
+-- 
+2.30.2
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
index 31e7db19aa..2697a28463 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
@@ -46,6 +46,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2023-3576.patch \
            file://CVE-2023-3618.patch \
            file://CVE-2023-40745.patch \
+           file://CVE-2023-41175.patch \
           "
 SRC_URI[md5sum] = "2165e7aba557463acc0664e71a3ed424"
 SRC_URI[sha256sum] = "5d29f32517dadb6dbcd1255ea5bbc93a2b54b94fbf83653b4d65c7d6775b8634"
-- 
2.25.1


