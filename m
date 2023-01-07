Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3831C54EBD
	for <webhook@archiver.kernel.org>; Sat,  7 Jan 2023 00:08:40 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.9932.1673050115385319344
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jan 2023 16:08:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OMfX6Sjg;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id h7-20020a17090aa88700b00225f3e4c992so6898768pjq.1
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Jan 2023 16:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sutbFmf25tB7kjPs2yW4F04pjog/kmcCO6uI3egioMM=;
        b=OMfX6SjgUlA6iLR70eZqIFnBnC2E/VyL3kbUGkeZdo6hF2hReJGHNKRnyUyEd8qgIg
         JpiNmU6cj4IpaAu8mYodPhPHtGdRDS1eyUTHx8goze3Am6EJmbnw7asDPmLFDZWtfjV9
         so8e9gIRwaupgy/iynxVCehMvWw5xfm2YAFgy+1oABbrx1c/S8fIwQctjLkqk/hpEvZC
         tde5v9JZa+Xnxk4WC9I0YhPw5NrEW+qDVa8RFS6k3Tte7GruLaFYigcx9uSAVAanI4qR
         I34Eq5zSwvPBP23Ez/hOXXjLjGUSOen+WwTejg7UEWR0xumIQKC4hlspxeEuSZXlbjMy
         U5Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sutbFmf25tB7kjPs2yW4F04pjog/kmcCO6uI3egioMM=;
        b=lYZXSlQ5W/Z0paudx6E+sOl0CtsvwEqg/tJpNfd8XYXPB0107LX+n/+YpXxRLwF7OV
         GsBr/6I2A6geoVQe+W9fStJhZ+RnSIuSZhizzjFEv9gwRIsUQ7We4c3WdMSYRR9iT4c2
         VZD0RrNfsj9StIOaNkXIax0PTKqQQGGk1gqb0KIHjlEn2NUEdSVND11qWIqFTz1DpCR8
         OMZHTdqVTU9ITJxyXJ0JvNHA2trpTCExjlsPnmbZ482liQoHLSqjkG6jZihhlmbSqbYB
         xSTe3KMzZC0ab0d0UVD95w2KhBtP7kpodeK4eXVTBZXOh8EtOGBZUbvi143djYFnJGR7
         HciQ==
X-Gm-Message-State: AFqh2ko4u+GRqiHhzPDhu3EyjjyJPahZsZz8EQkyUmjf1nNc9dhOe88L
	ilwHxo1uAZMt8IlOdR6WWeP58SPqhZz+wg==
X-Google-Smtp-Source: AMrXdXuGbVmUcVX/Dxabj1gBmxHg5wPA9elkVL00zcG9pn9LCSrwt1pmiB51RuWLwiHceqnOHawaxg==
X-Received: by 2002:a17:90b:3797:b0:226:3981:1ae3 with SMTP id mz23-20020a17090b379700b0022639811ae3mr29646600pjb.28.1673050114594;
        Fri, 06 Jan 2023 16:08:34 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::ee35])
        by smtp.gmail.com with ESMTPSA id c20-20020a17090ad91400b00226ed9cbd3esm530981pjv.1.2023.01.06.16.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 16:08:33 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH] site/common-musl: Set ac_cv_sys_file_offset_bits default to 64
Date: Fri,  6 Jan 2023 16:08:31 -0800
Message-Id: <20230107000831.1253334-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Jan 2023 00:08:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175612

off_t is always 64bit on musl regardless of 32bit or 64bit
architectures. autoconf has AC_SYS_LARGEFILE to detect correct off_t
size but it only work with glibc since it defines feature macros
_FILE_OFFSET_BITS=64 and _LARGEFILE_SOURCE but these macros are
not used on musl headers.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 meta/site/common-musl | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/site/common-musl b/meta/site/common-musl
index 86aed4a38c..23e50ef749 100644
--- a/meta/site/common-musl
+++ b/meta/site/common-musl
@@ -15,6 +15,8 @@ ac_cv_func_posix_getgrgid_r=${ac_cv_func_posix_getgrgid_r=yes}
 ac_cv_func_getaddrinfo=${ac_cv_func_getaddrinfo=yes}
 ac_cv_func_mmap_fixed_mapped=${ac_cv_func_mmap_fixed_mapped=yes}
 ac_cv_func_strtod=${ac_cv_func_strtod=yes}
+# off_t is always 64bit on musl systems
+ac_cv_sys_file_offset_bits=${ac_cv_sys_file_offset_bits=64}
 
 # glib
 glib_cv_strlcpy=${glib_cv_strlcpy=no}
-- 
2.39.0


