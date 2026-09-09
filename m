Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76500C79FBE
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 07:30:01 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6315.1788938999893499777
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 00:30:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=DaaYjqpS;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48584dc164fso5085963f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 00:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788938998; x=1789543798; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GoGZBqu34QZxmscKGKbv+GipK0zXLJF18QR+yq5xYiM=;
        b=DaaYjqpStgNo4Pa1GlZ8FAZOj8zVkeB4ILuAcjYBdWOTuwwPg5Xz/n27vmVz1qWooJ
         mM97cVbTlci4LcTU+sVoAqyvY6XNvyJFMWqEfhhpw6MQhZIK/IqiL/DRrLhs/RO1OUxm
         DqHjD6u7oF+JQ0qxat1WkIaf+VgikvdzVw5E8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788938998; x=1789543798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GoGZBqu34QZxmscKGKbv+GipK0zXLJF18QR+yq5xYiM=;
        b=KqeYWg89mDQR/BQwSwKQfaAupgCVzFFwq6IJ8wxPM9Mst/o7SkVS79fOJUNkfLFW8I
         b1i+MvZazNLAoH9ObOo1D+fGxha/grK6emVMxITeB0Xz99JiXz+iyO583HlpWuKpeQ3x
         WBmxDz8ECXXxB3mqi0xvnGQfQSMkJMBy6ojObnxg7nFg6CYLUEV15rDhOaXTeTzLooHm
         giPuZAQ1OBZxg0teqwsY2v3NyVUOM4ysdp4f6Jrt25dwpsSZuwBZ85Gnand/e9j5agvj
         fCH19N9Gm+Aex7qhUXc+Lot6uCLyF0pchXKEqOZkPNCclVTgAnstL11l7/T+Grz3H+MV
         Dk+g==
X-Gm-Message-State: AFuF++kBSnmieka0CTqtew7hMqJ5+ZjFJljG1KHNKiniEXhHnbhabszW
	e83dzi5C8aYdra+/x8sEEXcwaiKyfFh4m+Vz3bhmfodqODCKKejY3HvDvQ7DYeN2mb79vFVELYW
	mpNRxu6U=
X-Gm-Gg: AYBFou05+bwflKkYkLYn+jAnGTzKx/NlEECzrszkoR0cVTzswMfIMaNvhMXwc3kT0NS
	84IBioyEFcLqN7qSjIYxhGl76wBb42X/ewKdYQfgyipjOvFULD6ZVGrFm5iXEBZYbFY6xw0+pbU
	v1QCp7rrs37NvPW5u6Aitj3FMJSxYvMCIba0Of/xWeoXz05DWYX99TxofoYy/3nsipaLSEfUOpD
	S80VFfcAMI3F4XUrRVTlRjKMz7qmESGGaLTBOxdJBaGMynQTZ/YAcMjoB78s9uPnh9SgmqE1Sol
	BJnH3kFRIWRmRg6zCDKpo0aDzs4VzPnds0eUqFjuysYkyABbSUnV+TTH0JQKO+NnE4CLnfL2Pnl
	nTUtUdjSkh/KB/nJo6RPMEHicO88uXagEcmSd/dcsf7suGwVo+SE64Mo+ysWbrsNCxtVCDr0omb
	1aPKtfz2tLITLLSaPRJMr0xHOTgp1Si/rAVP99PQkg9WxxcIEWUgEazogpnvGhIpGGR19Z0cyqL
	2gNXin5GOam1Q+iFqmJolXQaxJnQdyEiZnlYL4BkNI1N65BWKyFZB1jGhM7yd01rI4skuFUz5U=
X-Received: by 2002:a05:6000:2287:b0:485:8a46:704f with SMTP id ffacd0b85a97d-4858a46725cmr30208037f8f.33.1788938997919;
        Wed, 09 Sep 2026 00:29:57 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858ac2b4cdsm40624310f8f.16.2026.09.09.00.29.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 00:29:56 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 08/38] python3-pip: Fix CVE-2026-13346
Date: Wed,  9 Sep 2026 09:29:07 +0200
Message-ID: <7862170e00e79f196db15f9b5efd97470ee8fd56.1788938909.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788938908.git.yoann.congal@smile.fr>
References: <cover.1788938908.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 07:30:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245417

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1].

[1] https://github.com/pypa/pip/commit/10dfb6b9005484578b386f64b9f36982e3dc6679
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-13346

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
[YC: fixed patch format]
---
 .../python/python3-pip/CVE-2026-13346.patch   | 206 ++++++++++++++++++
 .../python/python3-pip_26.0.1.bb              |   4 +-
 2 files changed, 209 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python3-pip/CVE-2026-13346.patch

diff --git a/meta/recipes-devtools/python/python3-pip/CVE-2026-13346.patch b/meta/recipes-devtools/python/python3-pip/CVE-2026-13346.patch
new file mode 100644
index 00000000000..e800f29e304
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
index 9640bc926aa..3ff6cd39cd2 100644
--- a/meta/recipes-devtools/python/python3-pip_26.0.1.bb
+++ b/meta/recipes-devtools/python/python3-pip_26.0.1.bb
@@ -24,7 +24,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=63ec52baf95163b597008bb46db68030 \
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI += "file://no_shebang_mangling.patch"
+SRC_URI += "file://no_shebang_mangling.patch \
+            file://CVE-2026-13346.patch \
+           "
 
 SRC_URI[sha256sum] = "c4037d8a277c89b320abe636d59f91e6d0922d08a05b60e85e53b296613346d8"
 

