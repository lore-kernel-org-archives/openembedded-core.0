Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 580D3C83F03
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 15:19:25 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.18575.1752074363797594227
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Jul 2025 08:19:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=BhMV4rXf;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b0b2d0b2843so79658a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Jul 2025 08:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752074363; x=1752679163; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LK1BOe0wecN7gUJcpd0PmOqXnTs4Y9AUeiKuFtUig6g=;
        b=BhMV4rXf0Jm4iIzoutm5H9K3xn+CsSZ1K2t5PR6QfrOpEbWUezpHkQ4Kmdo6THcTca
         VG/ET3lKbwHkC+60ulge+tNdxUh6XHGWAKveAjNkj8mZXn8fVSlIybbidzxzjpRxvrc3
         6jykVyW0dmMhD615EuPZJIazy/rRM0gJ9tuoNzsgqrBBH5P1O+rL3TDPc/wVYTMckQ9u
         PlmOJUAAYCvQGgBNAvouPap/AldXJc8tIOzVERydi33kv9jcQFp1bfSizgE3Ii+PSid+
         ls/u1TnbgtuUgNz3kaxxlFIBsAQdCOkYnVJ/pXhoBCwPA6ZHdmerGkilioz/7F0BwYzt
         CkPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752074363; x=1752679163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LK1BOe0wecN7gUJcpd0PmOqXnTs4Y9AUeiKuFtUig6g=;
        b=N25OleHZW8TSR/0VUrBNKO1FCOtjHcNPvbaAiyRVgoqwwtN+d28CSxKi7fwV8c2+Q0
         s3BxJg2e6YoRiq1WhZrzYPeBVZdp6ah/h3crYp/5oyRKeP/GZN5vom2MlW86IklW8Vbi
         gayZEqMpaxpsaXjrYK6+7w2cBuea/BLf4FMrWncF/HX40GSN3eFA+yHIla4WEXIST+oP
         59lJgJWUyzt/eOPLHuvOPCceSn3WKNSnrDgb2pCx29spx4V7yxrcXLBUpj2vtUIWvAkH
         ntQGPupk6btSwCYNUMmczfJJXoRM+aynVLa6o0xWHDp1VN45wOxNWmcB4Wp2sLtG2/ho
         rkiw==
X-Gm-Message-State: AOJu0Yxm378ugI0ezYRtfNl9CSVCQr+pdYcuTDE4jXs23zr+QzoTFjPG
	t8G/4xG5frCP7GvuDyH1ZYW9TpJlgpct4uXmozWAnLDneAHjnV6V9zJQ3SVoOwA3tdPqwJqo3Ag
	1N5tT
X-Gm-Gg: ASbGncv8dlt6ACuMfqry3wJxA2UTd2aJ7D31GeQgCA9X/BqHoPw1hlfmZUYZOtGmfXK
	OL4/OmjBNsbWRWcwpNDB0fnsc1m4yTpv9PjYFMpYTOawJJgb9x41j3Qbf6dRSoHgl8Vn2QkqF6H
	4vF7T5jA+3CQ6V7CTRFAZqqq+QXnX7EqeZpGTu/jnF5B/LrrOpup/JyTUnjQnBU0KhoEDZvDQ8a
	3GL9tAr/b8fnZsvF13GqqpUExF1JEDOSRESuzDUJ4z+JofN8GBsBBGkKrfO6p9CyqjG+NqGs+sd
	/8B6RMsR64QkkkwUenHtIZP0ToP+Ro7WJ8Rxdbho3xCXCTh1/1aP1g==
X-Google-Smtp-Source: AGHT+IHHlpAOJwmLDj1mC1ajIOBRtFFpnfwETSvwAqrxX0YqIeQSq3p4gxf67+z7AMzoMaCGPhZP/w==
X-Received: by 2002:a17:90b:2dd1:b0:315:af43:12ee with SMTP id 98e67ed59e1d1-31c2fdb9d3fmr4775281a91.16.1752074362677;
        Wed, 09 Jul 2025 08:19:22 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:a6e1:d218:3fcc:fd7d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c3019e934sm2340536a91.33.2025.07.09.08.19.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 08:19:22 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/11] libxml2: fix CVE-2025-6021
Date: Wed,  9 Jul 2025 08:19:05 -0700
Message-ID: <f75ef5dc195490ef8223f9a16086243450141e61.1752073806.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752073806.git.steve@sakoman.com>
References: <cover.1752073806.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Jul 2025 15:19:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220093

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport from https://gitlab.gnome.org/GNOME/libxml2/-/commit/acbbeef9f5dcdcc901c5f3fa14d583ef8cfd22f0

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libxml/libxml2/CVE-2025-6021.patch        | 56 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.14.bb    |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2025-6021.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2025-6021.patch b/meta/recipes-core/libxml/libxml2/CVE-2025-6021.patch
new file mode 100644
index 0000000000..9ec58e33c2
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2025-6021.patch
@@ -0,0 +1,56 @@
+From acbbeef9f5dcdcc901c5f3fa14d583ef8cfd22f0 Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Tue, 27 May 2025 12:53:17 +0200
+Subject: [PATCH] tree: Fix integer overflow in xmlBuildQName
+
+This issue affects memory safety.
+
+Fixes #926.
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/acbbeef9f5dcdcc901c5f3fa14d583ef8cfd22f0]
+CVE: CVE-2025-6021
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ tree.c | 12 +++++++++---
+ 1 file changed, 9 insertions(+), 3 deletions(-)
+
+diff --git a/tree.c b/tree.c
+index 6e04dfb..cdf863c 100644
+--- a/tree.c
++++ b/tree.c
+@@ -50,6 +50,10 @@
+ #include "buf.h"
+ #include "save.h"
+ 
++#ifndef SIZE_MAX
++#define SIZE_MAX ((size_t) -1)
++#endif
++
+ int __xmlRegisterCallbacks = 0;
+ 
+ /************************************************************************
+@@ -222,16 +226,18 @@ xmlGetParameterEntityFromDtd(const xmlDtd *dtd, const xmlChar *name) {
+ xmlChar *
+ xmlBuildQName(const xmlChar *ncname, const xmlChar *prefix,
+ 	      xmlChar *memory, int len) {
+-    int lenn, lenp;
++    size_t lenn, lenp;
+     xmlChar *ret;
+ 
+-    if (ncname == NULL) return(NULL);
++    if ((ncname == NULL) || (len < 0)) return(NULL);
+     if (prefix == NULL) return((xmlChar *) ncname);
+ 
+     lenn = strlen((char *) ncname);
+     lenp = strlen((char *) prefix);
++    if (lenn >= SIZE_MAX - lenp - 1)
++        return(NULL);
+ 
+-    if ((memory == NULL) || (len < lenn + lenp + 2)) {
++    if ((memory == NULL) || ((size_t) len < lenn + lenp + 2)) {
+ 	ret = (xmlChar *) xmlMallocAtomic(lenn + lenp + 2);
+ 	if (ret == NULL) {
+ 	    xmlTreeErrMemory("building QName");
+-- 
+2.49.0
+
diff --git a/meta/recipes-core/libxml/libxml2_2.9.14.bb b/meta/recipes-core/libxml/libxml2_2.9.14.bb
index bd6dd88dee..45424e59ff 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.14.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.14.bb
@@ -39,6 +39,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20080827.tar;subdir=${BP};name=testt
            file://CVE-2025-24928.patch \
            file://CVE-2025-32414.patch \
            file://CVE-2025-32415.patch \
+           file://CVE-2025-6021.patch \
            "
 
 SRC_URI[archive.sha256sum] = "60d74a257d1ccec0475e749cba2f21559e48139efba6ff28224357c7c798dfee"
-- 
2.43.0


