Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49AFEC3ABA5
	for <webhook@archiver.kernel.org>; Wed, 30 Apr 2025 02:54:17 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.8212.1745981655051071960
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Apr 2025 19:54:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=VU/ovdsO;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-301e05b90caso7414950a91.2
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 19:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1745981654; x=1746586454; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SA4Twf49ePQX/NU+0v7d6FEB87cF12hFE7Kh4mmF0/c=;
        b=VU/ovdsON5HK+ycXdrFGzQ56f4KC6kQy3MG5S3UpHJJGJ4WlWD6LKZBtkapcLCrBjW
         /amux6wxPCx6DKkiV6BwW0GWC3zSQ61MFC5GCOazY06NrXWJGphbvWKQTJeDuGsybqX1
         5jJZ3hLsEIsJCvKcQd+nSyOvHGhCOryMp0ZuLcYpNiWsFQauTGY/n6myNS9fFCOUU9Ka
         HWArGB2bTM800Svy7szZiZtV2g3xBhuj17QrmzRwZYZ3fkSURNCjxhgQr2KAy5JcX+k9
         Tn9b6AEFE1qi66BvPNU74RSpLRtybvMX3DF7Hf/zQ6g8nZT3OvN41mCzr53skRhmbM4h
         DkOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745981654; x=1746586454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SA4Twf49ePQX/NU+0v7d6FEB87cF12hFE7Kh4mmF0/c=;
        b=bHT67Ka1l/aL8TEv0ZtPRXzmfsk097tx4VhkvquPAv5cUAFQHPMsg/FTt/NYmtILGt
         v2Sb2b0Xa21uFO8FyuJcou7IpJYVlY5GzU35YgjiEvL5NQiBUuln2IyT4hicInDgkKBZ
         tsdDchl1DmXFyVS/GBwe+wguXEsrCUm3bakqOIOrMAgUPSvsO9PuftR38l+ErDADHSl4
         R5xmRMnwX47T7m+PfX7YirytXZYNStzGEGXDMdbltr/ieAPoxW9QcDOzuUvbgn2AvcOH
         wMW8MXZgHu5UON++mfYEvFysF+jktZiChNa9icdNt8biFZxC1PSLDAsDrE/FNAy96zPP
         2z2g==
X-Gm-Message-State: AOJu0YzJWRI5VBY8yW6RQ1Hf9ubK3HSmLVSq5goK2MmZMK1zHQgtC54e
	cZXabtorN/qhARn0QEYBu9n1MVu5rm2gwsWLiCwbXuFcO0rPthZDsBjECd7pnjXGheqGCSRYAfY
	l
X-Gm-Gg: ASbGncuy5ggFXzbr3KreHWxuYqXKIuE25+O3MV26Jq7+hbO6R4Wplo2dhCQnEolkUnb
	p0HEVe/hfuA5HVvgiRfxsJJZdmp+W2rpnBdjeuwjAZdiInqhTIAUAgabUH40n6MTKJyTEkBg1vb
	bitxYHZ/3Vwbq/fSuq6UZ3OLqtfIpyzT1V2TBeZBjRFrEBljUWWzH65kEe3wAT3fpiVaPv9bmv6
	lxsD13AWe/Qqn3hpYPSWfy1Fnh/IRq+QIGK0cWQRVDzGHXljUdK4JBbn++amo///IJN4KHIMEKe
	VVddGTu0sfcYZrKFxDDcELAUMf2VpzybPU6yK5lepw==
X-Google-Smtp-Source: AGHT+IES06KVI127F5OP9N80154q9CW14wrhuSrO8tuHmR3OIrNRHl72FGHYUbxz3NY3mA5WdMWTPQ==
X-Received: by 2002:a17:90b:568d:b0:2ee:b8ac:73b0 with SMTP id 98e67ed59e1d1-30a343eb192mr1512598a91.2.1745981653798;
        Tue, 29 Apr 2025 19:54:13 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:34b:e5e0:c38a:7e03])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a34a2ea46sm347852a91.31.2025.04.29.19.54.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 19:54:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/14] python3-setuptools: Fix CVE-2024-6345
Date: Tue, 29 Apr 2025 19:53:35 -0700
Message-ID: <238c305ba2c513a070818de4b6ad4316b54050a7.1745981510.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745981510.git.steve@sakoman.com>
References: <cover.1745981510.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 02:54:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215701

From: Soumya Sambu <soumya.sambu@windriver.com>

A vulnerability in the package_index module of pypa/setuptools versions up to 69.1.1
allows for remote code execution via its download functions. These functions, which
are used to download packages from URLs provided by users or retrieved from package
index servers, are susceptible to code injection. If these functions are exposed to
user-controlled inputs, such as package URLs, they can execute arbitrary commands on
the system. The issue is fixed in version 70.0.

References:
https://nvd.nist.gov/vuln/detail/CVE-2024-6345
https://ubuntu.com/security/CVE-2024-6345

Upstream patch:
https://github.com/pypa/setuptools/commit/88807c7062788254f654ea8c03427adc859321f0

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../python3-setuptools/CVE-2024-6345.patch    | 353 ++++++++++++++++++
 .../python/python3-setuptools_59.5.0.bb       |   1 +
 2 files changed, 354 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-setuptools/CVE-2024-6345.patch

diff --git a/meta/recipes-devtools/python/python3-setuptools/CVE-2024-6345.patch b/meta/recipes-devtools/python/python3-setuptools/CVE-2024-6345.patch
new file mode 100644
index 0000000000..958ddf559b
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-setuptools/CVE-2024-6345.patch
@@ -0,0 +1,353 @@
+From 88807c7062788254f654ea8c03427adc859321f0 Mon Sep 17 00:00:00 2001
+From: Jason R. Coombs <jaraco@jaraco.com>
+Date: Mon Apr 29 20:01:38 2024 -0400
+Subject: [PATCH] Merge pull request #4332 from pypa/debt/package-index-vcs
+
+Modernize package_index VCS handling
+
+Source: https://git.launchpad.net/ubuntu/+source/setuptools/tree/debian/patches/CVE-2024-6345.patch?h=applied/ubuntu/jammy-devel
+
+CVE: CVE-2024-6345
+
+Upstream-Status: Backport [https://github.com/pypa/setuptools/commit/88807c7062788254f654ea8c03427adc859321f0]
+
+Note: Cannot do exact upstream patch backport as the code changed.
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ setup.cfg                             |   1 +
+ setuptools/package_index.py           | 145 +++++++++++++++-----------
+ setuptools/tests/test_packageindex.py |  78 +++++++-------
+ 3 files changed, 123 insertions(+), 101 deletions(-)
+
+diff --git a/setup.cfg b/setup.cfg
+index 0bc0101..b8585d7 100644
+--- a/setup.cfg
++++ b/setup.cfg
+@@ -56,6 +56,7 @@ testing =
+ 	jaraco.envs>=2.2
+ 	pytest-xdist
+ 	sphinx
++	pytest-subprocess
+ 	jaraco.path>=3.2.0
+ docs = 
+ 	sphinx
+diff --git a/setuptools/package_index.py b/setuptools/package_index.py
+index e93fcc6..3a893df 100644
+--- a/setuptools/package_index.py
++++ b/setuptools/package_index.py
+@@ -1,5 +1,6 @@
+ """PyPI and direct package downloading"""
+ import sys
++import subprocess
+ import os
+ import re
+ import io
+@@ -566,7 +567,7 @@ class PackageIndex(Environment):
+             scheme = URL_SCHEME(spec)
+             if scheme:
+                 # It's a url, download it to tmpdir
+-                found = self._download_url(scheme.group(1), spec, tmpdir)
++                found = self._download_url(spec, tmpdir)
+                 base, fragment = egg_info_for_url(spec)
+                 if base.endswith('.py'):
+                     found = self.gen_setup(found, fragment, tmpdir)
+@@ -785,7 +786,7 @@ class PackageIndex(Environment):
+                 raise DistutilsError("Download error for %s: %s"
+                                      % (url, v)) from v
+ 
+-    def _download_url(self, scheme, url, tmpdir):
++    def _download_url(self, url, tmpdir):
+         # Determine download filename
+         #
+         name, fragment = egg_info_for_url(url)
+@@ -800,19 +801,57 @@ class PackageIndex(Environment):
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
++            return self._download_svn(url, spec_filename)
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
+@@ -842,7 +881,7 @@ class PackageIndex(Environment):
+     def _download_svn(self, url, filename):
+         warnings.warn("SVN download support is deprecated", UserWarning)
+         url = url.split('#', 1)[0]  # remove any fragment for svn's sake
+-        creds = ''
++        creds = []
+         if url.lower().startswith('svn:') and '@' in url:
+             scheme, netloc, path, p, q, f = urllib.parse.urlparse(url)
+             if not netloc and path.startswith('//') and '/' in path[2:]:
+@@ -851,65 +890,49 @@ class PackageIndex(Environment):
+                 if auth:
+                     if ':' in auth:
+                         user, pw = auth.split(':', 1)
+-                        creds = " --username=%s --password=%s" % (user, pw)
++                        creds.extend(["--username", user, "--password", pw])
+                     else:
+-                        creds = " --username=" + auth
++                        creds.extend(["--username", auth])
+                     netloc = host
+                     parts = scheme, netloc, url, p, q, f
+                     url = urllib.parse.urlunparse(parts)
+         self.info("Doing subversion checkout from %s to %s", url, filename)
+-        os.system("svn checkout%s -q %s %s" % (creds, url, filename))
++        cmd = ["svn", "checkout", "-q"] + creds + [url, filename]
++        subprocess.check_call(cmd)
++
+         return filename
+ 
+     @staticmethod
+-    def _vcs_split_rev_from_url(url, pop_prefix=False):
+-        scheme, netloc, path, query, frag = urllib.parse.urlsplit(url)
++    def _vcs_split_rev_from_url(url):
++        """
++        Given a possible VCS URL, return a clean URL and resolved revision if any.
++
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
++        no_fragment_path, _, _ = parts.path.partition('#')
+ 
+-        # Also, discard fragment
+-        url = urllib.parse.urlunsplit((scheme, netloc, path, query, ''))
++        pre, sep, post = no_fragment_path.rpartition('@')
++        clean_path, rev = (pre, post) if sep else (post, None)
+ 
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
+-            os.system("git -C %s checkout --quiet %s" % (
+-                filename,
+-                rev,
+-            ))
++        resolved = parts._replace(
++            scheme=clean_scheme,
++            path=clean_path,
++            # discard the fragment
++            fragment='',
++        ).geturl()
+ 
+-        return filename
+-
+-    def _download_hg(self, url, filename):
+-        filename = filename.split('#', 1)[0]
+-        url, rev = self._vcs_split_rev_from_url(url, pop_prefix=True)
+-
+-        self.info("Doing hg clone from %s to %s", url, filename)
+-        os.system("hg clone --quiet %s %s" % (url, filename))
+-
+-        if rev is not None:
+-            self.info("Updating to %s", rev)
+-            os.system("hg --cwd %s up -C -r %s -q" % (
+-                filename,
+-                rev,
+-            ))
+-
+-        return filename
++        return resolved, rev
+ 
+     def debug(self, msg, *args):
+         log.debug(msg, *args)
+diff --git a/setuptools/tests/test_packageindex.py b/setuptools/tests/test_packageindex.py
+index 8e9435e..cc7e86c 100644
+--- a/setuptools/tests/test_packageindex.py
++++ b/setuptools/tests/test_packageindex.py
+@@ -6,7 +6,6 @@ import urllib.request
+ import urllib.error
+ import http.client
+ 
+-import mock
+ import pytest
+ 
+ import setuptools.package_index
+@@ -193,61 +192,60 @@ class TestPackageIndex:
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
+-            'git clone --quiet '
+-            'https://github.example/group/project {expected_dir}'
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
++        expected_dir = tmp_path / 'project'
++        fp.register([
++            'git',
++            'clone',
++            '--quiet',
++            'https://github.example/group/project',
++            expected_dir,
++        ])
++        result = index.download(url, tmp_path)
+ 
+-        expected_dir = str(tmpdir / 'project')
+-        expected = (
+-            'git clone --quiet '
+-            'https://github.example/group/project {expected_dir}'
+-        ).format(**locals())
+-        os_system_mock.assert_called_once_with(expected)
++        assert result == str(expected_dir)
++        assert len(fp.calls) == 1
+ 
+-    def test_download_svn(self, tmpdir):
++    def test_download_svn(self, tmp_path, fp):
+         url = 'svn+https://svn.example/project#egg=foo'
+         index = setuptools.package_index.PackageIndex()
+ 
+-        with pytest.warns(UserWarning):
+-            with mock.patch("os.system") as os_system_mock:
+-                result = index.download(url, str(tmpdir))
+-
+-        os_system_mock.assert_called()
++        expected_dir = tmp_path / 'project'
++        fp.register([
++            'svn',
++            'checkout',
++            '-q',
++            'svn+https://svn.example/project',
++            expected_dir,
++        ])
+ 
+-        expected_dir = str(tmpdir / 'project')
+-        expected = (
+-            'svn checkout -q '
+-            'svn+https://svn.example/project {expected_dir}'
+-        ).format(**locals())
+-        os_system_mock.assert_called_once_with(expected)
++        with pytest.warns(UserWarning, match="SVN download support is deprecated"):
++            result = index.download(url, tmp_path)
+ 
++        assert result == str(expected_dir)
++        assert len(fp.calls) == 1
+ 
+ class TestContentCheckers:
+     def test_md5(self):
+-- 
+2.40.0
+
diff --git a/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb b/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb
index 5f2676a04a..0c0f1e9d81 100644
--- a/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb
@@ -12,6 +12,7 @@ SRC_URI += "\
     file://0001-change-shebang-to-python3.patch \
     file://0001-_distutils-sysconfig-append-STAGING_LIBDIR-python-sy.patch \
     file://0001-Limit-the-amount-of-whitespace-to-search-backtrack.-.patch \
+    file://CVE-2024-6345.patch \
 "
 
 SRC_URI[sha256sum] = "d144f85102f999444d06f9c0e8c737fd0194f10f2f7e5fdb77573f6e2fa4fad0"
-- 
2.43.0


