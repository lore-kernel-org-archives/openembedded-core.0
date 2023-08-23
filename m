Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29A63EE4993
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 16:24:19 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.1042.1692807849717602853
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 09:24:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=rPxbXomb;
 spf=pass (domain: konsulko.com, ip: 209.85.128.50, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-3fef56f7248so25002695e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 09:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1692807848; x=1693412648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CFqoaGvJM9vq72+/NvU+VlKNAwdsJqlwePR1VwlnYiI=;
        b=rPxbXomb7MwkBSGUfvpJbw8doYJfDLe/RxyscCFMDn32sZFmjwgbbxLTERZCN4WgRs
         bBj/uau5bpivRVV8hQ+QUM4H7fY64r/7EM7D0gfGkEjalnvEEB00q1cd1BglzGdcGOkO
         mUrZde4LUSV4fTQCoVu+6L42EbgADDu2Mbb3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692807848; x=1693412648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CFqoaGvJM9vq72+/NvU+VlKNAwdsJqlwePR1VwlnYiI=;
        b=HON9gkS1dvCDvJwPnPIWTQVmGCsRUMUaoz05RjO4jFFudq5S4pB+hNy0+Z9ANJxr6U
         2Cy0WHl4rHKaMNDoRmcNa6YYj8+5XPz3KFGR66b6E97cD7LggeyKtQhd/DokHu+96uS8
         sAi0sqTkWDaJ8RUqFLnnPRQsWviQ/p3ecqhBNHmRxxGIyikoQyD0nk1Avvh+zqVIu//k
         nUVBagf350ARS+/EBSf9/hQfXufC+51aMpd4SgsWFqIzpzIC1HanhQbPXFGRlVL+H2DB
         NpPMGO1JI8wgv9aQAOnyy+nwagqsAtNs266p1Ohmgt+dbxeJ/QXoz+Cpayy/vb5KCI+4
         /22A==
X-Gm-Message-State: AOJu0YzYrW/3/n/uWlPBsKQTAFaz1wrNLd2yzYypUchv8vGhLBfaoCs6
	IAzMiIdCGUyo42zsY8UHt9xvvhSNp/DlUkXNp1Q=
X-Google-Smtp-Source: AGHT+IE1J1SUZFKkNMwhbX3bEu9FaQoYV7j2wdaky/Un0uM0rtxnZguuZ1nYMyfCHwd0gKJCH6QiLQ==
X-Received: by 2002:a7b:cb42:0:b0:3fb:d1db:545b with SMTP id v2-20020a7bcb42000000b003fbd1db545bmr10253834wmj.20.1692807847877;
        Wed, 23 Aug 2023 09:24:07 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id o5-20020a1c7505000000b003fee8502999sm37521wmc.18.2023.08.23.09.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 09:24:07 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [PATCH 1/2] aml: add new recipe
Date: Wed, 23 Aug 2023 19:24:03 +0300
Message-Id: <20230823162404.457379-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 16:24:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186620

Add a new recipe for aml (Andri's Main Loop) v0.3.0. It is
required for neatvnc which is required for building Weston with
VNC backend.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 meta/conf/distro/include/maintainers.inc |  1 +
 meta/recipes-graphics/aml/aml_git.bb     | 35 ++++++++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-graphics/aml/aml_git.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 3619588ae6..11b47ffe84 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -894,3 +894,4 @@ RECIPE_MAINTAINER:pn-xz = "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER:pn-zip = "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER:pn-zlib = "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER:pn-zstd = "Alexander Kanavin <alex.kanavin@gmail.com>"
+RECIPE_MAINTAINER:pn-aml = "Leon Anavi <leon.anavi@konsulko.com>"
diff --git a/meta/recipes-graphics/aml/aml_git.bb b/meta/recipes-graphics/aml/aml_git.bb
new file mode 100644
index 0000000000..eed62adae0
--- /dev/null
+++ b/meta/recipes-graphics/aml/aml_git.bb
@@ -0,0 +1,35 @@
+SUMMARY = "Andri's Main Loop"
+DESCRIPTION = "Andri's Main Loop"
+HOMEPAGE = "https://github.com/any1/aml"
+LICENSE = "ISC"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e6f3cfaa39204b96e14b68b9d50d3e4e"
+
+SRC_URI = "git://github.com/any1/aml;branch=master;protocol=https"
+
+SRCREV = "b83f3576ce4187d9285f06e9066ef43a691464d4"
+
+PV = "0.3.0+git${SRCPV}"
+
+S = "${WORKDIR}/git"
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[examples] = "-Dexamples=true,-Dexamples=false"
+
+PACKAGE_BEFORE_PN += "${PN}-examples"
+ALLOW_EMPTY:${PN}-examples = "1"
+FILES:${PN}-examples = "${bindir}"
+
+inherit meson pkgconfig
+
+AML_EXAMPLES = "ticker nested-ticker reader"
+
+do_install:append () {
+	if ${@bb.utils.contains('PACKAGECONFIG', 'examples', 'true', 'false', d)}; then
+		install -d ${D}${bindir}
+		for bin in ${AML_EXAMPLES}; do
+			install -m 0755 ${B}/examples/$bin ${D}${bindir}
+		done
+	fi
+}
+
+BBCLASSEXTEND = "native"
-- 
2.39.2


