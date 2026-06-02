Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C01CCD6E60
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 12:07:06 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23445.1780401427739933682
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2026 04:57:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=oyywjE7T;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: frederikbraendstrup@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-687ed9aabb3so8202799a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 04:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780401426; x=1781006226; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OHaWse7mxQiN+ohoOuCV9QrWdZQb3kYRqYmK9yb+54I=;
        b=oyywjE7T5CjxRIRgruKKeHvlD8pmN17miyTuAtaNL5ZTA07PJG9jGgYOZne4RtzdzW
         QyE68pEZAOk7d+G3OryIFei2XnY5iBE5w0Ehb+VlE+HL3FQgF/OVypZyIOvAxhu08HtF
         6B6wUyCVF4uw3stVVZILVX7OIBnHa0tWFzmHW/AeMKau+W2S50IVf7V6dUNUT0LjKKli
         xkg4rcudeRelbbefaRxWrWXUuiGO3vfX3hR/3+oImiNeImxMtBreuIFIW1yy7usTJb4x
         JCM1IGcS+wmaT1Ly9GrrxU5143AJZue+h3+xEh6K3uJZe6staTMRevkfgXGOJZGkIhv/
         r/HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780401426; x=1781006226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OHaWse7mxQiN+ohoOuCV9QrWdZQb3kYRqYmK9yb+54I=;
        b=Z26YCv1CrmgPdVcjube/Pi9uD28OAuPc/SRclkAxER+fxZIN8tJtUU6KeLE9VJ/zLw
         lyW62OaDM8qaft2yovXzQABBvulbyyFc9bl9jFPqsFWVtB7g0OoTd+NgzalBrwnTraUR
         ihocR02Z2Pf4nXy84IXKVJkS3Vdt+nqxx8DPjxGcVxHT8C7/nVvDNP0FATMh3FI4J1MJ
         L9WA9cLsWZLXBz0ralig3BJMSwre8ObxMbY4NVwjxkV+4z7v86pC2S1gtEoELDV5PbCC
         O8/qgl/wtYw1k6WWZRfWq5fI3JVTRCWHQOJa3v4QFg2iJ/EAoavYVJPcar+egKeA4G7U
         PJRg==
X-Gm-Message-State: AOJu0YwtQN8kTa4mLZigfSEnWUmMGIqIQ8f3tSPGyAMYO1Kjd8epOkjW
	V6dZw+b+HHV8WBjuKXbRP8KKqL2Ay06oFjgYFCDofu9LaPIFKq5wudpoM0ukBXiX
X-Gm-Gg: Acq92OFp7XaUc0sHoT+7xlS6URUMfIvkt9wx1zyvO26cO0jWGNMZ2N/p9Ap4dnBzgCq
	LR0LtYpw+SiA2kBJQB1Q+0HqltJBveeZ6IvcQ6I1IwNyregmN77x8E4z89LgtA/siHimnesF2Dx
	yCfeIkbBbOR4ygZytd907+iZ9N7JjswCyuYq0GlVYLSk4usjFlztTe0tz1TyrTZMxqygiljtmio
	xTD17MA7jkxNhm/64QIZNT6rRriuBKEC4EPg7/ZNuQN8vAo7cRvAJQDVYpm6+w0sBZnmBZTVH8S
	QMKo+A2bSFFYsJSHYQKQhBKBvZoyM6bRiHp5E7r8irckvkgaW/wxZN8Ey8oUTOHVGJvMcg+ZXJJ
	ok3M0pt+q2SNM/PoWLAD0KMD48WPjol6iYcOjzf88cDmAOSTvPKi13rAX9bhE2B8Gq8qOoojT8w
	HWwJ0jDbXZFH+W4pHZfHOLTiCEleefc5Rcmr5MwzgQ74faPw0ZkOQ8+tcPTA==
X-Received: by 2002:a05:6402:26d3:b0:68c:eb73:391a with SMTP id 4fb4d7f45d1cf-68ceb733d45mr7191399a12.11.1780401425854;
        Tue, 02 Jun 2026 04:57:05 -0700 (PDT)
Received: from ws.taila4487.ts.net ([80.166.137.147])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68ceb7a7c70sm3320813a12.7.2026.06.02.04.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 04:57:05 -0700 (PDT)
From: =?UTF-8?B?RnJlZGVyaWsgQnLDpm5kc3RydXA=?= <frederikbraendstrup@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
Subject: [PATCH 3/3] python3-libpcap: add recipe
Date: Tue,  2 Jun 2026 13:56:32 +0200
Message-ID: <20260602115632.3105218-3-frederikbraendstrup@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602115632.3105218-1-frederikbraendstrup@gmail.com>
References: <20260602115632.3105218-1-frederikbraendstrup@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 12:07:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238040

Signed-off-by: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
---
 .../python3-libpcap_1.11.0b29.bb              | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python3-libpcap/python3-libpcap_1.11.0b29.bb

diff --git a/meta-python/recipes-devtools/python3-libpcap/python3-libpcap_1.11.0b29.bb b/meta-python/recipes-devtools/python3-libpcap/python3-libpcap_1.11.0b29.bb
new file mode 100644
index 0000000000..733f03a12f
--- /dev/null
+++ b/meta-python/recipes-devtools/python3-libpcap/python3-libpcap_1.11.0b29.bb
@@ -0,0 +1,26 @@
+SUMMARY = "Python binding for the libpcap C library (ctypes-based)"
+HOMEPAGE = "https://pypi.org/project/libpcap/"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3192dc70bf441e0dff721b0ec0c231e1"
+
+PYPI_PACKAGE = "libpcap"
+
+SRC_URI[sha256sum] = "65b43e9f4297c098df49f7cd4eab4aa0c58f83759daeb9a3f5f6da2f88f4ef08"
+
+inherit pypi python_setuptools_build_meta
+
+RDEPENDS:${PN} += " \
+    libpcap \
+    python3-py-utlx \
+    python3-pkg-about \
+    python3-ctypes \
+"
+
+do_install:append() {
+    find ${D}${PYTHON_SITEPACKAGES_DIR}/libpcap/_platform \
+        \( -name '*.so' -o -name '*.dll' \) -delete
+    find ${D}${PYTHON_SITEPACKAGES_DIR}/libpcap/_platform \
+        -type d -empty -delete
+}
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.54.0


