Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 502E5C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 19:17:12 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web08.1966.1645557431173434876
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 11:17:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hrm3ekDa;
 spf=pass (domain: gmail.com, ip: 209.85.210.180,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id g1so13074936pfv.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 11:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=2A9zV8aR5M60wXz9FhHddcStTsjphIo+8Q9kHuCCezQ=;
        b=hrm3ekDaKpw90KKoqH4Q0emlFdioG1SH9neqOivs4TKuG0+PnNQDeMKv3yzEGV9Os0
         r5VvxD97Rrgqc6HqvyCVPsW8OtQ3BC6nlCdUZyVuwYRmqOGlm+G2NadMy1j2W4fA6D/e
         lSrzsc/L93IC5+kg1dR7xBXsBzCEK9hiy+aqPA8mL7wwdNiSflWHIfchv9XF/wD9E3Mu
         RwK+m9e6pnsTITkDah26xSvzxBSGe9EbBCRiUT7JJ59eQHlJkfTXg+KlZMYJHLsVJs0/
         JeDdyMkQ+i+ErUXE0cu88UtzQbzeomE1P5+pDm0oVDsKsd6rX4c2O7yEaNN130YWrcYv
         2C8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2A9zV8aR5M60wXz9FhHddcStTsjphIo+8Q9kHuCCezQ=;
        b=gRIFoRaQQNRDmRtVTDJTcC6GHS2biAdpmNsAIPckx8elvrWO3utP8jK69h8vTtI+oz
         LOO3jE/4p9NEo3KRDHoMxaCq2+8yLkETXZKaCCCI+mhSyOtYxVHX7P/n01aTge38Cii2
         GH6+UGLOrvEvkQ8e6SNCyr1wSTVYPulRMtjhO/V6nPKC+fAvKzsMs5tsE+td3cfKLjMd
         BVAHnkQ13yS8hxO18Ob2+sQK8o1ZFC9PvLw3KdvvligVOekRtyb8RBRo8qam8oVjVG90
         LpdI2vEyO2AaGRdIz6H5wCUKmkvwIcxixalckwOKOzbbhLIZxcktwpMBbvaA6W1+2rO5
         cHgA==
X-Gm-Message-State: AOAM531iTEvBxoDeaHejiaNCjlwOKsnyHuUqgmI3NGs2olLrczs6/gRw
	GLCNZ+EuIMxERk70EOnsSVf+J4i40HIWfw==
X-Google-Smtp-Source: 
 ABdhPJw543HJu1tbeTDUlE8cCJbjgNJkmHy0EO9Hxu5v7wFBl1vtROsWqX+A5Qf7xbkDJOPX55N1zA==
X-Received: by 2002:a05:6a00:181c:b0:4e1:a270:df4d with SMTP id
 y28-20020a056a00181c00b004e1a270df4dmr26206245pfa.71.1645557430079;
        Tue, 22 Feb 2022 11:17:10 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d208:bddf:2b06:2b5a])
        by smtp.gmail.com with ESMTPSA id
 z13sm18402700pfe.20.2022.02.22.11.17.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 11:17:09 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 05/32] pip_install_wheel.bbclass: add helper class
Date: Tue, 22 Feb 2022 11:16:31 -0800
Message-Id: 
 <7ded178838deb30461a06ebf7cfef04f0a08af74.1645557032.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645557032.git.tim.orling@konsulko.com>
References: <cover.1645557032.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 19:17:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162196

Provide a helper class to use pip to install wheels built by either
bdist_wheel or a PEP-517 backend.

Set pip install arguments via PIP_INSTALL_ARGS, which can be overriden
by recipes.

Pass --root and --prefix to ensure that pip installs things into the
proper place in sysroot.

By passing --no-deps and --no-index we avoid finicky dependency
checking (pip expects wheels in its cache) and avoid trying to fetch
wheels from pypi.org. This is basically the same behavior we have now,
the dependencies should be declared in the recipe.

Also pass --force-reinstall to make sure built wheels are always installed
so that FILES gets properly populated.

Pass --no-cache to avoid a (harmless) warning about the pip cache in
$HOME be avoiding use of cache. We do not likely want wheels cached
anyway,

pip install changes the python interpreter in scripts installed in
${bindir}, e.g. to #!/usr/bin/nativepython3, correct the behavior after
install to #!/usr/bin/env python3.

[YOCTO #14638]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/classes/pip_install_wheel.bbclass | 39 ++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 meta/classes/pip_install_wheel.bbclass

diff --git a/meta/classes/pip_install_wheel.bbclass b/meta/classes/pip_install_wheel.bbclass
new file mode 100644
index 00000000000..70f47d6f79c
--- /dev/null
+++ b/meta/classes/pip_install_wheel.bbclass
@@ -0,0 +1,39 @@
+DEPENDS:append = " python3-pip-native"
+
+PIP_INSTALL_PACKAGE ?= "${PYPI_PACKAGE}"
+PIP_INSTALL_DIST_PATH ?= "${B}/dist"
+PYPA_WHEEL ??= "${PIP_INSTALL_DIST_PATH}/${PIP_INSTALL_PACKAGE}-${PV}-*.whl"
+
+PIP_INSTALL_ARGS ?= "\
+    -vvvv \
+    --force-reinstall \
+    --no-cache \
+    --no-deps \
+    --no-index \
+    --root=${D} \
+    --prefix=${prefix} \
+"
+
+pip_install_wheel_do_install:prepend () {
+    install -d ${D}${PYTHON_SITEPACKAGES_DIR}
+}
+
+export PYPA_WHEEL
+
+PIP_INSTALL_PYTHON = "python3"
+PIP_INSTALL_PYTHON:class-native = "nativepython3"
+
+pip_install_wheel_do_install () {
+    nativepython3 -m pip install ${PIP_INSTALL_ARGS} ${PYPA_WHEEL} ||
+    bbfatal_log "Failed to pip install wheel. Check the logs."
+
+    for i in ${D}${bindir}/* ${D}${sbindir}/*; do
+        if [ -f "$i" ]; then
+            sed -i -e "1s,#!.*nativepython3,#!${USRBINPATH}/env ${PIP_INSTALL_PYTHON}," $i
+            sed -i -e "s:${PYTHON}:${USRBINPATH}/env\ ${PIP_INSTALL_PYTHON}:g" $i
+            sed -i -e "s:${STAGING_BINDIR_NATIVE}:${bindir}:g" $i
+        fi
+    done
+}
+
+EXPORT_FUNCTIONS do_install
-- 
2.30.2


