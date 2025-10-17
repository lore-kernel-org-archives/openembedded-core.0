Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F40B6CCD195
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 13:27:30 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.15404.1760707641117758822
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Oct 2025 06:27:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D065A1595
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 06:27:12 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6141E3F66E
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 06:27:20 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] classes/cargo_common: ensure B is clean
Date: Fri, 17 Oct 2025 14:27:17 +0100
Message-ID: <20251017132717.3074920-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251017132717.3074920-1-ross.burton@arm.com>
References: <20251017132717.3074920-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 13:27:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225022

The cargo class defaults to out-of-tree builds in WORKDIR/build, but
at no point was that directory cleaned.  This causes problems with the
rust standard library recipe (libstd-rs) which installs manually with cp,
so rebuilds can be contaminated with the contents of previous builds.

I believe that post-release we should switch cargo.bbclass to mandating
out-of-tree builds to reduce the complexity, but for now in out-of-tree
builds we can just delete the ${B}/target directory.

Note that we use ${B}/target because there at least were reasons to use
that name[1], it is unclear if these limitations still hold. We can't
simply clean ${B} because that will break recipes that use cargo and
something else to build, for example librsvg.

[1] https://github.com/rust-lang/cargo/pull/1657

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/cargo_common.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes-recipe/cargo_common.bbclass b/meta/classes-reci=
pe/cargo_common.bbclass
index c9eb2d09a52..bc44ad79186 100644
--- a/meta/classes-recipe/cargo_common.bbclass
+++ b/meta/classes-recipe/cargo_common.bbclass
@@ -110,6 +110,10 @@ cargo_common_do_configure () {
 	# Put build output in build directory preferred by bitbake instead of
 	# inside source directory unless they are the same
 	if [ "${B}" !=3D "${S}" ]; then
+		# We should consider mandating out-of-tree builds and just using [clea=
ndirs]
+		rm -rf ${B}/target
+		mkdir -p ${B}
+
 		cat <<- EOF >> ${CARGO_HOME}/config.toml
=20
 		[build]
--=20
2.43.0


