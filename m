Received: from mail-da0-f49.google.com ([209.85.210.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tynak-00027o-LG
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Jan 2013 19:01:30 +0100
Received: by mail-da0-f49.google.com with SMTP id v40so271964dad.22
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2013 09:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=gw7pqQg4NLBLYOkEmONqngSN0UkR1Y7lRC4DzBMY7Cg=;
	b=0iurU08YM11EPmomqqBgzFV2fyPENDgLe92ahDoUxnH/IPlQDgmFtghDxCWgHLTVX5
	E8tiVRz3lC/rgUNUKVsV0hEotrFk3varq1/+Pj48wOiW9NAHsjz81TE4aQNNfi+o7zcE
	MfDDP5hM2+77TJCOAnleZzltBV6u8544WTtBWXD5J+5u6VJETwTIJ0ouruyr2joS2tQj
	x9mUDc4oGTG79JxyJwSSx5BSrwpwbTD6aK4iq+m0aYszRJGMURLUxYn3RLWhPBjjfhEp
	+KmsxB1h92J7DTP+bsFmkc9Kr13/1QdbBXFQbrpCfBeKMrjTl7U5MOcX508hmTh1LXTf
	pAKQ==
X-Received: by 10.68.135.99 with SMTP id pr3mr16128575pbb.151.1359135955195;
	Fri, 25 Jan 2013 09:45:55 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id p10sm1235523pax.27.2013.01.25.09.45.52
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 09:45:54 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Jan 2013 18:45:42 +0100
Message-Id: <1359135942-21309-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.1
Subject: [PATCH] eglibc-scripts: don't package mtrace, RDEPEND on eglibc-mtrace instead, fix RDEPENDS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 25 Jan 2013 18:01:30 -0000

* eglibc-mtrace and eglibc-scripts provide the same mtrace script
* remove mtrace from eglibc-scripts and replace it with RDEPENDS
* mtrace also needs perl (eglibc-mtrace has correct RDEPENDS), bash is
  for sotruss and xtrace
* remove invalid RDEPENDS_ldd, ldd is now using /bin/sh and is not
  packaged by eglibc-scripts
* fixes error in world-image build:
  * check_data_file_clashes: Package eglibc-mtrace wants to install file
    rootfs/usr/bin/mtrace
    But that file is already provided by package  * eglibc-scripts

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/eglibc/eglibc-scripts.inc | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc-scripts.inc b/meta/recipes-core/eglibc/eglibc-scripts.inc
index a020961..9ca6673 100644
--- a/meta/recipes-core/eglibc/eglibc-scripts.inc
+++ b/meta/recipes-core/eglibc/eglibc-scripts.inc
@@ -2,12 +2,11 @@ include eglibc-collateral.inc
 
 SUMMARY = "utility scripts provided by eglibc"
 DESCRIPTION = "utility scripts provided by eglibc"
-RDEPENDS_${PN} = "bash"
-RDEPENDS_ldd = "bash"
+RDEPENDS_${PN} = "bash eglibc-mtrace"
 
 SRC = "${STAGING_INCDIR}/eglibc-scripts-internal-${MULTIMACH_TARGET_SYS}"
 
-bashscripts = "mtrace sotruss xtrace"
+bashscripts = "sotruss xtrace"
 
 do_install() {
 	install -d -m 0755 ${D}${bindir}
-- 
1.8.1.1



