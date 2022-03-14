Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A2BBC433F5
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 22:48:49 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.3512.1647298128309413677
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 15:48:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IQYbA9r7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id
 v130-20020a1cac88000000b00389d0a5c511so405927wme.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 15:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BP257QDoAb6V1l9Sa//oJ3DW3boV2SUMbtPImgARG6M=;
        b=IQYbA9r77drnG14IiqeVwxkQzfZjOy6Zu9EVYB8fjEtHhhRTcxDE7Cwel0anqGhcFo
         170qtGf07d1Y7R9R4CgrNRXq4Gh8I2SbY8ZNZ5w2+FA54aRO5L4AX8z2BaVECowvLQdX
         wKLi4Ic20WL7DwyC1RAVbZFjd0j1Cu61tbCXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BP257QDoAb6V1l9Sa//oJ3DW3boV2SUMbtPImgARG6M=;
        b=PO0V9rlOCdSHi4V67CgCC0haOUTvXTM8TBy0plKZemUqq39yhwr25+IwlEM4auBS2e
         Uqoet5DW3ouJiVAA9wZ32kA3gwx8LE2l1DcflFeiccsrtWJeJUzn++piEQgoQ7ctsukX
         pBRw8yAsWSbiSe1yIqmUGQEfFo7F+Gk7VUG1Lv9ILt/3Gaojj4X2pBWhQRiSCETB6yvP
         V3ucRLRzJiRcGhZw8RKZGsVOjTgB41hufWg1xj9phiXoq9yfwTcEbNOFO+JXJZd2KCcu
         Gefp8Hx63XvjvOfzrYkM2M39ENJvD8Lnt1hZPQJ/0HRE7zUCZwUwGRAhguTPXaZAQO2e
         Yhzw==
X-Gm-Message-State: AOAM530FcTB8gv1jRQjF9lAEseOB02RjiaThh3Bd9PQvkPKmLY+dFglV
	abcRO1Vex2KWEZKS3mtJf8wMR/DXFM3Ed2cr
X-Google-Smtp-Source: 
 ABdhPJyuN0i57OHZOpPOVeAfQJNuELfmv5VmxBzPtq8P91J5mMSVDWNA5YCrWfIKUHUpNvxlcP0c1Q==
X-Received: by 2002:a05:600c:4615:b0:386:9f67:8c63 with SMTP id
 m21-20020a05600c461500b003869f678c63mr1017585wmo.12.1647298126547;
        Mon, 14 Mar 2022 15:48:46 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:9098:b3d5:8fee:ea58])
        by smtp.gmail.com with ESMTPSA id
 bg18-20020a05600c3c9200b0037c2ef07493sm788599wmb.3.2022.03.14.15.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 15:48:46 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 09/33] python3-cffi: move from meta-python
Date: Mon, 14 Mar 2022 22:48:13 +0000
Message-Id: <20220314224837.834776-9-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220314224837.834776-1-richard.purdie@linuxfoundation.org>
References: <20220314224837.834776-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 22:48:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163175

From: Tim Orling <tim.orling@konsulko.com>

Dependency for python3-cryptography

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/python3-cffi_1.15.0.bb              | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-cffi_1.15.0.bb

diff --git a/meta/recipes-devtools/python/python3-cffi_1.15.0.bb b/meta/recipes-devtools/python/python3-cffi_1.15.0.bb
new file mode 100644
index 00000000000..c36f23b3dde
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-cffi_1.15.0.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Foreign Function Interface for Python calling C code"
+HOMEPAGE = "http://cffi.readthedocs.org/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5677e2fdbf7cdda61d6dd2b57df547bf"
+DEPENDS += "libffi ${PYTHON_PN}-pycparser"
+
+SRC_URI[sha256sum] = "920f0d66a896c2d99f0adbb391f990a84091179542c205fa53ce5787aff87954"
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN}:class-target = " \
+    ${PYTHON_PN}-ctypes \
+    ${PYTHON_PN}-io \
+    ${PYTHON_PN}-pycparser \
+    ${PYTHON_PN}-shell \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.32.0


