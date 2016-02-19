Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 469307705C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Feb 2016 05:55:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u1J5t3KS027229
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 18 Feb 2016 21:55:03 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 18 Feb 2016 21:55:02 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <liezhi.yang@windriver.com>,
	<ross.burton@intel.com>, <richard.purdie@linuxfoundation.org>
Date: Fri, 19 Feb 2016 00:54:44 -0500
Message-ID: <efdeb9f6a0156843d4dee12d7c2e9c293ff55141.1455860789.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1455860789.git.hongxu.jia@windriver.com>
References: <cover.1455860789.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 6/6] git: fix installed-vs-shipped QA Issue
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
X-List-Received-Date: Fri, 19 Feb 2016 05:55:03 -0000
Content-Type: text/plain

Since commit set default libexecdir to $prefix/libexec
...
commit f35b2e29d9bfa817e64b83df11ebbbfe0f4e8e5c
Author: Ross Burton <ross.burton@intel.com>
Date:   Tue Apr 30 20:35:54 2013 +0100

    bitbake: set default libexecdir to $prefix/libexec
...

It casued '${D}${libdir}' does not exist, and the following
move operation incorrect which triggered QA Issue:
...
ERROR: git-2.7.0-r0 do_package: QA Issue: git: Files/directories were installed but not shipped in any package:
  /usr/lib64
  /usr/lib64/site_perl
  /usr/lib64/site_perl/5.22.1
...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/git/git.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index c19e0d4..a1d0300 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -50,6 +50,8 @@ perl_native_fixup () {
 
 	# ${libdir} is not applicable here, perl-native files are always
 	# installed to /usr/lib on both 32/64 bits targets.
+
+	mkdir -p ${D}${libdir}
 	mv ${D}${exec_prefix}/lib/perl-native/perl ${D}${libdir}
 	rmdir -p ${D}${exec_prefix}/lib/perl-native || true
 }
-- 
1.9.1


