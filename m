Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB58AC3DA6E
	for <webhook@archiver.kernel.org>; Fri,  5 Jan 2024 18:20:07 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.30668.1704478799767061481
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jan 2024 10:19:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OYX9PN2I;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6da6b0eb2d4so1206344b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jan 2024 10:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704478799; x=1705083599; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IXPJGMyspm7KclCXSvfZrOm+2bt9GYzDXaXD4UuS83w=;
        b=OYX9PN2IaKa8WDoFc2ZuYIIyKZl8zBCgfqSUtu4t0Yue5rUi2/7TH1Ab1H1GmM47vu
         5juCoQV4h+LYDezrHnE470GSr/cD5cdkfmy7+Z/ldv7lQumTo++SAuUOmQHa8RKsuaox
         ZvpMfWYmYOydsjTzJ+l2Uhvtv+44aXydbzKbMWsmrcVIcfGPOhVGvkarw3K/Zu9NzCWp
         HtHnMQBO+4dIrzHBJl1yaaqVvP7Nw0WcN8CDSiuuUuhncBSR6jrWP+AExYVXywcafdYL
         geiU+8Yowp9OgFfwUfKHwkRuNjxh+k94jCtSQRpIj+yQhrCfCqx3lIBNvPVjoESoHJF2
         egzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704478799; x=1705083599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IXPJGMyspm7KclCXSvfZrOm+2bt9GYzDXaXD4UuS83w=;
        b=kjmZx9YBbnzPG+Y9kpMZ80CqfiNxyvUBlliVA1mAyzZtrLEZEPkOu7CCNRrAPBOLW6
         CScxmf58sDdnJ+lSTGHlMVwlGdfCjn/EX+STYCs4FzFIc+k3DM/Xmcg0L5rDT+ATU5qR
         LiosyAzUduADP5J8jH/Z0T5+BbPyAlQYyoa+8vcxd6fGLBW0qbLHjdLHlxSMOEcqpoJm
         XoNz+pwvUoZswzbUOTkVDomNCkzJx918iX0jWd0T83Y7YuhLE+Imd58xmTxI4w/EpED2
         L/3Q+7IgAS6K2pc+/GT8VrJOahNNDV0DkvtlT8JmqJayNj6k7rzrBFS94CtzUfonm1lB
         Gj2Q==
X-Gm-Message-State: AOJu0Yz1Yp3vdOQbtxvSysjR2m9sArt3jvNf3RrprvkM/V2Hgh3j8SoS
	oYK+8q8ZFDBXko4i/m/bFput/ti9zsA=
X-Google-Smtp-Source: AGHT+IHME/cd5KtPbd1Jej5VmRXCs4m/g9H8lo2O+t50pRwhKZaUDWjEprM617pv/oc8KbuVDSzi9g==
X-Received: by 2002:a05:6a00:22ce:b0:6da:2ee0:50bd with SMTP id f14-20020a056a0022ce00b006da2ee050bdmr2994639pfj.53.1704478798855;
        Fri, 05 Jan 2024 10:19:58 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:1ef8:e4e3:e071:1cf1])
        by smtp.gmail.com with ESMTPSA id o128-20020a62cd86000000b006da3b35bef3sm1752318pfg.54.2024.01.05.10.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 10:19:58 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 2/2] python3-attrs: enable ptest
Date: Fri,  5 Jan 2024 10:14:55 -0800
Message-Id: <20240105181452.1488396-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240105181452.1488396-1-tim.orling@konsulko.com>
References: <20240105181452.1488396-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jan 2024 18:20:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193378

The conftest.py file is needed to define the "slots" and "frozen" fixtures
for pytest

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---

All ptests passed on core-image-ptest-python3-attrs in about 19 seconds
on qemux86-64

 .../conf/distro/include/ptest-packagelists.inc |  1 +
 .../python/python3-attrs/run-ptest             |  3 +++
 .../python/python3-attrs_23.2.0.bb             | 18 +++++++++++++++++-
 3 files changed, 21 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python3-attrs/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 9057c12b091..ef6f471e7bd 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -57,6 +57,7 @@ PTESTS_FAST = "\
     pango \
     popt \
     python3-atomicwrites \
+    python3-attrs \
     python3-bcrypt \
     python3-calver \
     python3-hypothesis \
diff --git a/meta/recipes-devtools/python/python3-attrs/run-ptest b/meta/recipes-devtools/python/python3-attrs/run-ptest
new file mode 100644
index 00000000000..8d2017d39ce
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-attrs/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest --automake
diff --git a/meta/recipes-devtools/python/python3-attrs_23.2.0.bb b/meta/recipes-devtools/python/python3-attrs_23.2.0.bb
index e00e1520156..7b6a6bd94c9 100644
--- a/meta/recipes-devtools/python/python3-attrs_23.2.0.bb
+++ b/meta/recipes-devtools/python/python3-attrs_23.2.0.bb
@@ -5,7 +5,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5e55731824cf9205cfabeab9a0600887"
 
 SRC_URI[sha256sum] = "935dc3b529c262f6cf76e50877d35a4bd3c1de194fd41f47a2b7ae8f19971f30"
 
-inherit pypi python_hatchling
+inherit pypi ptest python_hatchling
+
+SRC_URI += " \
+	file://run-ptest \
+"
 
 DEPENDS += " \
     python3-hatch-vcs-native \
@@ -18,4 +22,16 @@ RDEPENDS:${PN}+= " \
     python3-crypt \
 "
 
+RDEPENDS:${PN}-ptest += " \
+    ${PYTHON_PN}-hypothesis \
+    ${PYTHON_PN}-pytest \
+    ${PYTHON_PN}-unittest-automake-output \
+"
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+    install ${S}/conftest.py ${D}${PTEST_PATH}/
+}
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


