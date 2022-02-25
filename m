Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8020EC433EF
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 14:28:28 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.7082.1645799308105425316
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:28:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=736hGUEm;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id l19so4843260pfu.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:28:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=GUKCIkM2lQIlLnuT8xl6BfYo2rcOXiOHuFOzeW+3xvg=;
        b=736hGUEmTGvZeqZp+fT037gknVJYPEyP6zhDaH6XwDGjQhlTpQnzQ6BCkaa++AGdBE
         1vvL14E8NfwXRzJFEAAYHVriXS9eXHN3swmOhGbDIm65IXIZuYvhQKRlzgG+gQgWCG9T
         mVho/K6oJLGxl4KMrXxFmlvF7/utJ2NOktUfjqP/z+eKxpaX0C1P11u2LoaeOnWlVyAW
         iOUzp3CHF5QMppVHgGZLMGkYhJdHWBzKGbMoE1Kjfpz33DY9+MUPUjrT+k0toxFNbzWT
         gByWkZClLNL2moHuBdHW7lhBMKSPtfyAl/+EhHf/AipFfMkW0QomgLjOErKqPSOOZOh/
         cJzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GUKCIkM2lQIlLnuT8xl6BfYo2rcOXiOHuFOzeW+3xvg=;
        b=y5epbBVW0yHhrRoMRJtl2+YmOgSZ5I5ktmE2R5WG+pTXEusMUe5wjPwvGzVIGOktaT
         /4md66XqoGTRqaaj40SH/dDfQN0TKycHmJxpiDoA9uEtNzoC2Bq5A3rWQHamBBGY46uk
         KgtLWNrg55z6Q6dMLLdA9BVNoTiF7D1sfzSIljw2R1kkbDHIAG4ZzIxBV9Pbt1dbMqP2
         RD/21JLobreM+vriVQFXErO84q5ACIYopECAvPVR9sSkMSvvcc4fBhDNZmatBXt2t1bJ
         4e8LIg8ply7rRCeblgF9RIlS9o2xLxUIrZRG1PJ9znkwRYiOA8nHa1v+HzauA7tv4oTU
         ulpg==
X-Gm-Message-State: AOAM530/nVlnGA7JOwOpg+YVl9az52bfNE4WvjZ+KJyAm8z4rAt0lARa
	nxFjngVt8G9RlYsgPHLiBRGIDiAlib6oUgXR
X-Google-Smtp-Source: 
 ABdhPJwvblfGKRjd3FH25i64agcdPAZux8fG3thOTUa8n9XVwJlVklXpMgedEYy2NP/Wfvca19vHNA==
X-Received: by 2002:a63:5323:0:b0:375:9c2b:9716 with SMTP id
 h35-20020a635323000000b003759c2b9716mr4957256pgb.150.1645799307131;
        Fri, 25 Feb 2022 06:28:27 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h17-20020a63df51000000b0036b9776ae5bsm2864538pgj.85.2022.02.25.06.28.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 06:28:26 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 44/50] grub: add a check for a NULL pointer
Date: Fri, 25 Feb 2022 04:26:24 -1000
Message-Id: 
 <1d95061ecdc920835df44c0c3ed274193f26948e.1645798648.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645798648.git.steve@sakoman.com>
References: <cover.1645798648.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Feb 2022 14:28:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162390

From: Marta Rybczynska <rybczynska@gmail.com>

This patch adds a check for a NULL pointer before use in grub's
loader/xnu. It is a part of a security series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...k-if-pointer-is-NULL-before-using-it.patch | 42 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0040-loader-xnu-Check-if-pointer-is-NULL-before-using-it.patch

diff --git a/meta/recipes-bsp/grub/files/0040-loader-xnu-Check-if-pointer-is-NULL-before-using-it.patch b/meta/recipes-bsp/grub/files/0040-loader-xnu-Check-if-pointer-is-NULL-before-using-it.patch
new file mode 100644
index 0000000000..8081f7763a
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0040-loader-xnu-Check-if-pointer-is-NULL-before-using-it.patch
@@ -0,0 +1,42 @@
+From 778a3fffd19229e5650a1abfb06c974949991cd4 Mon Sep 17 00:00:00 2001
+From: Paulo Flabiano Smorigo <pfsmorigo@canonical.com>
+Date: Mon, 30 Nov 2020 10:36:00 -0300
+Subject: [PATCH] loader/xnu: Check if pointer is NULL before using it
+
+Fixes: CID 73654
+
+Signed-off-by: Paulo Flabiano Smorigo <pfsmorigo@canonical.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=7c8a2b5d1421a0f2a33d33531f7561f3da93b844]
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ grub-core/loader/xnu.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/grub-core/loader/xnu.c b/grub-core/loader/xnu.c
+index 39ceff8..adc048c 100644
+--- a/grub-core/loader/xnu.c
++++ b/grub-core/loader/xnu.c
+@@ -667,6 +667,9 @@ grub_xnu_load_driver (char *infoplistname, grub_file_t binaryfile,
+   char *name, *nameend;
+   int namelen;
+ 
++  if (infoplistname == NULL)
++    return grub_error (GRUB_ERR_BAD_FILENAME, N_("missing p-list filename"));
++
+   name = get_name_ptr (infoplistname);
+   nameend = grub_strchr (name, '/');
+ 
+@@ -698,10 +701,7 @@ grub_xnu_load_driver (char *infoplistname, grub_file_t binaryfile,
+   else
+     macho = 0;
+ 
+-  if (infoplistname)
+-    infoplist = grub_file_open (infoplistname, GRUB_FILE_TYPE_XNU_INFO_PLIST);
+-  else
+-    infoplist = 0;
++  infoplist = grub_file_open (infoplistname, GRUB_FILE_TYPE_XNU_INFO_PLIST);
+   grub_errno = GRUB_ERR_NONE;
+   if (infoplist)
+     {
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index eebe9a7233..fad7415e0d 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -86,6 +86,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0037-loader-bsd-Check-for-NULL-arg-up-front.patch \
            file://0038-loader-xnu-Fix-memory-leak.patch \
            file://0039-loader-xnu-Free-driverkey-data-when-an-error-is-dete.patch \
+           file://0040-loader-xnu-Check-if-pointer-is-NULL-before-using-it.patch \
            "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.25.1


