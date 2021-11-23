Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3908C433FE
	for <webhook@archiver.kernel.org>; Tue, 23 Nov 2021 21:58:02 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web12.807.1637704682123450174
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 13:58:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Rooky9Ud;
 spf=pass (domain: gmail.com, ip: 209.85.219.54,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id u16so312095qvk.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 13:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oDVwv+qBE1pNj5i7FN65q94QCOIEQCUCacf5H04qKSg=;
        b=Rooky9Udvta/EYwNzb/En3TBtP3wuFOrrfsUHQLFwonVlPmbrANYdl/4+Ln7lveUSL
         BrXVYCRHbWb1GUvbzz0nRx8zEXzF3MkJ4CwgffPQYhFy8mTwJMU9Gz6abSKgTz+w3dkt
         tb3UrkLkB4I6HLFIfg5i9zEr7pL+Hi11mbQQsH9Xk5q6/LsaiNJlbAtshYMu7+bgTZ6M
         rfg2QqKvpZrkL/SUDHtDG/p7KL7/9f9Hw5Y4Wp7vjAAOEydbk/RQ+rzdFrcwSlioIjpm
         np9ddEYVgOSfSKXOF36CjyW8ksnLfXdj3o6RYm0Fqa9ztmfrVjOtEDEdIbEK6BS1f/Wn
         02+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oDVwv+qBE1pNj5i7FN65q94QCOIEQCUCacf5H04qKSg=;
        b=LMNe5HmDneLACjoZcHzqP1JmTV+f4snFQtglo59OHqpMaixPNFQrFcdfDADcSpsK1Y
         FSByvnZsEiltiOQQ7vVl+nxCBiSKKyN65BqMalAjQot7REET0ooTC9WIjrrycF09qML0
         2/NDE8VGdsxJFYJgZLIIUoV1ok4x/czSToKMfMczEI5Jgioahp/QaIrZ/C/n75kCrfyM
         jyHk3Axh9PNh6Q5NpVnlNktGLyzdnXKxCfheWqNnTtqBl3s7oewMOlUL1v8ts7o24cg4
         35H1rIGLgNV1bkoFLYV6zRJhKXGLy80/yXFG4N1zG84R0IGd9e5To1GO/82fLozYraIp
         raqQ==
X-Gm-Message-State: AOAM532fAsXKDcMfwF1yKjcO4MvGC71TEijPQolmHzrKMDqFwCIpdh97
	S1z9k8A6wfLaCSJhl/CimYf3UjRajaMo1Q==
X-Google-Smtp-Source: 
 ABdhPJxKvFxq4iLXc0d4LHgEbq3eVqUw1lrMr5/YMHbp+mgBGY/tfP4P8ErHb4DD4Pw/2Cu1VFIH3w==
X-Received: by 2002:a05:6214:400c:: with SMTP id
 kd12mr864688qvb.41.1637704681231;
        Tue, 23 Nov 2021 13:58:01 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 m9sm6395640qtn.73.2021.11.23.13.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 13:58:00 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	TicoTimo@gmail.com,
	trevor.gamblin@windriver.com
Subject: [PATCH 11/20] python: import rfc3339-validator from meta-python
Date: Tue, 23 Nov 2021 16:57:38 -0500
Message-Id: 
 <b664c1714d93a821e19dab0aa5d63aba25fcf413.1637703810.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1637703810.git.bruce.ashfield@gmail.com>
References: <cover.1637703810.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Nov 2021 21:58:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158632

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Importing rfc3339-validator from meta-python, which is a dependency of
python3-jsonschema. These packges are required to support
the validation of kernel device trees.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../python/python3-rfc3339-validator_0.1.4.bb | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb

diff --git a/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb b/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb
new file mode 100644
index 0000000000..7f1bbaf97d
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb
@@ -0,0 +1,20 @@
+SUMMARY = "A pure python RFC3339 validator"
+HOMEPAGE = "https://github.com/naimetti/rfc3339-validator"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a21b13b5a996f08f7e0b088aa38ce9c6"
+
+FILESEXTRAPATHS:prepend := "${THISDIR}/python-rfc3339-validator:"
+
+SRC_URI[sha256sum] = "138a2abdf93304ad60530167e51d2dfb9549521a836871b88d7f4695d0022f6b"
+
+PYPI_PACKAGE = "rfc3339_validator"
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN} += "\
+    ${PYTHON_PN}-core \
+    ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-six \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.19.1


