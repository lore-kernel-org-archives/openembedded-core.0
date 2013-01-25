Received: from mail-da0-f53.google.com ([209.85.210.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TypQW-0008DY-8h
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Jan 2013 20:59:08 +0100
Received: by mail-da0-f53.google.com with SMTP id x6so315253dac.40
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2013 11:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=gw7pqQg4NLBLYOkEmONqngSN0UkR1Y7lRC4DzBMY7Cg=;
	b=m0HdtP4FZnE/oIIbgxcw5GmjSSDJ3yjnJXA4rD6SjFHJjf8XqnLdXI81czD9UYwdJz
	89u5iP5QMDyoFYPkPJfsRPJYtms2Y0jgTbReJDY2uc/4gxr5xCJTHoSGkIqCfKUYZB9E
	bwNfVIB9KMmfZLLHQDt08C7y1rXr/9uwxX6+WdBf/pnd3BwPvo5uUqjVa283MvVhubp3
	KhnOY8jgOSAH5A6Szy/HyQ1fM/xYRdN+qFMcLfwFbnLPduluyyu37XIIZtCbwZ9Cj9/t
	FxgWYGWRfF18i84rhmgLadgmN91u3FuFzHUaW5Pe5gZEjVD9slmz12i00PlfUlqFayUj
	rKXQ==
X-Received: by 10.68.135.40 with SMTP id pp8mr16890675pbb.63.1359143009028;
	Fri, 25 Jan 2013 11:43:29 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id z10sm1382994pax.38.2013.01.25.11.43.26
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 11:43:28 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Jan 2013 20:42:52 +0100
Message-Id: <be5af0856eca4f864731dd10456445a3d3979d0f.1359142768.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.1
In-Reply-To: <cover.1359142768.git.Martin.Jansa@gmail.com>
References: <cover.1359142768.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1359142768.git.Martin.Jansa@gmail.com>
References: <cover.1359142768.git.Martin.Jansa@gmail.com>
Subject: [PATCH 5/7] eglibc-scripts: don't package mtrace, RDEPEND on eglibc-mtrace instead, fix RDEPENDS
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
X-List-Received-Date: Fri, 25 Jan 2013 19:59:12 -0000

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



