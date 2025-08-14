Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3578CA0EDC
	for <webhook@archiver.kernel.org>; Thu, 14 Aug 2025 13:59:02 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.23245.1755179934995117044
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Aug 2025 06:58:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=aFTwCGt8;
 spf=pass (domain: mvista.com, ip: 209.85.216.42, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-323267bc0a8so1627228a91.1
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Aug 2025 06:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1755179934; x=1755784734; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OJ+rylSJPE6o39FoCnY4KkQB9DfgSfwdhCCftXE9SzY=;
        b=aFTwCGt8w5XiXTucqqn/7zCcrpnHXg2JSgK0sff9EB2TL7k6dpBJ3iYTBLgoZM1Tdz
         2QyzDiCu5G534jWp8gCYiu2+cSkI3DAJRR1e8DYiMbc2imX63HiGbjCtfswqQLMLY5z1
         8QREAVTbODeQ9WLGVykXZIGMZUfI4kwBwW1wk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755179934; x=1755784734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OJ+rylSJPE6o39FoCnY4KkQB9DfgSfwdhCCftXE9SzY=;
        b=dVto9r1m90SjFItxLB/mBY/9j8uwRv6JfQ7SESxtSMIoEmnpzjxP2fEMEp3na7WMP1
         RwW/CW+GdBMH+V2IaRO1E+WVtubw2jj7ttGGDnVEg+Mh4imkMJwVrvA0A1amI27mdYws
         xegldpfA14Za0RPPNLofce4EPuN5FF4C6GQmpU0sIbtST497ZOJvtKI8i82v/5iT7oO2
         jHYUJV+/7Rwwzq05oJh0jkl2+kUPI/j/QTE1kTBafbAROkGvkhxJqP6TXhfep2LcL8b4
         bBpLlViBqA8pQFVM+JUDCSfK+20exrdY4Zh1euhy7u2AXDqaDr5xYy/md+tfiU/lH/xv
         ufmw==
X-Gm-Message-State: AOJu0YxNll/LQANjH6Yoy4o0E27eiT7IpGmC/x6SB7IdsePs3j0i+xes
	VXYrYALQqJTQQYQXCaT3dfolVXvPCYpKD0mGFiuoIZsvMuHNI0EzJYA7RHxiF66vqnAw31Livz+
	BK3vBgSA=
X-Gm-Gg: ASbGncvkYjHbyAmEU8AaqfvzXO8sd+Xcc2XBzDwyM1XbRo717s5iWwDThMLCyX+NjSL
	rabSUumDY16Sb0KQIIswFM2zc4Ws6nYQC/g0J97rKcsXEhs/QJGUn72RaO2AddWRr7oNDq9slPh
	qxQqMHzJsAtsV6XQX7jLqnnqm1z7rRhgdQ0OHbMdjmGXmVE6TMjCfCAzot+UCwRwFCLGQt2awsx
	cv8Ecyg5YaQgyBRFcPgT0QJuHOYXiggaQEK1anaBswz8qPdzaSPDiXIi2ZDD03iUdJLP1D33SvS
	TZLg9QFuuW13k9cTlnXyAfzgj1BNzrZiuJXHZjrIkGVG0mjol1v5ESLZrUSm/87pPnsaY7SPTXU
	6+COoq8hSHmv28a7B3C/9em4vVyDhyMcXnw==
X-Google-Smtp-Source: AGHT+IHbmuOFbPU7hzPFtVxkQlZrweFjyiJjwgTqHOoA+BOqLIAZvv44mxasSWfvuqC3me2DlNZ1BA==
X-Received: by 2002:a17:90b:1c92:b0:321:75c1:65b2 with SMTP id 98e67ed59e1d1-32327a4e0d9mr5785519a91.18.1755179933621;
        Thu, 14 Aug 2025 06:58:53 -0700 (PDT)
Received: from localhost.localdomain ([49.207.229.79])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3233100c1d0sm1919591a91.17.2025.08.14.06.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 06:58:53 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH 2/3] xserver-xorg: Fix for CVE-2025-49176
Date: Thu, 14 Aug 2025 19:28:30 +0530
Message-Id: <20250814135831.981377-2-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250814135831.981377-1-vanusuri@mvista.com>
References: <20250814135831.981377-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Aug 2025 13:59:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221865

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from
https://gitlab.freedesktop.org/xorg/xserver/-/commit/03731b326a80b582e48d939fe62cb1e2b10400d9
& https://gitlab.freedesktop.org/xorg/xserver/-/commit/4fc4d76b2c7aaed61ed2653f997783a3714c4fe1

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../xserver-xorg/CVE-2025-49176-1.patch       | 92 +++++++++++++++++++
 .../xserver-xorg/CVE-2025-49176-2.patch       | 37 ++++++++
 .../xorg-xserver/xserver-xorg_21.1.8.bb       |  2 +
 3 files changed, 131 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-49176-1.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-49176-2.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-49176-1.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-49176-1.patch
new file mode 100644
index 0000000000..24c0156540
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-49176-1.patch
@@ -0,0 +1,92 @@
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
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/03731b326a80b582e48d939fe62cb1e2b10400d9]
+CVE: CVE-2025-49176
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ dix/dispatch.c | 9 +++++----
+ os/io.c        | 4 ++++
+ 2 files changed, 9 insertions(+), 4 deletions(-)
+
+diff --git a/dix/dispatch.c b/dix/dispatch.c
+index b3e5feacc2..2308cfe6d1 100644
+--- a/dix/dispatch.c
++++ b/dix/dispatch.c
+@@ -527,9 +527,10 @@ Dispatch(void)
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
+@@ -550,7 +551,7 @@ Dispatch(void)
+                                           client->index,
+                                           client->requestBuffer);
+ #endif
+-                if (result > (maxBigRequestSize << 2))
++                if (result < 0 || result > (maxBigRequestSize << 2))
+                     result = BadLength;
+                 else {
+                     result = XaceHookDispatch(client, client->majorOp);
+diff --git a/os/io.c b/os/io.c
+index 1fffaf62c7..3e39c10e6f 100644
+--- a/os/io.c
++++ b/os/io.c
+@@ -300,6 +300,10 @@ ReadRequestFromClient(ClientPtr client)
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
+GitLab
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-49176-2.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-49176-2.patch
new file mode 100644
index 0000000000..6476af9a85
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-49176-2.patch
@@ -0,0 +1,37 @@
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
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/4fc4d76b2c7aaed61ed2653f997783a3714c4fe1]
+CVE: CVE-2025-49176 #Follow-up Patch
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ os/io.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/os/io.c b/os/io.c
+index e7b76b9cea..167b40a720 100644
+--- a/os/io.c
++++ b/os/io.c
+@@ -394,6 +394,8 @@ ReadRequestFromClient(ClientPtr client)
+                     needed = get_big_req_len(request, client);
+             }
+             client->req_len = needed;
++            if (needed > MAXINT >> 2)
++                return -(BadLength);
+             needed <<= 2;
+         }
+         if (gotnow < needed) {
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
index 565489a926..6013d0e53c 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
@@ -37,6 +37,8 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
            file://CVE-2025-26601-4.patch \
            file://CVE-2022-49737.patch \
            file://CVE-2025-49175.patch \
+           file://CVE-2025-49176-1.patch \
+           file://CVE-2025-49176-2.patch \
            "
 SRC_URI[sha256sum] = "38aadb735650c8024ee25211c190bf8aad844c5f59632761ab1ef4c4d5aeb152"
 
-- 
2.25.1


