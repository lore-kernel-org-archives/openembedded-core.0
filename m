Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4B07FF8873
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 16:18:06 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2654.1777565879529223635
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2026 09:17:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rQC6SRoo;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: danismostlikely@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-8acb09ddbf6so15591986d6.2
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 09:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777565878; x=1778170678; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Vn2OecJWCVdxX3tQ9tN70eI0U/4IfrxvdEKE5BSeZE=;
        b=rQC6SRoob+lsGTqQO+KNdckpC3RkzZJ3qeE/Ihzs3BQiCFOf8ejE+sMyYF/4iSXDrU
         FpbdxfdATJmJZDT1xE7wkDXGjhUNjjg9XS0e4AYj24X4GtVy+RRoGyyO2wpzXXPkWJeN
         Il1vZAYL7OE7MmS/SRI7FC7kABzv/ILvcCmLikL9aiD7Fj8SnHWDX/s9j/E2Xubhdex1
         BGSaQ2kqhK6p7Gv82iQ6SBaL0VePtEM99YBpy6YuKfLpyMcZVzrG8j5/CRRCpXg1QKGW
         FoYZkrgVEO0PVSRj+5vdP9sA+aKHxXj2xohn0IW1UtKdirADDgxPKPsu2k8xShZndZlg
         nWcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777565878; x=1778170678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7Vn2OecJWCVdxX3tQ9tN70eI0U/4IfrxvdEKE5BSeZE=;
        b=bsfbQVt5ciQMPc82ONCY6jxtI+Gjkd5IlYOtDkMUlJt7t715oxCWDfwoapvJgcGBxh
         38E64fLd+huZDSkdI6MOV6CtAXDopHvLdSZWeQpd2Z8q9jug9oFDR2LVUBHAqS1PdqDl
         26K2lH1ST1O131MzxCJxOkbtjZioaVbhiQK2iOVe4WeulFaTFkWh50JBGNvmtBLOQa28
         vjOtDGLiKa0j6u4OLnxRTM2DoYMTBeLanXnB25zFdj0YGpVJ2QgK1787aVEHAk+MLW+H
         dvrIwRpI9HEp3XK7wghS9CtPeSKw91JyEpawqU1DCes91JlytrLotR0IxG6W9EtE9uZA
         2QNA==
X-Gm-Message-State: AOJu0YwrgfZr7FinzRIaymwl6i55gURUtCe9JoS++szzfqacKTBCD5gr
	0b2w4N054K/XG8BEjKJeB0Ho0Dlos0hq0E+qpWBrTGdNxf/FnoVId46AVhv6gg==
X-Gm-Gg: AeBDievfPst8I1oi7SqKYyAv74VNpJwmyPGQj0oU+L0og0UlwmlBqwL01SvFgwyLU+q
	K6axcI4C0Lz8Y5sCQcOYtNACXtfEqkSaC8huyRfzseJKgATJbxVvZ/Rh+5C54e8xqRIGpOIrCTC
	ow8MUOt5/scdfy4bonBQKeVCr+prtcx/iHz+oEJ/wrsk+xqGSgIrUuwtuFCr9WY/aXyFhUi6VXQ
	QOcGecrpbxIDmkshGAvCVNl8ChgMAs6M6uGO7gWGYGv7gFjF3OX5RMtuEhSCs7NZiabR1hdRjEo
	qFwiK8Kmv5wJJfRZoGsZa59D6b8wfVyS29AHCbpKhKjvCIKXXDggNIz+AEvR3PDtjcfSosTSDgw
	6omEp7X9AQyQ/A//Ee4uRw+Nm0sSlNnpymMwbCSvCiL2Vghuq4k1YSXvyLwKoqF/EtFDV39/p+q
	axEdfJEWtwsTsIHXHYk9wz5LAcIP9X6jqnJxb610/Z490u85rjP/eI8c7NapJRClpk6Q==
X-Received: by 2002:a05:6214:300c:b0:8ac:a757:c1ef with SMTP id 6a1803df08f44-8b3fe672473mr55208366d6.0.1777565878129;
        Thu, 30 Apr 2026 09:17:58 -0700 (PDT)
Received: from nebuchadnezzar.home.dankm.pro ([204.83.204.143])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b3ff43b776sm21541866d6.27.2026.04.30.09.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 09:17:57 -0700 (PDT)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Dan McGregor <dan.mcgregor@vecima.com>
Subject: [PATCH 2/2] python3-requests: Increase chardet upper limit
Date: Thu, 30 Apr 2026 10:17:02 -0600
Message-ID: <20260430161702.77076-2-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260430161702.77076-1-danismostlikely@gmail.com>
References: <20260430161702.77076-1-danismostlikely@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 16:18:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236176

From: Dan McGregor <dan.mcgregor@vecima.com>

OE Core includes chardet 6.0, while requests warns for any version
greater than or equal to 6.0. Not for any real reason, but because
it was a higher version than what was released when requests 2.32
was released.

Signed-off-by: Dan McGregor <dan.mcgregor@vecima.com>
---
 ...01-Increase-chardet-upper-limit-to-7.patch | 26 +++++++++++++++++++
 .../python/python3-requests_2.32.5.bb         |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-requests/0001-Increase-chardet-upper-limit-to-7.patch

diff --git a/meta/recipes-devtools/python/python3-requests/0001-Increase-chardet-upper-limit-to-7.patch b/meta/recipes-devtools/python/python3-requests/0001-Increase-chardet-upper-limit-to-7.patch
new file mode 100644
index 00000000000..2c445e42549
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-requests/0001-Increase-chardet-upper-limit-to-7.patch
@@ -0,0 +1,26 @@
+From 0f965846b95d096d76a1795db37fbe9acad0eb65 Mon Sep 17 00:00:00 2001
+From: Amin Vakil <info@aminvakil.com>
+Date: Sun, 22 Feb 2026 19:37:16 +0330
+Subject: [PATCH] Increase chardet upper limit to 7
+
+Upstream-Status: Backport [https://github.com/psf/requests/commit/4bd79e397304d46dfccd76f36c07f66c0295ff82]
+---
+ src/requests/__init__.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/requests/__init__.py b/src/requests/__init__.py
+index 051cda13..9a80c625 100644
+--- a/src/requests/__init__.py
++++ b/src/requests/__init__.py
+@@ -76,7 +76,7 @@ def check_compatibility(urllib3_version, chardet_version, charset_normalizer_ver
+         major, minor, patch = chardet_version.split(".")[:3]
+         major, minor, patch = int(major), int(minor), int(patch)
+         # chardet_version >= 3.0.2, < 6.0.0
+-        assert (3, 0, 2) <= (major, minor, patch) < (6, 0, 0)
++        assert (3, 0, 2) <= (major, minor, patch) < (7, 0, 0)
+     elif charset_normalizer_version:
+         major, minor, patch = charset_normalizer_version.split(".")[:3]
+         major, minor, patch = int(major), int(minor), int(patch)
+-- 
+2.44.4
+
diff --git a/meta/recipes-devtools/python/python3-requests_2.32.5.bb b/meta/recipes-devtools/python/python3-requests_2.32.5.bb
index 3477a5d83e9..02d476e975f 100644
--- a/meta/recipes-devtools/python/python3-requests_2.32.5.bb
+++ b/meta/recipes-devtools/python/python3-requests_2.32.5.bb
@@ -8,6 +8,7 @@ inherit pypi python_setuptools_build_meta
 SRC_URI[sha256sum] = "dbba0bac56e100853db0ea71b82b4dfd5fe2bf6d3754a8893c3af500cec7d7cf"
 
 SRC_URI += "file://CVE-2026-25645.patch"
+SRC_URI += "file://0001-Increase-chardet-upper-limit-to-7.patch"
 SRC_URI:append:class-nativesdk = " file://environment.d-python3-requests.sh"
 
 do_install:append:class-nativesdk() {

