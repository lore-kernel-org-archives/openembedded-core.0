Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B49DC61DB2
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 19:38:50 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.95896.1749584322963333946
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 12:38:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=sOKXkT8B;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-742c27df0daso5389405b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 12:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749584322; x=1750189122; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NSvB0c0rdGgV15drkOMNjy29LQqrRmEqedNdv5DfH8E=;
        b=sOKXkT8B8CGcrl9RrFbIbTWYbQmPpdZJzGKJ04hVOdPLIInZo1Z2eRQademrXPr+/N
         Yy1GsyDyBvqfcLRAgE43XmROt8prsIoFHGycxceMGQbdPZUrSLd6/yiHt2xyPtHzZfJg
         SAohuV8VWZ5jLGTQoQj+//ORsjmEJlCs8+BGACXwL5KosTMAWDewjei198Ep8WH1iHin
         r4sCzjzK0c4p3Gp8rN7DK2SnKk7nUBnEK/Ec906MtCH3rcyC4tZM7SWQP+bwS8ERYOaw
         6eHsxOVQss4VO2QPmOtgJJwcAp8PC30qB4blWFc6dLuNhXUMCzLBccIlU6pb1dPD7lAK
         eOEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749584322; x=1750189122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NSvB0c0rdGgV15drkOMNjy29LQqrRmEqedNdv5DfH8E=;
        b=EzZHP0wtun7cJNs4SLHkmAYcj2YDIuS+ARRm04H2Hhr9VYJ4//W2p5IriHWEItalGQ
         kcciXZy9YmsoW1ImXNVCKcW/Ig8S4HIYjPlViTUNE8faNOwSmv+A4QE75X3CdmFhLNeD
         gqqq9LcW4C3XI3lpa3lccMCd98oMIac5KZ7jdrwbNMcZyj0d8RvHxkGCCTXNwjbXdWQZ
         HneG0H4t4zCpqgRXqHNMIDXkiGUTads1r0sLblAJjQb6snXCrSqFFEt/2YLd3krAFf6k
         s4qevkYLfyH4GRpsZEmrXQv41Nuq8rSQiXf0R1KRgIOPrNpOL/UNHm8XSB1IjFSzO1E4
         RqhA==
X-Gm-Message-State: AOJu0Yyj00IcwAeaKVTScuv94AqcFG8QLUvhy7pGL8gl1GmACOOFo9mA
	yR0jzMX0G2nsTGaoyTwvZVViLD7OjxVoUvPDx4uMJaoNYdopFwDJeBzBmnC+oI0tZgd2DXd8Qko
	qbGWM
X-Gm-Gg: ASbGncs0VwiIgpKhDtxlVG1JdEEPLAbSxvhfDQkttJ+WrNTyQ42m0zp0NNZaHi7gdDv
	ceBB8z0xA4I1un3I3KqtmZ9Ru0yT7a/TnP/iA6VotLsjITn3b/Epm7Eciz5v05I3YCbW8pty8AY
	2EuW3C3SoPKiquufTJLl3W7xI1vF2gVoxOYwfVidpAvLlZS/d/FxpenlxOvrxYoJOj3qpSc+18i
	Qm/hNS6bS5IGfGaN2b07CZ+ws4BlPPM6AvHncx4vFDpE4oVC+HS3IBXWRvVUs+smOjs/ICSbHzf
	j8RxN3pl8idaQKvCAEal4CKrKxnn14dg86C/UG+IyKo7N8y3BiFI/w==
X-Google-Smtp-Source: AGHT+IGoIHB1o45cT660r9Miey07eTzVYOFK4NF4Y1QigSuNHJyidwg5FDjTTxzHLUiGa2CK0lS+cA==
X-Received: by 2002:a05:6a21:6d8b:b0:21a:de8e:5cc3 with SMTP id adf61e73a8af0-21f865b941dmr1172514637.4.1749584322166;
        Tue, 10 Jun 2025 12:38:42 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7bc4:2c75:fa51:ff16])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f5f7827c0sm7198595a12.62.2025.06.10.12.38.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 12:38:41 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/15] python3-setuptools: Fix CVE-2025-47273
Date: Tue, 10 Jun 2025 12:38:15 -0700
Message-ID: <6b6e556a226100205427c85e8064f7640a9da25e.1749584149.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749584149.git.steve@sakoman.com>
References: <cover.1749584149.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 19:38:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218431

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from
https://github.com/pypa/setuptools/commit/d8390feaa99091d1ba9626bec0e4ba7072fc507a
& https://github.com/pypa/setuptools/commit/250a6d17978f9f6ac3ac887091f2d32886fbbb0b

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.43.0


