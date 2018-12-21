Return-Path: <rbilovol@cisco.com>
Received: from aer-iport-4.cisco.com (aer-iport-4.cisco.com [173.38.203.54])
	by mail.openembedded.org (Postfix) with ESMTP id 335EF79D7D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Dec 2018 21:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=1506; q=dns/txt; s=iport;
	t=1545427982; x=1546637582; h=from:to:subject:date:message-id;
	bh=RxWcUS+N9+SF9mIsVz8cZLwu7yI1EmGu74JlWnJubRM=;
	b=ZeasOMcY9OXQm9m4nAvgsf2RUFPqEwP2UGOV1CCYiIdJaNbAY3G+ppAH
	bxlp4JlegfCrLmCmvmYVzEs6KRiB68d6VO7y61plb9BdPNh2CHjIZthmW
	10+HQd6qYkJs3m2F95iMDH2PDionvXTRUjDCmp6gWB2KVyJeltpK/yd+D w=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0ALAAAmWx1c/xbLJq1kGwEBAQEDAQE?=
	=?us-ascii?q?BBwMBAQGBUQYBAQELAYJpcBInjBZfjiaWY4F7DR+HXzQJDQEDAQECAQECbRw?=
	=?us-ascii?q?MhnOBFQESgyIBggGnV4osFIdqhFiBQD+BEYJdhH+GFgKhRQmHEopXAhaCLY8?=
	=?us-ascii?q?xAYlTkEmBRjiBVjMaCBsVgycJi0eFDT0DMAGMZ4JNAQE?=
X-IronPort-AV: E=Sophos;i="5.56,383,1539648000"; 
   d="scan'208";a="8964693"
Received: from aer-iport-nat.cisco.com (HELO aer-core-4.cisco.com)
	([173.38.203.22])
	by aer-iport-4.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Dec 2018 21:33:00 +0000
Received: from localhost ([10.63.15.139])
	by aer-core-4.cisco.com (8.15.2/8.15.2) with ESMTP id wBLLX0lU001218;
	Fri, 21 Dec 2018 21:33:00 GMT
From: Ruslan Bilovol <rbilovol@cisco.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org, xe-linux-external@cisco.com
Date: Fri, 21 Dec 2018 23:33:00 +0200
Message-Id: <1545427980-17876-1-git-send-email-rbilovol@cisco.com>
X-Mailer: git-send-email 1.9.1
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.63.15.139, [10.63.15.139]
X-Outbound-Node: aer-core-4.cisco.com
Subject: [PATCH] openssl: pass PERL=perl environment variable to configurator
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
X-List-Received-Date: Fri, 21 Dec 2018 21:33:00 -0000

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
 meta/recipes-connectivity/openssl/openssl_1.1.1a.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
index 5c4e69c..6a72b5c 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
@@ -112,7 +112,7 @@ do_configure () {
 	fi
 	# WARNING: do not set compiler/linker flags (-I/-D etc.) in EXTRA_OECONF, as they will fully replace the
 	# environment variables set by bitbake. Adjust the environment variables instead.
-	PERL5LIB="${S}/external/perl/Text-Template-1.46/lib/" \
+	PERL=perl PERL5LIB="${S}/external/perl/Text-Template-1.46/lib/" \
 	perl ${S}/Configure ${EXTRA_OECONF} ${PACKAGECONFIG_CONFARGS} --prefix=$useprefix --openssldir=${libdir}/ssl-1.1 --libdir=${libdir} $target
 	perl ${B}/configdata.pm --dump
 }
-- 
1.9.1


