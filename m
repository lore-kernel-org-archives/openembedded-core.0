Return-Path: <rbilovol@cisco.com>
Received: from aer-iport-3.cisco.com (aer-iport-3.cisco.com [173.38.203.53])
	by mail.openembedded.org (Postfix) with ESMTP id 3041C618A5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Mar 2020 11:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=1513; q=dns/txt; s=iport;
	t=1583409302; x=1584618902; h=from:to:subject:date:message-id;
	bh=uN0E5mz3ZKS5IwWQkaohE9zfWes5iLNN1WYGFhYGOrQ=;
	b=YT6KNEWshDnXNwMseA4m2T2SNeU7AsJ8C0kTP8jrjCYouoAKF8ya1ZaW
	zojy9gKKeuAyITQtwLWSXDNHTYXWPt7kqmgnLcRLjZNQA9XtUN60ZoD+o
	1Lp0QGclGFRzkTqLQWVRevyceaip34t3E9h4wOye2H936ta27xw0pfrUm A=;
X-IPAS-Result: =?us-ascii?q?A0DdAgAd6GBe/xbLJq1mHAEBAQEBBwEBEQEEBAEBgXuDF?=
	=?us-ascii?q?VQBIBIqjRiJEZo9CQEBAQ4fEAQBAYZ0OBMCAwEBAQMCAwEBAQEFAQEBAgEFB?=
	=?us-ascii?q?G2FVgyIIhKDJgGCe6w+gieFSoNCgT4UgSSHSIR5gUE/gRGCX3OEEoYoBLAhg?=
	=?us-ascii?q?kaHUo8IDByDSZdqAY51m3WBaSKBWDMaCBsVgycJRxgNl1iFDz8DMAKMQIJDA?=
	=?us-ascii?q?QE?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.70,517,1574121600"; d="scan'208";a="21737225"
Received: from aer-iport-nat.cisco.com (HELO aer-core-1.cisco.com)
	([173.38.203.22])
	by aer-iport-3.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
	05 Mar 2020 11:54:59 +0000
Received: from localhost ([10.63.15.135])
	by aer-core-1.cisco.com (8.15.2/8.15.2) with ESMTP id 025BswI9023091;
	Thu, 5 Mar 2020 11:54:59 GMT
From: Ruslan Bilovol <rbilovol@cisco.com>
To: alex.kanavin@gmail.com, openembedded-core@lists.openembedded.org,
	xe-linux-external@cisco.com
Date: Thu,  5 Mar 2020 13:53:33 +0200
Message-Id: <20200305115333.31139-1-rbilovol@cisco.com>
X-Mailer: git-send-email 2.17.1
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.63.15.135, [10.63.15.135]
X-Outbound-Node: aer-core-1.cisco.com
Subject: [PATCH RESEND] openssl: pass PERL=perl environment variable to configurator
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Mar 2020 11:55:01 -0000

In our build environment we use wrapper script
for perl in non-standard configuration with
extra variables set (provided by custom
buildtools-tarball).

In this case openssl fails to build because
by default it's Configure script detects and uses
perl executable directly (with absolute path)
obviously missing extra settings from wrapper
script.

Pass PERL=perl environment variable to Configure,
so it won't try to use perl executable directly
but will use what is provided from environment.

Signed-off-by: Ruslan Bilovol <rbilovol@cisco.com>
---
 meta/recipes-connectivity/openssl/openssl_1.1.1d.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
index c2ba005f47..d4871fe973 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
@@ -123,7 +123,7 @@ do_configure () {
 	fi
 	# WARNING: do not set compiler/linker flags (-I/-D etc.) in EXTRA_OECONF, as they will fully replace the
 	# environment variables set by bitbake. Adjust the environment variables instead.
-	PERL5LIB="${S}/external/perl/Text-Template-1.46/lib/" \
+	PERL=perl PERL5LIB="${S}/external/perl/Text-Template-1.46/lib/" \
 	perl ${S}/Configure ${EXTRA_OECONF} ${PACKAGECONFIG_CONFARGS} --prefix=$useprefix --openssldir=${libdir}/ssl-1.1 --libdir=${libdir} $target
 	perl ${B}/configdata.pm --dump
 }
-- 
2.17.1


