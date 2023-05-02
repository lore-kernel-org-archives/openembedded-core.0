Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03AEAC77B7E
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 17:45:36 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web10.645.1683049531426354798
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 May 2023 10:45:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=Tchkf8g3;
 spf=pass (domain: baylibre.com, ip: 209.85.160.174, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-3ef32014101so41555361cf.3
        for <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 10:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1683049530; x=1685641530;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=l7/Glo9QVhci9msy74K7SfFVla+SjtGSnyxwj20BWRE=;
        b=Tchkf8g3PoMMkCGDQAOcuJcc9BhgZYI2J/AUuMX6uiePRjuuP9eoVXyIPQ4dEQBzlJ
         BpbgL8H2fYkvR1esxsDG01PTFjznoWM+R5qnoLJHSh37MsWwBZqGlhIHgQ6rUiigOIHJ
         wgpKEkb9u+v6J5DifgmDPfq5Y6sUH+MgK7PFP+yGMguXY/b2M6QWKx2sdK/ITyLe05l9
         QOkkFO5e50iY06IgS+Ges19OeJ+YD1jxlf0svWK5iB+PMeTrbFqTZvpDW3YNOdoBjQyA
         eUQAGuCyJtyybndUBqCdiPbXil4XD7YmLFAmdLHnPRCfPqoISwTWpuN+rxWlnZFBjOcJ
         WTPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683049530; x=1685641530;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l7/Glo9QVhci9msy74K7SfFVla+SjtGSnyxwj20BWRE=;
        b=gdMzSLx0hR12oUxNXYxkFoNSziDnKqz1zVEh9VzaQwJJF5BhgJ6HzeIpgMBSNipu4/
         B/ln4vq66B3Hw4k6wK6hlcFvAgtwJPapUyBKx3SJLK16eOLOirv05QXQErBmBdLDDKlo
         T1b5Nx+YK85Fx6wkbna7aEauJAsWlqxNJy2nOfr3/o24dmftEA+jT59HyDpIy0ZIaP2a
         Qm9i3UuicDaMgbuy6DhFt6a1r4WKz9hi3/LdSIKGgHz2+TPYy3rt/Rg0ClIX4Q4MuTfj
         4lzpFRevoaAEVsoeDtTF2ZOyN6GBpAO0QFcQW2K4hKy6szhcHhmgLIYVnOMbYKCTwjGA
         UUyg==
X-Gm-Message-State: AC+VfDx8mEM8xbGr/D8fISjy+3Lu2UlxqsPGd07tuq1GZKCq4pG69+9o
	V6wN6dHzOcjyqjm4Yj3lxh3q5XpkiqLj40FKluA=
X-Google-Smtp-Source: ACHHUZ60LM5SoOTFwGUl3RlcAyMDxQFMdTDgTp8OKrfPBoa2tte3uzXUqNmOjV0vjISBIvfSyrI7SQ==
X-Received: by 2002:a05:622a:3c6:b0:3ef:2821:4869 with SMTP id k6-20020a05622a03c600b003ef28214869mr30429727qtx.34.1683049530404;
        Tue, 02 May 2023 10:45:30 -0700 (PDT)
Received: from megalith.ht.home (cpe64777de11593-cm64777de11590.cpe.net.cable.rogers.com. [174.115.224.47])
        by smtp.gmail.com with ESMTPSA id bq12-20020a05620a468c00b0074688c36facsm9782191qkb.56.2023.05.02.10.45.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 May 2023 10:45:30 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH v3] python3-calver: Add recipe
Date: Tue,  2 May 2023 13:45:29 -0400
Message-Id: <20230502174529.2262518-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 17:45:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180764

calver is "a setuptools extension for automatically defining your Python
package version as a calendar version." It is required for
python3-trove-classifiers (another new recipe), which in turn is
required for the upgrade of python3-hatchling from 1.13.0 to work.

v3 clarifies that the recipe now includes ptests, where v2 didn't make
this clear and v1 didn't have them at all.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../python/python3-calver_2022.6.26.bb        | 28 +++++++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-calver_2022.6.26.bb

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 2f83132aeb..bd95a13ff6 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -56,6 +56,7 @@ PTESTS_FAST = "\
     popt \
     python3-atomicwrites \
     python3-bcrypt \
+    python3-calver \
     python3-hypothesis \
     python3-jinja2 \
     python3-jsonpointer \
diff --git a/meta/recipes-devtools/python/python3-calver_2022.6.26.bb b/meta/recipes-devtools/python/python3-calver_2022.6.26.bb
new file mode 100644
index 0000000000..32b6cfbd42
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-calver_2022.6.26.bb
@@ -0,0 +1,28 @@
+SUMMARY = "Setuptools extension for CalVer package versions"
+HOMEPAGE = "https://github.com/di/calver"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+SRC_URI = " \
+    git://github.com/di/calver;branch=master;protocol=https \
+    file://run-ptest \
+"
+SRC_URI[sha256sum] = "e05493a3b17517ef1748fbe610da11f10485faa7c416b9d33fd4a52d74894f8b"
+SRCREV ?= "3268d8acf2c345f32a1c5f08ba25dc67f76cca81"
+
+inherit python_setuptools_build_meta ptest
+
+S = "${WORKDIR}/git"
+
+RDEPENDS:${PN}-ptest += " \
+    ${PYTHON_PN}-pretend \
+    ${PYTHON_PN}-pytest \
+    ${PYTHON_PN}-unittest-automake-output \
+"
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -rf ${S}/tests ${D}${PTEST_PATH}/
+}
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.40.0


