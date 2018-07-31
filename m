Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8629774745
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2018 11:06:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w6VB6ZHs011569
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 31 Jul 2018 04:06:35 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.399.0;
	Tue, 31 Jul 2018 04:06:34 -0700
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <raj.khem@gmail.com>
Date: Tue, 31 Jul 2018 04:06:34 -0700
Message-ID: <20180731110634.29361-1-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH] poky-lsb: security_flags.inc
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
X-List-Received-Date: Tue, 31 Jul 2018 11:06:34 -0000
Content-Type: text/plain

To fix the following error, we append '-O' to the defination of _FORTIFY_SOURCE

recipe-sysroot/usr/include/features.h:381:4: error: #warning _FORTIFY_SOURCE requires compiling with optimization (-O) [-Werror=cpp]
 #  warning _FORTIFY_SOURCE requires compiling with optimization (-O)
     ^~~~~~~

Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
---
 meta/conf/distro/include/security_flags.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index 6245e89ada..1c32fd3165 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -10,7 +10,7 @@ GCCPIE ?= "--enable-default-pie"
 
 # _FORTIFY_SOURCE requires -O1 or higher, so disable in debug builds as they use
 # -O0 which then results in a compiler warning.
-lcl_maybe_fortify = "${@oe.utils.conditional('DEBUG_BUILD','1','','-D_FORTIFY_SOURCE=2',d)}"
+lcl_maybe_fortify = "${@oe.utils.conditional('DEBUG_BUILD','1','','-D_FORTIFY_SOURCE=2 -O',d)}"
 
 # Error on use of format strings that represent possible security problems
 SECURITY_STRINGFORMAT ?= "-Wformat -Wformat-security -Werror=format-security"
-- 
2.11.0


