Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A76E0C5AE59
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 11:50:29 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.5558.1749124227056439336
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 04:50:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=cQcADvKf;
 spf=pass (domain: mvista.com, ip: 209.85.210.175, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-747c2cc3419so666528b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 04:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1749124226; x=1749729026; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xFC0bYTj81mksm8SgYzJM9/rj/HvsSioVCgV4/N+yW4=;
        b=cQcADvKfVKxMoPYojfcDLgrxlQTeEi+x9YaTK9DDfMckEToS/73hnc6uPWZH3Ap/Ef
         /PVl/Y9N2iOXnZSNc8gvu27N9r3Mh/2qLanvSbdxl4JpSntD9hbh6BXlnJlj3h25OJ5b
         CnxvZPeyGDQLLLggBAbs0Qb/qTBs3FutdTz14=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749124226; x=1749729026;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xFC0bYTj81mksm8SgYzJM9/rj/HvsSioVCgV4/N+yW4=;
        b=tlcDGH/WhplTqhbghhrxrE/G+tfc2g1jesKlptJdFcV243b8FNAnXyC94SG9h0J+lp
         ZqMU3jttcaVoKn4Q7AJZSyZl8bGRyBHjcRHbyxtccquyxmO23iFERO1iz+kCRsAnO2LJ
         T2hRJJMvAw+PgdYbNsc6uIL9Dmww4/d1DM5hB4CcflVub7Oah0xJ1MDMms1DMN0/wpwz
         lQ2tglnvjMRgMWs1A7n4VsVjY2DJBbOFIv4xJ0RZF8R84yS2Y9D4zjHtdKl+gvMRKA1F
         psS7aMSQ3BwRFki3hoOzQdMEV5510Lf1tvaHTkCKT8N0oByj1p75Ohg6qb+bJfcashIo
         LdHQ==
X-Gm-Message-State: AOJu0Yy6KeDARtbEvt/DcsQCd7aOmDD27rNdbsQwzyNDZ/l8aSRFQrru
	RyPfTzO2+4enZQVEMM4jlGdP+jri6D+PpEFoFNeTZtJygo7t0boC5Ml4Nwg9AqRNXoFF0KMH/SQ
	dyU/Xv7s=
X-Gm-Gg: ASbGnctMMcUkrLXg2i8v/xkSPJyx3goQpPdcO2+s2Unr/pQxrvijoV4yt8uqcDPPlC4
	1jFvZSkthnICyU7QvpQOL5UXMkipdvOVxBAhCdtHrZATFo+qf+7Q9wD1Fot7SwscjYXGHtxCZWW
	qv8/ixypc3f5zTjBTPrkn6t5MWxdjsOTIj8VNqaAkt7XQZu5r4xSs3m33OXwrm2fggPffYJPc8P
	rpcC0Qa7aKtzwnaLr+vbLytZHIqroSju7V/g1GfDiEkDNoV0P8EodTjKgQ+S9BPnW6ap8pthGEC
	eDxop1sgywKiiMtI5FYc9QcgIyalp9++1EEJ8kCBzslBt3T3Rc0o8ugF9hh6LIHTo1EvoIle
X-Google-Smtp-Source: AGHT+IGWMr0E/hBfbYoet9wAwVKV+mXm/EYtjjf3t+UvDzDu1nii3vTzW38kWvX5q/MhoA5Pg7G7oQ==
X-Received: by 2002:a05:6a00:300f:b0:740:a52f:a126 with SMTP id d2e1a72fcca58-7480b2b8568mr8070923b3a.9.1749124225938;
        Thu, 05 Jun 2025 04:50:25 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.207.192.97])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747cdb9a0b0sm10006414b3a.99.2025.06.05.04.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 04:50:25 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH] python3-setuptools: Fix CVE-2025-47273
Date: Thu,  5 Jun 2025 17:20:15 +0530
Message-Id: <20250605115015.1154750-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 11:50:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218010

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from
https://github.com/pypa/setuptools/commit/d8390feaa99091d1ba9626bec0e4ba7072fc507a
& https://github.com/pypa/setuptools/commit/250a6d17978f9f6ac3ac887091f2d32886fbbb0b

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../CVE-2025-47273-pre1.patch                 | 54 +++++++++++++++++
 .../python3-setuptools/CVE-2025-47273.patch   | 59 +++++++++++++++++++
 .../python/python3-setuptools_59.5.0.bb       |  2 +
 3 files changed, 115 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-setuptools/CVE-2025-47273-pre1.patch
 create mode 100644 meta/recipes-devtools/python/python3-setuptools/CVE-2025-47273.patch

diff --git a/meta/recipes-devtools/python/python3-setuptools/CVE-2025-47273-pre1.patch b/meta/recipes-devtools/python/python3-setuptools/CVE-2025-47273-pre1.patch
new file mode 100644
index 0000000000..b273551ffc
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
+index 3a893df..f350e11 100644
+--- a/setuptools/package_index.py
++++ b/setuptools/package_index.py
+@@ -786,9 +786,16 @@ class PackageIndex(Environment):
+                 raise DistutilsError("Download error for %s: %s"
+                                      % (url, v)) from v
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
+@@ -799,8 +806,13 @@ class PackageIndex(Environment):
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
index 0000000000..4b1a01cd34
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
+index f350e11..86bf851 100644
+--- a/setuptools/package_index.py
++++ b/setuptools/package_index.py
+@@ -789,12 +789,20 @@ class PackageIndex(Environment):
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
+@@ -806,7 +814,13 @@ class PackageIndex(Environment):
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
diff --git a/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb b/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb
index 0c0f1e9d81..b106b188f3 100644
--- a/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb
@@ -13,6 +13,8 @@ SRC_URI += "\
     file://0001-_distutils-sysconfig-append-STAGING_LIBDIR-python-sy.patch \
     file://0001-Limit-the-amount-of-whitespace-to-search-backtrack.-.patch \
     file://CVE-2024-6345.patch \
+    file://CVE-2025-47273-pre1.patch \
+    file://CVE-2025-47273.patch \
 "
 
 SRC_URI[sha256sum] = "d144f85102f999444d06f9c0e8c737fd0194f10f2f7e5fdb77573f6e2fa4fad0"
-- 
2.25.1


