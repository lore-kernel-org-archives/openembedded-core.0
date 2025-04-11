Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7701CC369A2
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 20:34:03 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.36735.1744403633978270762
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Apr 2025 13:33:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=zKUuhUxd;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-224341bbc1dso24203635ad.3
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 13:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1744403633; x=1745008433; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bB6fe66xb3MqVI1kfHQxW0rXQytbJiZ8vBF4MrLcMuc=;
        b=zKUuhUxdsr6tF+1LNx9yN/4nwQeT7YghSIarAUvaKGcMKfAA4tnRcbxKFUS/5mXNBo
         pMePxe9HYcSbjTzbDGs/PyyL4t0DcUdVDQAOCf1OWz9/+veDoSId7VVw3zKrXFgsCiup
         Q2v75odVbte2z/kNc/62L4Vv+YQqJep2iHBnDdnE1inqZZgKDJh614u7ME6/n07rW+SW
         dgSC/r08Ro/BjctrjBUnbfgWwYfZwDtSly5ZcHU9l8+gaYzaakRpdpRd1Zs/DjB8zPsO
         Kvn4NNtu58WaF/j+Yd0rdaUDlMMrax3q6c4moFChYbYMMcL1tyleXsIE4WAn7P3/D/Rj
         yR6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744403633; x=1745008433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bB6fe66xb3MqVI1kfHQxW0rXQytbJiZ8vBF4MrLcMuc=;
        b=C9fGdbJnUySnlWZH9faiX/qEGEh6ZRAr66BNsQiUDyR4VBEPuCqcfm0Cgzr3Y09wrg
         FACY4MClpQYmYEZvhLdQ+oOumxtDmwOXX6eIy5EYFyctBtldZIgoJ2BB0sUEd7qKDja0
         U4+DZNjPjG76YgVI5iS8sPFiO5OnhZ/2rvAYCAasnPwxmTj20n6g2g4dVwtzI8VaY6u/
         8X89jrV9ObDmlrqamMeGC91gMKxruYnhYok6g0EgqW4tTfqz+Ri7XRFF2nckq4dUSad+
         vTRTZoR/DLi5lXSc0bYt7lvoyJGmYQpWakEAby7w8tBQJ7QIKiPOBHIcutDcONmVG9HG
         Wa8w==
X-Gm-Message-State: AOJu0YzKyZZ9E0y6Se4U2RZATrYPApdkhbpsQ5odV5PT7jlnk9kaC6Xo
	Gp1tOpyoN6hoe9+pDNQuFARqFBnbDO4eYlY694kNW6KZXrvSDXwf7qUEsgHPT0eFfzcO6RvhHFQ
	H
X-Gm-Gg: ASbGncuj/e2EbmsKSE77AyeUOMXtIqhei8jhtjc5LjjLyQpbuU6BZJ6I4ypMhrJjQmE
	ekYngf+pK66GJ7HSqBTi2i67QQouYiTbcihZPEd6d/Xqju0aII1PdLkbD17//rGmskgx1Fhyh3Q
	4TnF7V4JE0TducMjSytnvxkyPXBRjt2zOZHX6yysT6My66rqcWX4VqeSxY8ZbjfmV0eyfwbSG48
	KqCGVYIZfYlTw1pkOqxC70UEaoS9pHsm6Su0iaNZ4P/hpM+JExYMAxNeH1KRmrEMEhiyTWb1sdd
	8kMTzzFffzKLJZpTXvSlddx8R1JzJ5LJ
X-Google-Smtp-Source: AGHT+IHRVU0aZUg4d92Suw0TGquLXXRA2c9HFSAGmoMCqzSBu+JHP24QPwKqDb35smuDwmnhUuuchQ==
X-Received: by 2002:a17:902:d4c5:b0:220:c63b:d93c with SMTP id d9443c01a7336-22bea4fee9amr56339315ad.44.1744403633129;
        Fri, 11 Apr 2025 13:33:53 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:c93f:3642:a7d6:27ed])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd230d697sm2067498b3a.123.2025.04.11.13.33.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 13:33:52 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 4/8] xz: upgrade 5.4.6 -> 5.4.7
Date: Fri, 11 Apr 2025 13:33:30 -0700
Message-ID: <e6565ca37da4821f8e3924fe6bc6a6f4eeedd9a9.1744403103.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1744403103.git.steve@sakoman.com>
References: <cover.1744403103.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 20:34:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214757

From: Peter Marko <peter.marko@siemens.com>

License-Update: homepage update in [1]

[1] https://github.com/tukaani-project/xz/commit/c5c091332c6953a0ce940cb355ea9e99491429fc

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/xz/{xz_5.4.6.bb => xz_5.4.7.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/xz/{xz_5.4.6.bb => xz_5.4.7.bb} (94%)

diff --git a/meta/recipes-extended/xz/xz_5.4.6.bb b/meta/recipes-extended/xz/xz_5.4.7.bb
similarity index 94%
rename from meta/recipes-extended/xz/xz_5.4.6.bb
rename to meta/recipes-extended/xz/xz_5.4.7.bb
index 3f82e476bf..53e5276951 100644
--- a/meta/recipes-extended/xz/xz_5.4.6.bb
+++ b/meta/recipes-extended/xz/xz_5.4.7.bb
@@ -17,7 +17,7 @@ LICENSE:${PN}-dbg = "GPL-2.0-or-later"
 LICENSE:${PN}-locale = "GPL-2.0-or-later"
 LICENSE:liblzma = "PD"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=d4378ea9d5d1fc9ab0ae10d7948827d9 \
+LIC_FILES_CHKSUM = "file://COPYING;md5=c8ea84ebe7b93cce676b54355dc6b2c0 \
                     file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.GPLv3;md5=1ebbd3e34237af26da5dc08a4e440464 \
                     file://COPYING.LGPLv2.1;md5=4fbd65380cdd255951079008b364516c \
@@ -27,7 +27,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d4378ea9d5d1fc9ab0ae10d7948827d9 \
 SRC_URI = "https://github.com/tukaani-project/xz/releases/download/v${PV}/xz-${PV}.tar.gz \
            file://run-ptest \
           "
-SRC_URI[sha256sum] = "aeba3e03bf8140ddedf62a0a367158340520f6b384f75ca6045ccc6c0d43fd5c"
+SRC_URI[sha256sum] = "8db6664c48ca07908b92baedcfe7f3ba23f49ef2476864518ab5db6723836e71"
 UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"
 UPSTREAM_CHECK_URI = "https://github.com/tukaani-project/xz/releases/"
 
-- 
2.43.0


