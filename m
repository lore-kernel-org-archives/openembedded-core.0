Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AE8AC5AE59
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 07:14:28 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.1573.1749107662524253422
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 00:14:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=SigfjxW+;
 spf=pass (domain: mvista.com, ip: 209.85.215.173, mailfrom: vanusuri@mvista.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-7fd581c2bf4so424270a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 00:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1749107661; x=1749712461; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ucR4WtKi+CTMLAuJHhoOwOYXahW3S9SGbDrelwcoSSU=;
        b=SigfjxW+TGVMCVby1fJ1C12NaT7ZAxeVujgL+o4pMYZx8r594WF378dP4qnYDJHyD4
         7v+ZvXf/SCQDwK42mNapBDP0BGAlRqkC8M1HzmH5oZ4nsNFrgKrdIlgBiFn8gAt3aANT
         lnnSbghn92avN3CdWdrtylKpavZ6wn6BRUEQw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749107661; x=1749712461;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ucR4WtKi+CTMLAuJHhoOwOYXahW3S9SGbDrelwcoSSU=;
        b=PBe1MOmbRwOk2saAFYWJBSm8pmLXNY5WNOdx9NuSPqGTYlvo3ZoPGUueHxj+VGqN8Y
         NQfKDjohlZ/1dcnw5OJc6ck5buHxV6b3m1cQn0B1TzLcDcK2S90uRH4znYMS03PGFfcW
         uyAFdWJqVH9Oe3VOR70diOWyIyb/rGbn0PUyysnNzcxeg1LtVii3jQbhg14milAByAET
         4RFYo+5h4syDihfMPFo6mUgnPfU079XNEnZDvm1/r8hbIRXfeavFIOVE1qcVsei94wbL
         osPByTlRRyqxatx5PLMsecuU9FTm33Wy6gjCrtoK8Mk1S4BTec9OUymFN3+LRj4kkCZf
         8dkw==
X-Gm-Message-State: AOJu0Yx1UOakJH2uk0aqN+XOhvWwoM+C6dur3O7a2oNlsL/99oNz5td0
	aQy7BOwccu4bpsermjoAkGtGdCEe4HfMpxceEzmsjKef0R1cH9ajDb83W+8H6wHcUkZv/8ZzvfQ
	nid3xx5U=
X-Gm-Gg: ASbGncs6N5kTl6krexks7K8A9dtKlfyvn7TvsRvKFG3ZAvRlfi3KDyvUv83D7n1/7i4
	iZqcVVfgrcYOFujwCN6IMq8Qi74SdNNDt+mSL+JFAa06+FyV1LL1kkVXPabnAJA5hZDsoTWJVxk
	wATsAeXUJ4fIYmWTYnp0RVeBPMuJBPz1Vc12t7jDoytJ0WnGJQ0ca6FvRMPunaQC3Cx6fUHhGDo
	2Ga2xmSGH3/ZfhBKQvhrg8DLCJBwVSZ88XfTjT1OrtiX+z5/vdx8jqtzC8IFznlqCAGfUZ1RX5j
	7roS0CHJ4q6PvjoJgLewk7Mvsly71TnAN8OFIbbwkC3wvSY0ARXikd68OGSSiUQN2gA6s574
X-Google-Smtp-Source: AGHT+IFd0m9/NAXSwAuilm9AjmL0XZLwbUSDUCOraVvKzrepE3QyobN0o6/02UMhaUk7y7I3P67L2w==
X-Received: by 2002:a05:6a21:8cca:b0:1f5:80a3:b003 with SMTP id adf61e73a8af0-21d22d34f1emr8409998637.37.1749107661359;
        Thu, 05 Jun 2025 00:14:21 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.207.192.97])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747affadf5asm12216697b3a.115.2025.06.05.00.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 00:14:20 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][PATCH] python3-setuptools: Fix CVE-2025-47273
Date: Thu,  5 Jun 2025 12:44:10 +0530
Message-Id: <20250605071410.518349-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 07:14:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217990

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from
https://github.com/pypa/setuptools/commit/d8390feaa99091d1ba9626bec0e4ba7072fc507a
& https://github.com/pypa/setuptools/commit/250a6d17978f9f6ac3ac887091f2d32886fbbb0b

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
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
2.25.1


