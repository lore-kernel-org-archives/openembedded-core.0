Return-Path: <Zhenbo.Gao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7C551731D2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2016 05:38:24 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u7V5cN71008770
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 30 Aug 2016 22:38:23 -0700 (PDT)
Received: from pek-zgao-d1.corp.ad.wrs.com (128.224.162.171) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Tue, 30 Aug 2016 22:38:22 -0700
From: Zhenbo Gao <zhenbo.gao@windriver.com>
To: <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>, <zhenbo.gao@windriver.com>
Date: Wed, 31 Aug 2016 13:37:58 +0800
Message-ID: <1472621878-5147-1-git-send-email-zhenbo.gao@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] perl: correct the path of perl used by ptest
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
X-List-Received-Date: Wed, 31 Aug 2016 05:38:26 -0000
Content-Type: text/plain

some files from perl-ptest depends on perl, which is located at /usr/bin/

Signed-off-by: Zhenbo Gao <zhenbo.gao@windriver.com>
---
 meta/recipes-devtools/perl/perl-ptest.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-devtools/perl/perl-ptest.inc b/meta/recipes-devtools/perl/perl-ptest.inc
index d136c5c..94e40e6 100644
--- a/meta/recipes-devtools/perl/perl-ptest.inc
+++ b/meta/recipes-devtools/perl/perl-ptest.inc
@@ -24,6 +24,12 @@ do_install_ptest () {
 
 	ln -sf ${bindir}/perl ${D}${PTEST_PATH}/t/perl
 
+	# perl is located at /usr/bin/
+	p='^#![/.]*perl'
+	files=`grep -E ${p} ${D} -nr | grep -v -E 'Binary|win32' | cut -d ':' -f 1`
+	for f in ${files}; do
+		sed -i -e "s:${p}:#! ${USRBINPATH}/perl:g" ${f}
+	done
 }
 
 python populate_packages_prepend() {
-- 
1.9.1


