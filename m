Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDEFAC7EE2C
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 15:20:34 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.30319.1683300025745453167
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 May 2023 08:20:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=aHyumYS3;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6434e263962so1500622b3a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 08:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1683300025; x=1685892025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nvN59XHpHPO1IToQrlMVI8ubS/dW0S3WSUE/HH1VlF0=;
        b=aHyumYS3/0Cp23D/6vAhZUF8BRJatRSaB9Fzk8VKUGN6h1flB+hQNFhB80u2kEcUPf
         6WCnT+bJiyIt9VIsHEVWTo/m3Jf22vJbmyeRa8P9DsVQMYQrjh/RmIcXa9me9JayT7lM
         gvBsZW6XqPMJtEXXVsD5Lp0w80NpsbPz4gkXE7dlSz4YSg8LH78t9TzkfZO1VDdB9PEw
         yIFpq6brrZs97JvAFHwXdyiaWu4ShzWOgnev5ZobEWYfwJwViYw8etokQSekWUe9ohT3
         yjJgO83Y2ivrYTFfPtCP7GfiMbqB+s90c1x4JV+lvxYTKtgo/uq2BpsCsBHevcVpoLh9
         wyRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683300025; x=1685892025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nvN59XHpHPO1IToQrlMVI8ubS/dW0S3WSUE/HH1VlF0=;
        b=Ohw92VEVvJoHQEEKxM/MLiplPJep3o3srVhVl9C4W8qbzObyx9AmG9OFfk0BM57QhN
         PTWU95KRFAUzH6K8yItpdlssC2AJ0QLGhLS+gDtURGDbJ3vgj2fZUMjMt4IGK47tlZIQ
         wIff8s9xF3owiDDGoDa3/u2jOSyqepRraSA1KpYZiwKAECb98pl+wmXjHkD8dj16SrBn
         PoX9MuuOt0nwkp/cFxpf/RPXclxWypA2K0UYdsqnmAz9jpWOF79wdyAHIQCvh/G6BF39
         m3N1pUDDbR+jJ7jyIq5obksb9oCDYtw69VWnBYIl17YVnTk9Ys9Mh1RQZr/2jJVi62ab
         sv5A==
X-Gm-Message-State: AC+VfDylESgQ6wYM5ZSaaIdUIETZfiveUrUcum0F8dX3gEoyykmwIW/2
	PrmtV6D+TrXQHkHgnhp4U8658ZwdbxVMGkKiLOE=
X-Google-Smtp-Source: ACHHUZ5D8q6A/mesihaPX5/NosuZ7emPzsU4HYsyt1sHamW+pIKODhSVTp0M0HKza2GXK9KWZA8F1g==
X-Received: by 2002:a05:6a00:846:b0:637:920c:25fd with SMTP id q6-20020a056a00084600b00637920c25fdmr2849821pfk.17.1683300024799;
        Fri, 05 May 2023 08:20:24 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c11-20020aa78c0b000000b00643864d03dfsm1831591pfd.171.2023.05.05.08.20.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 08:20:24 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 13/35] man-pages: upgrade 6.03 -> 6.04
Date: Fri,  5 May 2023 05:19:24 -1000
Message-Id: <0d416adf236952dd90954daf1067dbd619c39e3c.1683299764.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1683299764.git.steve@sakoman.com>
References: <cover.1683299764.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 15:20:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180933

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update:
 tmp/ -> .tmp/

Changelog:
============
-  Sections:
   -  Add HISTORY.
   -  HISTORY: Restore C89 references.
   -  Repurpose VERSIONS.
   -  Simplify STANDARDS.
   -  SYNOPSIS: Mark several functions as deprecated.

-  Build system:
   -  Support installing in different mandirs
      (e.g., man3typedir='/usr/share/man/man3').
   -  Support installing compressed pages (Z='.gz').
   -  Support installing link pages as symlinks (LINK_PAGES='symlink').

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 17b93f86d17c6164005fa9f3173585f092539dc6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../man-pages/{man-pages_6.03.bb => man-pages_6.04.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/man-pages/{man-pages_6.03.bb => man-pages_6.04.bb} (92%)

diff --git a/meta/recipes-extended/man-pages/man-pages_6.03.bb b/meta/recipes-extended/man-pages/man-pages_6.04.bb
similarity index 92%
rename from meta/recipes-extended/man-pages/man-pages_6.03.bb
rename to meta/recipes-extended/man-pages/man-pages_6.04.bb
index bc02597ef7..fee57e3fbd 100644
--- a/meta/recipes-extended/man-pages/man-pages_6.03.bb
+++ b/meta/recipes-extended/man-pages/man-pages_6.04.bb
@@ -4,7 +4,7 @@ SECTION = "console/utils"
 HOMEPAGE = "http://www.kernel.org/pub/linux/docs/man-pages"
 LICENSE = "GPL-2.0-or-later & GPL-2.0-only & GPL-1.0-or-later & BSD-2-Clause & BSD-3-Clause & BSD-4-Clause & MIT"
 
-LIC_FILES_CHKSUM = "file://README;md5=0fdad39ebaa973a50785f79f0f59f87f \
+LIC_FILES_CHKSUM = "file://README;md5=5b7d7488344f5af8841dc13aaec49cdf \
                     file://LICENSES/BSD-2-Clause.txt;md5=d0f280d1058e77e66264a9b9e10e6c89 \
                     file://LICENSES/BSD-3-Clause.txt;md5=71f739ef75581cae312e8c711bcdab16 \
                     file://LICENSES/BSD-4-Clause-UC.txt;md5=1da3cf8ad50cd8d5d1de3cfc53196d01 \
@@ -16,7 +16,7 @@ LIC_FILES_CHKSUM = "file://README;md5=0fdad39ebaa973a50785f79f0f59f87f \
                     "
 SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "76eca045b42a90dd25d094c46d97ac90187bc0f1bfca358bb5dae5c4337acbb0"
+SRC_URI[sha256sum] = "590623b99bf1f8ee958483c35cc0aaef2363e42998c4d927d1f705890d15d51e"
 
 inherit manpages
 
-- 
2.34.1


