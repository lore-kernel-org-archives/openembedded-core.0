Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9217CD5BAB
	for <webhook@archiver.kernel.org>; Sun, 24 May 2026 15:17:29 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9651.1779635843010478858
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 May 2026 08:17:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HxwBVS4E;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-44509921fbcso5610044f8f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 24 May 2026 08:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779635841; x=1780240641; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q355hWtMY65zD2OCDTiDmNUMJTlfNKHSEdgS4YDZFe0=;
        b=HxwBVS4EfDmf6k+C86PyI68zKznMJxzh5b4MU5FxbBW0EJsSa3PpFukiRrPpLY37yz
         OMN8KnU9kNarcPo4n1udtXunHNlGcEk534rlhKHdWU2j+71hSXjhcKsk2BZLHr7pPzJj
         OokJf6q/SN6L1JfuTA8FMwzoi5SgCzwlkQbnErZ7VcUxSOfdRr9AFgyOg1I9huxk9kog
         XFU3RbI1bL7BEgRfvdW7qJSVRl1YFdAk5ost5IlT78Lc5Imq95indkGm2si9DCgC2KJG
         eI7tGpKWdafsSXgG0od+T76YfmU+JbAMJJByxftA6wgR9CybqxqDbFD4kXyDoEz5BR3G
         YiYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779635841; x=1780240641;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q355hWtMY65zD2OCDTiDmNUMJTlfNKHSEdgS4YDZFe0=;
        b=XA1jl1t7fVG0kKmfGvLV5EqXY/4D9RFsVoMMgYBUDr8XdihbPu2y90vXgPPoZK0G4+
         iik8xZw0/jwJuQGl7o+roQziwXWQ9Ix2ZAD0yy6hyxQj0jYJhwNjKhY+sDOFVxd6Eayx
         CPyPO1Vbw7hIWWDwXj7xlcAPvg8iRw48GFUTggnjWuLCViGz74Ct2NO4HslWt/xdIEU4
         DysGoGLQ3ZD8nHTq+Wp1Dn/mBmnjGOP8C7eB9yG8T8RWjEHYiX/Ly0ymFFFhR+2PVRtl
         114q+9jWdd5sQ/ke8bszXBo/nMJDnV50pgKANGBme9WhTkCqQMeuOXtzkU/tfxz78ZVc
         548w==
X-Gm-Message-State: AOJu0Yz+yr6ehf4NH1Xltr6P1WU5Y7lD+ZzBc5e8mF4clftam+lnT1Cu
	YzKdadJULsIeIu76HVYzAJG3X6huMa3a20tucv8RZLUPm8YMIm+/pPxOxwiIAU6L
X-Gm-Gg: Acq92OHopu1d47DNOMCatdMim0YhUXiX7cZ/DLHuLIKrmScF729v+6BsP1X+Jqg8M2b
	VuGjyGzN4Gj7DQw8X7ElxxuvmL2mMNjUeKradJf9UskvPCEsBqD7msl420TBwSbeXO7HmA8OUtS
	9IcW/BYAuE2UVEXQFxrc/Q64+0eOtU3aoYzBFeJUF0hE2fap/+LvJmHc9bfaKZ+VWW7OKVd9WtJ
	uirpShO5tDFPuhRMOiSUnYAiU7DeW9BicV7HsyTluIXeICKxccR9iYPhhQmvvk9RZRn8CWbYz5n
	j8YdGNEFf+IY/uBIjOYCvr/FC0GRfadqb+NV//RNeAaK1c0Y8QFPlnSMDLFYk9zcM1tDucq0ts8
	xX8KoaL9W0b2Tp/NG/Z4R+ICHCeEd1ZQ5loyS2nRGx+xklA+7nRVoUIFXTxa1Cvcwg+G+hHMO/7
	RIGmzxOWzKOtr3WAbUhKmoGL7rYJKJzlk1/qpGtN/4JNnaIejgyV/JbdCnNTGYIAxpJk7tmwVUT
	GdKg5iC870AtNQap6jROyD5oB0IYaWzBLqCXAIDYHuL5Yd0WM31X26MwyrA090FRIyNRHoArA==
X-Received: by 2002:a05:6000:4b12:b0:43d:7e34:889c with SMTP id ffacd0b85a97d-45eb38b5a04mr18386913f8f.39.1779635841124;
        Sun, 24 May 2026 08:17:21 -0700 (PDT)
Received: from localhost.localdomain (2a02-1812-512-2c00-3c7a-8f5d-702a-f50d.ip6.access.telenet.be. [2a02:1812:512:2c00:3c7a:8f5d:702a:f50d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6c9f548sm21722290f8f.2.2026.05.24.08.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 08:17:20 -0700 (PDT)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [PATCH] python3-requests: version bump 2.33.1 -> 2.34.2
Date: Sun, 24 May 2026 17:17:12 +0200
Message-ID: <20260524151712.11547-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 May 2026 15:17:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237566

+ added the DESCRIPTION taken from the README.md
+ sorted the RDEPENDS
+ untabify

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 ...uests_2.33.1.bb => python3-requests_2.34.2.bb} | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/python/{python3-requests_2.33.1.bb => python3-requests_2.34.2.bb} (71%)

diff --git a/meta/recipes-devtools/python/python3-requests_2.33.1.bb b/meta/recipes-devtools/python/python3-requests_2.34.2.bb
similarity index 71%
rename from meta/recipes-devtools/python/python3-requests_2.33.1.bb
rename to meta/recipes-devtools/python/python3-requests_2.34.2.bb
index e9c6fe4e97..8230e8ce43 100644
--- a/meta/recipes-devtools/python/python3-requests_2.33.1.bb
+++ b/meta/recipes-devtools/python/python3-requests_2.34.2.bb
@@ -1,29 +1,30 @@
 SUMMARY = "Python HTTP for Humans."
+DESCRIPTION = "Requests is a simple, yet elegant, HTTP library."
 HOMEPAGE = "https://requests.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "18817f8c57c6263968bc123d237e3b8b08ac046f5456bd1e307ee8f4250d3517"
+SRC_URI[sha256sum] = "f288924cae4e29463698d6d60bc6a4da69c89185ad1e0bcc4104f584e960b9ed"
 
 SRC_URI:append:class-nativesdk = " file://environment.d-python3-requests.sh"
 
 do_install:append:class-nativesdk() {
-	mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
-	install -m 644 ${UNPACKDIR}/environment.d-python3-requests.sh ${D}${SDKPATHNATIVE}/environment-setup.d/python3-requests.sh
+        mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
+        install -m 644 ${UNPACKDIR}/environment.d-python3-requests.sh ${D}${SDKPATHNATIVE}/environment-setup.d/python3-requests.sh
 }
 
-RDEPENDS:${PN} += " \
+RDEPENDS:${PN} += "\
     python3-certifi \
+    python3-chardet \
+    python3-compression \
     python3-email \
+    python3-idna \
     python3-json \
     python3-netserver \
     python3-pysocks \
     python3-urllib3 \
-    python3-chardet \
-    python3-idna \
-    python3-compression \
 "
 
 FILES:${PN}:append:class-nativesdk = " ${SDKPATHNATIVE}/environment-setup.d/python3-requests.sh"
-- 
2.47.3


