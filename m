Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B007CA0EEB
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 20:50:15 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.4495.1755636607186051147
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Aug 2025 13:50:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=AVQdzXF5;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b4743621044so1738825a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 13:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1755636606; x=1756241406; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NnIrYC17z9n0YpYIupHbMM/zPIktaD2IVmVf+K6YuS8=;
        b=AVQdzXF5psFJyRs84V6qDgQymIjcl3tc6AA2EdkwgVQ2idZn22v9PnUwKj19DsQ8js
         L/L4k++ltjVHuPTz6Zq+1n3/PdKOjjqhPNxkUOHqFZ41SpMkchxdSpGAIxTCNkwIiNhx
         ROe7lq1GJ9KipsZdYwbvufiOmdg4U+VnHehS7WzYZ0pEmiA9f6kjAlcES39tDdyaBAEF
         cUfFjMNXNwIFayENOpZJbybD0yheu0AhxAoewWbpUUFhJDkTJgVtGi0eDxSlxBKiYbcf
         LScSw60LPPR72fHGiljAgZlr81+Oud9yqTiU1O26VJnA4Wq7C1qd3cHtCvIeOJxATMWY
         rZFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755636606; x=1756241406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NnIrYC17z9n0YpYIupHbMM/zPIktaD2IVmVf+K6YuS8=;
        b=Ct0aw85/sR7Vy1MSrrzATaB1qgMxtBe2HUvZIBejo3Tk07rhqhnG0moSIfWhvB+Az7
         i7ZZ4j06ZmmOAW0l612sMN0BqqddyRSQG8Ef70zP0dI7WzyUOjbCxuVVGFQhYfo9v+Fu
         vi2tSvVMGcbNgYj5+KNScmZPGUsjIxrBBye3h3ZFCgw8BOwQFxdGh4waiW3rZlDRQYI7
         7RYsAdtDykfeRzuofZcHRgqfNxQm5LkHm7IUjcmb8bYmGgGkNum37a9iOG2iMsxTxFO2
         Usg/V7WAph7r/rBsT1vMxGnqnhuqegqz/NMfTe+E9DUkufh7/pFDtRcNSn8MAxWa+DIu
         HnUQ==
X-Gm-Message-State: AOJu0YykBqYqzUQM9JB4sEulJdwSP/Uw7fixARiUUSzzRjAXTOMS2l5Q
	zJ/Cv0jt3zB99vSYc5YFj6FyYerBCU9qyzahwGmN6K8CaOpxftS4acAl1gecHPsITK0r+gEduir
	rauCF
X-Gm-Gg: ASbGncvRasjb4A8TVFvKxSZoguXHPcDUnZ2AHeIjAjKR3l1df/acPrVXTSyFNaN3Bmu
	fQAiGgxEwNjgzef8qZ7sHBtPRmL8vsCrO5smH07017qdv2MmyrtYpE5v/V2RuzIN+ztRJsl/Ozi
	oEI/Mu8qi4OetDhh/OCVxXeeEzQC89NY52suVcsSq8mQ1VzPXRNe3ug1K3+z4/JlFDyDQ8r8NA8
	LqeDdZChvqpRvw2u3vd7HyczAsvDGTHXpg7bsGaxf48etWp3d09T4eEpGJqTKEy1Zy9yJCCRi0+
	DaqRq29d579+m38r9kiRhv8LsSJHOyerYT6TLt+P61JIWd7/XGbR1LpVPwJ4s5PVVSLpXv5ps4b
	bMaRVaYY2dwY4bg==
X-Google-Smtp-Source: AGHT+IF3juAQ7/X7BgwxogyH/XIx6D/FDy3R7OI678b2/G1FPXwYCGQTGBB9xhVwKUK1e8lPxPl81Q==
X-Received: by 2002:a17:903:1968:b0:242:9bc6:6bbf with SMTP id d9443c01a7336-245ef286117mr3580235ad.54.1755636606296;
        Tue, 19 Aug 2025 13:50:06 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:f07e:6fcf:4f52:4db2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed33af50sm6179675ad.2.2025.08.19.13.50.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 13:50:05 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 5/9] xserver-xorg: Fix for CVE-2025-49176
Date: Tue, 19 Aug 2025 13:49:44 -0700
Message-ID: <d1b634ce77b5d47b086a2c757acf50e6e002494b.1755636489.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1755636489.git.steve@sakoman.com>
References: <cover.1755636489.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 20:50:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222144

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from
https://gitlab.freedesktop.org/xorg/xserver/-/commit/03731b326a80b582e48d939fe62cb1e2b10400d9
& https://gitlab.freedesktop.org/xorg/xserver/-/commit/4fc4d76b2c7aaed61ed2653f997783a3714c4fe1

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.43.0


