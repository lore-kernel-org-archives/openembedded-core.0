Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DBE3C44539
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 10:36:31 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44815.1784716586697258086
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 03:36:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=J9NObjdT;
 spf=pass (domain: konsulko.com, ip: 209.85.128.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49546c690ffso39551555e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 03:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1784716585; x=1785321385; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qIQ5wgVZ++grRq8b+9J4hrotdeO9dj+IvHSRY/cfkM4=;
        b=J9NObjdTlUtDuYS0LYF/I1AxH/iplN3e2/71uC7NI9fgbeoSzV4qpgMV0arChQOGzd
         wuIXJu473hnESJxkMjz1Luhv8dcrWh/Jtyh4zm8kkIsZiWABzG16FiKUicNbSZ0Tn57p
         ClcDPsfFIjo7E17H3jrBLmSH0Gc7BpXtXUhEc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784716585; x=1785321385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qIQ5wgVZ++grRq8b+9J4hrotdeO9dj+IvHSRY/cfkM4=;
        b=husYao6gRuX+M06Br5fQa3PwE/7uIfJOu0qzu4kEBP9o8OSUuO7skhFHKpjNyltsrN
         vZw2gx5I9CPZVKFbfT59p9V5fRpWObYLQ17E334cu1vdGCd14OohvL+2apH7pKkMCm2H
         s6YY8murDo8qDpwXkeUiIGdy/TZuRNx0UslOR3JBrAAbze1JeqjyI6sdLLs4s3vfivOI
         BDC/G+lrpo62h+/vg9YIH8lVFkRAkCDZ3kUpoGMmF08l9bCsiJKQmpNCOvG2bQBl6rG9
         zUOGyVMCPeIu8E8DAiZCzhp32aNMnR8ezkExdEmPRtrkj9kjWE6KRO/86oMFdyBuDZ3F
         Jkxw==
X-Gm-Message-State: AOJu0Yw+yUYw/+PelqNh5SxeEE9VmZF9zsNyQcI26GLvEZKNnVfA2pmq
	BD/zcWNNOfa90MR0N5H3WIFaEmxC0I4B0lU3aQVqe8FFHdGEZx5EadSRCVYqpVWn33gG/azyvvT
	e2A6U
X-Gm-Gg: AR+sD129JtP4u0mjOqIt+nF7yzfwyoZLcxoT4qWqwzwvrdEghn2j2a0LY5ASaF9tUjF
	YDS7T6fwkVAd+PQr2Elu1f1ErLrAGCCsgkE1HMeTkxpGWkqwP9pVUlqoMEenn75uJuZE15Ud1HP
	ZRJXJtvWtsx/282ebhbKnyTzgPYBphCqrrb2+UZ97macqAPANGFYMOx1RTSLNcY3eA3fGHRdoI+
	MAxTDKCRtw/6g2ZxG8Ds+i46tME+ayZ4lUF8tDzpzqaHPaBLcUFBpeIA8eXs65nxTCHul9iB7t3
	SupRP4iNWAZig/NTy0ywOaGHSdG6lNDq73UIJEE+tjpKHCVAmseuNKM8UfRh1KcJRolgeVC89nD
	cyqAVLIxc4kL/BWIS8y3eusNMsS+EDspNRtL9ho4Y1XscAk1oaTh9S33UVd3S5UZ9tjtMWciDRC
	KTECTiyLfEnDNEStF8Up3NAR7/5dJEitFK8Xw491UU4psn+fnFGqG3Yfey6SD2TRMALf8UQU8ny
	SVdlseDZFXZmBv+tkGZwEcu0oQkmjQ=
X-Received: by 2002:a05:600c:9a2:b0:495:3aac:1098 with SMTP id 5b1f17b1804b1-4954a50c489mr173174615e9.32.1784716584870;
        Wed, 22 Jul 2026 03:36:24 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956537c7desm197275745e9.7.2026.07.22.03.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 03:36:24 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [PATCH 2/2] python3-chardet: Enable tests
Date: Wed, 22 Jul 2026 13:36:20 +0300
Message-ID: <20260722103621.1810876-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260722103621.1810876-1-leon.anavi@konsulko.com>
References: <20260722103621.1810876-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 10:36:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241657

Inherit ptest-python-pytest, include tests and scripts for chardet.
Add chardet to PTESTS_SLOW in ptest-packagelists.inc.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 meta/conf/distro/include/ptest-packagelists.inc      |  1 +
 .../recipes-devtools/python/python3-chardet_7.4.3.bb | 12 +++++++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 3297b5a645..c83c1b5e0f 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -141,6 +141,7 @@ PTESTS_SLOW = "\
     perl \
     python3 \
     python3-cffi \
+    python3-chardet \
     python3-click \
     python3-cryptography \
     python3-numpy \
diff --git a/meta/recipes-devtools/python/python3-chardet_7.4.3.bb b/meta/recipes-devtools/python/python3-chardet_7.4.3.bb
index 30c44c6d7c..994ccdd5d6 100644
--- a/meta/recipes-devtools/python/python3-chardet_7.4.3.bb
+++ b/meta/recipes-devtools/python/python3-chardet_7.4.3.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=bd0753b9dc12e5e3da3047778fcf1dca"
 SRC_URI[sha256sum] = "cc1d4eb92a4ec1c2df3b490836ffa46922e599d34ce0bb75cf41fd2bf6303d56"
 UPSTREAM_CHECK_REGEX = "chardet-(?P<pver>6\..*)\.tar"
 
-inherit pypi python_hatchling
+inherit pypi python_hatchling ptest-python-pytest
 
 DEPENDS += "python3-hatch-vcs-native"
 
@@ -21,4 +21,14 @@ RDEPENDS:${PN}:class-target += " \
     python3-logging \
 "
 
+RDEPENDS:${PN}-ptest += " \
+    python3-core \
+    git \
+"
+
+do_install_ptest:append() {
+    install -d ${D}${PTEST_PATH}/scripts
+    cp -r ${S}/scripts/*.py ${D}${PTEST_PATH}/scripts/
+}
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.47.3


