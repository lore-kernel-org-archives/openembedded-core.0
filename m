Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12746C677C4
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 16:00:33 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.37092.1749225629360745856
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jun 2025 09:00:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=g+6/lQAH;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-742c3d06de3so2646448b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 09:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749225629; x=1749830429; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kbsDPDu2sO9FJ4dLcsgADP0puUA++y3ojOxGp5L69fs=;
        b=g+6/lQAHfmReM5zeUgu2X+aT90C5q9Ti9WY1jkRaPXZpd1JBcgi2/zwFDZjvl6Sqkg
         r7xylDVeIQcfX+J55AKY2+7ezm1FPoA+xdopWR9aRGv6p4lcPM7u79icyOkdzo2YHB+j
         U9nK1BTBsL60t/LZd11/3mz/uqHEwujsdaHVdCmE/bKFDkjg/gwUJDfnEzcpKfI02vM2
         AYI/2xvTwq+Ui+OhJZ6HCJTXd3S5JHzgwhkVu/ffKfHuCnl9Pnu7rdyURyexptsMwPVt
         Hgu5ER4dEY324vl5cKxl3y9w+wqt+0x13SI0Us0OEWXhEojVNqHnlw/CH4BrwECQte49
         lg4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749225629; x=1749830429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kbsDPDu2sO9FJ4dLcsgADP0puUA++y3ojOxGp5L69fs=;
        b=vC4sW7CI6SfoqI80lvcFwdHVbYatDYxHCLIFq2yXZL64D4AYPEjzDA5r6WBntaFJgz
         AbXdAuUID08TvyAo2/1xkaIB1YhKDFwY+zys7VObNJODdCetFo6Chhl6JUzpoE1Rnu7R
         IH7q2D9dkh9ZpC8H+ABqrRx4Od1yIoJCnesEgA5T1tuigWWPyIleYt2xjU229GIzpxuI
         YwTqYxfsvrJ5t4hgtdr17m2l7x48N6LiERJMj2FMN3J0ymXiRWo6uDTkGkra9jQI2Ck7
         tMk7wRv9SyusK1IBSFT5Imk+AKjZaWU+xDRJ0FtV+gfGKlCIMM19qYP6vHF1zqAWUB+Z
         hYZA==
X-Gm-Message-State: AOJu0YzSF1hKcWmqLOEzmJh469cGhZ+61WVPJLCziku/h8Hor7YLSFdF
	pRVdWW3hWlsdIpLesVzNObiY+mSZvVw/pRc/XVAuDt4eEHQLK+cxd66WjghBHeX1M5D8B2vnQrp
	tzktB
X-Gm-Gg: ASbGncs29f+KKmCyaa8BkA3FRs5KIHo8fGsrPcupveGGmB5sM7e5baWR7c5VklpHiL4
	QGPBawuowBy2U+8WWNrb3c790AABuTqJe/2TE+omydge4b+HAPHDmaRJbsUUuc1zShW7RxN1aNM
	bHlnQzVjnHMLArAQKB0QUJcob4Ln9JNHQrfHiRMyBRk9SOoOR0iw9/IPFhsB1g99YxPdoivECfk
	Db42ED9VeJTXi1GGM3wFzM8jmzxgyzoDMgEv3DaXhggUlnVvwgXjFEGSdG2xEvp/5fy8/MgJaFl
	qYl/5+hN8XCLCSoE1hq5wr2XLdz4VQpbA14ezPEyCRo=
X-Google-Smtp-Source: AGHT+IHIh3We8UpcMOCg7PeGLmSB5jyuQ67gqI/nLZXkO7dlhbH8E6t/uCzTIrGB/ty522lIj56fWA==
X-Received: by 2002:a05:6a00:2303:b0:736:34a2:8a18 with SMTP id d2e1a72fcca58-74827f4494cmr5869765b3a.24.1749225628254;
        Fri, 06 Jun 2025 09:00:28 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:742a:4153:2a1f:f028])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b083a9bsm1436489b3a.77.2025.06.06.09.00.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 09:00:27 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/12] python3-setuptools: Fix CVE-2025-47273
Date: Fri,  6 Jun 2025 09:00:00 -0700
Message-ID: <9769cd99c32faf7d95a7cab07b8550b438ccaf0c.1749225418.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749225417.git.steve@sakoman.com>
References: <cover.1749225417.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 16:00:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218169

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from
https://github.com/pypa/setuptools/commit/d8390feaa99091d1ba9626bec0e4ba7072fc507a
& https://github.com/pypa/setuptools/commit/250a6d17978f9f6ac3ac887091f2d32886fbbb0b

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../CVE-2025-47273-pre1.patch                 | 54 +++++++++++++++++
 .../python3-setuptools/CVE-2025-47273.patch   | 59 +++++++++++++++++++
 .../python/python3-setuptools_69.1.1.bb       |  2 +
 3 files changed, 115 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-setuptools/CVE-2025-47273-pre1.patch
 create mode 100644 meta/recipes-devtools/python/python3-setuptools/CVE-2025-47273.patch

diff --git a/meta/recipes-devtools/python/python3-setuptools/CVE-2025-47273-pre1.patch b/meta/recipes-devtools/python/python3-setuptools/CVE-2025-47273-pre1.patch
new file mode 100644
index 0000000000..72bcaea435
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-setuptools/CVE-2025-47273-pre1.patch
@@ -0,0 +1,54 @@
+From d8390feaa99091d1ba9626bec0e4ba7072fc507a Mon Sep 17 00:00:00 2001
+From: "Jason R. Coombs" <jaraco@jaraco.com>
+Date: Sat, 19 Apr 2025 12:49:55 -0400
+Subject: [PATCH] Extract _resolve_download_filename with test.
+
+Upstream-Status: Backport [https://github.com/pypa/setuptools/commit/d8390feaa99091d1ba9626bec0e4ba7072fc507a]
+CVE: CVE-2025-47273 #Dependency Patch
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ setuptools/package_index.py | 20 ++++++++++++++++----
+ 1 file changed, 16 insertions(+), 4 deletions(-)
+
+diff --git a/setuptools/package_index.py b/setuptools/package_index.py
+index 00a972d..d460fcb 100644
+--- a/setuptools/package_index.py
++++ b/setuptools/package_index.py
+@@ -815,9 +815,16 @@ class PackageIndex(Environment):
+             else:
+                 raise DistutilsError("Download error for %s: %s" % (url, v)) from v
+ 
+-    def _download_url(self, url, tmpdir):
+-        # Determine download filename
+-        #
++    @staticmethod
++    def _resolve_download_filename(url, tmpdir):
++        """
++        >>> du = PackageIndex._resolve_download_filename
++        >>> root = getfixture('tmp_path')
++        >>> url = 'https://files.pythonhosted.org/packages/a9/5a/0db.../setuptools-78.1.0.tar.gz'
++        >>> import pathlib
++        >>> str(pathlib.Path(du(url, root)).relative_to(root))
++        'setuptools-78.1.0.tar.gz'
++        """
+         name, fragment = egg_info_for_url(url)
+         if name:
+             while '..' in name:
+@@ -828,8 +835,13 @@ class PackageIndex(Environment):
+         if name.endswith('.egg.zip'):
+             name = name[:-4]  # strip the extra .zip before download
+ 
+-        filename = os.path.join(tmpdir, name)
++        return os.path.join(tmpdir, name)
+ 
++    def _download_url(self, url, tmpdir):
++        """
++        Determine the download filename.
++        """
++        filename = self._resolve_download_filename(url, tmpdir)
+         return self._download_vcs(url, filename) or self._download_other(url, filename)
+ 
+     @staticmethod
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/python/python3-setuptools/CVE-2025-47273.patch b/meta/recipes-devtools/python/python3-setuptools/CVE-2025-47273.patch
new file mode 100644
index 0000000000..be6617e0f6
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-setuptools/CVE-2025-47273.patch
@@ -0,0 +1,59 @@
+From 250a6d17978f9f6ac3ac887091f2d32886fbbb0b Mon Sep 17 00:00:00 2001
+From: "Jason R. Coombs" <jaraco@jaraco.com>
+Date: Sat, 19 Apr 2025 13:03:47 -0400
+Subject: [PATCH] Add a check to ensure the name resolves relative to the
+ tmpdir.
+
+Closes #4946
+
+Upstream-Status: Backport [https://github.com/pypa/setuptools/commit/250a6d17978f9f6ac3ac887091f2d32886fbbb0b]
+CVE: CVE-2025-47273
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ setuptools/package_index.py | 18 ++++++++++++++++--
+ 1 file changed, 16 insertions(+), 2 deletions(-)
+
+diff --git a/setuptools/package_index.py b/setuptools/package_index.py
+index d460fcb..6c7874d 100644
+--- a/setuptools/package_index.py
++++ b/setuptools/package_index.py
+@@ -818,12 +818,20 @@ class PackageIndex(Environment):
+     @staticmethod
+     def _resolve_download_filename(url, tmpdir):
+         """
++        >>> import pathlib
+         >>> du = PackageIndex._resolve_download_filename
+         >>> root = getfixture('tmp_path')
+         >>> url = 'https://files.pythonhosted.org/packages/a9/5a/0db.../setuptools-78.1.0.tar.gz'
+-        >>> import pathlib
+         >>> str(pathlib.Path(du(url, root)).relative_to(root))
+         'setuptools-78.1.0.tar.gz'
++
++        Ensures the target is always in tmpdir.
++
++        >>> url = 'https://anyhost/%2fhome%2fuser%2f.ssh%2fauthorized_keys'
++        >>> du(url, root)
++        Traceback (most recent call last):
++        ...
++        ValueError: Invalid filename...
+         """
+         name, fragment = egg_info_for_url(url)
+         if name:
+@@ -835,7 +843,13 @@ class PackageIndex(Environment):
+         if name.endswith('.egg.zip'):
+             name = name[:-4]  # strip the extra .zip before download
+ 
+-        return os.path.join(tmpdir, name)
++        filename = os.path.join(tmpdir, name)
++
++        # ensure path resolves within the tmpdir
++        if not filename.startswith(str(tmpdir)):
++            raise ValueError(f"Invalid filename {filename}")
++
++        return filename
+ 
+     def _download_url(self, url, tmpdir):
+         """
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/python/python3-setuptools_69.1.1.bb b/meta/recipes-devtools/python/python3-setuptools_69.1.1.bb
index 7663101f23..46b2f0ab00 100644
--- a/meta/recipes-devtools/python/python3-setuptools_69.1.1.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_69.1.1.bb
@@ -13,6 +13,8 @@ SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 SRC_URI += " \
             file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch \
             file://CVE-2024-6345.patch \
+            file://CVE-2025-47273-pre1.patch \
+            file://CVE-2025-47273.patch \
 "
 
 SRC_URI[sha256sum] = "5c0806c7d9af348e6dd3777b4f4dbb42c7ad85b190104837488eab9a7c945cf8"
-- 
2.43.0


