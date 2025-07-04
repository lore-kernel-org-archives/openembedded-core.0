Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6188C83F09
	for <webhook@archiver.kernel.org>; Fri,  4 Jul 2025 15:29:18 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.14820.1751642953780092103
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jul 2025 08:29:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=j30d6hyE;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-747c2cc3419so951847b3a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 08:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1751642953; x=1752247753; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wXfBT4cvnKP7+K+zVEZ+FosN8fS8yv1NB8As+3UT9NQ=;
        b=j30d6hyEXEEyexg3eK5KmETBnzvqegZ2Fdz6vL26R+UrdtiC/Q3fI8FmymGqeVa/GZ
         5fd1GGo2tEI6oYgHJyusey2VOeIwgl/HVlNG/1DgKiP5ZgmFC80rNbH5yfkk4LjgD5ia
         1MDppVIbq672QZOkWXPWAa+YUkA69fKHPCOa4N0tQjq06C5a52UrG5nAPufS7t/szQ+d
         pbDIxyF8eK1L3rGU77GxBHl/dn2JMQZnXwR3/nXZ4O7PfS/3DO3pwj0MtCYM1rU4A/dJ
         6K60okDbGd/Qr4LgTbVdVjvtSphZxrlHDkkl6PuDE5/1x6DEnS9evSqN/CGGjQYlvy/G
         qURg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751642953; x=1752247753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wXfBT4cvnKP7+K+zVEZ+FosN8fS8yv1NB8As+3UT9NQ=;
        b=ux5N0ATTFJQNHpdct11Pv6I0xyF4N02zd9ZZIo9I1wLdrVgOJho37RDiMbPzVV4W3N
         3kf0MoOwlukHDFh0bpx29jvUuYda5UcAj6OS6toFolqcnwstCYievURphDVgd/Pm0uPn
         8E2KUOXEh9Skn3vNH4NwCnWSciqni316X0Xc+E/pWsMvM0Gy9GOujlx2ZasoK1ByL7WD
         10yCQMx3ebid58KpEBWx0eWPD5bLrNXrmmceCBpESiyzqtwaSNPZuHfLf9Lds3ssifiS
         rySP6ZXlhF+dBWqCUK6Lob4o0JruAsZcFmHo+5x1EHjgo3xGBu3njuyh/di+NDYRokvL
         VdKg==
X-Gm-Message-State: AOJu0YzpDyuJIUyzKfqMxynAVOe/IsWCyQw47N1ZuEpE24/Rype32Q4f
	kCym06ctfWW25+zBShePCtsIIEtdYCszYJ4zl5rbdYhm5tVyBB41EobUj0P6GzF4hHxWhVrB48y
	PL+eV
X-Gm-Gg: ASbGnct8wPFXSDMZ5MW2mvj5GD8sv6Ad/QRB8jJnP+J8nNjlTzQXFP/c5WdG8Zsj+VC
	eOZDYizaodwhN91YMt2TJGqZL41+yzAid2N+rQt2Hexp2iy/ttNzf3mBTSHgSF9BeSyxKzOAT9i
	1FGbqkg2jsTyjqQ4btEhAiQ3lY671xLCbcYJMSeOsCiCFx1Jg0Tcy8bejNB0mneluWq1cToIPrw
	pIW18sSMc+3DFjP/KJs53NbPYbKp7+AvrZQgvSQV9OLNuMaSISAa9xoNVXymD8Ab8t0G0qNuOTN
	/oEvV4C6h5z/MqmuZtYMqiiLne7e1FLk6lSzwR22nA7+obnHtbNLEA==
X-Google-Smtp-Source: AGHT+IHK/MTvLW1C9hWRejp4LWia8wjStRht3xLt2NLbQCEy66iFFjiEw8JNmfXGu79SYapK1ciu2w==
X-Received: by 2002:a05:6a00:4fc1:b0:748:e150:ac5c with SMTP id d2e1a72fcca58-74ce6d7ba84mr4359310b3a.23.1751642952920;
        Fri, 04 Jul 2025 08:29:12 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:d985:cb7d:ae84:68cc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce42a1ca0sm2424232b3a.138.2025.07.04.08.29.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 08:29:12 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 7/9] xwayland: fix CVE-2025-49178
Date: Fri,  4 Jul 2025 08:28:53 -0700
Message-ID: <9ab0fb0deebd4abb22dbfc6b40fe962cb3388fbd.1751641924.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1751641924.git.steve@sakoman.com>
References: <cover.1751641924.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 15:29:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219946

From: Archana Polampalli <archana.polampalli@windriver.com>

A flaw was found in the X server's request handling. Non-zero 'bytes to ignore'
in a client's request can cause the server to skip processing another client's
request, potentially leading to a denial of service.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xwayland/xwayland/CVE-2025-49178.patch    | 50 +++++++++++++++++++
 .../xwayland/xwayland_22.1.8.bb               |  1 +
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
diff --git a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
index fefc0d4e3a..caca8ab0f6 100644
--- a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
@@ -47,6 +47,7 @@ SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz \
            file://CVE-2025-49176-0001.patch \
            file://CVE-2025-49176-0002.patch \
            file://CVE-2025-49177.patch \
+           file://CVE-2025-49178.patch \
 "
 SRC_URI[sha256sum] = "d11eeee73290b88ea8da42a7d9350dedfaba856ce4ae44e58c045ad9ecaa2f73"
 
-- 
2.43.0


