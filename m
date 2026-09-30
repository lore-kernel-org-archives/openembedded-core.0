Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFE29CA5FC4
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 08:16:51 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8488.1790756208686361074
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 01:16:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=evABUKqB;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id EF2A51A107E
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 08:16:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C3A4660749
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 08:16:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 26C64103298AE;
	Wed, 30 Sep 2026 10:16:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790756206; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WrFZGpa3iVZMuW3qZ9yR+A+9zKXzdEj61CKgLMm1vzY=;
	b=evABUKqByv1DSpl0d+raDSRIut2Pvt0KmnXAFktQYVNZA+BFDPeOCIObEH7GZ8bHktnC/q
	EsQ/vjpw3M2hC1mmfpAo7ZJakQCnvud01YS3NwfLvylJEmi1fjxDACrQaRKdIT0lKh81Hl
	YAcbeWGdO83jLtTCJHnUhrGtAhl2eyjRbe4K/GdHMrG4uYSht3m6j7kRl0k0hLc8bZgXAF
	n+akqh9V1z5qes4wrHrh4vK4TXh4RKDAxvagCAnxhvj8ZbzxHX686x3lvE8rkRebWZdt5b
	9Hj1/8zHt3h77j7+PdHwFQdDSpWaKYaQ9HqmtiOR5Tp+ZNhBtaUEsxuM8Ji8Jw==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Wed, 30 Sep 2026 10:16:27 +0200
Subject: [PATCH 02/24] python3-vcs-versioning: upgrade 2.4.0 -> 2.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-mathieu-upgrades-2026-02-29-v1-2-102c38be04df@bootlin.com>
References: <20260930-mathieu-upgrades-2026-02-29-v1-0-102c38be04df@bootlin.com>
In-Reply-To: <20260930-mathieu-upgrades-2026-02-29-v1-0-102c38be04df@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790756204; l=4097;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=kJ0V3ljo7HI0Rf/2TJYx7J1TIJZPFi7ClcipuK/Zk60=;
 b=uT16gX7qXPFrSOw59XVxhZL/iVWDnz4ndR7j2KsJUr1JtzSgdWvVdEAu7jGnA3xTuATrDHABN
 jIGnMUWv8F3Dn6pfzMI3TvGX5ft9JTs8fjzWpsDxaetlxCq2L5Qw585
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 08:16:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246927

- Add `discover_file_workdir()`, which finds the checkout a project sits in for
  the purpose of listing files. `discover_workdir()` answers which checkout
  defines the version, scoped by `root` and `search_parent_directories`; which
  files a project ships is a separate question, and a project in a subdirectory
  of a checkout still ships that checkout's files. ([#1543]( ))

- Accept the `tool` keyword in `_version_missing()` again. setuptools-scm 10.1.0
  through 10.2.3 pass it and allow any `vcs-versioning<3`; since 2.4.1 removed
  it,
  a build without a detectable version failed with
  `TypeError: _version_missing() got an unexpected keyword argument 'tool'`
  instead of the `LookupError` that says how to set a version. The keyword is
  ignored; the tool is taken from the configuration's environment. ([#1550]( ))

- The error raised when a `.jj/` directory is found but `jj` is not installed
  now names the environment variables that actually disable jj discovery
  (`SETUPTOOLS_SCM_DISABLE_JJ=1` / `VCS_VERSIONING_DISABLE_JJ=1`) instead of an
  unprefixed `DISABLE_JJ=1`, which was never read. ([#1537]( ))
- The "unable to detect version" error now names the environment variables the
  running integration actually reads. It previously suggested
  `SETUPTOOLS_SCM_PRETEND_VERSION_FOR_${NORMALIZED_DIST_NAME}` unconditionally,
  which is not read by `vcs-versioning` on its own (or by any other integrator),
  and it named setuptools-scm as the failing tool regardless of which one ran.

  When the distribution name is known the suggested variable is spelled out in
  full. When it is not, the generic variables are suggested instead, with a note
  that the per-distribution `..._FOR_<DIST>` form needs a dist name to match --
  the previous message offered a `${NORMALIZED_DIST_NAME}` template that could
  never be filled in. ([#1539]( ))
- Warn when file discovery is suppressed while a VCS marker sits in the
  project directory. `scm_search_known_failed()` means an integrator already
  looked and found no checkout, so a `.git`, `.hg` or `.jj` right there
  contradicts it and the artifact is about to lose every tracked file. That
  combination was the signature of the pretend-version regression and stayed
  invisible for three releases. Parent directories are not searched, since an
  unpacked sdist inside an unrelated checkout is the case the suppression
  exists for, and roots listed in `IGNORE_VCS_ROOTS` are skipped. ([#1540]( ))

- Environment variable names are now built in one place (`env_var_name` /
  `EnvReader.candidate_names`), shared by the lookup in `EnvReader.read` and by
  every error message that suggests a variable, so a message cannot name a
  variable the lookup would not honour.

The "repository found in a parent directory" error no longer offers a
  `get_version(relative_to=...)` call to integrators that do not ship one; the
  remaining options are renumbered instead. ([#1539]( ))

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 ...{python3-vcs-versioning_2.4.1.bb => python3-vcs-versioning_2.5.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-vcs-versioning_2.4.1.bb b/meta/recipes-devtools/python/python3-vcs-versioning_2.5.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-vcs-versioning_2.4.1.bb
rename to meta/recipes-devtools/python/python3-vcs-versioning_2.5.0.bb
index 36bb2856a0ba..16e009c16dbd 100644
--- a/meta/recipes-devtools/python/python3-vcs-versioning_2.4.1.bb
+++ b/meta/recipes-devtools/python/python3-vcs-versioning_2.5.0.bb
@@ -5,7 +5,7 @@ library that can be used independently of setuptools."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c9b06ad2ebd7e2e82d34b3caf353e7d5"
 
-SRC_URI[sha256sum] = "d4575de3115ec9434393c87c80ffb0eb98a16056bfe2b11ce0f3a97aff67fe0a"
+SRC_URI[sha256sum] = "956a796e31f80fe714d219d6d1df15a6bf247d10f6d851bf4b98279d0a42da55"
 
 SRC_URI += "\
     file://run-ptest \

-- 
2.47.3


