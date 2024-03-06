Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15DBFC54E61
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 15:42:32 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.14886.1709739744946335426
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 07:42:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XWL5ghv0;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a3ed9cae56fso185823066b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 07:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709739743; x=1710344543; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X1U4C1csQrdCOnPbVyCzJFrLHP5ThFJBz3ZMj3QiMmw=;
        b=XWL5ghv0xGgi+L4qiJQ9UcPKSM2w/oVTUL81UjghzOXSZwmq4nYauXC+jVHJqg8Qp9
         38slei+rJSMv+TddJ94tGNFw1eIjWke4kFUVM0yb6pJoSEktJrV8mPjgz0XvxyHVPyFO
         7sukjGYvfrqjVG4LFDBy89GCa43afbxS56Vj9A90b/glHAtXkPZjfCmUqP8/WAkNagoU
         C8pZ3SIeDxiPdQXihEg6VQe7fKC0FkOoBce36oRcMq7UlqmFkWmlbsnwB8gRMri6C/JE
         ySb2v5fK3boGn48KcXeDlO94oSG3qXmnrZbq2zLZyLT2aOcrqpVkHgoQtNZ+kNytFPw9
         nFIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709739743; x=1710344543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X1U4C1csQrdCOnPbVyCzJFrLHP5ThFJBz3ZMj3QiMmw=;
        b=qyF6NvlYLswPPmWH1uirWA2ZCj/Ap3Hn6yVe17erN9Pd8Dp2Gkn+aiPrbEgq4M+NVm
         hVg4CC+Yy5f/z7sVnaF1/UJlR+pWa/b8houFjHrA/BfTtsGn0ZVSmYgu5/GLJOrBrl+K
         SedWqY4oNw7VOPgTDS0/9z5UZiKV56noHXOUjdX0z6GNj6sd1eFa1oWGnnnkG0nPiJby
         uAuKh4o9qjqKXoX3l04gxavdFF58VRjnoU9IGxX8AVOHbCEnFGsheXRfX/B67eOQy+w5
         k/q7+M7VL0eohiA27qIcU1hBdMGNB84+WdFt1DnfAdDqbTBCsK4+wJI9GprdsjXLy1tj
         YZIQ==
X-Gm-Message-State: AOJu0Yx5pNQ3KZcToOiLRrExvqMq6Lmwma5qvaIyCJqEanCTZ5GMDO7l
	tSKQMYfcG4L+5WTX7ySu1pgYRlmay4b93ie6oxULisleNpcpCizP0+wkAoCT
X-Google-Smtp-Source: AGHT+IGPpu1tx9JnZ82THBEcB6i7TCP/aYVmirZExMed30hzkqpGxqwsBGEf8cB/Da0AdJVV4DUsIw==
X-Received: by 2002:a17:906:d14a:b0:a45:7936:d09e with SMTP id br10-20020a170906d14a00b00a457936d09emr6320556ejb.19.1709739743213;
        Wed, 06 Mar 2024 07:42:23 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id x11-20020a170906710b00b00a4434e9938asm7209343ejj.84.2024.03.06.07.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 07:42:23 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 42/47] taglib: upgrade 1.13.1 -> 2.0 and add utfcpp recipe to support that
Date: Wed,  6 Mar 2024 16:41:46 +0100
Message-Id: <20240306154151.3741709-42-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240306154151.3741709-1-alex@linutronix.de>
References: <20240306154151.3741709-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 15:42:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196725

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/maintainers.inc         |  1 +
 .../taglib/{taglib_1.13.1.bb => taglib_2.0.bb}   |  4 ++--
 meta/recipes-support/utfcpp/utfcpp_4.0.5.bb      | 16 ++++++++++++++++
 3 files changed, 19 insertions(+), 2 deletions(-)
 rename meta/recipes-support/taglib/{taglib_1.13.1.bb => taglib_2.0.bb} (94%)
 create mode 100644 meta/recipes-support/utfcpp/utfcpp_4.0.5.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index a44e065d2d9..9faac4a89f4 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -836,6 +836,7 @@ RECIPE_MAINTAINER:pn-usbutils = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-util-linux = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-util-linux-libuuid = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-util-macros = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-utfcpp = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-v86d = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-vala = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-valgrind = "Alexander Kanavin <alex.kanavin@gmail.com>"
diff --git a/meta/recipes-support/taglib/taglib_1.13.1.bb b/meta/recipes-support/taglib/taglib_2.0.bb
similarity index 94%
rename from meta/recipes-support/taglib/taglib_1.13.1.bb
rename to meta/recipes-support/taglib/taglib_2.0.bb
index b26563ae91d..4bf9be15ae9 100644
--- a/meta/recipes-support/taglib/taglib_1.13.1.bb
+++ b/meta/recipes-support/taglib/taglib_2.0.bb
@@ -7,11 +7,11 @@ LIC_FILES_CHKSUM = "file://COPYING.LGPL;md5=4fbd65380cdd255951079008b364516c \
                     file://COPYING.MPL;md5=bfe1f75d606912a4111c90743d6c7325 \
                     file://taglib/audioproperties.h;beginline=1;endline=24;md5=9df2c7399519b7310568a7c55042ecee"
 
-DEPENDS = "zlib"
+DEPENDS = "zlib utfcpp"
 
 SRC_URI = "http://taglib.github.io/releases/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "c8da2b10f1bfec2cd7dbfcd33f4a2338db0765d851a50583d410bacf055cfd0b"
+SRC_URI[sha256sum] = "e36ea877a6370810b97d84cf8f72b1e4ed205149ab3ac8232d44c850f38a2859"
 
 UPSTREAM_CHECK_URI = "https://taglib.org/"
 UPSTREAM_CHECK_REGEX = "taglib-(?P<pver>\d+(\.\d+)+)\.tar"
diff --git a/meta/recipes-support/utfcpp/utfcpp_4.0.5.bb b/meta/recipes-support/utfcpp/utfcpp_4.0.5.bb
new file mode 100644
index 00000000000..5ac6fd369ae
--- /dev/null
+++ b/meta/recipes-support/utfcpp/utfcpp_4.0.5.bb
@@ -0,0 +1,16 @@
+SUMMARY = " UTF-8 with C++ in a Portable Way"
+HOMEPAGE = "https://github.com/nemtrif/utfcpp"
+
+LICENSE = "BSL-1.0 & BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e4224ccaecb14d942c71d31bef20d78c \
+                    file://extern/ftest/LICENSE;md5=d33c6488d3b003723a5f17ac984db030"
+
+SRC_URI = "gitsm://github.com/nemtrif/utfcpp;protocol=https;branch=master"
+
+SRCREV = "6be08bbea14ffa0a5c594257fb6285a054395cd7"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+
+FILES:${PN}-dev += "${datadir}/utf8cpp/cmake"
-- 
2.39.2


