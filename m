Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9412CD3420
	for <webhook@archiver.kernel.org>; Sun,  1 Sep 2024 17:17:42 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.20405.1725211053644899127
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Sep 2024 10:17:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=997451aeb6=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 481Fe2ew010392
	for <openembedded-core@lists.openembedded.org>; Sun, 1 Sep 2024 10:17:33 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41c2pkgwgs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 01 Sep 2024 10:17:32 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 1 Sep 2024 10:17:31 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Sun, 1 Sep 2024 10:17:30 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][scarthgap][PATCH 1/1] python3-setuptools: Fix CVE-2024-6345
Date: Sun, 1 Sep 2024 17:17:26 +0000
Message-ID: <20240901171726.3659567-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=c+X5Qg9l c=1 sm=1 tr=0 ts=66d4a1ac cx=c_pps p=0DMlDUsRAAAA:8 a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=EaEq8P2WXUwA:10 a=t7CeM3EgAAAA:8 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=-VEQcbrZAAAA:8
 a=jjaPvp3S8u6lK2pjS_EA:9 a=s5zKW874KtQA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=168rQcPrDVj8xHztDHWJ:22 a=-CJt7n-APeOCVU92nYHP:22
X-Proofpoint-ORIG-GUID: EakcN7vw9ydSAtCeHxclPUAqw745ygs7
X-Proofpoint-GUID: EakcN7vw9ydSAtCeHxclPUAqw745ygs7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-09-01_04,2024-08-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 mlxscore=0 clxscore=1011 lowpriorityscore=0 malwarescore=0 impostorscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.21.0-2407110000
 definitions=main-2409010147
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Sep 2024 17:17:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204050

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
2.40.0


