Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09968CCA476
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 07:36:22 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.13420.1759822581437057595
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Oct 2025 00:36:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=PVtSXKST;
 spf=pass (domain: mvista.com, ip: 209.85.214.178, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-27d3540a43fso61798835ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Oct 2025 00:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1759822580; x=1760427380; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B04Uvo+IIWC1vz3obeA59Ddt7fx7e6fTsoYVHBtUXVo=;
        b=PVtSXKSTX2diQ1mbHUtEYC9EyfN3GEcZxQTKlnOxHxKkTs4lzNkrd2uCWOkzcI66vJ
         /5t5+A6vNQEqvv4JlKwmKuycqloJFO/vOJYuY89ARD94W+3AtqAHeNFICWkPJ8JGmRhB
         qyo+HX3DE1ap6p4qa2LJuHGT9EZvM41esxo4Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759822580; x=1760427380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B04Uvo+IIWC1vz3obeA59Ddt7fx7e6fTsoYVHBtUXVo=;
        b=rO3hRR7X5lomrm7cYGSkT34dzK2eY+2yOK3gqyGAnAAW7jfgfZEHtmAaJp0MgJN9TV
         y4OCdmruMWuMwK+cgVt/2HbU6PQOKRiKuXrwJxD55KGXb8n+WKzl4cMEWt9zhXC+r9Qv
         Znol5stAf639UcgPjgbDX1TlfZFsCwCyyA+V7Jgf++i/hQil1OSwLTTj8rANPkXPb+5A
         0F/DaDCmEdRPuc+9F341YwvUSq/Qmaydal6qBMc/7sixDwEJnMxsjwKpHsQSdHSY+WfC
         09JQsCVm36Ywkx8Isl+lTsqaDbxST1C9cf6gfzMns3TwjTHzPDPZEbZ53fnyDs5qfcHM
         UZAA==
X-Gm-Message-State: AOJu0YyEouC9gjpFssyLyPkVldz08w+O00ZpbB43t/SOfA1lMKyljF5z
	EJZbxgjKwNHkZoaA8sZD+9LrNiJAsXOjxa/AFULJA123np92hUK3JIhdK7RQTz9EzY/d7O4h7ag
	nyjeZwUo=
X-Gm-Gg: ASbGncuFabEJja4olzbC1HdadlNRWcvgKqkIDDl51s3J4nAgduLWdR6KiwUeYP+woj0
	6a1fgp+JUd5tcn4mTPePXpSvvXpjd6IOsrNapUt5MdEL9Yb+oZe0hY5yv6rvynU0tGY/a67B2Iu
	kPqqlU/nRtxnw/niqSFmlWuK2gLXOdUeuDsrU62hP7k0c9uTEaVxyc2bLdQpUTQD2cJ4Y3kGrdk
	qyithmjAf72425OdacsPFdPIEItzZ610Hxvr/VMKI6e4kejVdU2QJ5rH3/nzxOzQUmaxOQtfuw+
	Ux4yMsid/qhDNOpNvr5DrUL7uHmFsvj71rzFvHBgYZl7FWFmcneCjF/MewjDAhzePOho6dpP/jR
	r0sNCy1u9UfAI2zpQGPhDxDCf/Ub9lFkG/VTZ5u+wURmB90U7rKviGT5zH48wvg==
X-Google-Smtp-Source: AGHT+IFIY8fWaZ/wnumS3Dx4VLEcd3DI3lUSGTjtv5ZnU8xhAV8s5k4fejCcy/zr9AFEZyJnOYigDw==
X-Received: by 2002:a17:902:b785:b0:28e:7e7e:fb6f with SMTP id d9443c01a7336-28e9a546377mr127251475ad.10.1759822580305;
        Tue, 07 Oct 2025 00:36:20 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:8fce:10c0:ed9d:912e:bd93:91cd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d126ad9sm155498605ad.45.2025.10.07.00.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 00:36:19 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH 2/2] tiff: Fix CVE-2025-9165
Date: Tue,  7 Oct 2025 13:06:04 +0530
Message-Id: <20251007073604.856848-2-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251007073604.856848-1-vanusuri@mvista.com>
References: <20251007073604.856848-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Oct 2025 07:36:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224515

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Commit: https://gitlab.com/libtiff/libtiff/-/commit/ed141286a37f6e5ddafb5069347ff5d587e7a4e0

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../libtiff/tiff/CVE-2025-9165.patch          | 32 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2025-9165.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2025-9165.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-9165.patch
new file mode 100644
index 0000000000..3694b11c67
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-9165.patch
@@ -0,0 +1,32 @@
+From ed141286a37f6e5ddafb5069347ff5d587e7a4e0 Mon Sep 17 00:00:00 2001
+From: Su_Laus <sulau@freenet.de>
+Date: Fri, 8 Aug 2025 21:35:30 +0200
+Subject: [PATCH] tiffcmp: fix memory leak when second file cannot be opened.
+
+Closes #728, #729
+
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/ed141286a37f6e5ddafb5069347ff5d587e7a4e0]
+CVE: CVE-2025-9165
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ tools/tiffcmp.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/tools/tiffcmp.c b/tools/tiffcmp.c
+index 2a35fe6..f812c7d 100644
+--- a/tools/tiffcmp.c
++++ b/tools/tiffcmp.c
+@@ -103,7 +103,10 @@ main(int argc, char* argv[])
+ 		return (2);
+ 	tif2 = TIFFOpen(argv[optind+1], "r");
+ 	if (tif2 == NULL)
++	{
++		TIFFClose(tif1);
+ 		return (2);
++	}
+ 	dirnum = 0;
+ 	while (tiffcmp(tif1, tif2)) {
+ 		if (!TIFFReadDirectory(tif1)) {
+-- 
+2.25.1
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
index 2ee6cdef73..84c3028b45 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
@@ -64,6 +64,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2025-8851.patch \
            file://CVE-2025-9900.patch \
            file://CVE-2025-8961.patch \
+           file://CVE-2025-9165.patch \
            "
 
 SRC_URI[sha256sum] = "0e46e5acb087ce7d1ac53cf4f56a09b221537fc86dfc5daaad1c2e89e1b37ac8"
-- 
2.25.1


