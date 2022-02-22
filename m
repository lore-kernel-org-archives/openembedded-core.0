Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 520EFC433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 19:17:15 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.1883.1645557434664193113
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 11:17:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jVe+tmki;
 spf=pass (domain: gmail.com, ip: 209.85.214.181,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id 4so7891347pll.6
        for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 11:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=bWhHPJN72ybqi8E/3bpMgB2+KNdETHvjWsuVfcI7nvg=;
        b=jVe+tmki5LypRswFX0oJu9VSsU9dOUAopfg4Y/T1Thi0ODPgvCBOr7+B+KV78N4AXq
         LiUXgV/nRdVLpOwD7+1Gca8KyeE109dPbucO4EB0iv3T3Z1Gc1HnlSX2bxZKVW/QHRaX
         RP/+q63kmfz6r66epKdV5D2TGSCMeX2PTKnjQt0MrBn7VywMyycFYwCe5kCD34RZglBr
         IvFGz+pQ59+nyXuJCl4s9K8ym5ZEdPALW8hfEfFdTO2kbpuRZhFF2fLqsg7d5GBgxUvW
         E+aZ9JxD333fWeAQlqIMH16QZuBe3ZGNd0Nu5OmUB6K3rNs0lpIP+aubFMjYqjyuK2dM
         E1Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bWhHPJN72ybqi8E/3bpMgB2+KNdETHvjWsuVfcI7nvg=;
        b=xSrBk1SrHSrp7VDN7/oVphskiZOeoSnvqHAQMDZdf0R07f5x1XqPmnrGYyZb3+Hgme
         PQWw7ZWMJO+8jTytOM5t1hWUvM89UhqXi2ILoVp5s9ZaTJItN3gbhbk5HY+t66+56v05
         nUP/Wer7hunTEKEZiCaHp3moxVcjYhDfn1Rvte/K+3GnAXxq13KDQlg/D6scfSIsVazl
         KQ550GpYxH7CwQDPlDXD+t/QPjnkRNpiurTY4wqsTUkxwxeNO3vzO8z4UgIbaZWfrwHl
         vQ4aMyQl6A37Dy3IDWFZNJ7KqLquwK0iw0pCBIG00UY6n94MI586vA5dCzV5MTel5Qmg
         V3GQ==
X-Gm-Message-State: AOAM531bDu1VPnSboo5FbkHhlEdiZuW+IyXejf/WO9pnGz058shRMGgL
	3YP8WWD4knS7h+dvTA+sjCif/P+/asKd4Q==
X-Google-Smtp-Source: 
 ABdhPJwq9mWBLbBhnzN0tRq6qpzsGeL/gv6JLFzKmIQdyRj9xyMDV6at5PMSjdtgo7VtG/nfmu8EjQ==
X-Received: by 2002:a17:902:d4cb:b0:14f:f7b0:cb28 with SMTP id
 o11-20020a170902d4cb00b0014ff7b0cb28mr47612plg.60.1645557433631;
        Tue, 22 Feb 2022 11:17:13 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d208:bddf:2b06:2b5a])
        by smtp.gmail.com with ESMTPSA id
 z13sm18402700pfe.20.2022.02.22.11.17.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 11:17:13 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 07/32] python3-pip: inherit setuptools_build_meta
Date: Tue, 22 Feb 2022 11:16:33 -0800
Message-Id: 
 <d7fd8523060c53dd0c3f1315883362f8a7777822.1645557032.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645557032.git.tim.orling@konsulko.com>
References: <cover.1645557032.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 19:17:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162198

Upstream provides a pyproject.toml which declares setuptools.build_meta
as the backend for PEP-517 packaging.

We bootstrap the -native installation by simply unzipping the wheel to
PYTHON_SITEPACKAGES_DIR, so that all other recipes can use pip to
install wheels (as intended by upstream).

Check for presence of ${D}${bindir}/pip and remove if found (this was
originally to make sure Python2 pip was the default).

[YOCTO #14638]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/python3-pip_22.0.3.bb              | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-pip_22.0.3.bb b/meta/recipes-devtools/python/python3-pip_22.0.3.bb
index 889a6bf8adc..c4671f50175 100644
--- a/meta/recipes-devtools/python/python3-pip_22.0.3.bb
+++ b/meta/recipes-devtools/python/python3-pip_22.0.3.bb
@@ -4,17 +4,32 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=63ec52baf95163b597008bb46db68030"
 
+inherit pypi setuptools_build_meta
+
 DEPENDS += "python3 python3-setuptools-native"
 
-inherit pypi setuptools3
+# To avoid a dependency loop; we bootstrap -native
+DEPENDS:remove:class-native = "python3-pip-native"
+DEPENDS:append:class-native = " unzip-native"
 
 SRC_URI += "file://0001-change-shebang-to-python3.patch"
 
 SRC_URI[sha256sum] = "f29d589df8c8ab99c060e68ad294c4a9ed896624f6368c5349d70aa581b333d0"
 
+PYPA_WHEEL ?= "${B}/dist/${PYPI_PACKAGE}-${PV}-*.whl"
+
+do_install:class-native() {
+    # Bootstrap to prevent dependency loop in python3-pip-native
+    install -d ${D}${PYTHON_SITEPACKAGES_DIR}
+    unzip -d ${D}${PYTHON_SITEPACKAGES_DIR} ${PYPA_WHEEL} || \
+    bbfatal_log "Failed to unzip wheel: ${PYPA_WHEEL}. Check the logs."
+}
+
 do_install:append() {
     # Install as pip3 and leave pip2 as default
-    rm ${D}/${bindir}/pip
+    if [ -e ${D}/${bindir}/pip ]; then
+        rm ${D}/${bindir}/pip
+    fi
 }
 
 RDEPENDS:${PN} = "\
-- 
2.30.2


