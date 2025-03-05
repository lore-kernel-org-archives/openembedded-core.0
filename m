Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8E9BC282EC
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 15:59:04 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.16702.1741190340835482090
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Mar 2025 07:59:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=liFsfPuN;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-22401f4d35aso9894995ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 07:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741190340; x=1741795140; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ynvfTxCo1YXf4irWDLt7okSJKLwwD7Xj5DhWNiyJws8=;
        b=liFsfPuNp1fsoVE8Uqn2iJWhtT4YMe23+2zij7QlgIM9PO/wcT47vpCxbNpMKoK2rD
         TEt6RkhSbNykkDG+03VA6XnVfAECHCoLjlakSUwGRe3NUlirVGaD0cQjqDy6H/9bGNLT
         kp03ok04SDKZu6IokSWofcl5Nhksmx++Fmr5o/vnNQQLODB4JGVzhuorACC1SNkYfnAR
         dc04St7exR90PL0+ZejnO59aUA89W87gYwQy2H+TI4lKoZ1oRiw3raEKLPpwirBnBsc8
         14kmf0RgxktGNtnVCrn6m9GaQWZ+b8odcKXKX/mTiKvnZfdS8KfXcraBRpSjITOJGGon
         tYTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741190340; x=1741795140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ynvfTxCo1YXf4irWDLt7okSJKLwwD7Xj5DhWNiyJws8=;
        b=Bb/kuQuIOurnJexJCqsYy0SlB8H/vdC1d04V2X89z4lowjGisFzuypD0lRu2KSmoPp
         IYq1cNLYJ0kK4g7nExWz1QyQq0Vf2nBiztUjjwgFUmiGu2djtnaNW5/FuYcvO8SDhcA4
         +zNlfzvT3eP70Pxa+zvGI3nRwH5AIbY+ANtVsyNXVRY3GFpZlvKDvCz/BxEriMQpPTOJ
         olbsTa5aPQHJKe4iXC8GTQRvMA+sOFfjknnkR2yIwW2Bx5gsSA9UvPfYOVbrTR5KP5jx
         61NyhLhO/UZMQB6v7Ck8E6eGhN2m5GQwqmy7SNtbmSzf5kWM72glkxykPTSefajm5rSK
         1zsw==
X-Gm-Message-State: AOJu0YyIPpN+dMQiAAWDKEqt9OSzl9BCLEuOkk32464O0nUhuL8CzPXa
	96U/AiD/h1X8QhWtVIqieTcJRywSjdnGvHBRgRMl7YwIYQwNK0e+3Ij08JoAfNS07sCGUV1nIXv
	p
X-Gm-Gg: ASbGncvz6efYQ97OUJFvirdptExMV/Ce5gv5P+mFw2iaoqO3tEI0Pdogyblo1NrxfkU
	Vob4f1dRivcITOIkCLymuu05AQtDzL6JdHlj8Gj6iqGD5As/E0x5fumHOKttQ7sp/XNe+zp/b1S
	bwh+cSsatOrXeoionCSzOgPUZ+vHI+njlgLVkpiM/HifVcUjdKofDy+QbbTkE/aE95QimQWRUAj
	S/coCU+If5je7A8L6Dz8hIBxGRJ+xJH3Nzz6n54+PfqzlPXxhUppndqz8rCGdzRCXrtj+t1VJKv
	OCY1Jpi1nSI1rZWEm5PIP8QxBrbhdrz1mJQ=
X-Google-Smtp-Source: AGHT+IGqkOeweBNcabWa8jjQ/M9rC161PoHQvAY/W6h9TggPkuYpj6Wx6L2fRjBT6EIdCvMQQpDmRw==
X-Received: by 2002:a17:902:d50f:b0:223:5e76:637a with SMTP id d9443c01a7336-223f1c97445mr44146195ad.23.1741190340069;
        Wed, 05 Mar 2025 07:59:00 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:2308:d28:2350:a5eb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501f97bfsm115411025ad.85.2025.03.05.07.58.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 07:58:59 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/16] xwayland: Fix CVE-2024-31080
Date: Wed,  5 Mar 2025 07:58:33 -0800
Message-ID: <4e41b1c8cccd3b2f359ee949cad402b9418f5983.1741190221.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741190221.git.steve@sakoman.com>
References: <cover.1741190221.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 15:59:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212326

From: Vijay Anusuri <vanusuri@mvista.com>

Patch copied from xserver-xorg recipe.
CVE reported for both and patch apply on both.

Upstream-Commit: https://gitlab.freedesktop.org/xorg/xserver/-/commit/96798fc1967491c80a4d0c8d9e0a80586cb2152b

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xwayland/xwayland/CVE-2024-31080.patch    | 49 +++++++++++++++++++
 .../xwayland/xwayland_22.1.8.bb               |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2024-31080.patch

diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2024-31080.patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2024-31080.patch
new file mode 100644
index 0000000000..40296903cd
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2024-31080.patch
@@ -0,0 +1,49 @@
+From 96798fc1967491c80a4d0c8d9e0a80586cb2152b Mon Sep 17 00:00:00 2001
+From: Alan Coopersmith <alan.coopersmith@oracle.com>
+Date: Fri, 22 Mar 2024 18:51:45 -0700
+Subject: [PATCH] Xi: ProcXIGetSelectedEvents needs to use unswapped length to
+ send reply
+
+CVE-2024-31080
+
+Reported-by: https://debbugs.gnu.org/cgi/bugreport.cgi?bug=69762
+Fixes: 53e821ab4 ("Xi: add request processing for XIGetSelectedEvents.")
+Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/1463>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/96798fc1967491c80a4d0c8d9e0a80586cb2152b]
+CVE: CVE-2024-31080
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ Xi/xiselectev.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/Xi/xiselectev.c b/Xi/xiselectev.c
+index edcb8a0d36..ac14949871 100644
+--- a/Xi/xiselectev.c
++++ b/Xi/xiselectev.c
+@@ -349,6 +349,7 @@ ProcXIGetSelectedEvents(ClientPtr client)
+     InputClientsPtr others = NULL;
+     xXIEventMask *evmask = NULL;
+     DeviceIntPtr dev;
++    uint32_t length;
+ 
+     REQUEST(xXIGetSelectedEventsReq);
+     REQUEST_SIZE_MATCH(xXIGetSelectedEventsReq);
+@@ -418,10 +419,12 @@ ProcXIGetSelectedEvents(ClientPtr client)
+         }
+     }
+ 
++    /* save the value before SRepXIGetSelectedEvents swaps it */
++    length = reply.length;
+     WriteReplyToClient(client, sizeof(xXIGetSelectedEventsReply), &reply);
+ 
+     if (reply.num_masks)
+-        WriteToClient(client, reply.length * 4, buffer);
++        WriteToClient(client, length * 4, buffer);
+ 
+     free(buffer);
+     return Success;
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
index 1d4e699d94..78e849b305 100644
--- a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
@@ -24,6 +24,7 @@ SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz \
            file://CVE-2024-21885.patch \
            file://CVE-2024-21886-1.patch \
            file://CVE-2024-21886-2.patch \
+           file://CVE-2024-31080.patch \
 "
 SRC_URI[sha256sum] = "d11eeee73290b88ea8da42a7d9350dedfaba856ce4ae44e58c045ad9ecaa2f73"
 
-- 
2.43.0


