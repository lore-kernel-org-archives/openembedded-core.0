Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD88DC61DBD
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 05:44:07 +0000 (UTC)
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6206.1787723040188407208
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 22:44:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Gj/yHQ6b;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=10337; q=dns/txt;
  s=iport01; t=1787723040; x=1788932640;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6sEcNPp2ojYHH/337j2ppEZmr9xotztNjg87rgnhWaU=;
  b=Gj/yHQ6beYLg9XJZeMLhWHOo2QhGyRHK6XWW9Y6LGroaa3dtSulKXHEB
   bbgYisHq3BKHUCWGUVMzLW27mnCRIfqONzPr/+pnSOuwJNhZFFqSAIWUr
   OUquSiAMwaKZtcrb8CbGtegncJfJHll0JOzEZly8tRUz+UUZoH2ktmFdk
   L/mzaxpnHq3eSRD5rv41fmp76jGcZ/baB7lwqsN3JgcEQ2iBVzq+j81WV
   ZrhQD3RvryqFAweRl3Mj5K6To64p98Q6RM2uuLDS2NLDmnDRZdgjmbi8H
   Uhv64RJ4c6op7NYXqi83DaCnOu2+ju9quPRQsWIDvyUF4/YGFNtunlpBf
   Q==;
X-CSE-ConnectionGUID: V3hYAsHtTiG1cPKpGLJzBw==
X-CSE-MsgGUID: Ydrlm9l6RxObgUIDwrwAnQ==
X-IPAS-Result: =?us-ascii?q?A0AnAABZfI5q/5IQJK1HEx0BAQEBCQESAQUFAYF8CAELA?=
 =?us-ascii?q?YJWdF9CSYxyiViLZ5I3gX4PAQEBD0QNBAEBhQWNbgImNAkOAQIEAwIDAQEBA?=
 =?us-ascii?q?QEBAQEBAQELAQEFAQEBAgEHBYEOE4ZPDYZaAQIBKgsBRiwDAQIZDCoLIyEag?=
 =?us-ascii?q?mgBgjoDNwIBEQW9dho3gXkzgQGCZAEBAYEBAkNQ2EsNglgBCxQBBYEzAYU+g?=
 =?us-ascii?q?n+FI10YAUSEOCcbG4FyF4I5gi6BBYEaQgEBA4IthXUEgiKBDIFagRaQckiBH?=
 =?us-ascii?q?gNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBDRsGBYEdgSiEECMZNnyBCV6BK?=
 =?us-ascii?q?ylgARIXgQmCBwKCWoIFAgFJQw4HRz4LGA1IESw3FBkEPm4HjmsfgXxNATAvG?=
 =?us-ascii?q?xMBKgFQBjt1IhIPB6MxgiGgHnEKKIN2ij+BY48+hXwaM4VbpRELmH2NXC6EC?=
 =?us-ascii?q?ZFqXYRpgWg8gUcLB3AVO4JnCUoZD44sAgoLg2CBf4NlxlUkNQIJMgEBBwIHD?=
 =?us-ascii?q?gMLgWiQAiQJgU8BAQ?=
IronPort-Data: A9a23:BN6sWKnDIfSU2sTvczGz1Rro5gzWJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIYC2DQb6reZmDyKN1xO97g/RtSsZWBytUwTAc6qSpmFFtH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4E/raf658SUUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZC31GONgWYubDpEsfzb8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FbND+tdeGkFSy
 f03cTs1TQiso8Ck6q3uH4GAhux7RCXqFIobvnclyXTSCuwrBMiSBa7L/tRfmjw3g6iiH96HO
 JFfMmQpNUqGOkERUrsUIMpWcOOAhmX/ej5RsnqepLE85C7YywkZPL3FYIOKI4bUH5gE9qqej
 lPK5WD8UxVEDsy4wzW4016znPDmmxquDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4Guk+7kSJj6HT+QvcXjlCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1r994cRva1fApEFI/
IronPort-HdrOrdr: A9a23:l6kHSKgvXElfHyaizF+IM7SW9HBQXvYji2hC6mlwRA09TyVXra
 +TdZMgpHrJYVkqOU3I9ersBEDiewK/yXcK2+ks1N6ZNWGM0ldAR7sN0WKN+VHd8gTFh4pgPN
 9bAstDIey1K0RmhsDn5wT9OdMhzN6btJ2Mv47lvhBQpcUAUdAY0++/YTzrdHFLeA==
X-Talos-CUID: =?us-ascii?q?9a23=3AVXncEmijdJmJX+LDnlYLCIaS5zJuTCbd/V7LA1O?=
 =?us-ascii?q?ECEkwQ4W2UXC02rFOjJ87?=
X-Talos-MUID: =?us-ascii?q?9a23=3AHqM+SA6xRnHC3khMzxLlmN+wxoxZ776qDREJz68?=
 =?us-ascii?q?WnMOLCA1cJC2CpTKOF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,244,1779148800"; 
   d="scan'208";a="817126259"
Received: from alln-l-core-09.cisco.com ([173.36.16.146])
  by alln-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 26 Aug 2026 05:43:59 +0000
Received: from sjc-ads-4178.cisco.com (sjc-ads-4178.cisco.com [171.70.54.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-09.cisco.com (Postfix) with ESMTPS id 2BC161800045B;
	Wed, 26 Aug 2026 05:43:59 +0000 (GMT)
Received: by sjc-ads-4178.cisco.com (Postfix, from userid 1887505)
	id BDF9CCE1BBD; Tue, 25 Aug 2026 22:43:58 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [OE-core][scarthgap][PATCH] python3-pip: Fix CVE-2026-13346
Date: Tue, 25 Aug 2026 22:40:23 -0700
Message-Id: <20260826054023.1802819-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4178.cisco.com [171.70.54.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.54.199, sjc-ads-4178.cisco.com
X-Outbound-Node: alln-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 05:44:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244300

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in
[2], using the commit shown in [1].

[1] https://github.com/pypa/pip/commit/10dfb6b90054
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-13346

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../python/python3-pip/CVE-2026-13346.patch   | 223 ++++++++++++++++++
 .../python/python3-pip_24.0.bb                |   1 +
 2 files changed, 224 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pip/CVE-2026-13346.patch

diff --git a/meta/recipes-devtools/python/python3-pip/CVE-2026-13346.patch b/meta/recipes-devtools/python/python3-pip/CVE-2026-13346.patch
new file mode 100644
index 0000000000..246f587a14
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pip/CVE-2026-13346.patch
@@ -0,0 +1,223 @@
+From e743e63ca083402fe0a344c4837cc6acf3081987 Mon Sep 17 00:00:00 2001
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
+- Adapted imports and download call sites to pip 24.0.
+- Secured pip 24.0 separate BatchDownloader path.
+- Omitted tests absent from the pip 24.0 source archive.
+
+(cherry picked from commit 10dfb6b9005484578b386f64b9f36982e3dc6679)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ news/14110.bugfix.rst                   |  1 +
+ src/pip/_internal/models/link.py        | 63 ++++++++++++++++++++-----
+ src/pip/_internal/network/download.py   | 20 +++++---
+ src/pip/_internal/operations/prepare.py |  6 +--
+ 4 files changed, 69 insertions(+), 21 deletions(-)
+ create mode 100644 news/14110.bugfix.rst
+
+diff --git a/news/14110.bugfix.rst b/news/14110.bugfix.rst
+new file mode 100644
+index 000000000..f7d4f7888
+--- /dev/null
++++ b/news/14110.bugfix.rst
+@@ -0,0 +1 @@
++Fix ``Link.filename`` decoding the URL path twice.
+diff --git a/src/pip/_internal/models/link.py b/src/pip/_internal/models/link.py
+index 73041b864..e4bd559bf 100644
+--- a/src/pip/_internal/models/link.py
++++ b/src/pip/_internal/models/link.py
+@@ -13,6 +13,7 @@ from typing import (
+     List,
+     Mapping,
+     NamedTuple,
++    NewType,
+     Optional,
+     Tuple,
+     Union,
+@@ -36,6 +37,49 @@ if TYPE_CHECKING:
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
+@@ -380,18 +424,13 @@ class Link(KeyBasedCompareMixin):
+         return self._url
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
+index d1d43541e..3aec97e84 100644
+--- a/src/pip/_internal/network/download.py
++++ b/src/pip/_internal/network/download.py
+@@ -11,7 +11,12 @@ from pip._vendor.requests.models import CONTENT_CHUNK_SIZE, Response
+ from pip._internal.cli.progress_bars import get_download_progress_renderer
+ from pip._internal.exceptions import NetworkConnectionError
+ from pip._internal.models.index import PyPI
+-from pip._internal.models.link import Link
++from pip._internal.models.link import (
++    Link,
++    PathComponent,
++    as_path_component,
++    join_within_directory,
++)
+ from pip._internal.network.cache import is_from_cache
+ from pip._internal.network.session import PipSession
+ from pip._internal.network.utils import HEADERS, raise_for_status, response_chunks
+@@ -91,11 +96,14 @@ def parse_content_disposition(content_disposition: str, default_filename: str) -
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
+@@ -109,7 +117,7 @@ def _get_http_response_filename(resp: Response, link: Link) -> str:
+         ext = os.path.splitext(resp.url)[1]
+         if ext:
+             filename += ext
+-    return filename
++    return as_path_component(filename)
+ 
+ 
+ def _http_get_download(session: PipSession, link: Link) -> Response:
+@@ -140,7 +148,7 @@ class Downloader:
+             raise
+ 
+         filename = _get_http_response_filename(resp, link)
+-        filepath = os.path.join(location, filename)
++        filepath = join_within_directory(location, filename)
+ 
+         chunks = _prepare_download(resp, link, self._progress_bar)
+         with open(filepath, "wb") as content_file:
+@@ -176,7 +184,7 @@ class BatchDownloader:
+                 raise
+ 
+             filename = _get_http_response_filename(resp, link)
+-            filepath = os.path.join(location, filename)
++            filepath = join_within_directory(location, filename)
+ 
+             chunks = _prepare_download(resp, link, self._progress_bar)
+             with open(filepath, "wb") as content_file:
+diff --git a/src/pip/_internal/operations/prepare.py b/src/pip/_internal/operations/prepare.py
+index 956717d1e..0a9b39332 100644
+--- a/src/pip/_internal/operations/prepare.py
++++ b/src/pip/_internal/operations/prepare.py
+@@ -26,7 +26,7 @@ from pip._internal.exceptions import (
+ from pip._internal.index.package_finder import PackageFinder
+ from pip._internal.metadata import BaseDistribution, get_metadata_distribution
+ from pip._internal.models.direct_url import ArchiveInfo
+-from pip._internal.models.link import Link
++from pip._internal.models.link import Link, join_within_directory
+ from pip._internal.models.wheel import Wheel
+ from pip._internal.network.download import BatchDownloader, Downloader
+ from pip._internal.network.lazy_wheel import (
+@@ -189,7 +189,7 @@ def _check_download_dir(
+     """Check download_dir for previously downloaded file with correct hash
+     If a correct file is found return its path else None
+     """
+-    download_path = os.path.join(download_dir, link.filename)
++    download_path = join_within_directory(download_dir, link.filename)
+ 
+     if not os.path.exists(download_path):
+         return None
+@@ -666,7 +666,7 @@ class RequirementPreparer:
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
+
diff --git a/meta/recipes-devtools/python/python3-pip_24.0.bb b/meta/recipes-devtools/python/python3-pip_24.0.bb
index cf123a5d23..7f7b6026e2 100644
--- a/meta/recipes-devtools/python/python3-pip_24.0.bb
+++ b/meta/recipes-devtools/python/python3-pip_24.0.bb
@@ -33,6 +33,7 @@ inherit pypi python_setuptools_build_meta
 
 SRC_URI += "file://no_shebang_mangling.patch \
             file://CVE-2026-1703.patch \
+            file://CVE-2026-13346.patch \
            "
 
 SRC_URI[sha256sum] = "ea9bd1a847e8c5774a5777bb398c19e80bcd4e2aa16a4b301b718fe6f593aba2"
-- 
2.35.6


