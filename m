Return-Path: <i.efimov@inango-systems.com>
Received: from mail.inango-sw.com (mail.inango-systems.com [213.136.71.184])
	by mail.openembedded.org (Postfix) with ESMTP id 392197C70F
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Mar 2019 19:26:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.inango-sw.com (Postfix) with ESMTP id 7F2537A24DE
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Mar 2019 21:26:59 +0200 (IST)
Received: from mail.inango-sw.com ([127.0.0.1])
	by localhost (mail.inango-sw.com [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id NaWn_vuGuv-w; Sun,  3 Mar 2019 21:26:57 +0200 (IST)
Received: from localhost (localhost [127.0.0.1])
	by mail.inango-sw.com (Postfix) with ESMTP id 515C27A24DD;
	Sun,  3 Mar 2019 21:26:57 +0200 (IST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.inango-sw.com 515C27A24DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inango-systems.com;
	s=45A440E0-D841-11E8-B985-5FCC721607E0; t=1551641217;
	bh=4kJUnEWjUKMzbgmeYiFYM0tQg9h0+Lr5RPjuBTfE02c=;
	h=From:To:Date:Message-Id;
	b=bnfr0OhDvYAMPvK2GCMtTF/WVGV1Nq3VIS/zs+95fbiG2GCnEwnRmtfIJlZ14NkGE
	qnwfAc4LCw5jQzDQA3obHLgqpb/Snt6A7/x0NRzUvzzP3KtygA7f0xfuaDbaOzwL1N
	+hf+Jz2C+Gu1XhMbPpanCGdFq/rqEcKTnEuW7PdEq3t801wNT7u/vcgRRA9LrHNmam
	6fbzy7u7gRc5Skchy8ghug8VlppQAZd4k8xddW32uysZMXqQC/8dXk1dQ5/YeFV1nl
	pPxI0l8sNx98oGHXwhgu9PQtkGnEFuflkWJnpLnQsTQ1sSjp0VkAeG4hJ+5pPcCnHU
	CL9KHF8ZtCmyg==
X-Virus-Scanned: amavisd-new at inango-sw.com
Received: from mail.inango-sw.com ([127.0.0.1])
	by localhost (mail.inango-sw.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id NrLcvQVNW6pz; Sun,  3 Mar 2019 21:26:57 +0200 (IST)
Received: from ivane-1.inango-sw (unknown [194.60.247.123])
	by mail.inango-sw.com (Postfix) with ESMTPSA id CB10D7A24DC;
	Sun,  3 Mar 2019 21:26:56 +0200 (IST)
From: Ivan Efimov <i.efimov@inango-systems.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Mar 2019 00:26:46 +0500
Message-Id: <20190303192646.13696-1-i.efimov@inango-systems.com>
X-Mailer: git-send-email 2.14.1
Subject: [morty][PATCH v3] perl, do_install_ptest_base: add "--" into "tar" command line
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
X-List-Received-Date: Sun, 03 Mar 2019 19:26:59 -0000

Add explicit separator "--" between options and arguments in "tar"
command to avoid mistakenly detection file with name starts with "-" as
an unknown option

Steps for reproduce issue:

* Add next variables into "conf/local.conf":

  CC_append_pn-perl = " -MD -Ml,M"
  CXX_append_pn-perl = " -MD -Ml,M"

* Then "bitbake perl"
* Task "do_install_ptest_base" will fail with error:

    tar: invalid option -- '.'

  because of presence next file

    tmp/work/i586-poky-linux/perl/5.22.1-r0/perl-5.22.1/-.d

  which starts from minus (-) sign and Yocto tries to run:

    tar <options> -.d <other files>

  and "tar" parse "-.d" as a option instead of file

Signed-off-by: Ivan Efimov <i.efimov@inango-systems.com>
---
 meta/recipes-devtools/perl/perl-ptest.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/perl/perl-ptest.inc b/meta/recipes-devtools/perl/perl-ptest.inc
index d136c5c0e4..51367b5ed9 100644
--- a/meta/recipes-devtools/perl/perl-ptest.inc
+++ b/meta/recipes-devtools/perl/perl-ptest.inc
@@ -9,7 +9,7 @@ do_install_ptest () {
 	sed -e "s:\/opt:\/usr:" -i Porting/add-package.pl
 	sed -e "s:\/local\/gnu\/:\/:" -i hints/cxux.sh
 	tar -c --exclude=\*.o --exclude=libperl.so --exclude=Makefile --exclude=makefile --exclude=hostperl \
-		--exclude=miniperl --exclude=generate_uudmap --exclude=patches * | ( cd ${D}${PTEST_PATH} && tar -x )
+		--exclude=miniperl --exclude=generate_uudmap --exclude=patches -- * | ( cd ${D}${PTEST_PATH} && tar -x )
 
 	sed -i -e "s,${D},,g" \
 	       -e "s,--sysroot=${STAGING_DIR_HOST},,g" \
-- 
2.14.1


