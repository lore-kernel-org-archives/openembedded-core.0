Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 244BA70016
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Nov 2016 05:51:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uA95pxX4026810
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Nov 2016 21:51:59 -0800 (PST)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 8 Nov 2016 21:51:58 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 9 Nov 2016 13:51:07 +0800
Message-ID: <20161109055107.2250-1-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
MIME-Version: 1.0
Subject: [PATCH] classes/cpan-base: fix for PERLVERSION
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
X-List-Received-Date: Wed, 09 Nov 2016 05:51:59 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Immediate expansion of get_perl_version() is too early for
PERLVERSION, it will result in 'None' before perl is built
and packages that rely on this veriable fail to work with
the incorrect version.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/classes/cpan-base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cpan-base.bbclass b/meta/classes/cpan-base.bbclass
index 55ac052..48d53cc 100644
--- a/meta/classes/cpan-base.bbclass
+++ b/meta/classes/cpan-base.bbclass
@@ -36,5 +36,5 @@ def is_target(d):
 
 PERLLIBDIRS = "${libdir}/perl"
 PERLLIBDIRS_class-native = "${libdir}/perl-native"
-PERLVERSION := "${@get_perl_version(d)}"
+PERLVERSION = "${@get_perl_version(d)}"
 PERLVERSION[vardepvalue] = ""
-- 
2.8.3


