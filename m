Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A452C004D4
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 23:18:34 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.61173.1674170305140518307
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jan 2023 15:18:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Qoa6fvaq;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id a9-20020a17090a740900b0022a0e51fb17so736814pjg.3
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 15:18:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kwSBFUzjUESLsklyUfced+eHK1hiiBbKQfaIpzPpz28=;
        b=Qoa6fvaqoR9wrBZiNh0ExEoYnVN7QBFo6klu+6j40UPvlNkil07yce7EK/wbcErpK1
         mYy6r9oQV0BIiJwdNvjHmTQFzv8ZP6jOYSGgjfERb+RlS+0jmeYffwVRbcbt17oDT3Ev
         hvVxJxSwzrOxFgid0va0Bo8jUG7Q7xCw4nHXGrU4SjKykjsXyx5Q8jSIgU+CngaTIViA
         K9tPNBILLDwVa+MI69Etc5CYhmYopXPZrGJBCRc0+lFcrfyMCP22zgQllWy4qthzOJOu
         jVOcQ1h7u+ivMJoOtf6e5IjTMh9ArC75hSfZmGzodEMuTj6Af94CmNs8xtgru0e9e7N+
         0d3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kwSBFUzjUESLsklyUfced+eHK1hiiBbKQfaIpzPpz28=;
        b=40dzVq5x+M5Lj1ZVuSDuQno2R+75ybWMNaqf8B5cyVzgEFgaZQtR6xqSzQ/yAKrPSt
         pSdlUKBwCGFMUJqbSvzuU6JvTjWG8IDeyJ+bV+AXNwgTkrB9NHOSTl8t03882n7trwaU
         JZLHObQ8ao9nKdyxVS7tgQxPwGc+/gOrxT6BUX00Hu1s+q2ymwf3h0LcHGFokJcN9E8B
         ug4w4DID1W/+TqOVgyToQQ8++ihRxzI3h9D9GBeeEeIO+W9TtTEJF89lqRRwmfym3hZ2
         poWPUxa/ut+/WGvwHC04SJ7/HnE9Ifo4wh0kNs8d97Y1qUUgNkfk4DQLM99w50qtQtOA
         A/UA==
X-Gm-Message-State: AFqh2kq+0iKkpZxKg5eyFEuak/QR4nYA9qbCfQMeu+Yzitn74oEEHK5+
	9YfPpP91MiJE07nJc8jPOYuGo1V6rpcn5Q==
X-Google-Smtp-Source: AMrXdXvzzZ762EdjCJUtvC/FAijrz3bqT2lj2GBryxN01nz+L59qCcJYTjCJ31PMTlhWfxjxjUq+vQ==
X-Received: by 2002:a05:6a20:4a1e:b0:b8:edf8:ae8c with SMTP id fr30-20020a056a204a1e00b000b8edf8ae8cmr9306375pzb.24.1674170304295;
        Thu, 19 Jan 2023 15:18:24 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::b940])
        by smtp.gmail.com with ESMTPSA id 8-20020a621608000000b0058a3d8eab6asm18382507pfw.134.2023.01.19.15.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 15:18:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/3] libtirpc: Check if file exists before operating on it
Date: Thu, 19 Jan 2023 15:18:16 -0800
Message-Id: <20230119231817.1187300-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230119231817.1187300-1-raj.khem@gmail.com>
References: <20230119231817.1187300-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 23:18:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176170

In some cases (e.g. mingw) this file may not be installed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb b/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb
index 8c6c20733c..f55e0b0ed1 100644
--- a/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb
+++ b/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb
@@ -22,7 +22,7 @@ inherit autotools pkgconfig
 EXTRA_OECONF = "--disable-gssapi"
 
 do_install:append() {
-	chown root:root ${D}${sysconfdir}/netconfig
+	test -e ${D}${sysconfdir}/netconfig && chown root:root ${D}${sysconfdir}/netconfig
 }
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.39.1


