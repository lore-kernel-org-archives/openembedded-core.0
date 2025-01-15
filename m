Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA2B1C02180
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 16:33:34 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.26129.1736958812221800829
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 08:33:32 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1009911FB
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 08:34:00 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5321A3F673
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 08:33:31 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] autoconf: rename autotools_aclocals and only run in do_configure
Date: Wed, 15 Jan 2025 16:33:18 +0000
Message-ID: <20250115163318.1110804-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250115163318.1110804-1-ross.burton@arm.com>
References: <20250115163318.1110804-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 16:33:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209922

Despite the name, autotools_aclocals() doesn't actually do anything with
aclocal. Instead it reads all of the available autoconf site default
files[1] and sets CONFIG_SITE appropriately. Rename the function to
autotools_sitefiles to make this clear.

Also there's no need to do this before do_configure or do_install, as
the variable is only checked when configure runs.

[1] https://www.gnu.org/software/autoconf/manual/autoconf-2.69/html_node/=
Site-Defaults.html

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/autotools.bbclass | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/classes-recipe/autotools.bbclass b/meta/classes-recipe/=
autotools.bbclass
index 99d3cb75833..b1829e83e24 100644
--- a/meta/classes-recipe/autotools.bbclass
+++ b/meta/classes-recipe/autotools.bbclass
@@ -134,12 +134,11 @@ EXTRACONFFUNCS ??=3D ""
=20
 EXTRA_OECONF:append =3D " ${PACKAGECONFIG_CONFARGS}"
=20
-do_configure[prefuncs] +=3D "autotools_preconfigure autotools_aclocals $=
{EXTRACONFFUNCS}"
-do_compile[prefuncs] +=3D "autotools_aclocals"
-do_install[prefuncs] +=3D "autotools_aclocals"
+do_configure[prefuncs] +=3D "autotools_preconfigure autotools_sitefiles =
${EXTRACONFFUNCS}"
 do_configure[postfuncs] +=3D "autotools_postconfigure"
=20
-python autotools_aclocals () {
+# Tell autoconf to load the site defaults from siteinfo
+python autotools_sitefiles () {
     sitefiles, searched =3D siteinfo_get_files(d, sysrootcache=3DTrue)
     d.setVar("CONFIG_SITE", " ".join(sitefiles))
 }
--=20
2.43.0


