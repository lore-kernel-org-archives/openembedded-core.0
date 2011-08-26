Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QwurY-0002s3-MH
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Aug 2011 13:46:16 +0200
Received: by fxg11 with SMTP id 11so2605338fxg.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2011 04:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=T73FqJHWwscrNn7/2M5EUnHXv+Lzco1yrvFdUSX5r6M=;
	b=sfiS03/7htHLtnvhKjcdg9DTH0vdH6cVk5enTIreamGLIJgclRfVou02DbcCU4cEa2
	YwsK1P18fpMf+6nFmOwhTSTSBeSEvdUW41umHRGPmQcf6uLcvnuC52E1r6VVWj0nof86
	Vu2QMFVL6MhMgCsJ9v+xcSW/W5R3/xgwvhExw=
Received: by 10.223.99.65 with SMTP id t1mr1462818fan.93.1314358888236;
	Fri, 26 Aug 2011 04:41:28 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id c7sm1256302fac.36.2011.08.26.04.41.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 26 Aug 2011 04:41:27 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Aug 2011 13:41:18 +0200
Message-Id: <1314358878-22817-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <20110826113143.GG5081@jama.jama.net>
References: <20110826113143.GG5081@jama.jama.net>
Subject: [PATCH] eglibc: fix gconv packaging after 5486cac29db6e67051fff7637a0abc9aeab661e5
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Aug 2011 11:46:16 -0000

* gconv is directory so test -f was always false as reported by Phil Blundell in
  http://lists.linuxtogo.org/pipermail/openembedded-core/2011-August/008973.html
* -e used also for localedef which is file, just to be more consistent

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/eglibc/eglibc-package.inc |    4 ++--
 meta/recipes-core/eglibc/eglibc_2.12.bb     |    2 +-
 meta/recipes-core/eglibc/eglibc_2.13.bb     |    2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes-core/eglibc/eglibc-package.inc
index 5308bb9..adda5e9 100644
--- a/meta/recipes-core/eglibc/eglibc-package.inc
+++ b/meta/recipes-core/eglibc/eglibc-package.inc
@@ -100,10 +100,10 @@ do_install_locale () {
 	if [ "${base_libdir}" != "${libdir}" ]; then
 		cp -fpPR ${D}${base_libdir}/* ${dest}${base_libdir}
 	fi
-	if [ -f ${D}${bindir}/localedef ]; then
+	if [ -e ${D}${bindir}/localedef ]; then
 		mv -f ${D}${bindir}/localedef ${dest}${bindir}
 	fi
-	if [ -f ${D}${libdir}/gconv ]; then
+	if [ -e ${D}${libdir}/gconv ]; then
 		mv -f ${D}${libdir}/gconv ${dest}${libdir}
 	fi
 	cp -fpPR ${D}${libdir}/* ${dest}${libdir}
diff --git a/meta/recipes-core/eglibc/eglibc_2.12.bb b/meta/recipes-core/eglibc/eglibc_2.12.bb
index 1a69bdc..a71c4d4 100644
--- a/meta/recipes-core/eglibc/eglibc_2.12.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.12.bb
@@ -1,7 +1,7 @@
 require eglibc.inc
 
 DEPENDS += "gperf-native"
-PR = "r22"
+PR = "r23"
 
 SRCREV = "14158"
 
diff --git a/meta/recipes-core/eglibc/eglibc_2.13.bb b/meta/recipes-core/eglibc/eglibc_2.13.bb
index f382448..3b19e7b 100644
--- a/meta/recipes-core/eglibc/eglibc_2.13.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.13.bb
@@ -3,7 +3,7 @@ require eglibc.inc
 SRCREV = "14157"
 
 DEPENDS += "gperf-native"
-PR = "r13"
+PR = "r14"
 PR_append = "+svnr${SRCPV}"
 
 EGLIBC_BRANCH="eglibc-2_13"
-- 
1.7.6.1



