Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9E82C8303A
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 13:38:23 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.11121.1751377102258442814
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 06:38:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=YFOOv0xH;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-311e46d38ddso4738117a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 06:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1751377101; x=1751981901; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CLhB8Scz9Iyhxj3ucDuGbyeYx7CnhhjiJ+vvlHmMRc0=;
        b=YFOOv0xH54R9+5okM1UqGwLr2oPr23YytDG3lzgt8Ok5oRHGr6IRNKPuW/npW4if4m
         hjfgsHu+MmA1Su2OT/k0IUBNU4tHjfB20LTxra5PpuNXbeklBZFNpfsQIvfmU3QApZ8M
         IoW/lguBu9XUwP4XZ4JKWmnGCs20bG4nAkSnjjqAwhBD8gwPTdGnvWjr4qv7nN+Rt7iY
         4+uGz6xIBwkphNuRSO5jzdlsp4DIYlDBaZ5ewUoIW4QZt6gU1niFXXkP5TSB8yypupHq
         IteykMgbv6IGNVf6nVzcoz7JQCr8G86lJBv005rLS+rUz7s52j0LW489Tb3EB2sN0Uue
         EgMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751377101; x=1751981901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CLhB8Scz9Iyhxj3ucDuGbyeYx7CnhhjiJ+vvlHmMRc0=;
        b=pFnkIR6oGy30V/IkeUS8Vi1dVX4LqusmRhgpY4fUbGXQoON2WgFOBcOKZ8DPO/LPY1
         AYA0pw2CrdvMF5+csSCacT/welacsCRcYaeQvrnOUslCrQ9hfipa5fbvh1+6yiGY60FI
         m88Ah/me1RZXc1y+sISKS99PyMsyHU67LjIiQUvFNVE6fW74S5Wg6EN5vaOlsbYJxr2a
         Lmq4W2N2QAevHPplgR/JcwsBqydSWBjiZi6u01Kcb8zs8+1Y5eT01eDd/OmMc06m4eV0
         oOKlZyGLE/9Ah+c+HyXMBhCGTU0nt6RWecRnGVW1pzt3HvyeFijUx3rBosmhfDshI+4Q
         eVZQ==
X-Gm-Message-State: AOJu0YzpmMcwka2T+syv/bDxkrhALACYRHMwOHCv15fFkmtXb7rW8gWU
	OxIP4VKP9rhIWna4ErWrkf+7JazLSV8MxlKznb/j9/sj/SUlzKpZy/TDAHPKAwc0vpDFogK1DSk
	EOIR7
X-Gm-Gg: ASbGncs+Abc3pn9PsDxBXlZs2f6wI9Mbj3qyBigH8wH4DQpiJw6QY9vwF+wJPWRLn6R
	6zlZcrAH2Y9VZtmff1feTXgF1BSbGz2mRGfHEEtu9VqeAziTGUuNgdjv/s+6s+dpEF/5x4TE9Kn
	JuiAfjf2yKfKyANQYfTsBzKtc3NIi6KcttWtOmQlTwRmrKtYePyYcaEpVGpjsuWrOIa1IMAMDYh
	oIQlI7iE5SaE7FBiQ7e/coKExwYwzpQ4V1YK2e3Sbu5w5tt88aGUbbBAvaC3G004od8M1pcI3/l
	H4nFpfRaNXJgkfiICfhHbH78E4Z+DI3k/PDdOmj/KEsUR//egAVs4Q==
X-Google-Smtp-Source: AGHT+IHawW0pggPy6YW2gWh9k/AQztN7GslQjJh2p/R7DfoNaNdDyyqD8wqYTJgWSzcdN3/zoKz9Wg==
X-Received: by 2002:a17:90b:5386:b0:2fe:85f0:e115 with SMTP id 98e67ed59e1d1-318c925242bmr21702614a91.26.1751377101137;
        Tue, 01 Jul 2025 06:38:21 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:34f8:320a:2e39:118e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-318c152331fsm11466117a91.44.2025.07.01.06.38.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 06:38:20 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 03/11] python3-setuptools: fix CVE-2025-47273
Date: Tue,  1 Jul 2025 06:38:01 -0700
Message-ID: <cfb2d77f841ae21cae0ba7d6263dc3e1e0280400.1751376952.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1751376952.git.steve@sakoman.com>
References: <cover.1751376952.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 13:38:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219574

From: Praveen Kumar <praveen.kumar@windriver.com>

setuptools is a package that allows users to download, build, install,
upgrade, and uninstall Python packages. A path traversal vulnerability
in `PackageIndex` is present in setuptools prior to version 78.1.1. An
attacker would be allowed to write files to arbitrary locations on the
filesystem with the permissions of the process running the Python code,
which could escalate to remote code execution depending on the context.
Version 78.1.1 fixes the issue.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-47273

Upstream-patch:
https://github.com/pypa/setuptools/commit/d8390feaa99091d1ba9626bec0e4ba7072fc507a
https://github.com/pypa/setuptools/commit/250a6d17978f9f6ac3ac887091f2d32886fbbb0b

Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../CVE-2025-47273-pre1.patch                 | 55 +++++++++++++++++
 .../python3-setuptools/CVE-2025-47273.patch   | 60 +++++++++++++++++++
 .../python/python3-setuptools_76.0.0.bb       |  5 +-
 3 files changed, 119 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python3-setuptools/CVE-2025-47273-pre1.patch
 create mode 100644 meta/recipes-devtools/python/python3-setuptools/CVE-2025-47273.patch

diff --git a/meta/recipes-devtools/python/python3-setuptools/CVE-2025-47273-pre1.patch b/meta/recipes-devtools/python/python3-setuptools/CVE-2025-47273-pre1.patch
new file mode 100644
index 0000000000..d75f05fc68
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-setuptools/CVE-2025-47273-pre1.patch
@@ -0,0 +1,55 @@
+From d8390feaa99091d1ba9626bec0e4ba7072fc507a Mon Sep 17 00:00:00 2001
+From: "Jason R. Coombs" <jaraco@jaraco.com>
+Date: Sat, 19 Apr 2025 12:49:55 -0400
+Subject: [PATCH] Extract _resolve_download_filename with test.
+
+CVE: CVE-2025-47273 #Dependency Patch
+
+Upstream-Status: Backport [https://github.com/pypa/setuptools/commit/d8390feaa99091d1ba9626bec0e4ba7072fc507a]
+
+Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
+---
+ setuptools/package_index.py | 20 ++++++++++++++++----
+ 1 file changed, 16 insertions(+), 4 deletions(-)
+
+diff --git a/setuptools/package_index.py b/setuptools/package_index.py
+index 1a6abeb..b317735 100644
+--- a/setuptools/package_index.py
++++ b/setuptools/package_index.py
+@@ -807,9 +807,16 @@ class PackageIndex(Environment):
+             else:
+                 raise DistutilsError(f"Download error for {url}: {v}") from v
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
+         name, _fragment = egg_info_for_url(url)
+         if name:
+             while '..' in name:
+@@ -820,8 +827,13 @@ class PackageIndex(Environment):
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
+2.40.0
diff --git a/meta/recipes-devtools/python/python3-setuptools/CVE-2025-47273.patch b/meta/recipes-devtools/python/python3-setuptools/CVE-2025-47273.patch
new file mode 100644
index 0000000000..3c44a2a321
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-setuptools/CVE-2025-47273.patch
@@ -0,0 +1,60 @@
+From 250a6d17978f9f6ac3ac887091f2d32886fbbb0b Mon Sep 17 00:00:00 2001
+From: "Jason R. Coombs" <jaraco@jaraco.com>
+Date: Sat, 19 Apr 2025 13:03:47 -0400
+Subject: [PATCH] Add a check to ensure the name resolves relative to the
+ tmpdir.
+
+Closes #4946
+
+CVE: CVE-2025-47273
+
+Upstream-Status: Backport [https://github.com/pypa/setuptools/commit/250a6d17978f9f6ac3ac887091f2d32886fbbb0b]
+
+Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
+---
+ setuptools/package_index.py | 18 ++++++++++++++++--
+ 1 file changed, 16 insertions(+), 2 deletions(-)
+
+diff --git a/setuptools/package_index.py b/setuptools/package_index.py
+index b317735..a8f868e 100644
+--- a/setuptools/package_index.py
++++ b/setuptools/package_index.py
+@@ -810,12 +810,20 @@ class PackageIndex(Environment):
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
+         name, _fragment = egg_info_for_url(url)
+         if name:
+@@ -827,7 +835,13 @@ class PackageIndex(Environment):
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
+2.40.0
diff --git a/meta/recipes-devtools/python/python3-setuptools_76.0.0.bb b/meta/recipes-devtools/python/python3-setuptools_76.0.0.bb
index 71c8eb1a1f..91d8fdd73b 100644
--- a/meta/recipes-devtools/python/python3-setuptools_76.0.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_76.0.0.bb
@@ -11,7 +11,10 @@ CVE_PRODUCT = "python3-setuptools python:setuptools"
 SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-easy_install.patch"
 
 SRC_URI += " \
-            file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
+            file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch \
+            file://CVE-2025-47273-pre1.patch \
+            file://CVE-2025-47273.patch \
+"
 
 SRC_URI[sha256sum] = "43b4ee60e10b0d0ee98ad11918e114c70701bc6051662a9a675a0496c1a158f4"
 
-- 
2.43.0


