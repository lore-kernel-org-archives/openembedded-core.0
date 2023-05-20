Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52B82C7EE2E
	for <webhook@archiver.kernel.org>; Sat, 20 May 2023 16:05:25 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.13616.1684598724062426687
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 May 2023 09:05:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=MTtwRFV0;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-64d2a613ec4so1799761b3a.1
        for <openembedded-core@lists.openembedded.org>; Sat, 20 May 2023 09:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1684598723; x=1687190723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uCW3Z0t5RY10PiBh4pfS/eDM/xRKX8XbICv5qN+lEsU=;
        b=MTtwRFV0/PXRE4Xjo7VW+lq0W/+UJhK+rFYWOCe7Rr5gasZTaPXyGRhuiaemmAFRYP
         risBPyuhqtkY14YbhVdLJFVlL8ECh13AvseMUgBy6MsUgm5P3lK17nQ6fm0W2PalZsFD
         U6G466KoeCz8GH9sFc7m8vwpoA23bSLhrgri4f6T7wDd6xQGfCsecrwkoB4Sy6Jcd3bQ
         BQ+LQw3anuwxVZaJ2iFMEZ6xYcxnG6ppq1rtIltSNRYT3j3IhlMmnztti+iKiYppQvyk
         K2/nhJzNyDkXCFPV9zAwLWX38HhuLOnCXToZUj9XipIaOjNsVHL8OK5dZwpfbYzt4i2Q
         RUng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684598723; x=1687190723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uCW3Z0t5RY10PiBh4pfS/eDM/xRKX8XbICv5qN+lEsU=;
        b=lfyztQSa00LMV2dcNUcIjX7WVqewaXZaib7zoLsDjRedCjCbA6Kv1OE0kuKQWfUGPs
         PaSXae8aMkme6Bl0kgQFUlGOYvqZRcu9JfMMS99+ngJwiWJHk9vOZ6fKBfigIoFt7v5r
         etlwqMSmSDyn1kOom5FoQh7INglEtGJbFnElSQI8i9K5EVIaBuB+t51Ek7e2UUWeIuRi
         SpE8oA+8PItl8nTvfsfpk4i/M4vU4tJgYyD3y+XA4IH7sVYLVvwPU4HHbMlCl4pN74g+
         YrUs5j3RnuGkcpU8pJGEkURFPwfYRhYmME1i2B8s7QSXHzoR4JC/mAal9gjzDaKbDm0o
         gEoA==
X-Gm-Message-State: AC+VfDxQaHGHfMC5thSxGXCRcEUJ0Xjmt/Ak2laztkngRKC9n7/e+LEe
	iagF3/IjvHDAsyKkpsfs2f+ohcj0If9EsjmZ8Tw=
X-Google-Smtp-Source: ACHHUZ5miuTUolOzsADlSMYeNwRB2BvB70cyBZV7TKmX6PNi6PXdXp8y8xFcQ99dt1Hg5Qg+qCXIpQ==
X-Received: by 2002:a05:6a00:14c4:b0:647:b071:20c4 with SMTP id w4-20020a056a0014c400b00647b07120c4mr7424023pfu.1.1684598723088;
        Sat, 20 May 2023 09:05:23 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id a24-20020a62e218000000b00642f1e03dc1sm1457790pfi.174.2023.05.20.09.05.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 May 2023 09:05:22 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/11] pypi.bbclass: Set CVE_PRODUCT to PYPI_PACKAGE
Date: Sat, 20 May 2023 06:05:00 -1000
Message-Id: <1c37b96cd4fdfad21bf24b8b883e371c3bca56de.1684598568.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1684598568.git.steve@sakoman.com>
References: <cover.1684598568.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 May 2023 16:05:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181567

From: Alex Kiernan <alex.kiernan@gmail.com>

The CVE product name for PyPI packages is (usually) the same as the PyPI
package name (and not our recipe name), so use that as the default.

Signed-off-by: Alex Kiernan <alexk@zuma.ai>
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 61f6b0ad09bf87cdc2d3f08770b7c44cad1d0e58)
Signed-off-by: Sanjay Chitroda <schitrod@cisco.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/pypi.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/pypi.bbclass b/meta/classes/pypi.bbclass
index 87b4c85fc0..c68367449a 100644
--- a/meta/classes/pypi.bbclass
+++ b/meta/classes/pypi.bbclass
@@ -24,3 +24,5 @@ S = "${WORKDIR}/${PYPI_PACKAGE}-${PV}"
 
 UPSTREAM_CHECK_URI ?= "https://pypi.org/project/${PYPI_PACKAGE}/"
 UPSTREAM_CHECK_REGEX ?= "/${PYPI_PACKAGE}/(?P<pver>(\d+[\.\-_]*)+)/"
+
+CVE_PRODUCT ?= "python:${PYPI_PACKAGE}"
-- 
2.34.1


