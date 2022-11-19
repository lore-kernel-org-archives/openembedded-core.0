Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EF96C43219
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 21:15:49 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.30937.1668892546349056567
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Nov 2022 13:15:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=L4X9QdcR;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id b185so8030783pfb.9
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 13:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jI1ByqEvF8Q0mDVdLT78iBhNMM0/1bKr0/ok6HsNZmI=;
        b=L4X9QdcRfJWQyzJbgL+n3zUyjx2vpO0N2YSNDPcGcMfaXSYl3/A9RDJ6eMMxY6fDP3
         LC0M+oLT/7IUVIu9eDn7PTRTZ9RTQRHwR1t0GaXhSyRxUyKTHLwB0VHlhGSfSyu5GFbe
         hdLi8y+O3VJQyfvsq1LM5HJrtcVCE/dYIxrJM1yWhSiVnkGNIapPQykoX2ElNkx5WizX
         50GNNXtlqhkpF4v2Oszz9MdK3/QC8O5opd0YxjVVlbm7K5I54B8XgrDqke0rhoDtZP9E
         6S9mKuDf8sUr0f1NTZqwjRL0wnZnjH5VWyB48wz4KE5QMltyonX0gH7yOoy4gkqVzi/q
         6z0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jI1ByqEvF8Q0mDVdLT78iBhNMM0/1bKr0/ok6HsNZmI=;
        b=LDH7S1lI3wrnrCV8mOblH4XH6eu6OIcXgpMTc2+AGzPGC6Ey++ksFPvMEHIXMqTg3Y
         ldZ+q+/8v6NYor3rMk5o5ikDdPBxKYBozUQqIrZtkRDXL4cHbo1LDc1cRo/j/MNasdEK
         zPMyhiLIGquwVUm44/6tW5fcRA9WnbInnogNQcNWswh89DSEKDsrBkSiZGj+s/tkd7OV
         0d07yvk8J5DQNn1yHFgZIrt3lOotgcPOEDmLDGrZrbNrZGX4XXBxFUJ6vVEYuAeh/E8P
         QOtxGdN0JvrHSn/DKg4B8pQ+iNCSDjCpG7J+Yy0qedjT/yNwPYsrNRX98LiS7r7o2OL5
         WhLQ==
X-Gm-Message-State: ANoB5pmV1mXfvJ0uyy8Pj9h4ZBAzTsF1tqUb1sP1cvEx8Hgn6eLZiYYq
	cz6UWTs3aDnupcPYMCl0V3gUGsB3ACp6xV3PYgk=
X-Google-Smtp-Source: AA0mqf6UxuRDqaTa/xjl/Z3xNIBp0HXbb8+0vlF0o4G/5PcnbLO1/T/nPsroNLdu5my+RYrUEqFWEA==
X-Received: by 2002:a63:6645:0:b0:476:cdb8:28fd with SMTP id a66-20020a636645000000b00476cdb828fdmr12104050pgc.358.1668892545390;
        Sat, 19 Nov 2022 13:15:45 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id s16-20020a170902a51000b001869f2120a5sm6197735plq.34.2022.11.19.13.15.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 13:15:44 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 12/35] sudo: upgrade 1.9.11p3 -> 1.9.12p1
Date: Sat, 19 Nov 2022 11:14:51 -1000
Message-Id: <2ee8bfb667edf2ff3785bc52afb289374709de4c.1668892398.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668892398.git.steve@sakoman.com>
References: <cover.1668892398.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 21:15:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173552

From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/sudo/sudo.inc                             | 2 +-
 .../sudo/{sudo_1.9.11p3.bb => sudo_1.9.12p1.bb}                 | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/sudo/{sudo_1.9.11p3.bb => sudo_1.9.12p1.bb} (96%)

diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
index 8947c46129..fd5bbf103d 100644
--- a/meta/recipes-extended/sudo/sudo.inc
+++ b/meta/recipes-extended/sudo/sudo.inc
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sudo.ws"
 BUGTRACKER = "http://www.sudo.ws/bugs/"
 SECTION = "admin"
 LICENSE = "ISC & BSD-3-Clause & BSD-2-Clause & Zlib"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=16cf60b466f3a0606427a7b624a3a670 \
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=7aacba499777b719416b293d16f29c8c \
                     file://plugins/sudoers/redblack.c;beginline=1;endline=46;md5=03e35317699ba00b496251e0dfe9f109 \
                     file://lib/util/reallocarray.c;beginline=3;endline=15;md5=397dd45c7683e90b9f8bf24638cf03bf \
                     file://lib/util/fnmatch.c;beginline=3;endline=27;md5=004d7d2866ba1f5b41174906849d2e0f \
diff --git a/meta/recipes-extended/sudo/sudo_1.9.11p3.bb b/meta/recipes-extended/sudo/sudo_1.9.12p1.bb
similarity index 96%
rename from meta/recipes-extended/sudo/sudo_1.9.11p3.bb
rename to meta/recipes-extended/sudo/sudo_1.9.12p1.bb
index ba610ee2e7..1495b67b8b 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.11p3.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.12p1.bb
@@ -8,7 +8,7 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[sha256sum] = "4687e7d2f56721708f59cca2e1352c056cb23de526c22725615a42bb094f1f70"
+SRC_URI[sha256sum] = "475a18a8eb3da8b2917ceab063a6baf51ea09128c3c47e3e0e33ab7497bab7d8"
 
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS:${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
2.25.1


