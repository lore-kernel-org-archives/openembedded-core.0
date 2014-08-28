Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AD63E617B8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 05:40:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7S5e7CW026997
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Aug 2014 22:40:07 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 27 Aug 2014 22:40:07 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 27 Aug 2014 22:40:05 -0700
Message-ID: <cf4a1ff22d094474723cd6dbbf267088e6d6d548.1409204283.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1409204283.git.liezhi.yang@windriver.com>
References: <cover.1409204283.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] perl-native: fixed bad interpreter error
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
X-List-Received-Date: Thu, 28 Aug 2014 05:40:10 -0000
Content-Type: text/plain

We may get the error on some hosts when build in deeper dir:
/bin/sh: /path/to/tmp/sysroots/i686-linux/usr/bin/perl-native/pod2man: /path/to/tmp/sysroots/i686-li:
bad interpreter: No such file or directory

Note the "i686-li", it should be "i686-linux", but is truncated by the
host.

We can use "/usr/bin/env nativeperl" as we have done in cpan.bbclass for
other recipe's perl script to fix the problem.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/perl/perl-native_5.20.0.bb |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/perl/perl-native_5.20.0.bb b/meta/recipes-devtools/perl/perl-native_5.20.0.bb
index 4364d41..069696a 100644
--- a/meta/recipes-devtools/perl/perl-native_5.20.0.bb
+++ b/meta/recipes-devtools/perl/perl-native_5.20.0.bb
@@ -105,6 +105,11 @@ do_install () {
 
 	create_wrapper ${D}${bindir}/perl PERL5LIB='$PERL5LIB:${STAGING_LIBDIR}/perl/${PV}:${STAGING_LIBDIR}/perl/'
 	create_wrapper ${D}${bindir}/perl${PV} PERL5LIB='$PERL5LIB:${STAGING_LIBDIR}/perl/${PV}:${STAGING_LIBDIR}/perl/'
+
+	# Use /usr/bin/env nativeperl for the perl script.
+	for f in `grep -Il '#! *${bindir}/perl' ${D}/${bindir}/*`; do
+		sed -i -e 's|${bindir}/perl|/usr/bin/env nativeperl|' $f
+	done
 }
 
 SYSROOT_PREPROCESS_FUNCS += "perl_sysroot_create_wrapper"
-- 
1.7.9.5


