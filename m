Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D406CA1017
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 16:15:23 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.16922.1756916118713667928
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Sep 2025 09:15:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=WIiOFcGU;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-77287fb79d3so93080b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Sep 2025 09:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756916118; x=1757520918; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=65g7QfRwoMNeoDR7USXzYAqii/ACTYRfwBvXmqNjqrA=;
        b=WIiOFcGU/jTtNiVQ33roncJaCMxnCCAgrJKS0HGLjPXJoFxHcEFKo1Y4PfFqYWJJxk
         3JwuQUqqPBkrQCyHFJ/uxTHZyR46x2BEC4yQYsbNHNJ8lJjloKtO/+UiJRq8oOgTxxmR
         ebAJLO8TTolObA/YvB185wXhlam69WHllOiI8a2ocz/fOCPYHsRXSS/7XMhSJ0/JmY3o
         4HlR1J6C0OuH4zI24aeD7btTbtnRf86jMknI4kWqnamkAiY2NKQPp6UM51pW4y7xwOb/
         nSqSs+krzzfjRx0H1MtL1/1EY6nu8W6qx0uziiyNcLdMoj6ERf3RjQIZapgHyVcgvRIK
         4HgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756916118; x=1757520918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=65g7QfRwoMNeoDR7USXzYAqii/ACTYRfwBvXmqNjqrA=;
        b=wSCZdGWi7Ou4QrMy2zWFzZuauAoMEWtqJ/VjJneTAy42sCNsb05Xbs6qnxxgv0noSN
         voJWn9sVcPIGL1lOEcEi1eYiHckK5DFk2by9jmLFVKoAbHBtiio3afdV5QLXDZwaLpCD
         I5LWPHt5U91R+ojNPLTeaZ32Q2qjmbVCy6FRi+DhlkYm8MJ+pnmwl+sFLOuWaAhaVhk9
         NDO9SvT+EyMnVOOANffRIFCDODv2RGPNrM4wyXznzpvQ7w8PJX6+8OB0y50jg1mL0QIU
         EnMk4afUVODB40aLyZ9+Gs0mBM3mxXCIY9V5dlecgVBwPeBaLm8zUIHFg7ZHNzFJVMWR
         12Fw==
X-Gm-Message-State: AOJu0YzU7NX6sqqhWKmyutj+B/DM1VwgyzlFeJ3rzDFiHBEoK7A3XrLY
	DQQF11ALzfunfI7YnPquY3qdmDWvf+A34/6DxblsIOGXTUstnta4vVeTK+Y4zrMNuMnPVhPhDSQ
	gO8Wl
X-Gm-Gg: ASbGncvFjUDa9nzO7P4HmYOdfzTBXngpCiFmBka95rWO6GZmx6zn0M2EF+9eLUTmYso
	StwP+QTKk+2msj98ynaMWHkFaSW4y8sRiK5QrD/2gIF8oOVjAxvMe5040vRrLx3rtzE7nAa1XWq
	1YVnHqVQY8e8ZV/Nf3WW8PgNsWJdmrulMuOQTw7KKZq8NEC6wLL8LLgXCwatT1wjyhsrv5Wcs+N
	C38OT/9jXJ38o/gZ9yD9lrOEJL5Miih0WHJovEykS7BmEJcJ+qvTB3Md7VQXbWdxRlUHJy80SaR
	6CCoAeWbwfzETiO+zWPnEBQCd6O1gB3fFKqFt7mhFhV65Hh4UIBVVk45SxO8Gc7pwtd0oHPOhtc
	8Y3dpTFCa68ePiQ==
X-Google-Smtp-Source: AGHT+IGvNAUPrsJGUcU7rfP//qR8NTSdUMmCsyKMbghQ44ho7qT3Jk+c8w7XuWOqwAfoS+XHEWIJ7w==
X-Received: by 2002:a05:6a20:a89a:b0:244:d3d0:962a with SMTP id adf61e73a8af0-244d3d099a4mr7074249637.22.1756916117724;
        Wed, 03 Sep 2025 09:15:17 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:9ffe:4bb4:e2b3:4b1c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7724f079b88sm11027602b3a.40.2025.09.03.09.15.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 09:15:17 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 7/9] sudo: remove devtool FIXME comment
Date: Wed,  3 Sep 2025 09:14:57 -0700
Message-ID: <652986a4c67fc5d1c69cd3c2cb0d7f197b960be6.1756915922.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756915922.git.steve@sakoman.com>
References: <cover.1756915922.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Sep 2025 16:15:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222872

From: Peter Marko <peter.marko@siemens.com>

This comment should not have been merged.
It shows that the license did not change.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/sudo/sudo_1.9.17p1.bb | 52 ---------------------
 1 file changed, 52 deletions(-)

diff --git a/meta/recipes-extended/sudo/sudo_1.9.17p1.bb b/meta/recipes-extended/sudo/sudo_1.9.17p1.bb
index c5d57da9f0..5b9d73b33b 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.17p1.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.17p1.bb
@@ -1,55 +1,3 @@
-# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
-# The following is the difference between the old and the new license text.
-# Please update the LICENSE value if needed, and summarize the changes in
-# the commit message via 'License-Update:' tag.
-# (example: 'License-Update: copyright years updated.')
-#
-# The changes:
-#
-# --- LICENSE.md
-# +++ LICENSE.md
-# @@ -1,6 +1,6 @@
-#  Sudo is distributed under the following license:
-#
-# -    Copyright (c) 1994-1996, 1998-2023
-# +    Copyright (c) 1994-1996, 1998-2025
-#          Todd C. Miller <Todd.Miller@sudo.ws>
-#
-#      Permission to use, copy, modify, and distribute this software for any
-# @@ -247,9 +247,9 @@
-#
-#  The file arc4random.c bears the following license:
-#
-# -    Copyright (c) 1996, David Mazieres <dm@uun.org>
-# -    Copyright (c) 2008, Damien Miller <djm@openbsd.org>
-# -    Copyright (c) 2013, Markus Friedl <markus@openbsd.org>
-# +    Copyright (c) 1996, David Mazieres <dm@uun.org>
-# +    Copyright (c) 2008, Damien Miller <djm@openbsd.org>
-# +    Copyright (c) 2013, Markus Friedl <markus@openbsd.org>
-#      Copyright (c) 2014, Theo de Raadt <deraadt@openbsd.org>
-#
-#      Permission to use, copy, modify, and distribute this software for any
-# @@ -282,7 +282,7 @@
-#
-#  The file getentropy.c bears the following license:
-#
-# -    Copyright (c) 2014 Theo de Raadt <deraadt@openbsd.org>
-# +    Copyright (c) 2014 Theo de Raadt <deraadt@openbsd.org>
-#      Copyright (c) 2014 Bob Beck <beck@obtuse.com>
-#
-#      Permission to use, copy, modify, and distribute this software for any
-# @@ -299,7 +299,7 @@
-#
-#  The embedded copy of zlib bears the following license:
-#
-# -    Copyright (C) 1995-2022 Jean-loup Gailly and Mark Adler
-# +    Copyright (C) 1995-2024 Jean-loup Gailly and Mark Adler
-#
-#      This software is provided 'as-is', without any express or implied
-#      warranty.  In no event will the authors be held liable for any damages
-#
-#
-
 require sudo.inc
 
 SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
-- 
2.43.0


