Return-Path: <sudipm.mukherjee@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26805C83F2C
	for <webhook@archiver.kernel.org>; Sat,  2 Sep 2023 13:10:19 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.7620.1693660212362038662
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Sep 2023 06:10:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=LtTI5jxZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: sudipm.mukherjee@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-401b5516104so27586605e9.2
        for <openembedded-core@lists.openembedded.org>; Sat, 02 Sep 2023 06:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693660210; x=1694265010; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W6luC7587B9Pa7HZ+8IV+UfFRWAomq87LKldpL0nJ3w=;
        b=LtTI5jxZne/q2cAAQ6/8qRouAaHhMknmgFE0geYVk8arxD9cJbGm5LtW5aCcMMxmvq
         Be02NL0TBmjC0OcD8LqulW9ergXr9e6cT9v8ipy7RD0JNJK93Qgg5uTTdiahfi6e7Blx
         6glUa4jj2QMfFv78CRU6D/Oc9+/LnAIUNtEDnO9oHI3VSz6g2HCB2TbXZlsN9krtZRCN
         N8woh/IsH9bcQ6oeYoOkdTBDvVuWlcfOF+JWAS7lfLsxEkUWJ9OGjEq4jDr/be0EaMxc
         7vVghY73/O7jCO7HjWnw9mYPW8vYquNTpHr4zMVPXXCLqKQ2T4dUq/y/QEcJBaVaXiOj
         Wmow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693660210; x=1694265010;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W6luC7587B9Pa7HZ+8IV+UfFRWAomq87LKldpL0nJ3w=;
        b=M73NoFwfd9nDFDQJP3c/K0lVcffCvukYn0+7Hhi4Ac0vjcOrkhomoP6SVDU2XP7tfA
         Wr7Q6nYXAUV+ZKXbYohnDzCgZ7AzFOaIn+t4Hzj70/eBwutreDt70+q93w1XbiwJFwGv
         hlsG4kZBYFHjhpX0y+vecOg8l/8aYTNe0EPwwedt9HQc+r1czHE7BjHnePedgnPVWVzy
         fIbm1HsSrrLXUHuwjjss+LmVDzqE9ftJbvE7HgvBZfs4SvX1AsEbbH9412LbtUlDBqsq
         Ql7zDfAcncrevGzqsaqJvNqzQCOrQZKvnoWzFfyIbAvxmY5Gt/F+/b9SLuFjln/mg5xd
         iMHQ==
X-Gm-Message-State: AOJu0YxSYkFdumpngnyY+JRhsCO2YbKXYPsGaJhwJCsXrRlmLPFnv7v0
	4svlRGcuPQYxgmtBEiukLAYs2c1di3Y=
X-Google-Smtp-Source: AGHT+IE+XBubnq5KDSARR95ODavVrl1mevJkXvtpUplBt0UO1tcwLm40+AaEw+9kQyNKJ1sdOpHRug==
X-Received: by 2002:a7b:cd0a:0:b0:3fe:795:712a with SMTP id f10-20020a7bcd0a000000b003fe0795712amr3841895wmj.27.1693660210095;
        Sat, 02 Sep 2023 06:10:10 -0700 (PDT)
Received: from localhost.localdomain ([63.135.72.41])
        by smtp.gmail.com with ESMTPSA id m18-20020a7bce12000000b00401dc20a070sm10986143wmc.43.2023.09.02.06.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Sep 2023 06:10:09 -0700 (PDT)
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH] dpkg: upgrade to v1.22.0
Date: Sat,  2 Sep 2023 14:10:06 +0100
Message-Id: <20230902131006.8106-1-sudipm.mukherjee@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Sep 2023 13:10:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187150

Changes:
Use main branch
Rebase patch

Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
---
 ...pt-to-linux-wrs-kernel-version-which-has-characte.patch | 7 +++----
 .../dpkg/{dpkg_1.21.22.bb => dpkg_1.22.0.bb}               | 4 ++--
 2 files changed, 5 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/dpkg/{dpkg_1.21.22.bb => dpkg_1.22.0.bb} (93%)

diff --git a/meta/recipes-devtools/dpkg/dpkg/0002-Adapt-to-linux-wrs-kernel-version-which-has-characte.patch b/meta/recipes-devtools/dpkg/dpkg/0002-Adapt-to-linux-wrs-kernel-version-which-has-characte.patch
index 9fe0ca7600..ef5f7c3ec3 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0002-Adapt-to-linux-wrs-kernel-version-which-has-characte.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0002-Adapt-to-linux-wrs-kernel-version-which-has-characte.patch
@@ -13,14 +13,14 @@ Upstream-Status: Inappropriate [embedded specific]
  1 file changed, 2 insertions(+), 4 deletions(-)
 
 diff --git a/lib/dpkg/parsehelp.c b/lib/dpkg/parsehelp.c
-index 453077fd9..f42ea2882 100644
+index 63a36f55c..81901bd5a 100644
 --- a/lib/dpkg/parsehelp.c
 +++ b/lib/dpkg/parsehelp.c
-@@ -243,14 +243,12 @@ parseversion(struct dpkg_version *rversion, const char *string,
+@@ -275,14 +275,12 @@ parseversion(struct dpkg_version *rversion, const char *string,
    ptr = rversion->version;
    if (!*ptr)
      return dpkg_put_error(err, _("version number is empty"));
--  if (*ptr && !c_isdigit(*ptr++))
+-  if (!c_isdigit(*ptr++))
 -    return dpkg_put_warn(err, _("version number does not start with digit"));
    for (; *ptr; ptr++) {
 -    if (!c_isdigit(*ptr) && !c_isalpha(*ptr) && strchr(".-+~:", *ptr) == NULL)
@@ -32,7 +32,6 @@ index 453077fd9..f42ea2882 100644
 +    if (!c_isdigit(*ptr) && !c_isalpha(*ptr) && strchr(".-+~_", *ptr) == NULL)
        return dpkg_put_warn(err, _("invalid character in revision number"));
    }
- 
 
 -- 
 2.11.0
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.21.22.bb b/meta/recipes-devtools/dpkg/dpkg_1.22.0.bb
similarity index 93%
rename from meta/recipes-devtools/dpkg/dpkg_1.21.22.bb
rename to meta/recipes-devtools/dpkg/dpkg_1.22.0.bb
index 04bcc93321..7eaae9f22e 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.21.22.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.22.0.bb
@@ -1,7 +1,7 @@
 require dpkg.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-SRC_URI = "git://salsa.debian.org/dpkg-team/dpkg.git;protocol=https;branch=1.21.x \
+SRC_URI = "git://salsa.debian.org/dpkg-team/dpkg.git;protocol=https;branch=main \
            file://noman.patch \
            file://remove-tar-no-timestamp.patch \
            file://arch_pm.patch \
@@ -18,6 +18,6 @@ SRC_URI = "git://salsa.debian.org/dpkg-team/dpkg.git;protocol=https;branch=1.21.
 
 SRC_URI:append:class-native = " file://0001-build.c-ignore-return-of-1-from-tar-cf.patch"
 
-SRCREV = "48482e4f16467e05a08aa3b3b8048e08f0024609"
+SRCREV = "744487c98a622b9b38c22c6ca330315af4a30a11"
 
 S = "${WORKDIR}/git"
-- 
2.39.2


