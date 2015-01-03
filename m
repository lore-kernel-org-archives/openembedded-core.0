Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1F9E7727D9
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Jan 2015 14:39:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t03EdOft019445
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 3 Jan 2015 06:39:24 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Sat, 3 Jan 2015 06:39:24 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 3 Jan 2015 06:39:20 -0800
Message-ID: <2c3c33715c6ea9751815f1c63d687c3c5b34d7c7.1420295873.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1420295873.git.liezhi.yang@windriver.com>
References: <cover.1420295873.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] cpan-base.bbclass: avoid using immmediate assignment for PERLLIBDIRS
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
X-List-Received-Date: Sat, 03 Jan 2015 14:39:30 -0000
Content-Type: text/plain

The immediate assignment:
PERLLIBDIRS := "${@perl_get_libdirs(d)}"

may cause PERLLIBDIRS get wrong values when multilib, for example, when
the default target arch is x86_64 (/usr/lib64), and mutilib is lib32
(/usr/lib), the ":=" would cause lib32-BPN's PERLLIBDIRS to be
/usr/lib64, and lead to build errors.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/cpan-base.bbclass |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/cpan-base.bbclass b/meta/classes/cpan-base.bbclass
index d9817ba..0860bee 100644
--- a/meta/classes/cpan-base.bbclass
+++ b/meta/classes/cpan-base.bbclass
@@ -42,8 +42,8 @@ def is_target(d):
         return "yes"
     return "no"
 
-PERLLIBDIRS := "${@perl_get_libdirs(d)}"
-PERLVERSION := "${@get_perl_version(d)}"
+PERLLIBDIRS = "${@perl_get_libdirs(d)}"
+PERLVERSION = "${@get_perl_version(d)}"
 PERLVERSION[vardepvalue] = ""
 
 FILES_${PN}-dbg += "${PERLLIBDIRS}/auto/*/.debug \
-- 
1.7.9.5


