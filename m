Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF56ACDB47E
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 21:53:33 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web11.51168.1697234003756594190
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Oct 2023 14:53:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=cg/WBHrH;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.176, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3b2b1af964dso677216b6e.1
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 14:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697234003; x=1697838803; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ORGXUCHwvI8GGJsBNCuTNC8JTZfunpkQvc0n730BFRM=;
        b=cg/WBHrHT4N/FkLdRYLiyJmjb5nyV5RPk+u4q5BiJ+dplcq6M6YgFsdE3OzlUBSgn6
         YmWWhpi4/peihU1OY/ZF2b9E9mQA7ZeCnFI2IqzulVyvLIP66Q/P9S/ripOeu3kU2+/k
         NvSBJlas+h173U+qMB0XmVV5SqqyYTpQbyTg5PA6ShAAfXu0dcMdAdttXixPoHMVG6uO
         J1A1W124nhaMP7xHbAfOjr2LjQ6rpiadiFzLtFwztkQz/MiYgoIffZFa+Ht7a4JPK/0t
         Ni2P95f208YYLMZ9xfiQH1xzjvqna/614Gu6heg1NuGAPbhCLoQvGq5emDLBE3jVv+oU
         mTEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697234003; x=1697838803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ORGXUCHwvI8GGJsBNCuTNC8JTZfunpkQvc0n730BFRM=;
        b=kwz3s0QAg5PZ8zHisypwnkxpV6P1DEUfpUCuAF2zXHD18xkqFuA7GVP/DeMv5/MWOU
         PGDL4FSszQ8xTAqQDmPc90rYcjJLZ2TE4ha3CgsXKtd3I5FuTDD58h1lIG6IHm48a8xs
         OereNs4uYmfWkZAs5feSmNDvANywoYHiq/kxpjrmTs98ClgtzrP8dhq7cVOg3717k3Br
         JYnlPwRkhLnkBFZmglaawGRRCpApdicmXOyX/hF+G2ee1GGFgIGLPxobVVw4nJJIqd9N
         oE+/UfVws4x6VwEGqG8sPt+1adfXAPzQqaFQ/Y2RcjY9KSK0k4ovCj3nlMZbxXyfPfMy
         Fv0g==
X-Gm-Message-State: AOJu0Ywt1IqV7WWj4C6j56VCQ8YABV0b9Y4eAzOye/u7JrySthkWjNOp
	PMy+W6NpVumscZk3LeN5wbJ3gafS/kCIoca6X2c=
X-Google-Smtp-Source: AGHT+IE0MIRNnY6iN7vZ4n/XdKxNQd+IN71l2fvbe83eqTerSyPD4jGGS19vX9NLMvYpFH6Otsbx1w==
X-Received: by 2002:a05:6808:8fb:b0:3af:7ac8:c413 with SMTP id d27-20020a05680808fb00b003af7ac8c413mr28357693oic.40.1697234002679;
        Fri, 13 Oct 2023 14:53:22 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id u22-20020a62ed16000000b00690fe1c928csm14307334pfh.147.2023.10.13.14.53.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 14:53:22 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 12/27] avahi: handle invalid service types gracefully
Date: Fri, 13 Oct 2023 11:52:36 -1000
Message-Id: <273aed0462728508506a4c65d367d583a86a54c3.1697233866.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697233866.git.steve@sakoman.com>
References: <cover.1697233866.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 21:53:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189089

From: Ross Burton <ross.burton@arm.com>

Services which broadcast an invalid service type will cause the browse
to fail. Instead of failing, replace the service type and continue.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e581da6c4db21312833395e96b48e868a202f0f9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/avahi/avahi_0.8.bb  |  1 +
 .../avahi/files/invalid-service.patch         | 29 +++++++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-connectivity/avahi/files/invalid-service.patch

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-connectivity/avahi/avahi_0.8.bb
index 8649140a45..3fb082cf3f 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -26,6 +26,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/avahi-${PV}.tar.gz \
            file://0001-Fix-opening-etc-resolv.conf-error.patch \
            file://handle-hup.patch \
            file://local-ping.patch \
+           file://invalid-service.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/lathiat/avahi/releases/"
diff --git a/meta/recipes-connectivity/avahi/files/invalid-service.patch b/meta/recipes-connectivity/avahi/files/invalid-service.patch
new file mode 100644
index 0000000000..8f188aff2c
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/invalid-service.patch
@@ -0,0 +1,29 @@
+From 46490e95151d415cd22f02565e530eb5efcef680 Mon Sep 17 00:00:00 2001
+From: Asger Hautop Drewsen <asger@princh.com>
+Date: Mon, 9 Aug 2021 14:25:08 +0200
+Subject: [PATCH] Fix avahi-browse: Invalid service type
+
+Invalid service types will stop the browse from completing, or
+in simple terms "my washing machine stops me from printing".
+
+Upstream-Status: Submitted [https://github.com/lathiat/avahi/pull/472]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ avahi-core/browse-service.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/avahi-core/browse-service.c b/avahi-core/browse-service.c
+index 63e0275a..ac3d2ecb 100644
+--- a/avahi-core/browse-service.c
++++ b/avahi-core/browse-service.c
+@@ -103,7 +103,9 @@ AvahiSServiceBrowser *avahi_s_service_browser_prepare(
+     AVAHI_CHECK_VALIDITY_RETURN_NULL(server, AVAHI_PROTO_VALID(protocol), AVAHI_ERR_INVALID_PROTOCOL);
+     AVAHI_CHECK_VALIDITY_RETURN_NULL(server, !domain || avahi_is_valid_domain_name(domain), AVAHI_ERR_INVALID_DOMAIN_NAME);
+     AVAHI_CHECK_VALIDITY_RETURN_NULL(server, AVAHI_FLAGS_VALID(flags, AVAHI_LOOKUP_USE_WIDE_AREA|AVAHI_LOOKUP_USE_MULTICAST), AVAHI_ERR_INVALID_FLAGS);
+-    AVAHI_CHECK_VALIDITY_RETURN_NULL(server, avahi_is_valid_service_type_generic(service_type), AVAHI_ERR_INVALID_SERVICE_TYPE);
++
++    if (!avahi_is_valid_service_type_generic(service_type))
++        service_type = "_invalid._tcp";
+ 
+     if (!domain)
+         domain = server->domain_name;
-- 
2.34.1


