Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7299C021A7
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 14:22:07 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.16834.1739370118777625950
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 06:21:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ThcV8Hrm;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21f62cc4088so85809295ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 06:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1739370118; x=1739974918; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GyfEHGF5/0jbyt5NwH5Qt59D6DaxEu3gr03oLZtuGZo=;
        b=ThcV8Hrmycybd5gvZ6fly9+1WuRQHzbmVQ+Xrk5wmIhHVMEJi2PSJXeNkw4wHUL/q0
         481lWFBC1lDlFl6HGYvzcXkYat4XY+kjTjLipDcLj9WlQc0c6kD6nYOGpcqwkblcYA6x
         2Og9E8hOq7Uo+ecY6LM4LxGrIgUhNqqoTKqJwwkVJn6ORjaBLFIyzHTdwAAmQdR8kN07
         EBT5AUjIcfliVHIfK2uH4n8GYS+sJRKujmX9TJklj6ihp+tmAmJsgPUw7dQoKJlv9YJz
         32J2QshXzQsAouqHxIBsJe4hUImJw4NuY6xxOMWSdPVu4/u8l/EJAII5yP5WTqSjACxI
         aApA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739370118; x=1739974918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GyfEHGF5/0jbyt5NwH5Qt59D6DaxEu3gr03oLZtuGZo=;
        b=RKAstAyk8bO8v3mCaFbkuTYfh+9aZ5Lr9O7O6sLu7OhYCSu0ckBKom6TNgkl80Pb6M
         SI4v7/UJqZMe7RHU71eiCP51g7Q2tJ7NHY4gT2ow0Ha2EC97vymYbFQOEXJuLuxz+h4E
         KC3uBc3N/uOMrUFXdCM5KiEmD2kd6yta7/1gQ+9+Z4j4rSim6lGMb9HNR1kqUxgfBf1J
         IkRheqHOctV4DMJFgpt38lRt5PB0qS2miHFHLLOKQc8JjDNXP1Cdo8XJfca7VZgWIWkS
         emciBLDAwyvt8x0ZbYloydKTHAi7g7dgCe+Natk+yAl46Iq1KFAUQKEsxnd6rSlk2t+0
         UqGQ==
X-Gm-Message-State: AOJu0Yw+klW8rR2FEy+wHHXHCDoFMtiTkI7FbVwh53mFjo3d543NwQ88
	VuUhDyawX5q0mwNQa1g2+s9uWcFmTusn15M/6zTMtdCHMe+9VW24tJxOYdHmKgsjXCUaxzXuCos
	/
X-Gm-Gg: ASbGncv3xmXXBTqLH93M42l8Ws9s9OtnIcVZmLSIYQ69t14f7USrPayzjh4dIIyLfJ2
	M8SdKtM7BKOnTPD4RmvD/UpoY4RBiKJNdQF2x+rc/lX80qYNIdEiQ68zdOaBpmNK39RDlf0C+xM
	jIBZP3tKy2+tWIJLVisZ9zO01jPVoWWfYPNNcatLdIcK29F9ptbND0u4EinNd7b2AAZ/FBqK17H
	jXPOeOsfjzn6fJyI6UuUK68P4ssMfZoIMdQyhmP2WDtTHjjmVoJNXz0SpByBxyLtnTrVUEQ43GN
	bxZu
X-Google-Smtp-Source: AGHT+IFuEsrVXq55+phyi/9ASnK08IxgccGmJq/UK4ig8AdTIe8X1f2DOvmCtr8iY7sjweK51uvgWQ==
X-Received: by 2002:a05:6a20:a124:b0:1e0:d89e:f5bc with SMTP id adf61e73a8af0-1ee5c73f004mr4652475637.11.1739370118041;
        Wed, 12 Feb 2025 06:21:58 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73079facc59sm7445260b3a.123.2025.02.12.06.21.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 06:21:57 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 7/7] cmake: apply parallel build settings to ptest tasks
Date: Wed, 12 Feb 2025 06:21:37 -0800
Message-ID: <bd12abeff6ee14385fba63fa5ba15d9fadec4d0e.1739369945.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1739369945.git.steve@sakoman.com>
References: <cover.1739369945.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 14:22:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211241

From: Peter Marko <peter.marko@siemens.com>

ptest compile and install tasks do not have parallel build settings for
cmake. On powerful build machines this can cause overload situations
and oomkills.
Observed when building qtgrpc with ptest generally enabled in distro.

Having this in ptest class is suboptimal, but creating ptest-cmake class
just for these two variables is probably overkill.

(From OE-Core rev: 3c311fbf0c2090268e9b83123d762b05b61b4074)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/cmake.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index 7ec6ca58fc..0c0d719829 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -62,6 +62,8 @@ EXTRA_OECMAKE:append = " ${PACKAGECONFIG_CONFARGS}"
 export CMAKE_BUILD_PARALLEL_LEVEL
 CMAKE_BUILD_PARALLEL_LEVEL:task-compile = "${@oe.utils.parallel_make(d, False)}"
 CMAKE_BUILD_PARALLEL_LEVEL:task-install = "${@oe.utils.parallel_make(d, True)}"
+CMAKE_BUILD_PARALLEL_LEVEL:task-compile-ptest-base = "${@oe.utils.parallel_make(d, False)}"
+CMAKE_BUILD_PARALLEL_LEVEL:task-install-ptest-base = "${@oe.utils.parallel_make(d, True)}"
 
 OECMAKE_TARGET_COMPILE ?= "all"
 OECMAKE_TARGET_INSTALL ?= "install"
-- 
2.43.0


