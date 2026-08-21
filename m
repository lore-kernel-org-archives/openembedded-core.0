Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 421FDC5DF92
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 11:25:19 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5276.1787311515801976758
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Aug 2026 04:25:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gxocniiG;
 spf=pass (domain: gmail.com, ip: 209.85.210.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7f3faf2b081so835602a34.3
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 04:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787311515; x=1787916315; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=00EcoBlm/gRsZWOpGMeAgceHseilGDQBwZXVIF76fZg=;
        b=gxocniiGdxzLf5yUK9tjZ+EyMRBOjYpKoRWeKu+hGyEd0ATZFS5AwdNg9o8aWewrsU
         Z5p3A6a4RzC+QywjUc1V+KMSo7rfBCNGAYuMamgt7n1G5PhcT8rp1wMtxPzK5xvPunBb
         S/HyW1tLZeetg4F0bDzUyNKahYFgRCT/IAJb2GRxNJexDllhjYduaLUoa9B84cO5dht3
         PkP3SEwdwcrqcZdDUresBAYs+OZaMvcPhCF3ytXTK/Sa2Q/2kzPY5lfb57OVTMVE0q4W
         pa2JzpG6LX5QIat7wTmVhQtn3D+r1oVszsV+p2bkNkNavYn+Z7jmPhzeuY8xvx4FnSO/
         YpSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787311515; x=1787916315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=00EcoBlm/gRsZWOpGMeAgceHseilGDQBwZXVIF76fZg=;
        b=L8DhiaE4uXzttzyyFSZpEsT0GDk9Jf6nM/iWUMJKdE/xyXHUg3bWrG6IaHXUU3/Fjs
         dzQXwAiDhmdb7lx8TJoNgbJ9J6kDHwnHt2r39PMIgJ37WKRzqKgw/vl+04dayhyOxb1N
         Kh6o3PEl6jpozQ0dlLcmy8NWQ4JyJTZkyJc02RoZTGdPDym/+x3f5FSRYNqfawRptbEr
         IwDTVOtbYKx+Bntt4aFWVZNt9v9ypIww9vppNyiIDCkCamlbxQz6q4wKjjwqIQQdbuPK
         xybIz+UKtnUxFEIFiXR8NPXdsOnjBQ+TcXb5L6p+1fwuN8MErDMEQOt1fzOPFPxaOIZu
         bPEg==
X-Gm-Message-State: AOJu0YydSogjE4rXNDAnQgnGC4pMpl++BDhnno3qI9pdaaBlvc35z34X
	HKd/cRJ9DbeX3WOV0uDRIdBYQ9wpDcmVZw1z5ZvuCaSXcyzlsbslnqSbaLx5NgTq
X-Gm-Gg: AR+sD116O6IFy00yBxiWMrcWHlAFVTN2AQvFau+KgCJ8zS86u0+8ovSVT+OKqEcZjt5
	P3ncT+UTxIAl+VJPasI+yzDj60oILGozA3lNGQRQYwWhOsz/O7yUONwByTigbGvD/1zi4leus2Y
	666rKeNJXqe604L78w/sB7UcuhPn0BAMA8qf1UiPjjzgQKT8LL+9LN+CC7lIGI3kgGKmYQJb5zz
	CoP7ZFbUM+3C8vpASL/LO70oJCQr4843KLXLQGg6342t1iUf77Ug/ovUUfMLw3g97MKTtnDQRzt
	vKNzKxyfSiyPMjpt01vXCuRGl9cWvbOJJPpaqOAnyU6QutiXPtHPA5a4S1qIieKwJdFbDjUg7bd
	FWCh7IpEIsEnSiz9b4rMcFjnM5CRHXyqWXk9rIbjYKRXVBZJCcufKyEPn9x98VbSGeIjEyy6mIP
	HeeEPDDrfsp+uldbMoZJ6S2IHl4XesIG8B5yDaLxi/utfPNGxy00oAe9+clC72hpKu/3hQkPcDx
	O6MkIYkdrcmk0nkofnN5wbgGvb1HU5Za2uRT6d/cZR2uLwKlhYpaXiELi50/muCmgQyMLh5VJ5S
	oqYV0ZJC6rgS9qMmfD4t2uKJrafGYkNfvu3eRZ6ZMW8qxqMhRsQRkNL7DA9NPjCr+7LdatRiqt0
	OEsY64ICpb9deVWs=
X-Received: by 2002:a05:6830:2985:b0:7e9:ff97:5e3b with SMTP id 46e09a7af769-7f46196be8bmr5854463a34.15.1787311514755;
        Fri, 21 Aug 2026 04:25:14 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f43fe70792sm7398018a34.5.2026.08.21.04.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 04:25:13 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][PATCH 02/06] linux-libc-headers: update to 7.2
Date: Fri, 21 Aug 2026 07:25:04 -0400
Message-ID: <20260821112509.861559-3-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821112509.861559-1-bruce.ashfield@gmail.com>
References: <20260821112509.861559-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 11:25:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243926

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Update the sanitized kernel headers to the 7.2 release.

Add a HEADER_FETCH_VER mapping for major version 7 so the tarball is
fetched from the v7.x/ path on the kernel.org mirror; without it the
fetch fell through to the 2.6 default.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc   | 2 ++
 .../{linux-libc-headers_6.18.bb => linux-libc-headers_7.2.bb}   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 rename meta/recipes-kernel/linux-libc-headers/{linux-libc-headers_6.18.bb => linux-libc-headers_7.2.bb} (80%)

diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
index eeb42b24cc..a9376894de 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
@@ -46,6 +46,8 @@ python __anonymous () {
         d.setVar("HEADER_FETCH_VER", "5.x")
     elif major == "6":
         d.setVar("HEADER_FETCH_VER", "6.x")
+    elif major == "7":
+        d.setVar("HEADER_FETCH_VER", "7.x")
     else:
         d.setVar("HEADER_FETCH_VER", "2.6")
 }
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb
similarity index 80%
rename from meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb
rename to meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb
index 6a1ec33dc5..90c7b48405 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb
@@ -8,6 +8,6 @@ SRC_URI:append:libc-musl = "\
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
-SRC_URI[sha256sum] = "9106a4605da9e31ff17659d958782b815f9591ab308d03b0ee21aad6c7dced4b"
+SRC_URI[sha256sum] = "f9fef3d14c0df53819026f4be74459835c2a0b0dcbf5b5bbd9ea19f0829402b3"
 
 
-- 
2.43.0


