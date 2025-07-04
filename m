Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEB5EC83F0C
	for <webhook@archiver.kernel.org>; Fri,  4 Jul 2025 15:29:18 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.14858.1751642950498860605
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jul 2025 08:29:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=1blTLoWE;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-74b27c1481bso680746b3a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 08:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1751642950; x=1752247750; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=42ZjTNiR1butv7dyJ+HCm60kzsgq+bIs8V25I3Ko4bQ=;
        b=1blTLoWEHdhN/kbccv3RE2HsoDxC3CawyKLXefK8FurXE7zarFHzwGrLbuTDTSsGz2
         yVtokfpW4qOn41aks2VDeIlrqXF47vLmjPbHcGFh/qLtIfkJwSjkWEEOOJ97/K36CF+e
         QNQWi7dkXr+fwxFoZOcn+pA7c0Ro9AmKTSiNPTFf3ixuAe6giXU9c3Rn1BWgBrOofbeX
         oBb9FWGImTkXCYvqW34GhDg6CH/3KjmK9/24B4Bcubv2KaG50iw1yLsfJD/CRrRJ33P+
         qYKr4kc+VLoi/AZZam0Gun+7oaBT2BMFMt1EZZE/kuauNa35pCgFG/M0NMeC2Fk/LZYc
         ki/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751642950; x=1752247750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=42ZjTNiR1butv7dyJ+HCm60kzsgq+bIs8V25I3Ko4bQ=;
        b=ZeTHyBl7iMN6cfMVopnDCapQITW7W5XvBiGAxcsvEOo5YlUrN9fbpxYjmMFCm/YrIF
         ngBl7Lumca6nEHbTSEc8QBq3PGlOPnQxDLPnJganKgHT7Y5eP/6XHpq4ITb9oN06sBH5
         Zvss3r2DGTlVshwjpY+nt1sGzvZtnrMDezN8o4nScM/xj4QaxGtCE1K9QxIKUksFeLZh
         xbg9ObXKaVKGdePCB8wRF39UuHmRqKNLxbNdkmULgQdoImEVwFLWZonx+hkerqeQzVfm
         lAynUtDCOMInC0yoH45BUS9Oqdt87GhUXHgiOUFs+QtQnKMoxfbueQW1u98rWACMomVf
         h2jA==
X-Gm-Message-State: AOJu0Ywu1h6EMo3nwpSepVV/0PBS7kw0yVV8IC1WrKuW3J8jy1r3iEyW
	v5MGGlaptCACngb1A8SCTK33MavDzaf08gRgbErU8i/m9rjR4YFmVQeFUo3Wx91+PqvScmgj+m8
	2QFp+
X-Gm-Gg: ASbGncuV4EMnm4DPgdP1H/DCkmC9fmWmK9vZeQLi5zswZ0TEIF03vhQi5tVpBtrILi8
	CK1wjZBbI2hsFC4byMkVqIyo89NU7w0oRs6/aUFBHyPUoc/qv86bic5MifpaWACPLnBVJpaSXwA
	cJbKdiTlPcIPrp0DCSSILOhGp6cWbAZDIlERAH5Fg9Ow8W/iTLsRAfQ+9u+5dZ/qBZT1C7gbj5z
	RCcoIQRl2lCj5OlpX9op73MpSEfMTt6Kl61N9Xav1t3+1C7xaEBmuQ3UDIapbQvpQ9p4q2fAP71
	RlNeYa5QiJdP8jOnHufjusuDrUkAs3kROFGgBP4FA/dVZVAgBwEC7A==
X-Google-Smtp-Source: AGHT+IHtZAlz4vHB19H8wGVxgybRDGrDvyd+wHPwy5sWpj0bG5Y5yHM1eTEMv0m0N/rW3wTkpGnMbw==
X-Received: by 2002:a05:6a00:3d56:b0:748:f1ba:9af8 with SMTP id d2e1a72fcca58-74ce69f212emr4566186b3a.21.1751642949552;
        Fri, 04 Jul 2025 08:29:09 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:d985:cb7d:ae84:68cc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce42a1ca0sm2424232b3a.138.2025.07.04.08.29.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 08:29:09 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 5/9] xwayland: fix CVE-2025-49176
Date: Fri,  4 Jul 2025 08:28:51 -0700
Message-ID: <17033023d679a597e31964b0fed2b2e89cdf61ec.1751641924.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1751641924.git.steve@sakoman.com>
References: <cover.1751641924.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 15:29:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219944

From: Archana Polampalli <archana.polampalli@windriver.com>

A flaw was found in the Big Requests extension. The request length is multiplied
by 4 before checking against the maximum allowed size, potentially causing an
integer overflow and bypassing the size check.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xwayland/CVE-2025-49176-0001.patch        | 93 +++++++++++++++++++
 .../xwayland/CVE-2025-49176-0002.patch        | 38 ++++++++
 .../xwayland/xwayland_22.1.8.bb               |  2 +
 3 files changed, 133 insertions(+)
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-49176-0001.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-49176-0002.patch

diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2025-49176-0001.patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-49176-0001.patch
new file mode 100644
index 0000000000..fd3b1d936b
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-49176-0001.patch
@@ -0,0 +1,93 @@
+From 03731b326a80b582e48d939fe62cb1e2b10400d9 Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Mon, 7 Apr 2025 16:13:34 +0200
+Subject: [PATCH] os: Do not overflow the integer size with BigRequest
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The BigRequest extension allows requests larger than the 16-bit length
+limit.
+
+It uses integers for the request length and checks for the size not to
+exceed the maxBigRequestSize limit, but does so after translating the
+length to integer by multiplying the given size in bytes by 4.
+
+In doing so, it might overflow the integer size limit before actually
+checking for the overflow, defeating the purpose of the test.
+
+To avoid the issue, make sure to check that the request size does not
+overflow the maxBigRequestSize limit prior to any conversion.
+
+The caller Dispatch() function however expects the return value to be in
+bytes, so we cannot just return the converted value in case of error, as
+that would also overflow the integer size.
+
+To preserve the existing API, we use a negative value for the X11 error
+code BadLength as the function only return positive values, 0 or -1 and
+update the caller Dispatch() function to take that case into account to
+return the error code to the offending client.
+
+CVE-2025-49176
+
+This issue was discovered by Nils Emmerich <nemmerich@ernw.de> and
+reported by Julian Suleder via ERNW Vulnerability Disclosure.
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Reviewed-by: Michel Dänzer <mdaenzer@redhat.com>
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/2024>
+
+CVE: CVE-2025-49176
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/03731b326a80b582e48d939fe62cb1e2b10400d9]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ dix/dispatch.c | 9 +++++----
+ os/io.c        | 4 ++++
+ 2 files changed, 9 insertions(+), 4 deletions(-)
+
+diff --git a/dix/dispatch.c b/dix/dispatch.c
+index 9e98d54..20473f1 100644
+--- a/dix/dispatch.c
++++ b/dix/dispatch.c
+@@ -513,9 +513,10 @@ Dispatch(void)
+
+                 /* now, finally, deal with client requests */
+                 result = ReadRequestFromClient(client);
+-                if (result <= 0) {
+-                    if (result < 0)
+-                        CloseDownClient(client);
++                if (result == 0)
++                    break;
++                else if (result == -1) {
++                    CloseDownClient(client);
+                     break;
+                 }
+
+@@ -536,7 +537,7 @@ Dispatch(void)
+                                           client->index,
+                                           client->requestBuffer);
+ #endif
+-                if (result > (maxBigRequestSize << 2))
++                if (result < 0 || result > (maxBigRequestSize << 2))
+                     result = BadLength;
+                 else {
+                     result = XaceHookDispatch(client, client->majorOp);
+diff --git a/os/io.c b/os/io.c
+index 841a0ee..aeece86 100644
+--- a/os/io.c
++++ b/os/io.c
+@@ -296,6 +296,10 @@ ReadRequestFromClient(ClientPtr client)
+                 needed = get_big_req_len(request, client);
+         }
+         client->req_len = needed;
++        if (needed > MAXINT >> 2) {
++            /* Check for potential integer overflow */
++            return -(BadLength);
++        }
+         needed <<= 2;           /* needed is in bytes now */
+     }
+     if (gotnow < needed) {
+--
+2.40.0
diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2025-49176-0002.patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-49176-0002.patch
new file mode 100644
index 0000000000..6d7df79111
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-49176-0002.patch
@@ -0,0 +1,38 @@
+From 4fc4d76b2c7aaed61ed2653f997783a3714c4fe1 Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Wed, 18 Jun 2025 08:39:02 +0200
+Subject: [PATCH] os: Check for integer overflow on BigRequest length
+
+Check for another possible integer overflow once we get a complete xReq
+with BigRequest.
+
+Related to CVE-2025-49176
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Suggested-by: Peter Harris <pharris2@rocketsoftware.com>
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/2028>
+
+CVE: CVE-2025-49176
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/4fc4d76b2c7aaed61ed2653f997783a3714c4fe1]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ os/io.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/os/io.c b/os/io.c
+index aeece86..67465f9 100644
+--- a/os/io.c
++++ b/os/io.c
+@@ -395,6 +395,8 @@ ReadRequestFromClient(ClientPtr client)
+                     needed = get_big_req_len(request, client);
+             }
+             client->req_len = needed;
++            if (needed > MAXINT >> 2)
++                return -(BadLength);
+             needed <<= 2;
+         }
+         if (gotnow < needed) {
+--
+2.40.0
diff --git a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
index 55d381f868..40f010865e 100644
--- a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
@@ -44,6 +44,8 @@ SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz \
            file://CVE-2025-26601-4.patch \
            file://CVE-2022-49737.patch \
            file://CVE-2025-49175.patch \
+           file://CVE-2025-49176-0001.patch \
+           file://CVE-2025-49176-0002.patch \
 "
 SRC_URI[sha256sum] = "d11eeee73290b88ea8da42a7d9350dedfaba856ce4ae44e58c045ad9ecaa2f73"
 
-- 
2.43.0


