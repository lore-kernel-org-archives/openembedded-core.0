Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9016C4332F
	for <webhook@archiver.kernel.org>; Tue,  9 Nov 2021 14:38:13 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web08.12976.1636468691816879860
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Nov 2021 06:38:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10162"; a="229915803"
X-IronPort-AV: E=Sophos;i="5.87,220,1631602800";
   d="scan'208";a="229915803"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2021 06:38:12 -0800
X-IronPort-AV: E=Sophos;i="5.87,220,1631602800";
   d="scan'208";a="641956790"
Received: from chinboon-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.234.207])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2021 06:38:11 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 03/26] dpkg: Install dkpg-perl scripts to versioned
 perl directory
Date: Tue,  9 Nov 2021 22:37:38 +0800
Message-Id: 
 <37030893cdabdce935defc6f468309d8cd275e53.1636467986.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1636467986.git.anuj.mittal@intel.com>
References: <cover.1636467986.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Nov 2021 14:38:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158024

From: Manuel Leonhardt <mleonhardt@arri.de>

Install dpkg-perl scripts to versioned perl directory, otherwise the
following traceback happens when running, e.g. dpkg-architecture on the
target:

Can't locate Dpkg.pm in @INC (you may need to install the Dpkg module)
  (@INC contains: /usr/lib/perl5/site_perl/5.30.1/aarch64-linux
  /usr/lib/perl5/site_perl/5.30.1
  /usr/lib/perl5/vendor_perl/5.30.1/aarch64-linux
  /usr/lib/perl5/vendor_perl/5.30.1
  /usr/lib/perl5/5.30.1/aarch64-linux
  /usr/lib/perl5/5.30.1 .) at /usr/bin/dpkg-architecture line 25.

Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Manuel Leonhardt <mleonhardt@arri.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bdd4757ae057c7b3bfe27353fa25c4d7807a86ce)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/dpkg/dpkg.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index b6807b004f..74074cfdd7 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -15,7 +15,7 @@ inherit autotools gettext perlnative pkgconfig perl-version update-alternatives
 
 PERL:class-native = "${STAGING_BINDIR_NATIVE}/perl-native/perl"
 
-export PERL_LIBDIR = "${libdir}/perl/${@get_perl_version(d)}"
+export PERL_LIBDIR = "${libdir}/perl5/${@get_perl_version(d)}"
 PERL_LIBDIR:class-native = "${libdir}/perl-native/perl/${@get_perl_version(d)}"
 
 EXTRA_OECONF = "\
@@ -66,7 +66,7 @@ FILES:update-alternatives-dpkg = "${bindir}/update-alternatives ${localstatedir}
 RPROVIDES:update-alternatives-dpkg += "update-alternatives"
 
 PACKAGES += "${PN}-perl"
-FILES:${PN}-perl = "${libdir}/perl/${@get_perl_version(d)}"
+FILES:${PN}-perl = "${libdir}/perl5/${@get_perl_version(d)}"
 
 RDEPENDS:${PN}-perl += "perl-module-carp perl-module-constant \
                         perl-module-cwd perl-module-digest \
-- 
2.31.1


