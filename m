Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEF45C5DF97
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 05:45:37 +0000 (UTC)
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6218.1787723128717533794
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 22:45:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Ce+1iEJr;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=10113; q=dns/txt;
  s=iport01; t=1787723128; x=1788932728;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=PCrVNQkC6LxpLOdBAg/ro+j7qev4bJknDFM1d/r51mw=;
  b=Ce+1iEJrVLl1GQ2T46LbZqIKSY42JxRLA+sLxBCsTF2QxScEVq0Vmvgb
   ZQgxYaF9mfedvNFADDPlbIOg+oH3Z450jT92uQ0Q4TQy7UWdyULx6WgL/
   ilNpp7FQpUb2iSSYO25IYBYuoNOwjuSQ3n0QxtvwgemnTHZr9pxEezyQJ
   aAspuJQkTw/wNjQbLhxZO26dTY7DCC+MHl7RZCnie9/DeU2DmJZkBz8JG
   hTfReMZSmr06kNiFxbLrPzvvKbD7U9FAeeKdTLtfhqKEzudCn4xmICm4G
   LQBa+NgTg1J8MClFbJf1ZbWxidk/Wp7qoroiQyU2GkIqVPzMbwTlhN/bP
   g==;
X-CSE-ConnectionGUID: 182tEWo2QCiPz/6lASVXPA==
X-CSE-MsgGUID: sTv4Ct6yTYOTRXlIY6umzA==
X-IPAS-Result: =?us-ascii?q?A0BHAgDyfI5q/48QJK1HEx4BAQsSDIIFC4JXdF5DSZVeb?=
 =?us-ascii?q?ItnkjeBfg8BAQEPRA0EAQGFBY1uAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBA?=
 =?us-ascii?q?QUBAQECAQcFgQ4Thk8NhloBAgEqCwEYAS0sAwECGQwqCyMhGoJoAYI6AzcDE?=
 =?us-ascii?q?QW9dho3gXkzgQGCZAEBAUEBPwJDUNhLDYJYAQsUAQWBM4U/gn+FI10YAUSEO?=
 =?us-ascii?q?CcbG4FyF4RngQWBGkIBAQOBJIEJhXUEgiJ6EoFakghIgR4DWSwBVRMNCgsHB?=
 =?us-ascii?q?YFmAzUSKhVuMh2BIz4XgQ0bBgWBHYEohBAjGTZ8gQlegSspYAESF4EJggcCg?=
 =?us-ascii?q?lqCBQIBSUMOB0c+CxgNSBEsNxQZBD5uB45rH4JJATAvGxMBKgFQBjt1NA8Ho?=
 =?us-ascii?q?zGCIaAecQoog3aKP4Fjjz6FfBozhVulEQuYfY1cLoQJkWpdhGmBaDyBRwsHc?=
 =?us-ascii?q?BWDIglKGQ+OLAIKC4NggX+DZcZVJzICCTIBAQcCBw4DC4FokAACJAIHgU8BA?=
 =?us-ascii?q?Q?=
IronPort-Data: A9a23:DnuCjqgzHgkuQ4IYO25Zgmi/X161NxEKZh0ujC45NGQN5FlHY01je
 htvC2mPbPaOZmrxKY93aIWx/E4H78XQmtE3TQc6+SgyQS5jpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FH1dOOn9SUgvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeCULOZ82QsaDxMu/jd8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqVBqrxrLF5Jr
 8UzKQgfKU6HrtmI8IqSH7wEasQLdKEHPasWvnVmiDWcBvE8TNWbHePB5MRT23E7gcUm8fT2P
 pVCL2ExKk2eJUQTYT/7C7pm9AusrnnjczRboUi9rqss6G+Vxwt0uFToGIqMK43XHJQKwi50o
 Erdw3qlKQ1EJeCu7ga/wnaNt7HSmDHSDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO+Q+7AfIzu/f5ByUQzBaCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u78Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:mTjDTK4D0+Uv+cFKjQPXwOTXdLJyesId70hD6qm+c3Nom6uj5q
 WTdZsgtCMc5Ax9ZJhCo6HjBED/exPhHPdOiOF7V4tKNzOJhILHFu1fBKLZslnd8lXFh41g/J
 YlVbRiA9vtClU/p8P77A6kV+sE+rC8gceVbSO09QYVcemsAJsQiTtENg==
X-Talos-CUID: 9a23:0F6pJ2B0W6TA/6/6E3A3rlI5Jcd/S1bc9GWXfUuRMlhZcJTAHA==
X-Talos-MUID: 9a23:O7jKywtR/wf2dzAXNc2nnw18aOx0vbWSOWcxq6UCmvjaKCliEmLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,244,1779148800"; 
   d="scan'208";a="819951974"
Received: from alln-l-core-06.cisco.com ([173.36.16.143])
  by alln-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 26 Aug 2026 05:45:27 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-06.cisco.com (Postfix) with ESMTPS id A13E018000580;
	Wed, 26 Aug 2026 05:45:27 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 433E6CCA79B; Tue, 25 Aug 2026 22:45:27 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [OE-core][wrynose][PATCH] python3-pip: Fix CVE-2026-13346
Date: Tue, 25 Aug 2026 22:45:24 -0700
Message-Id: <20260826054524.3275588-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: alln-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 05:45:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244301

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1].

[1] https://github.com/pypa/pip/commit/10dfb6b9005484578b386f64b9f36982e3dc6679
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-13346

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../python/python3-pip/CVE-2026-13346.patch   | 206 ++++++++++++++++++
 .../python/python3-pip_26.0.1.bb              |   4 +-
 2 files changed, 209 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python3-pip/CVE-2026-13346.patch

diff --git a/meta/recipes-devtools/python/python3-pip/CVE-2026-13346.patch b/meta/recipes-devtools/python/python3-pip/CVE-2026-13346.patch
new file mode 100644
index 0000000000..86da6fb5fd
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pip/CVE-2026-13346.patch
@@ -0,0 +1,206 @@
+From 10dfb6b9005484578b386f64b9f36982e3dc6679 Mon Sep 17 00:00:00 2001
+From: Damian Shaw <damian.peter.shaw@gmail.com>
+Date: Tue, 30 Jun 2026 21:52:39 -0400
+Subject: [PATCH] Fix Link.filename decoding URL path twice (#14110)
+
+Link already percent-decodes the URL path into `self._path`, but
+`Link.filename` decoded the basename again, so a doubly-encoded
+separator was decoded twice: `%252F` became `%2F` in `__init__`, then
+`/` in `filename`, turning the single component `a%2Fb.whl` into
+`a/b.whl`.
+
+Drop the second decode, and add a `join_within_directory` helper so the
+download-path joins treat the name as a single path component.
+
+CVE: CVE-2026-13346
+Upstream-Status: Backport [https://github.com/pypa/pip/commit/10dfb6b9005484578b386f64b9f36982e3dc6679]
+
+Backport Changes:
+- Omit news/14110.bugfix.rst and tests/unit/test_link.py because these
+  paths are absent from the pip 26.0.1 PyPI sdist used by this recipe.
+  All runtime-source changes are unchanged from upstream.
+
+(cherry picked from commit 10dfb6b9005484578b386f64b9f36982e3dc6679)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/pip/_internal/models/link.py        | 63 ++++++++++++++++++++-----
+ src/pip/_internal/network/download.py   | 20 ++++++--
+ src/pip/_internal/operations/prepare.py |  6 +--
+ 3 files changed, 69 insertions(+), 20 deletions(-)
+
+diff --git a/src/pip/_internal/models/link.py b/src/pip/_internal/models/link.py
+index 200ec34c5..1a6439873 100644
+--- a/src/pip/_internal/models/link.py
++++ b/src/pip/_internal/models/link.py
+@@ -14,6 +14,7 @@ from dataclasses import dataclass
+ from typing import (
+     Any,
+     NamedTuple,
++    NewType,
+ )
+
+ from pip._internal.exceptions import InvalidEggFragment
+@@ -31,6 +32,49 @@ from pip._internal.utils.urls import path_to_url, url_to_path
+ logger = logging.getLogger(__name__)
+
+
++# A single path component: percent-decoded once and reduced to a basename, so it
++# contains no path separator and is not a ``.`` or ``..`` reference. The empty
++# string means "no component".
++PathComponent = NewType("PathComponent", str)
++
++
++def _to_path_component(name: str) -> PathComponent:
++    """Reduce ``name`` to a single path component, or ``""`` if it has none.
++
++    ``os.path.basename`` drops any directory part, drive letter, or separator;
++    a ``.``, ``..``, or empty result is not a component and becomes ``""``.
++    """
++    name = os.path.basename(name)
++    if name in ("", os.curdir, os.pardir):
++        return PathComponent("")
++
++    return PathComponent(name)
++
++
++def as_path_component(name: str) -> PathComponent:
++    """Like ``_to_path_component`` but reject the empty result.
++
++    Use where a file is about to be written, so a missing name is an error
++    rather than a silent fallback to the directory itself.
++    """
++    component = _to_path_component(name)
++    if not component:
++        raise ValueError(f"Unexpected file name derived from URL: {name!r}")
++
++    return component
++
++
++def join_within_directory(directory: str, component: PathComponent) -> str:
++    """Join a single path ``component`` onto ``directory``.
++
++    ``component`` is a :data:`PathComponent`, so by type it has no separator and
++    is not a ``.`` or ``..`` reference; the result can never escape ``directory``.
++    Requiring ``PathComponent`` rather than ``str`` lets the type checker enforce
++    at the call site that the name was reduced to a safe component beforehand.
++    """
++    return os.path.join(directory, component)
++
++
+ # Order matters, earlier hashes have a precedence over later hashes for what
+ # we will pick to use.
+ _SUPPORTED_HASHES = ("sha512", "sha384", "sha256", "sha224", "sha1", "md5")
+@@ -423,18 +467,13 @@ class Link:
+         return redact_auth_from_url(self.url)
+
+     @property
+-    def filename(self) -> str:
+-        path = self.path.rstrip("/")
+-        name = posixpath.basename(path)
+-        if not name:
+-            # Make sure we don't leak auth information if the netloc
+-            # includes a username and password.
+-            netloc, user_pass = split_auth_from_netloc(self.netloc)
+-            return netloc
+-
+-        name = urllib.parse.unquote(name)
+-        assert name, f"URL {self._url!r} produced no filename"
+-        return name
++    def filename(self) -> PathComponent:
++        name = _to_path_component(posixpath.basename(self.path.rstrip("/")))
++        if name:
++            return name
++
++        # No component in the path; fall back to the netloc, dropping any auth.
++        return _to_path_component(split_auth_from_netloc(self.netloc)[0])
+
+     @property
+     def file_path(self) -> str:
+diff --git a/src/pip/_internal/network/download.py b/src/pip/_internal/network/download.py
+index 26966423f..fa71c75a3 100644
+--- a/src/pip/_internal/network/download.py
++++ b/src/pip/_internal/network/download.py
+@@ -20,7 +20,12 @@ from pip._vendor.urllib3.exceptions import ReadTimeoutError
+ from pip._internal.cli.progress_bars import BarType, get_download_progress_renderer
+ from pip._internal.exceptions import IncompleteDownloadError, NetworkConnectionError
+ from pip._internal.models.index import PyPI
+-from pip._internal.models.link import Link
++from pip._internal.models.link import (
++    Link,
++    PathComponent,
++    as_path_component,
++    join_within_directory,
++)
+ from pip._internal.network.cache import SafeFileCache, is_from_cache
+ from pip._internal.network.session import CacheControlAdapter, PipSession
+ from pip._internal.network.utils import HEADERS, raise_for_status, response_chunks
+@@ -117,11 +122,14 @@ def parse_content_disposition(content_disposition: str, default_filename: str) -
+     return filename or default_filename
+
+
+-def _get_http_response_filename(resp: Response, link: Link) -> str:
++def _get_http_response_filename(resp: Response, link: Link) -> PathComponent:
+     """Get an ideal filename from the given HTTP response, falling back to
+     the link filename if not provided.
++
++    The result is validated as a single path component, so it can be joined onto
++    a download directory without escaping it.
+     """
+-    filename = link.filename  # fallback
++    filename: str = link.filename  # fallback
+     # Have a look at the Content-Disposition header for a better guess
+     content_disposition = resp.headers.get("content-disposition")
+     if content_disposition:
+@@ -135,7 +143,7 @@ def _get_http_response_filename(resp: Response, link: Link) -> str:
+         ext = os.path.splitext(resp.url)[1]
+         if ext:
+             filename += ext
+-    return filename
++    return as_path_component(filename)
+
+
+ @dataclass
+@@ -188,7 +196,9 @@ class Downloader:
+         resp = self._http_get(link)
+         download_size = _get_http_response_size(resp)
+
+-        filepath = os.path.join(location, _get_http_response_filename(resp, link))
++        filepath = join_within_directory(
++            location, _get_http_response_filename(resp, link)
++        )
+         with open(filepath, "wb") as content_file:
+             download = _FileDownload(link, content_file, download_size)
+             self._process_response(download, resp)
+diff --git a/src/pip/_internal/operations/prepare.py b/src/pip/_internal/operations/prepare.py
+index 67f9ee950..d260d15a2 100644
+--- a/src/pip/_internal/operations/prepare.py
++++ b/src/pip/_internal/operations/prepare.py
+@@ -29,7 +29,7 @@ from pip._internal.exceptions import (
+ from pip._internal.index.package_finder import PackageFinder
+ from pip._internal.metadata import BaseDistribution, get_metadata_distribution
+ from pip._internal.models.direct_url import ArchiveInfo
+-from pip._internal.models.link import Link
++from pip._internal.models.link import Link, join_within_directory
+ from pip._internal.models.wheel import Wheel
+ from pip._internal.network.download import Downloader
+ from pip._internal.network.lazy_wheel import (
+@@ -201,7 +201,7 @@ def _check_download_dir(
+     """Check download_dir for previously downloaded file with correct hash
+     If a correct file is found return its path else None
+     """
+-    download_path = os.path.join(download_dir, link.filename)
++    download_path = join_within_directory(download_dir, link.filename)
+
+     if not os.path.exists(download_path):
+         return None
+@@ -683,7 +683,7 @@ class RequirementPreparer:
+             # No distribution was downloaded for this requirement.
+             return
+
+-        download_location = os.path.join(self.download_dir, link.filename)
++        download_location = join_within_directory(self.download_dir, link.filename)
+         if not os.path.exists(download_location):
+             shutil.copy(req.local_file_path, download_location)
+             download_path = display_path(download_location)
+-- 
+2.35.6
diff --git a/meta/recipes-devtools/python/python3-pip_26.0.1.bb b/meta/recipes-devtools/python/python3-pip_26.0.1.bb
index 28af8f7ec7..ef51922713 100644
--- a/meta/recipes-devtools/python/python3-pip_26.0.1.bb
+++ b/meta/recipes-devtools/python/python3-pip_26.0.1.bb
@@ -24,7 +24,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=63ec52baf95163b597008bb46db68030 \
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI += "file://no_shebang_mangling.patch"
+SRC_URI += "file://no_shebang_mangling.patch \
+            file://CVE-2026-13346.patch \
+           "
 
 SRC_URI[sha256sum] = "c4037d8a277c89b320abe636d59f91e6d0922d08a05b60e85e53b296613346d8"
 
-- 
2.35.6


