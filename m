Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BBD2C7EE23
	for <webhook@archiver.kernel.org>; Thu, 11 May 2023 12:58:16 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.58074.1683809890624687212
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 May 2023 05:58:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=bABA/YE4;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: max.oss.09@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-969f90d71d4so532459866b.3
        for <openembedded-core@lists.openembedded.org>; Thu, 11 May 2023 05:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683809889; x=1686401889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=edcBmstFNHSQvZeoogrbXXz6RfKNvuTPWIDQX4qDR3g=;
        b=bABA/YE4kS1SKFGzxc9+YrItfNfzf1VxwRNdrUjPk+7JZQDi/TzLZpAheSqETvmauZ
         D5bdr7bWBygX2veNCd5P5Cuy+LRKIBYBwaekzI8UcnyFnn8SCL6+p7i9GPHpoI9iuKJW
         QbY6LjusCkm7yiK7VR3oH73HgH+uXw9eCXUI9j69XHFiCPlGC1SFwqR/eLMbPr5FzyLB
         ude6AjIe7qkftstkPM8JNOOn7KBp4E/yS0lpCNEfO4k2VcSt95truqRtXqcU9BIIJSpk
         SrAF3Ctt0zF7GPjYCVMtmIbJsjsZi6FbuWpb8EtkRmoD3tcWoGSgZoYw6UAv67RS5HmU
         Ff0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683809889; x=1686401889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=edcBmstFNHSQvZeoogrbXXz6RfKNvuTPWIDQX4qDR3g=;
        b=S9DzUuHzi2OMi75AGSsxIKbJoAnVZTuCMIUh1FUcr3YAeB6xOHMfpoh1YmKNRTsM4L
         f/UVpncnIn9ujuX32Uc2PGXxESP0kfpWwDwzX8bSuzdR0YcsUTl5Mm8O4ciKGWTr/Jee
         1RS6lzbREGkgezqzHt/62dtz5edOFYpTSh9Aow1BPVGBJVmnWdfbqSWJO/hGoWBBpMc+
         uMIEeNP7h8ctgtQLzuaejlIHBj4hEmZmAhdVRoum9w0LgrECvONlemjJKVXB5oxfQeMN
         h2ZsAUFwezNRHvNcLwKDs0hgSkoLz4gcTp7f//ujdIlymFIDxKZRyxmyrbWUY9GvfynD
         l7nw==
X-Gm-Message-State: AC+VfDyygGUnwwKv1DsMbgQomk4pigrD198VtrChV+eCG7no3yF3tvdQ
	kvvuqF4C0TAPLaQX3vi/qQaoqNmO1h8=
X-Google-Smtp-Source: ACHHUZ5d35kv2QQ3yyr6S40bmagf9xDyVBe/CxqNk1SgsXH5QxDgeRqjRRh07mfNqbK+vFF2oVVTZQ==
X-Received: by 2002:a17:907:7282:b0:96a:4654:9a49 with SMTP id dt2-20020a170907728200b0096a46549a49mr3009873ejc.67.1683809888863;
        Thu, 11 May 2023 05:58:08 -0700 (PDT)
Received: from linuxdev2.toradex.int (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id f7-20020a170906494700b00965bf86c00asm4047223ejt.143.2023.05.11.05.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 05:58:08 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: bruce.ashfield@gmail.com,
	raj.khem@gmail.com,
	quaresma.jose@gmail.com,
	Max Krummenacher <max.krummenacher@toradex.com>
Subject: [OE-core][Patch v3 3/3] perf: add libtraceevent packageconfig
Date: Thu, 11 May 2023 14:56:03 +0200
Message-Id: <20230511125603.958144-4-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230511125603.958144-1-max.oss.09@gmail.com>
References: <20230511125603.958144-1-max.oss.09@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 May 2023 12:58:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181135

From: Max Krummenacher <max.krummenacher@toradex.com>

With kernel 6.4-rc1 commit 6898e60f709b ("perf build: If libtraceevent
isn't present error the build") having libtraceevent is a required
dependency unless building it with 'NO_LIBTRACEEVENT=1'.

Older kernels did build libtraceevent as provided by the kernel sources.
(Unless LIBTRACEEVENT_DYNAMIC=1 was defined, then it tried to pickup
an external provided libtraceevent and printed a warning if not found.)

Add a libtraceevent packageconfig which adds the dependency on
libtraceevent if set, otherwise builds with NO_LIBTRACEEVENT=1.
For older kernels the old behaviour of building libtraceevent from
the kernel sources isn't changed.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 meta/recipes-kernel/perf/perf.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 80199a4515..19f8aadaa0 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -11,7 +11,7 @@ LICENSE = "GPL-2.0-only"
 
 PR = "r9"
 
-PACKAGECONFIG ??= "scripting tui libunwind"
+PACKAGECONFIG ??= "scripting tui libunwind libtraceevent"
 PACKAGECONFIG[dwarf] = ",NO_DWARF=1"
 PACKAGECONFIG[scripting] = ",NO_LIBPERL=1 NO_LIBPYTHON=1,perl python3 python3-setuptools-native"
 # gui support was added with kernel 3.6.35
@@ -27,6 +27,7 @@ PACKAGECONFIG[jvmti] = ",NO_JVMTI=1"
 PACKAGECONFIG[audit] = ",NO_LIBAUDIT=1,audit"
 PACKAGECONFIG[manpages] = ",,xmlto-native asciidoc-native"
 PACKAGECONFIG[cap] = ",,libcap"
+PACKAGECONFIG[libtraceevent] = ",NO_LIBTRACEEVENT=1,libtraceevent"
 # Arm CoreSight
 PACKAGECONFIG[coresight] = "CORESIGHT=1,,opencsd"
 
-- 
2.35.3


