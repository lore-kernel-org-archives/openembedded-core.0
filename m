Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91E96CD4F36
	for <webhook@archiver.kernel.org>; Wed,  4 Sep 2024 21:33:20 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.62088.1725485590600845448
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Sep 2024 14:33:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=MQbUV0d9;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-7d50a42ce97so73593a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Sep 2024 14:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1725485590; x=1726090390; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M/K+FQUftPGh5K12SXf+IxgF+2lN3mbEdZmZu+PVBR8=;
        b=MQbUV0d9mXq5DIRP+muVst1An8QFJvpiOnE24F9TzPlE7iEnrd953tt5vnoR8WzQLh
         KuFPyB4yHJm4qr7MQHxoRXVSc8yh5cy/UmKbwY0TwrKfr48SRpg06SWiGfRADkTcmqmp
         LgM6CTkFUq+a+NpOwDa9sJhcwe5aJYJcxKqHZj7Eow3GzGZ0698TKLfvDuNkXsBNbAQ+
         BZ7V75pOB6+dUO3mzkp92OyiaqZraSut1muvayxp0GQlalZPIgedWE1Wo91CxNSDLJbS
         R0gldp0ApB9Fm83DrCsL+ErzIcU1HQXcK1/e1iICdBjDEIR0W2TMgfC7MBjHvyshR29r
         X22A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725485590; x=1726090390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M/K+FQUftPGh5K12SXf+IxgF+2lN3mbEdZmZu+PVBR8=;
        b=umubxD06tVJH7JluwNUswPOp8I/S+cT+ve1FUeuXmGcvv2inxEgzrkM2Piuezq4gI/
         +Jw68V5aHEjFHBdSwYvLYF2mxHafxlF6jqzzwh9lL69jXpismlUVKLOvMVBLc90DRdjJ
         x5fFUUewzPrmV8z++ibbPeKnU2JeGN18gy58v5pS+lA+KOznks/24eUf4YhOKrQgBeNV
         jynJRr3tqoAY4Gn21L7AsRXWNH2TuF4HypufdMyHqC+cZdFlhuvlza9BqA8REs+1xwFz
         vRfLLxbwpiya3OkCWkuuaogvJgWuwdaLj5i8NxVUzh0xE9e0ZHlCDahJ+aVvSAxjuqnO
         WpDw==
X-Gm-Message-State: AOJu0YxtNAqiWRGh8YnY0mmbM7VhJgUvlXdZ6CAYBruzD+Ec87FrBbSf
	ux6kDaqJVJLmUr0laif6jg7FlB3VXS9EnRVV6wsl79PTMCSTqvTe41pjfr6BX9UnLkYBct16lcn
	kXz4=
X-Google-Smtp-Source: AGHT+IHXnkUASMBgVd/iguL63MhPTyvbE1lMVr8hKzXut2S9pwzToCes0eoc4COajRfIDX8C92Hy6Q==
X-Received: by 2002:a17:90a:2c9:b0:2c9:7219:1db0 with SMTP id 98e67ed59e1d1-2d85616ed48mr25678365a91.3.1725485589665;
        Wed, 04 Sep 2024 14:33:09 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d8e3e8c580sm6693767a91.40.2024.09.04.14.33.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 14:33:09 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 03/14] python3: Fix CVE-2024-8088
Date: Wed,  4 Sep 2024 14:32:44 -0700
Message-Id: <2d98276ba70ed6c44afecd42a7352f1b3030438f.1725456307.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1725456307.git.steve@sakoman.com>
References: <cover.1725456307.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Sep 2024 21:33:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204215

From: Soumya Sambu <soumya.sambu@windriver.com>

There is a HIGH severity vulnerability affecting the CPython "zipfile"
module. When iterating over names of entries in a zip archive (for example,
methodsof "zipfile.ZipFile" like "namelist()", "iterdir()", "extractall()",
etc) the process can be put into an infinite loop with a maliciously crafted
zip archive. This defect applies when reading only metadata or extracting
the contents of the zip archive. Programs that are not handling
user-controlled zip archives are not affected.

References:
https://nvd.nist.gov/vuln/detail/CVE-2024-8088

Upstream-Patch:
https://github.com/corydolphin/flask-cors/commit/7ae310c56ac30e0b94fb42129aa377bf633256ec

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../python/python3/CVE-2024-8088.patch        | 128 ++++++++++++++++++
 .../recipes-devtools/python/python3_3.12.4.bb |   1 +
 2 files changed, 129 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2024-8088.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2024-8088.patch b/meta/recipes-devtools/python/python3/CVE-2024-8088.patch
new file mode 100644
index 0000000000..13836f1ccc
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2024-8088.patch
@@ -0,0 +1,128 @@
+From dcc5182f27c1500006a1ef78e10613bb45788dea Mon Sep 17 00:00:00 2001
+From: "Miss Islington (bot)"
+ <31488909+miss-islington@users.noreply.github.com>
+Date: Mon, 12 Aug 2024 02:35:17 +0200
+Subject: [PATCH] gh-122905: Sanitize names in zipfile.Path. (GH-122906)
+ (#122923)
+
+CVE: CVE-2024-8088
+
+Upstream-Status: Backport [https://github.com/python/cpython/commit/dcc5182f27c1500006a1ef78e10613bb45788dea]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ Lib/test/test_zipfile/_path/test_path.py      | 17 +++++
+ Lib/zipfile/_path/__init__.py                 | 64 ++++++++++++++++++-
+ ...-08-11-14-08-04.gh-issue-122905.7tDsxA.rst |  1 +
+ 3 files changed, 81 insertions(+), 1 deletion(-)
+ create mode 100644 Misc/NEWS.d/next/Library/2024-08-11-14-08-04.gh-issue-122905.7tDsxA.rst
+
+diff --git a/Lib/test/test_zipfile/_path/test_path.py b/Lib/test/test_zipfile/_path/test_path.py
+index 06d5aab..90885db 100644
+--- a/Lib/test/test_zipfile/_path/test_path.py
++++ b/Lib/test/test_zipfile/_path/test_path.py
+@@ -577,3 +577,20 @@ class TestPath(unittest.TestCase):
+         zipfile.Path(alpharep)
+         with self.assertRaises(KeyError):
+             alpharep.getinfo('does-not-exist')
++
++    def test_malformed_paths(self):
++        """
++        Path should handle malformed paths.
++        """
++        data = io.BytesIO()
++        zf = zipfile.ZipFile(data, "w")
++        zf.writestr("/one-slash.txt", b"content")
++        zf.writestr("//two-slash.txt", b"content")
++        zf.writestr("../parent.txt", b"content")
++        zf.filename = ''
++        root = zipfile.Path(zf)
++        assert list(map(str, root.iterdir())) == [
++            'one-slash.txt',
++            'two-slash.txt',
++            'parent.txt',
++        ]
+diff --git a/Lib/zipfile/_path/__init__.py b/Lib/zipfile/_path/__init__.py
+index 78c4135..42f9fde 100644
+--- a/Lib/zipfile/_path/__init__.py
++++ b/Lib/zipfile/_path/__init__.py
+@@ -83,7 +83,69 @@ class InitializedState:
+         super().__init__(*args, **kwargs)
+
+
+-class CompleteDirs(InitializedState, zipfile.ZipFile):
++class SanitizedNames:
++    """
++    ZipFile mix-in to ensure names are sanitized.
++    """
++
++    def namelist(self):
++        return list(map(self._sanitize, super().namelist()))
++
++    @staticmethod
++    def _sanitize(name):
++        r"""
++        Ensure a relative path with posix separators and no dot names.
++
++        Modeled after
++        https://github.com/python/cpython/blob/bcc1be39cb1d04ad9fc0bd1b9193d3972835a57c/Lib/zipfile/__init__.py#L1799-L1813
++        but provides consistent cross-platform behavior.
++
++        >>> san = SanitizedNames._sanitize
++        >>> san('/foo/bar')
++        'foo/bar'
++        >>> san('//foo.txt')
++        'foo.txt'
++        >>> san('foo/.././bar.txt')
++        'foo/bar.txt'
++        >>> san('foo../.bar.txt')
++        'foo../.bar.txt'
++        >>> san('\\foo\\bar.txt')
++        'foo/bar.txt'
++        >>> san('D:\\foo.txt')
++        'D/foo.txt'
++        >>> san('\\\\server\\share\\file.txt')
++        'server/share/file.txt'
++        >>> san('\\\\?\\GLOBALROOT\\Volume3')
++        '?/GLOBALROOT/Volume3'
++        >>> san('\\\\.\\PhysicalDrive1\\root')
++        'PhysicalDrive1/root'
++
++        Retain any trailing slash.
++        >>> san('abc/')
++        'abc/'
++
++        Raises a ValueError if the result is empty.
++        >>> san('../..')
++        Traceback (most recent call last):
++        ...
++        ValueError: Empty filename
++        """
++
++        def allowed(part):
++            return part and part not in {'..', '.'}
++
++        # Remove the drive letter.
++        # Don't use ntpath.splitdrive, because that also strips UNC paths
++        bare = re.sub('^([A-Z]):', r'\1', name, flags=re.IGNORECASE)
++        clean = bare.replace('\\', '/')
++        parts = clean.split('/')
++        joined = '/'.join(filter(allowed, parts))
++        if not joined:
++            raise ValueError("Empty filename")
++        return joined + '/' * name.endswith('/')
++
++
++class CompleteDirs(InitializedState, SanitizedNames, zipfile.ZipFile):
+     """
+     A ZipFile subclass that ensures that implied directories
+     are always included in the namelist.
+diff --git a/Misc/NEWS.d/next/Library/2024-08-11-14-08-04.gh-issue-122905.7tDsxA.rst b/Misc/NEWS.d/next/Library/2024-08-11-14-08-04.gh-issue-122905.7tDsxA.rst
+new file mode 100644
+index 0000000..1be44c9
+--- /dev/null
++++ b/Misc/NEWS.d/next/Library/2024-08-11-14-08-04.gh-issue-122905.7tDsxA.rst
+@@ -0,0 +1 @@
++:class:`zipfile.Path` objects now sanitize names from the zipfile.
+--
+2.40.0
diff --git a/meta/recipes-devtools/python/python3_3.12.4.bb b/meta/recipes-devtools/python/python3_3.12.4.bb
index 9199edce3d..3ac83166ac 100644
--- a/meta/recipes-devtools/python/python3_3.12.4.bb
+++ b/meta/recipes-devtools/python/python3_3.12.4.bb
@@ -35,6 +35,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
 	   file://0001-test_deadlock-skip-problematic-test.patch \
 	   file://0001-test_active_children-skip-problematic-test.patch \
            file://CVE-2024-7592.patch \
+           file://CVE-2024-8088.patch \
            "
 
 SRC_URI:append:class-native = " \
-- 
2.34.1


