Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84A77C8303D
	for <webhook@archiver.kernel.org>; Fri,  4 Jul 2025 15:10:58 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.14493.1751641853519380292
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jul 2025 08:10:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=LvkX05p9;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-74b50c71b0aso626793b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 08:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1751641853; x=1752246653; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bvJiY2dZo3pNiujZpKtOlAnOocLspC8eh6GM0lveI1k=;
        b=LvkX05p9pczJ2rxRmXbdwLDqfThI0U1EOhK11K0wJZlYd6fDmWelUSELbYV1/kJlTJ
         uUOEtA/31grnuI0lIsbNNoEmEQ6RnmEvtaGwwggidj7OXBI7YJGUQ3KbQur9UoQashCt
         b+IO5XZmD02Xm6zv4iHpCUEtzXJLU5/hBlMD2wC4LGKyoxsFW9HQavqmNAtNdrrC2EEz
         DlPm1CNBm7ssP4u30jZC/ZZIf3k5jgMv7zjIverDsHKSs9l0OHZUiiW+doQm0gLwpvxu
         KK3DhE43n4p7uNnZpw3gbxpbXAS9A9zFuqwj5Wr++QzlsKNnYYJwNPs46heHJLHzZ4Z2
         KdkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751641853; x=1752246653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bvJiY2dZo3pNiujZpKtOlAnOocLspC8eh6GM0lveI1k=;
        b=MgvslhI8S59IrzMrZbNEfvp0pUWabUASENeLvoE3/JPu0bVycPEu8Eil9/XfcsBjPS
         BDafUby5s06RntjTnnGgm3rzUxArold3rvmRHzctYcWe3Hr4UON2KEgc/98GcUDi9WNn
         RTQV0mXJZjAGicatD43KicfRV9/jhS0H7mvHfdjR2VZj9KypU6rHNptlTN9WnonKEMa/
         yiIqqFwRyv1gBnOuZNy4CjeqFAum4I3XSoERBQhsYmlVVeePpG86TE3FWQwJ7UYf2tSA
         KyFLkV79UahZdKb0vmsxFtjUFkh0h7hsEGFL7SdGASfiomWlVZYnjGXEnL6wPGv7aCh2
         toog==
X-Gm-Message-State: AOJu0Yyb8dtrLtqvxZGzHt7Ea7S2mRd1LqsJHaP5djWPIbaluJd0r36A
	WFMgCEUJm4nu3mKWXJJ5/2AG4gOW8vT8k5KiKhIduKSBTgXJp+WdpMlv2XL7apaPugenrofc1xP
	DCVjf
X-Gm-Gg: ASbGncsPOMCx1nzaoMo3xLVQTs7/wjBSzQqjojfoY2/qP47+PevsikvKyjle4Mfm4z1
	NGmdcRrjHhOJreOlk2zmkIs37sm/ETOgQDzRmiufh54q5GZwIUx0HmCeOfVJ3GBZ8/t6EzvR3Ih
	LZLpEa55i44e6EolX3tP5ST03nYO4708+UsPntQJ+O/eQLpiRmgdP2RHmDucbvZ8qOpT4bSVRJu
	b5BIHKC1SORHIozij4RBfLhd6iJtN5RYeWm1HWves8Qbblh/txVP26huae4d3LhS5f/eycg67Yc
	UKMsFJm3bZg4EzrEvTJ/iO4cEU0yxD85UkocHQJFsjWRl5SHnPWquA==
X-Google-Smtp-Source: AGHT+IHoD+eH32kInKwLuzILS8BmoxH0dDQ5dqvDyCiBk+Wda7nazrYh7mrD66XWdK+gPg1MIuXQqA==
X-Received: by 2002:a05:6a00:391d:b0:748:f854:b765 with SMTP id d2e1a72fcca58-74ce88249c1mr3736731b3a.4.1751641852704;
        Fri, 04 Jul 2025 08:10:52 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:d985:cb7d:ae84:68cc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce417e869sm2159592b3a.82.2025.07.04.08.10.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 08:10:52 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/11] xwayland: fix CVE-2025-49176
Date: Fri,  4 Jul 2025 08:10:30 -0700
Message-ID: <0a2c5179e1f08ccd0fcaccb6f95c892ebafac8a8.1751641631.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1751641631.git.steve@sakoman.com>
References: <cover.1751641631.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 15:10:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219933

From: Archana Polampalli <archana.polampalli@windriver.com>

A flaw was found in the Big Requests extension. The request length is multiplied
by 4 before checking against the maximum allowed size, potentially causing an
integer overflow and bypassing the size check.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xwayland/CVE-2025-49176-0001.patch        | 93 +++++++++++++++++++
 .../xwayland/CVE-2025-49176-0002.patch        | 38 ++++++++
 .../xwayland/xwayland_23.2.5.bb               |  2 +
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
diff --git a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb b/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
index b9b4aa1a6a..72396dcd40 100644
--- a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
@@ -25,6 +25,8 @@ SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz \
            file://CVE-2025-26601-3.patch \
            file://CVE-2025-26601-4.patch \
            file://CVE-2025-49175.patch \
+           file://CVE-2025-49176-0001.patch \
+           file://CVE-2025-49176-0002.patch \
 "
 SRC_URI[sha256sum] = "33ec7ff2687a59faaa52b9b09aa8caf118e7ecb6aed8953f526a625ff9f4bd90"
 
-- 
2.43.0


