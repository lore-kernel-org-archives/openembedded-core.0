Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5DB8CA5FB1
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 08:16:51 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8561.1790756209429746383
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 01:16:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=nDj3p/rN;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BCAA61A1080
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 08:16:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 92AFC60749
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 08:16:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A5EA9103298AF;
	Wed, 30 Sep 2026 10:16:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790756207; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=81j7Dinca8cutqU32aGbj8KAsEYS625CE/F8WPBYGQE=;
	b=nDj3p/rNFI5qDEjGNhvzKpLhA7iS95LcIkFQOU7LxBnMKil4/L9ZmeSZBNEM8TJTDpOKJU
	3psExW2fIjT36qJwZWC8dkWTSulLCxCqyg12TlXkUNDZlucTjMfjUm0MID9wt1Sxn+jbMn
	UuUxY6DQtkEYVhW70lqiP0tYRyy5oeAWlltZHNKM9sqkV1a14IJcG+CptVa02/4XcKNsRd
	XupPZcSifE1jAwDwrxal206bcbr9J5z4O4twtb3/HzboCQkpExTi94OmhSKKcf87iUcNIZ
	b9BywH8eMUzJnD12GVXzu7KCxl+B4mTK1X5OpJ+JoflLoJh0h+/8T/CR+JYYTg==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Wed, 30 Sep 2026 10:16:28 +0200
Subject: [PATCH 03/24] python3-setuptools-scm: upgrade 10.2.3 -> 10.3.4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-mathieu-upgrades-2026-02-29-v1-3-102c38be04df@bootlin.com>
References: <20260930-mathieu-upgrades-2026-02-29-v1-0-102c38be04df@bootlin.com>
In-Reply-To: <20260930-mathieu-upgrades-2026-02-29-v1-0-102c38be04df@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790756204; l=6155;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=ADXN/AkNI35idLOewjMbg/eZjeEV96N3zBS2Mab1tsI=;
 b=fIukcbEAWK7+2cT3yUn/wA9JVkXgvpftgQbtG5nchmkZQlJvhDHRhaP2lHz1sH+evk9UJKioS
 ONysBNZLjzBA2mVo2796/3wj6JeBNJgepNWQnM09/yZm9feUUNd6bki
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 08:16:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246926

10.3.4 (2026-09-23)
- Fixed
  - Ship the tracked files of projects whose pyproject.toml sits in a
    subdirectory of the checkout. root defaults to the project
    directory, so version inference correctly finds no SCM there and
    answers from SETUPTOOLS_SCM_PRETEND_VERSION or fallback_version --
    but that says nothing about which files git tracks, and the sdist
    and wheel came out with none of them. This was the 10.3.0 regression
    fixed in 10.3.3, surviving in the subdirectory layout.
  - File discovery now follows the checkout the project sits in,
    independently of the root that scopes versioning, and records
    scm_file_list.json in the egg-info as a root-level project already
    did.
  - Require vcs-versioning>=2.5.0. The subdirectory file-discovery fix
    imports discover_file_workdir, which no earlier release has, while
    the declared floor still named 2.4.0 -- an install against a
    published vcs-versioning raised ImportError during the build.

10.3.3 (2026-09-16)
- Fixed
  - Keep file discovery working when the version is pretended.
    SETUPTOOLS_SCM_PRETEND_VERSION and its scoped _FOR_<DIST> form made
    version inference return before discovering a workdir, and the
    egg_info mixin read the absent workdir as "searched, found no
    checkout" -- the signal it acts on by suppressing the
    setuptools.file_finders chain. Every SCM-tracked file that
    setuptools' own package discovery does not find was then dropped
    from the sdist and the wheel, silently, since the build succeeded
    and the version was correct.
  - A pretended version still skips discovery, because most builds only
    want a version and probing for a checkout nobody asks about costs
    subprocesses for nothing. What no longer happens is passing that off
    as an answer: "nobody looked yet" is now distinct from "looked and
    found nothing", and the workdir is discovered on demand the first
    time a consumer needs a file list.
  - scm_file_list.json is now written to the egg-info for pretended
    builds as well. It describes which files the checkout tracks, which
    a pretended version says nothing about. scm_version.json stays
    absent there, because a pretended version must not be recorded as
    what the SCM said.

10.3.2 (2026-09-14)
- Fixed
  - Stop the command mixins from reordering a project's own build_py,
    egg_info or bdist_wheel MRO. ScmVersionFileMixin and friends
    inherited from the corresponding setuptools command, so wrapping a
    project class built on a disjoint hierarchy --
    distutils.command.build_py, or the standalone wheel package's
    bdist_wheel -- placed setuptools' command ahead of the project's
    class. setuptools.build_py.run() does not delegate any further, so
    the project's run() was silently skipped, surfacing as error:
    package directory '...' does not exist. The mixins now carry no
    runtime base class and linearise to (wrapped, mixin,
    *project_command.__mro__).
  - Leave a project's cmdclass alone when setuptools-scm is installed
    but not actually inferring a version. build_py, egg_info and
    bdist_wheel are now registered only once version inference has
    stored data on the distribution -- the precondition for any of the
    mixins doing something. Previously every project with a
    pyproject.toml had its commands wrapped, including projects with no
    [tool.setuptools_scm] section at all.
  - Note for projects that used to configure setuptools-scm and no
    longer do: a scm_version.json left behind in a stale *.egg-info
    directory is no longer stripped from built wheels, because the
    bdist_wheel mixin that strips it is no longer registered either.
    Remove the stale *.egg-info directory.

10.3.1 (2026-09-14)
- Fixed
  - Require vcs-versioning>=2.4.0. setuptools-scm 10.3.0 declared
    >=2.3.2 but imports
    vcs_versioning._file_finders.scm_search_known_failed, which
    vcs-versioning only gained in 2.4.0, so installing it alongside an
    older vcs-versioning failed with ImportError. CI now installs
    setuptools-scm against the oldest vcs-versioning its metadata
    permits, so the lower bound can no longer go stale unnoticed.

10.3.0 (2026-09-12)
- Deprecated
  - Emit a DeprecationWarning when the setuptools.file_finders entry
    point is invoked for a project that does not configure
    setuptools-scm. The entry point will be removed in a future major
    release.
- Fixed
  - Run the setuptools.file_finders hook inside a setuptools-scm
    override context. It previously resolved settings under the
    VCS_VERSIONING prefix only, so documented variables such as
    SETUPTOOLS_SCM_SUBPROCESS_TIMEOUT and SETUPTOOLS_SCM_HG_COMMAND were
    ignored when finding files.
  - When version inference has already run and found no SCM checkout,
    the egg_info mixin now tells the file finders so, rather than
    letting walk_revctrl() re-probe every backend for a repository known
    to be absent.

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 ...ython3-setuptools-scm_10.2.3.bb => python3-setuptools-scm_10.3.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-setuptools-scm_10.2.3.bb b/meta/recipes-devtools/python/python3-setuptools-scm_10.3.4.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-setuptools-scm_10.2.3.bb
rename to meta/recipes-devtools/python/python3-setuptools-scm_10.3.4.bb
index 0af4bd24f5e2..db9a565439c5 100644
--- a/meta/recipes-devtools/python/python3-setuptools-scm_10.2.3.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-scm_10.3.4.bb
@@ -6,7 +6,7 @@ argument or in a SCM managed file."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=838c366f69b72c5df05c96dff79b35f2"
 
-SRC_URI[sha256sum] = "f179ed3e2a63cf5823e5ee9aa9ca08386219400443a0553224d72dde3f206b44"
+SRC_URI[sha256sum] = "a69f28bfc245608781205e912faae437c2b2165773afa4e7b979d77447a69dd2"
 
 PYPI_PACKAGE = "setuptools_scm"
 

-- 
2.47.3


