Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70D78CD6E60
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 12:06:46 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23233.1780401423620806943
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2026 04:57:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=GAb6/8EE;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: frederikbraendstrup@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-68bd9fce347so7481260a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 04:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780401422; x=1781006222; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jpaQtfd11/xG8HbzsPzacu92pyihqkOdwWkBsE52Qp8=;
        b=GAb6/8EEsekn97BG7Mb2icyzXamYyI52/ErFaWjwWetOELXr0noPQ25X0XGhaUWIcx
         azHbGCqFj/r4cuEqG9BPmQCxqxrXx344tFxNzhIUBcwWJq4+d6X7gLJ7xqcSAt5Y/upl
         nURobenegCHnqWUfM48EIb/0xO2y33JOcAXbejK7jPkten8gJA0xcBPfKI2/o+ODRG7D
         s2zgtv4Xgmvke58ZrKt7TVFbF7DhPn3TCMxll8ks3clxI/fNoCfutDPi3/WdTY/qbx1r
         w+kZCA7tsWEVNnpPGvDu6zguLImCCk7pju0EyOHbiviUaSOAHouoD/MPDAxx/LCkLtpF
         PeaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780401422; x=1781006222;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jpaQtfd11/xG8HbzsPzacu92pyihqkOdwWkBsE52Qp8=;
        b=T942h/epriJenzRnCYLPTvu0h9AmtGfgAQXekjZDXFV2/Gw5/SGTzYZlg/3QOy/ALS
         8MLUZU0muxkiOdtT8brsw490CJLjIxIsiRGDXMP4Uz5ksRUgvVHS+rIeVAIsQ9Z8TsIq
         3oZnQ/jZZorEhV2NtGf8m+AlXYs9kHSOLlaBZKLOm45N8w+D6vPPZHwboouPt6ex+fel
         x1nWGd5rq37JBIQ9X2InwRyZBTLylyzSrpcQnlJzYLgS+Cr05VxFYaKyYq47v20g/J5h
         7TWeXDK9AYJXQFj+7brVAiJI2RdVoDfCz+w0EOpVUjldt15e/R0UE0BfWzdqwaxPFfcz
         rN8g==
X-Gm-Message-State: AOJu0YxlZ+BUc6RTt+gkTeSauMyr/BMIpI4GHy6mYNgeICDN0HVvfojC
	en1YbDVIQPY9OG+BvHGtTjVAStRgBlFmOuA4JwxULxkhGs4W9hc2MpWHdyHPoUYF
X-Gm-Gg: Acq92OHDU+ztkRi/CyMtWgtHRrfcRZ1dJmOlr92eCl8NgoW/s8eREg1v733jzg8WQAx
	9jjWEdNJh03uOUJ8ZfWqpI3zEf0mPZimnAtz5e3qa7EJydNQlUui5XbVB9xih6u6eD4l2IhzgVG
	Rtm82nAxgykg4Mk402lSKVNYHqUFwQlwd1XzlhqsAg7atsYfZ+qivA2L3LgIxPiT7EaZkGMbOp8
	C+iyXQEhBdduSDrgI72m/72eid6cvsAO2qBawu7dylL3zeVFyTAg3CMS3n1mTeTHbuYuFAeNCWB
	yiFaOmkjHit4a8YIoxfsBLVyPatXl27B514z/l6eT1FHpC4eJDX+6wO0+WA20x9zA/fgJDRgHWa
	zAyjh1vnm7Gyo7JpCXIKQ3RUx8cyswTrDpDHnIYR/k/skcN4Y+hVrEs4KRPh7ilLwiEd76qsJVw
	Qm954Gs52ZoACBLS6oLELG6CFo65/ycsq0tGbRWjaJYnv00wRxzhKmjnGeYA==
X-Received: by 2002:a17:906:3098:b0:beb:133d:cf02 with SMTP id a640c23a62f3a-beb133dd1d4mr588423066b.26.1780401421374;
        Tue, 02 Jun 2026 04:57:01 -0700 (PDT)
Received: from ws.taila4487.ts.net ([80.166.137.147])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68ceb7a7c70sm3320813a12.7.2026.06.02.04.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 04:57:01 -0700 (PDT)
From: =?UTF-8?B?RnJlZGVyaWsgQnLDpm5kc3RydXA=?= <frederikbraendstrup@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
Subject: [PATCH 1/3] python3-pkg-about: add recipe
Date: Tue,  2 Jun 2026 13:56:30 +0200
Message-ID: <20260602115632.3105218-1-frederikbraendstrup@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 12:06:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238038

Signed-off-by: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
---
 .../python3-pkg-about_2.4.2.bb                | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python3-pkg-about/python3-pkg-about_2.4.2.bb

diff --git a/meta-python/recipes-devtools/python3-pkg-about/python3-pkg-about_2.4.2.bb b/meta-python/recipes-devtools/python3-pkg-about/python3-pkg-about_2.4.2.bb
new file mode 100644
index 0000000000..a9fdc6d544
--- /dev/null
+++ b/meta-python/recipes-devtools/python3-pkg-about/python3-pkg-about_2.4.2.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Easy access to information about a Python package/distribution"
+HOMEPAGE = "https://pypi.org/project/pkg-about/"
+LICENSE = "Zlib"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d1684e2918788f4ab887eb4f3f7400bf"
+
+PYPI_PACKAGE = "pkg_about"
+
+SRC_URI[sha256sum] = "f5a3b2e402842141a8a36069dbb57ad9d27aa1623574863654cc26b5cc4bd545"
+
+inherit pypi python_setuptools_build_meta
+
+RDEPENDS:${PN} += " \
+    python3-build \
+    python3-packaging \
+    python3-importlib-metadata \
+    python3-email \
+    python3-packaging \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.54.0


