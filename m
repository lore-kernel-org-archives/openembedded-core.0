Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 346C4C433FE
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 21:24:39 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.4753.1645478678685626967
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:24:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FIuj/LjJ;
 spf=pass (domain: gmail.com, ip: 209.85.214.176,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id q11so4080193pln.11
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:24:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=OqfbI/taZuE5tvRkjzUudtuBzn1DIs9rdG1KeJG3/cw=;
        b=FIuj/LjJjRL43X+Lupx16qSfkqwbBNVZR1iPZ3TIHkTAuO/oU9gNU+05TD+KuOAIMx
         /olTAmzwm8bY2/N7fvKAgshHFXWwpHgd8xmJovnQRhQF0J8cPfNbsGyMnirQ7YW9x7fQ
         4sQFZTyuUca/0PZfgZIy2M90hHBrebK/9STJtJZlcga+cPTSY7GvcE7bm/ca6nLc8iL9
         XnvzEoYX9dHawfl9zuX2LJG12qvVeNBxd2Ff2lhfzkr4TzUXyn7O7ayjJGcY+SLaMxQc
         0LPR5wLvmRdMYYnjnTH54opfkneZ+hDRbC7ko/y64prpvxzXdCNyivL3RSKLvIhGGMJG
         M5ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OqfbI/taZuE5tvRkjzUudtuBzn1DIs9rdG1KeJG3/cw=;
        b=lPxenmjLZ5i4EZMe4pWS/XYhzH8nYK/fUuH95Dfw9hchXcVt264cbBn5/rQTMD7665
         cTAJMEUJZ0wiMXkFVewUMiAv7f/T8Qky8rli6WX3OpI9bapiwiwmNRKUVyMKw3cNwA2y
         bQJlNrCSfTyk1K0lh5j8YqujbuT+e8XsHNKktwgBPdUFlAB3X7QheyCu+xp7bgXAGKql
         bnBfNrpf9Yd5HRtFq4AhSw84Gp+zjc3swgkcfq9eTDRWW1BM2UqYO6FhCy/up1H/UadM
         AYNg1PehiQHQtsbof97eD9Gi2d+EUwkZJd6JqGAsxZk9Nk0HL5NKKZm2GWeEOkX8L7E3
         kaVA==
X-Gm-Message-State: AOAM532rZzQppm7kHZCt4qvDz1qiBOd2gxmLjnxFIwhSp1cAP+wlvXZD
	gH4A5H7+NGEfgUthyV7Z0laZ3NWRKKKxkw==
X-Google-Smtp-Source: 
 ABdhPJxlw3y3ZJv3ptXPa2Flcx9Bheqr4EK5srEj45Ko3IDK6nl0t5/ruv6MnvpkJMM0Jn10xocz5g==
X-Received: by 2002:a17:903:1249:b0:14e:e477:5019 with SMTP id
 u9-20020a170903124900b0014ee4775019mr20799476plh.53.1645478677785;
        Mon, 21 Feb 2022 13:24:37 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d01c:96b7:6393:8c56])
        by smtp.gmail.com with ESMTPSA id
 n85sm14081529pfd.142.2022.02.21.13.24.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 13:24:37 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 22/32] python3-scons: merge -native recipe
Date: Mon, 21 Feb 2022 13:23:37 -0800
Message-Id: 
 <9eb629938e3106ae90894b191f9205f37a09eb95.1645478020.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645478020.git.tim.orling@konsulko.com>
References: <cover.1645478020.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 21:24:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162098

The native recipe simply calls create_wrapper to add a host script. Do
this via do_install:append:class-native()

The scons*.1 man pages are being installed in ${prefix}, move them to
${mandir} (previously installed in ${datadir}).

[YOCTO #14638]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/python3-scons-native_4.3.0.bb            |  7 -------
 meta/recipes-devtools/python/python3-scons_4.3.0.bb | 13 ++++++++++++-
 2 files changed, 12 insertions(+), 8 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-scons-native_4.3.0.bb

diff --git a/meta/recipes-devtools/python/python3-scons-native_4.3.0.bb b/meta/recipes-devtools/python/python3-scons-native_4.3.0.bb
deleted file mode 100644
index 73076b87320..00000000000
--- a/meta/recipes-devtools/python/python3-scons-native_4.3.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require python3-scons_${PV}.bb
-inherit native python3native
-DEPENDS = "python3-native python3-setuptools-native"
-
-do_install:append() {
-    create_wrapper ${D}${bindir}/scons SCONS_LIB_DIR='${STAGING_DIR_HOST}/${PYTHON_SITEPACKAGES_DIR}' PYTHONNOUSERSITE='1'
-}
diff --git a/meta/recipes-devtools/python/python3-scons_4.3.0.bb b/meta/recipes-devtools/python/python3-scons_4.3.0.bb
index bff2fdae92d..cfb075f65f3 100644
--- a/meta/recipes-devtools/python/python3-scons_4.3.0.bb
+++ b/meta/recipes-devtools/python/python3-scons_4.3.0.bb
@@ -8,6 +8,7 @@ SRC_URI += " file://0001-Fix-man-page-installation.patch"
 SRC_URI[sha256sum] = "d47081587e3675cc168f1f54f0d74a69b328a2fc90ec4feb85f728677419b879"
 
 PYPI_PACKAGE = "SCons"
+PIP_INSTALL_DIST_PATH = "${B}/build/dist"
 
 inherit pypi setuptools3
 
@@ -24,4 +25,14 @@ RDEPENDS:${PN}:class-target = "\
   python3-pprint \
   "
 
-FILES:${PN}-doc += "${datadir}/scons*.1"
+do_install:append() {
+    install -d ${D}${mandir}/man1
+    mv ${D}${prefix}/scons*.1 ${D}${mandir}/man1/
+}
+FILES:${PN}-doc += "${mandir}/man1/scons*.1"
+
+do_install:append:class-native() {
+    create_wrapper ${D}${bindir}/scons SCONS_LIB_DIR='${STAGING_DIR_HOST}/${PYTHON_SITEPACKAGES_DIR}' PYTHONNOUSERSITE='1'
+}
+
+BBCLASSEXTEND = "native"
-- 
2.30.2


