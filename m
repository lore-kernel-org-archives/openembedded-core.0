Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAAFDCD4F35
	for <webhook@archiver.kernel.org>; Wed,  4 Sep 2024 21:33:10 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.62086.1725485587650309089
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Sep 2024 14:33:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=sQ6dzAIU;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2d8b679d7f2so25027a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Sep 2024 14:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1725485587; x=1726090387; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A5k8+vtBHh20F7ltPtXueM+Q0kCJKzpBtnS6BH/CdYY=;
        b=sQ6dzAIUrFJSYhxLa+keiF7qYnaRr2Qull35TyuJ7HY11x31oPzDR9CxqcjWSnBtZe
         z+sFjQMt9BjVgn2hVjIpF2QdBd10ACHBeaTsHJbzcs1NBPsS/HU4howwkvPaCs52ysJx
         Qwlt7VEq24TQbKK6L+xiDDTjMX3BQhQBXdg1vHFrt7J2Y9zY1jUz+qLR9lhK7htGo+1t
         NIl8V+ITDU+eCI871C1aJ6+n/XTMXmPcOTTiIBk0gfjKxKtGg4fifL6wt7TEfK77i/bt
         Qxng0QD/zzbH+sqoU/S2zPUf23WiNT8LA5DGd3wCJ4ryP8yPaaZD6+e8X59mrNw4rXxc
         F8/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725485587; x=1726090387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A5k8+vtBHh20F7ltPtXueM+Q0kCJKzpBtnS6BH/CdYY=;
        b=we0P5F4115TZ7RaKlWUdwlF5EAIgG06nRE3rkyQk66Tn1d4ypErRF5Bd68ps8rzBNJ
         +sF7ugp6Ud0B9HilTk4Jm4gafjVdebvICXOy99J0J98ByDJ04ewdnkG/EX8zYb4xdcGL
         bOy5m69QuZAm3UKHycgkY9tHxfYhsMqeiFYEchyF4+SSkI3HaX8Ye3+GWeTktQ8DbkEv
         26txB46/O6b6ia3SGsBpb8PmjAdBCNDFr9PsCaIQbMrkodoI3PQ5p21CymjAOvi1y6ST
         N5w7OY4hO/NXvyg7dMnjjZBRUeeI9GYeVjI8PFfOffQZCAlPNE+aYapX98Tw8lr+itmX
         ChOw==
X-Gm-Message-State: AOJu0YzQqeclII+HKmXbw4hFwwasAnNyX0wqvKawIcL3SqU7FnjTc6K9
	4SsjuWi9uBtWkvdNjahI0dgEeXfK0Xqh4X/I9aBMUL/CI1P0MuOVVIsz1kN9hj0YbyPFq56Kzmj
	zZwg=
X-Google-Smtp-Source: AGHT+IFXCutTyeViMpF91Yi+GV5z5L+7lh8amdwXfRzBD9tVRMuZgxNdm/Y51eAxBOz6ipmmU8C28w==
X-Received: by 2002:a17:90a:5806:b0:2d8:ee39:465 with SMTP id 98e67ed59e1d1-2da7482d904mr6648740a91.1.1725485586742;
        Wed, 04 Sep 2024 14:33:06 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d8e3e8c580sm6693767a91.40.2024.09.04.14.33.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 14:33:06 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 01/14] python3-setuptools: Fix CVE-2024-6345
Date: Wed,  4 Sep 2024 14:32:42 -0700
Message-Id: <468c5a4e12b9d38768b00151c55fd27b2b504f3b.1725456307.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1725456307.git.steve@sakoman.com>
References: <cover.1725456307.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Sep 2024 21:33:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204213

From: Soumya Sambu <soumya.sambu@windriver.com>

A vulnerability in the package_index module of pypa/setuptools versions up to 69.1.1 allows for
remote code execution via its download functions. These functions, which are used to download
packages from URLs provided by users or retrieved from package index servers, are susceptible
to code injection. If these functions are exposed to user-controlled inputs, such as package
URLs, they can execute arbitrary commands on the system. The issue is fixed in version 70.0.

References:
https://nvd.nist.gov/vuln/detail/CVE-2024-6345

Upstream-patch:
https://github.com/pypa/setuptools/commit/88807c7062788254f654ea8c03427adc859321f0

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../python3-setuptools/CVE-2024-6345.patch    | 312 ++++++++++++++++++
 .../python/python3-setuptools_69.1.1.bb       |   4 +-
 2 files changed, 315 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python3-setuptools/CVE-2024-6345.patch

diff --git a/meta/recipes-devtools/python/python3-setuptools/CVE-2024-6345.patch b/meta/recipes-devtools/python/python3-setuptools/CVE-2024-6345.patch
new file mode 100644
index 0000000000..ac520be74a
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-setuptools/CVE-2024-6345.patch
@@ -0,0 +1,312 @@
+From 88807c7062788254f654ea8c03427adc859321f0 Mon Sep 17 00:00:00 2001
+From: Jason R. Coombs <jaraco@jaraco.com>
+Date: Mon Apr 29 20:01:38 2024 -0400
+Subject: [PATCH] Merge pull request #4332 from pypa/debt/package-index-vcs
+
+Modernize package_index VCS handling
+
+CVE: CVE-2024-6345
+
+Upstream-Status: Backport [https://github.com/pypa/setuptools/commit/88807c7062788254f654ea8c03427adc859321f0]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ setup.cfg                             |   1 +
+ setuptools/package_index.py           | 145 ++++++++++++++------------
+ setuptools/tests/test_packageindex.py |  56 +++++-----
+ 3 files changed, 106 insertions(+), 96 deletions(-)
+
+diff --git a/setup.cfg b/setup.cfg
+index edf9798..238d00a 100644
+--- a/setup.cfg
++++ b/setup.cfg
+@@ -65,6 +65,7 @@ testing =
+ 	sys_platform != "cygwin"
+ 	jaraco.develop >= 7.21; python_version >= "3.9" and sys_platform != "cygwin"
+ 	pytest-home >= 0.5
++	pytest-subprocess
+ testing-integration = 
+ 	pytest
+ 	pytest-xdist
+diff --git a/setuptools/package_index.py b/setuptools/package_index.py
+index 271aa97..00a972d 100644
+--- a/setuptools/package_index.py
++++ b/setuptools/package_index.py
+@@ -1,6 +1,7 @@
+ """PyPI and direct package downloading."""
+ 
+ import sys
++import subprocess
+ import os
+ import re
+ import io
+@@ -585,7 +586,7 @@ class PackageIndex(Environment):
+             scheme = URL_SCHEME(spec)
+             if scheme:
+                 # It's a url, download it to tmpdir
+-                found = self._download_url(scheme.group(1), spec, tmpdir)
++                found = self._download_url(spec, tmpdir)
+                 base, fragment = egg_info_for_url(spec)
+                 if base.endswith('.py'):
+                     found = self.gen_setup(found, fragment, tmpdir)
+@@ -814,7 +815,7 @@ class PackageIndex(Environment):
+             else:
+                 raise DistutilsError("Download error for %s: %s" % (url, v)) from v
+ 
+-    def _download_url(self, scheme, url, tmpdir):
++    def _download_url(self, url, tmpdir):
+         # Determine download filename
+         #
+         name, fragment = egg_info_for_url(url)
+@@ -829,19 +830,59 @@ class PackageIndex(Environment):
+ 
+         filename = os.path.join(tmpdir, name)
+ 
+-        # Download the file
+-        #
+-        if scheme == 'svn' or scheme.startswith('svn+'):
+-            return self._download_svn(url, filename)
+-        elif scheme == 'git' or scheme.startswith('git+'):
+-            return self._download_git(url, filename)
+-        elif scheme.startswith('hg+'):
+-            return self._download_hg(url, filename)
+-        elif scheme == 'file':
+-            return urllib.request.url2pathname(urllib.parse.urlparse(url)[2])
+-        else:
+-            self.url_ok(url, True)  # raises error if not allowed
+-            return self._attempt_download(url, filename)
++        return self._download_vcs(url, filename) or self._download_other(url, filename)
++
++    @staticmethod
++    def _resolve_vcs(url):
++        """
++        >>> rvcs = PackageIndex._resolve_vcs
++        >>> rvcs('git+http://foo/bar')
++        'git'
++        >>> rvcs('hg+https://foo/bar')
++        'hg'
++        >>> rvcs('git:myhost')
++        'git'
++        >>> rvcs('hg:myhost')
++        >>> rvcs('http://foo/bar')
++        """
++        scheme = urllib.parse.urlsplit(url).scheme
++        pre, sep, post = scheme.partition('+')
++        # svn and git have their own protocol; hg does not
++        allowed = set(['svn', 'git'] + ['hg'] * bool(sep))
++        return next(iter({pre} & allowed), None)
++
++    def _download_vcs(self, url, spec_filename):
++        vcs = self._resolve_vcs(url)
++        if not vcs:
++            return
++        if vcs == 'svn':
++            raise DistutilsError(
++                f"Invalid config, SVN download is not supported: {url}"
++            )
++
++        filename, _, _ = spec_filename.partition('#')
++        url, rev = self._vcs_split_rev_from_url(url)
++
++        self.info(f"Doing {vcs} clone from {url} to {filename}")
++        subprocess.check_call([vcs, 'clone', '--quiet', url, filename])
++
++        co_commands = dict(
++            git=[vcs, '-C', filename, 'checkout', '--quiet', rev],
++            hg=[vcs, '--cwd', filename, 'up', '-C', '-r', rev, '-q'],
++        )
++        if rev is not None:
++            self.info(f"Checking out {rev}")
++            subprocess.check_call(co_commands[vcs])
++
++        return filename
++
++    def _download_other(self, url, filename):
++        scheme = urllib.parse.urlsplit(url).scheme
++        if scheme == 'file':  # pragma: no cover
++            return urllib.request.url2pathname(urllib.parse.urlparse(url).path)
++        # raise error if not allowed
++        self.url_ok(url, True)
++        return self._attempt_download(url, filename)
+ 
+     def scan_url(self, url):
+         self.process_url(url, True)
+@@ -857,64 +898,36 @@ class PackageIndex(Environment):
+         os.unlink(filename)
+         raise DistutilsError(f"Unexpected HTML page found at {url}")
+ 
+-    def _download_svn(self, url, _filename):
+-        raise DistutilsError(f"Invalid config, SVN download is not supported: {url}")
+-
+     @staticmethod
+-    def _vcs_split_rev_from_url(url, pop_prefix=False):
+-        scheme, netloc, path, query, frag = urllib.parse.urlsplit(url)
++    def _vcs_split_rev_from_url(url):
++        """
++        Given a possible VCS URL, return a clean URL and resolved revision if any.
++        >>> vsrfu = PackageIndex._vcs_split_rev_from_url
++        >>> vsrfu('git+https://github.com/pypa/setuptools@v69.0.0#egg-info=setuptools')
++        ('https://github.com/pypa/setuptools', 'v69.0.0')
++        >>> vsrfu('git+https://github.com/pypa/setuptools#egg-info=setuptools')
++        ('https://github.com/pypa/setuptools', None)
++        >>> vsrfu('http://foo/bar')
++        ('http://foo/bar', None)
++        """
++        parts = urllib.parse.urlsplit(url)
+ 
+-        scheme = scheme.split('+', 1)[-1]
++        clean_scheme = parts.scheme.split('+', 1)[-1]
+ 
+         # Some fragment identification fails
+-        path = path.split('#', 1)[0]
+-
+-        rev = None
+-        if '@' in path:
+-            path, rev = path.rsplit('@', 1)
+-
+-        # Also, discard fragment
+-        url = urllib.parse.urlunsplit((scheme, netloc, path, query, ''))
+-
+-        return url, rev
+-
+-    def _download_git(self, url, filename):
+-        filename = filename.split('#', 1)[0]
+-        url, rev = self._vcs_split_rev_from_url(url, pop_prefix=True)
+-
+-        self.info("Doing git clone from %s to %s", url, filename)
+-        os.system("git clone --quiet %s %s" % (url, filename))
+-
+-        if rev is not None:
+-            self.info("Checking out %s", rev)
+-            os.system(
+-                "git -C %s checkout --quiet %s"
+-                % (
+-                    filename,
+-                    rev,
+-                )
+-            )
++        no_fragment_path, _, _ = parts.path.partition('#')
+ 
+-        return filename
++        pre, sep, post = no_fragment_path.rpartition('@')
++        clean_path, rev = (pre, post) if sep else (post, None)
+ 
+-    def _download_hg(self, url, filename):
+-        filename = filename.split('#', 1)[0]
+-        url, rev = self._vcs_split_rev_from_url(url, pop_prefix=True)
++        resolved = parts._replace(
++            scheme=clean_scheme,
++            path=clean_path,
++            # discard the fragment
++            fragment='',
++        ).geturl()
+ 
+-        self.info("Doing hg clone from %s to %s", url, filename)
+-        os.system("hg clone --quiet %s %s" % (url, filename))
+-
+-        if rev is not None:
+-            self.info("Updating to %s", rev)
+-            os.system(
+-                "hg --cwd %s up -C -r %s -q"
+-                % (
+-                    filename,
+-                    rev,
+-                )
+-            )
+-
+-        return filename
++        return resolved, rev
+ 
+     def debug(self, msg, *args):
+         log.debug(msg, *args)
+diff --git a/setuptools/tests/test_packageindex.py b/setuptools/tests/test_packageindex.py
+index 41b9661..e4cd91a 100644
+--- a/setuptools/tests/test_packageindex.py
++++ b/setuptools/tests/test_packageindex.py
+@@ -2,7 +2,6 @@ import distutils.errors
+ import urllib.request
+ import urllib.error
+ import http.client
+-from unittest import mock
+ 
+ import pytest
+ 
+@@ -171,49 +170,46 @@ class TestPackageIndex:
+             assert dists[0].version == ''
+             assert dists[1].version == vc
+ 
+-    def test_download_git_with_rev(self, tmpdir):
++    def test_download_git_with_rev(self, tmp_path, fp):
+         url = 'git+https://github.example/group/project@master#egg=foo'
+         index = setuptools.package_index.PackageIndex()
+ 
+-        with mock.patch("os.system") as os_system_mock:
+-            result = index.download(url, str(tmpdir))
++        expected_dir = tmp_path / 'project@master'
++        fp.register([
++            'git',
++            'clone',
++            '--quiet',
++            'https://github.example/group/project',
++            expected_dir,
++        ])
++        fp.register(['git', '-C', expected_dir, 'checkout', '--quiet', 'master'])
+ 
+-        os_system_mock.assert_called()
++        result = index.download(url, tmp_path)
+ 
+-        expected_dir = str(tmpdir / 'project@master')
+-        expected = (
+-            'git clone --quiet ' 'https://github.example/group/project {expected_dir}'
+-        ).format(**locals())
+-        first_call_args = os_system_mock.call_args_list[0][0]
+-        assert first_call_args == (expected,)
++        assert result == str(expected_dir)
++        assert len(fp.calls) == 2
+ 
+-        tmpl = 'git -C {expected_dir} checkout --quiet master'
+-        expected = tmpl.format(**locals())
+-        assert os_system_mock.call_args_list[1][0] == (expected,)
+-        assert result == expected_dir
+-
+-    def test_download_git_no_rev(self, tmpdir):
++    def test_download_git_no_rev(self, tmp_path, fp):
+         url = 'git+https://github.example/group/project#egg=foo'
+         index = setuptools.package_index.PackageIndex()
+ 
+-        with mock.patch("os.system") as os_system_mock:
+-            result = index.download(url, str(tmpdir))
+-
+-        os_system_mock.assert_called()
+-
+-        expected_dir = str(tmpdir / 'project')
+-        expected = (
+-            'git clone --quiet ' 'https://github.example/group/project {expected_dir}'
+-        ).format(**locals())
+-        os_system_mock.assert_called_once_with(expected)
+-
+-    def test_download_svn(self, tmpdir):
++        expected_dir = tmp_path / 'project'
++        fp.register([
++            'git',
++            'clone',
++            '--quiet',
++            'https://github.example/group/project',
++            expected_dir,
++        ])
++        index.download(url, tmp_path)
++
++    def test_download_svn(self, tmp_path):
+         url = 'svn+https://svn.example/project#egg=foo'
+         index = setuptools.package_index.PackageIndex()
+ 
+         msg = r".*SVN download is not supported.*"
+         with pytest.raises(distutils.errors.DistutilsError, match=msg):
+-            index.download(url, str(tmpdir))
++            index.download(url, tmp_path)
+ 
+ 
+ class TestContentCheckers:
+-- 
+2.40.0
+
diff --git a/meta/recipes-devtools/python/python3-setuptools_69.1.1.bb b/meta/recipes-devtools/python/python3-setuptools_69.1.1.bb
index 67475b68eb..7b9b02059f 100644
--- a/meta/recipes-devtools/python/python3-setuptools_69.1.1.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_69.1.1.bb
@@ -9,7 +9,9 @@ inherit pypi python_setuptools_build_meta
 SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-easy_install.patch"
 
 SRC_URI += " \
-            file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
+            file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch \
+            file://CVE-2024-6345.patch \
+"
 
 SRC_URI[sha256sum] = "5c0806c7d9af348e6dd3777b4f4dbb42c7ad85b190104837488eab9a7c945cf8"
 
-- 
2.34.1


