Return-Path: <i.efimov@inango-systems.com>
Received: from mail.inango-sw.com (mail.inango-systems.com [213.136.71.184])
	by mail.openembedded.org (Postfix) with ESMTP id C36E27CB35
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Mar 2019 17:38:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.inango-sw.com (Postfix) with ESMTP id 641B07A24D7
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Mar 2019 19:38:23 +0200 (IST)
Received: from mail.inango-sw.com ([127.0.0.1])
	by localhost (mail.inango-sw.com [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id oMXzREIn3MaA; Sun,  3 Mar 2019 19:38:21 +0200 (IST)
Received: from localhost (localhost [127.0.0.1])
	by mail.inango-sw.com (Postfix) with ESMTP id 357047A24D5;
	Sun,  3 Mar 2019 19:38:21 +0200 (IST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.inango-sw.com 357047A24D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inango-systems.com;
	s=45A440E0-D841-11E8-B985-5FCC721607E0; t=1551634701;
	bh=I0x7E5uQ9yrsjcjC9CmFveVmRrK1e3oze+39pIwBMJ8=;
	h=From:To:Date:Message-Id;
	b=GXbtKnZgif/H/ti3MNy6HCIRPb2OvvKllFZj0OrD/l/Md81Tbypenu9YIOH/yx2fW
	NZgGXb9dduSXBnH6R42uTScye/JYOivBJxeG2ER/441UYrxsq6jTggwrYyWySF3Ykm
	WqlSyKdgq1gP/QvN1jKEaB0lFA8A3dnrDHZRCz6Z8/4LgxZT6Jk0TO78CuxdI2/fGj
	sP4+Pe794uPQI44/+qbbhN0J9AHRb7bCUZixl6vuWHXlEmrg/86WwFG9jO/NBGiy3F
	oawyklnWVJdMxb3cAEj+1jpITCtmZb0l4IgQZffvmgFUI4ac9kfFX1gerf2z3FwsV+
	Yv6Fku6cM+ULQ==
X-Virus-Scanned: amavisd-new at inango-sw.com
Received: from mail.inango-sw.com ([127.0.0.1])
	by localhost (mail.inango-sw.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id ECJk6GUhfqkd; Sun,  3 Mar 2019 19:38:21 +0200 (IST)
Received: from ivane-1.inango-sw (unknown [194.60.247.123])
	by mail.inango-sw.com (Postfix) with ESMTPSA id BBBCA7A24B9;
	Sun,  3 Mar 2019 19:38:20 +0200 (IST)
From: Ivan Efimov <i.efimov@inango-systems.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  3 Mar 2019 22:38:08 +0500
Message-Id: <20190303173808.12198-1-i.efimov@inango-systems.com>
X-Mailer: git-send-email 2.14.1
Subject: [morty][PATCH v2] perl, do_install_ptest_base: add "--" into "tar" command line
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
X-List-Received-Date: Sun, 03 Mar 2019 17:38:23 -0000

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

Upstream-Status: Pending

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


