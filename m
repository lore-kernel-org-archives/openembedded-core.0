Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0780371B1D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2019 14:48:28 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x0LEmTmq019674
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2019 06:48:29 -0800 (PST)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Mon, 21 Jan 2019 06:48:28 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 21 Jan 2019 09:48:24 -0500
Message-ID: <20190121144824.172600-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Subject: [PATCH] perl-native: unset configure symbol i_xlocale
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
X-List-Received-Date: Mon, 21 Jan 2019 14:48:29 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

perl-native checks xlocale.h on build machine. But xlocale.h has been
removed by glibc already. When use share state caches between machines
that one has xlocale.h but the other one doesn't, it causes packages
which depend on perl-native such as libdbi-perl-native fails to compile:

| In file included from DBIXS.h:23,
|                  from Perl.xs:7:
| .../tmp-glibc/work/x86_64-linux/libdbi-perl-native/1.642-r0/recipe-sysroot-native/usr/lib/perl5/5.28.1/x86_64-linux/CORE/perl.h:723:13:
| fatal error: xlocale.h: No such file or directory
|  #   include <xlocale.h>
|	       ^~~~~~~~~~~
| compilation terminated.

Unset configure symbol i_xlocale for perl-native to fix the issue.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-devtools/perl-sanity/perl_5.28.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/perl-sanity/perl_5.28.1.bb b/meta/recipes-devtools/perl-sanity/perl_5.28.1.bb
index 71892a2436..0969efea11 100644
--- a/meta/recipes-devtools/perl-sanity/perl_5.28.1.bb
+++ b/meta/recipes-devtools/perl-sanity/perl_5.28.1.bb
@@ -81,7 +81,8 @@ do_configure_class-native() {
     -Dbin=${bindir}/perl-native \
     -Duseshrplib \
     -Dsoname=libperl.so.5 \
-    -Dvendorprefix=${prefix}
+    -Dvendorprefix=${prefix} \
+    -Ui_xlocale
 }
 
 do_compile() {
-- 
2.20.0


