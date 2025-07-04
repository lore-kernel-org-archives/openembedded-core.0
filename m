Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91D2DC83F0B
	for <webhook@archiver.kernel.org>; Fri,  4 Jul 2025 15:10:58 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.14494.1751641856116832174
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jul 2025 08:10:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=WIa/kf6W;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-74b52bf417cso738776b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 08:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1751641855; x=1752246655; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QFZqLw5RtrZb//WwY1IeIXaGY9+JZHG55NxTeYU7Td8=;
        b=WIa/kf6Wv0ThU5qdBtaJ5nFQnibmlG9lxv3zr5lxBjaKm4q7aw1/vTTXeIVK6bppHQ
         yTDtDrZZuTzqIvhjnrHuP+2w5xrgzV5NhIz+VYG6MrEBmCRvI/9mY8IOXivVhTbnaVcT
         okBQ64Rd/DEFy/xu3R/9b1mcEnnvltQqG/NN+3WAqJq3v+66tNDvxVVo1yIaHjY+i6QU
         kB4V8sJzqKG2WB0xkkwTTKK6Z8eBbGoPhyKrA/Fa3rYpgWdULq3ckNllqiYZS/n60JPy
         +hGT35FmZONlTscSXSph0MsO6F+bZm85eHS3Mebak8qtWflvOLXlBhFLc+vZNmx3FBnz
         hSHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751641855; x=1752246655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QFZqLw5RtrZb//WwY1IeIXaGY9+JZHG55NxTeYU7Td8=;
        b=r7N+WfZEjkRWV6s2ZlnTsd8QHIdDYUMQvKhfvHmuMHR3slEaN4wFwCIByOwPbDpVI5
         qCbt3c0CNtWPOZXb15Ou0wpOnozdR+OgOJFK66n0+A4JjnbOMqP1oPXVlo/7HSMh7Ze4
         P2L0wGwoRaB0sFyxEvAZboQ/QzuYlGZr5H66fBOI3i8ilYGPm8uDjufN/QwbNCuwAAoJ
         sxhHscIoXjN7ofZ5gODg4u3E4XHEIZ23e2LwiwIcF9MdkKPHtFX2Cwi16E0i7D/ns6Xe
         fYyqP5L5GQhQZ4CyEAuC5Y6R7SNXpss1ckinlBap2Sku2vwgS0+iXR6n5qnNRHDfZ1ii
         ES1w==
X-Gm-Message-State: AOJu0YyY1OT5ReS9CNSmEJSXS/UeszfjVqWwk5HT2zPpP+/CxMVZAlbZ
	cqoLF31cDp0RcOXfNcMKAFyP4ZZr+TEVsZIh/kEa7v1CMOCi3G/S2bzlwQGUSuqSZFj7z2K4amG
	ZpjVf
X-Gm-Gg: ASbGncs2fTZf8cIGDG1e4GkLdPzOyT0qQOiY9ZCSn8UgrbPMIb/pd6+9trlaFfM6vNA
	Ng/biFPnk7KiNXRtvRk67IaFJTs62kyDkPBE/64Fu1pQIgUnooL5+4dNkLv3AjallUN01dg13Ft
	FuJc4L4Msy6vrFMgsr4BkdZEJwe/uhHmaqGGgXa9kMci0S00TGr7NEqOl1v8Yeg53Mov2WlYehI
	jFbUw2kBuuv89Kslvv0ZDAJ+xPvNJQDWS5GwtoJqIl50O3REzw56YySKmwFKNUGriUaE+p6TRqA
	HCnuls//xIupabF6imxIkyOSHo+HkVu4fjQaD9sBpooBAD2xXmo6XQ==
X-Google-Smtp-Source: AGHT+IFh6er6y26aQqcRhtITSQ4J7ax5rLcNKfHcbHUVuFh4JqSHETHLquY/48V3j8ut4SPf/gon1Q==
X-Received: by 2002:a05:6a00:929e:b0:742:8d52:62f1 with SMTP id d2e1a72fcca58-74ce6419a9emr5405152b3a.8.1751641855281;
        Fri, 04 Jul 2025 08:10:55 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:d985:cb7d:ae84:68cc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce417e869sm2159592b3a.82.2025.07.04.08.10.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 08:10:55 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 09/11] xwayland: fix CVE-2025-49178
Date: Fri,  4 Jul 2025 08:10:32 -0700
Message-ID: <4c6df8320497c2ebf09902a62b6a3f3b061be917.1751641631.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1751641631.git.steve@sakoman.com>
References: <cover.1751641631.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 15:10:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219935

From: Archana Polampalli <archana.polampalli@windriver.com>

A flaw was found in the X server's request handling. Non-zero 'bytes to ignore'
in a client's request can cause the server to skip processing another client's
request, potentially leading to a denial of service.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xwayland/xwayland/CVE-2025-49178.patch    | 50 +++++++++++++++++++
 .../xwayland/xwayland_23.2.5.bb               |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-49178.patch

diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2025-49178.patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-49178.patch
new file mode 100644
index 0000000000..5ef2fea1c9
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-49178.patch
@@ -0,0 +1,50 @@
+From d55c54cecb5e83eaa2d56bed5cc4461f9ba318c2 Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Mon, 28 Apr 2025 10:46:03 +0200
+Subject: [PATCH] os: Account for bytes to ignore when sharing input buffer
+
+When reading requests from the clients, the input buffer might be shared
+and used between different clients.
+
+If a given client sends a full request with non-zero bytes to ignore,
+the bytes to ignore may still be non-zero even though the request is
+full, in which case the buffer could be shared with another client who's
+request will not be processed because of those bytes to ignore, leading
+to a possible hang of the other client request.
+
+To avoid the issue, make sure we have zero bytes to ignore left in the
+input request when sharing the input buffer with another client.
+
+CVE-2025-49178
+
+This issue was discovered by Nils Emmerich <nemmerich@ernw.de> and
+reported by Julian Suleder via ERNW Vulnerability Disclosure.
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/2024>
+
+CVE: CVE-2025-49178
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/d55c54cecb5e83eaa2d56bed5cc4461f9ba318c2]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ os/io.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/os/io.c b/os/io.c
+index 67465f9..f92a40e 100644
+--- a/os/io.c
++++ b/os/io.c
+@@ -444,7 +444,7 @@ ReadRequestFromClient(ClientPtr client)
+      */
+
+     gotnow -= needed;
+-    if (!gotnow)
++    if (!gotnow && !oci->ignoreBytes)
+         AvailableInput = oc;
+     if (move_header) {
+         if (client->req_len < bytes_to_int32(sizeof(xBigReq) - sizeof(xReq))) {
+--
+2.40.0
diff --git a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb b/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
index 5ed8ca0365..e150961882 100644
--- a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
@@ -28,6 +28,7 @@ SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz \
            file://CVE-2025-49176-0001.patch \
            file://CVE-2025-49176-0002.patch \
            file://CVE-2025-49177.patch \
+           file://CVE-2025-49178.patch \
 "
 SRC_URI[sha256sum] = "33ec7ff2687a59faaa52b9b09aa8caf118e7ecb6aed8953f526a625ff9f4bd90"
 
-- 
2.43.0


