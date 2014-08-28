Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E2BBC71178
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 05:40:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7S5e834005134
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Aug 2014 22:40:08 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 27 Aug 2014 22:40:07 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 27 Aug 2014 22:40:06 -0700
Message-ID: <fd12f5beea3408e341292fe296678cf97ad743d1.1409204283.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1409204283.git.liezhi.yang@windriver.com>
References: <cover.1409204283.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] cpan.bbclass: matches more lines
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

Fixed:
- There might be a space between "#!" and "/pat/to/usr/bin/perl", e.g.:
  "#! /usr/bin/perl", now also matches it.

- There might be the lines like the following in the body:
  eval 'exec /path/to/usr/bin/perl-native/perl -S $0 ${1+"$@"}'

  Now we only check "#! */path/to/usr/bin/perl" to make sure it is a
  perl script, but match and fix the lines in both header and body.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/cpan.bbclass |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/cpan.bbclass b/meta/classes/cpan.bbclass
index 7088039..e2bbd2f 100644
--- a/meta/classes/cpan.bbclass
+++ b/meta/classes/cpan.bbclass
@@ -47,8 +47,8 @@ cpan_do_compile () {
 
 cpan_do_install () {
 	oe_runmake DESTDIR="${D}" install_vendor
-	for PERLSCRIPT in `grep -rIEl '#!${bindir}/perl-native.*/perl' ${D}`; do
-		sed -i -e 's|^#!${bindir}/perl-native.*/perl|#!/usr/bin/env nativeperl|' $PERLSCRIPT
+	for PERLSCRIPT in `grep -rIEl '#! *${bindir}/perl-native.*/perl' ${D}`; do
+		sed -i -e 's|${bindir}/perl-native.*/perl|/usr/bin/env nativeperl|' $PERLSCRIPT
 	done
 }
 
-- 
1.7.9.5


