Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web10.4790.1594242486948020542
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2020 14:08:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=ikGvVXYI;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=z9mr=at=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 4B2BjJ1Mtmz4K
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Jul 2020 23:08:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1594242484;
	bh=5kaAbXdbwbc185zcvUCYrkSODxpFE2OaBhnAZiUJ+Kc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ikGvVXYIUUSUaTynlEvxPGHPHEcf5wf5BvSBl95GnAmb9tEHp8zrcp8Oblm2wwd/h
	 Av0iHd5Rf//gyjaGblma6KQE40rqfTBcabXKh58hijxVrTr/Lwb+Qxc0TlaDDsECSE
	 t20N/XJdjr9Lc+1EjCckYaN5OrtHhbn/TBzbjirBccR+i0bDfcVSUnaAYQNr5KFjBP
	 F6bkZVf3UR4jI82tU4yH+VRcnIsSriopiOEGk2qHBrnOVjlI2a9QmCk/inwPthICUZ
	 UHMmRaX5WKxlflLYzSLZ4rBMUHM7mPHdFw43SSMkhmbDOk3i+YPLqtnZ4n6gZ5YMJN
	 9zktEGW4NmjmrENBvKciPEhro5r1gTRTRZRaWAepAk4Wf0QW32YGOvgIap/pvsxCLG
	 A3fFZc1ZTSOc74AP22GlW1gccbrZzP+U4iiNEGTJToIsvwHcWzoC3MFSS20YlsjBBi
	 H1GVoG6Tp2QcfhQiaCUyPfjvEuyAvPFvkyBayKauxz4WuRFEL8sLw+Hf0swWvC555v
	 It2YLcToSN/2Weri1PQBEXTEAZVZerJ9t5MpIR9VWZFxGN0amGZULjuGfN+Kx4wGTC
	 xjlCH7CfiFHjyjhMwP6g+kYETA+oo2JWvFzjqwsK3gaBUbpnIjwo2XAWa0h/4Z+CK6
	 hwAYYIt7umY7TaedKJrEXGIg=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][zeus][PATCH 03/19] sqlite: backport CVE fix
Date: Thu,  9 Jul 2020 00:07:45 +0300
Message-Id: <20200708210801.5553-3-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200708210801.5553-1-bunk@stusta.de>
References: <20200708210801.5553-1-bunk@stusta.de>

From: Sakib Sajal <sakib.sajal@windriver.com>

Fixes CVE-2020-11655

(From OE-Core rev: 3b06a6c73f4e49c6d00f758423c2e8865ec2de00)

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
[ without the CVE-2020-11656 fix that did not apply cleanly ]
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../sqlite/files/CVE-2020-11655.patch         | 32 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.29.0.bb |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2020-11655.patch

diff --git a/meta/recipes-support/sqlite/files/CVE-2020-11655.patch b/meta/recipes-support/sqlite/files/CVE-2020-11655.patch
new file mode 100644
index 0000000000..e30c482bbb
--- /dev/null
+++ b/meta/recipes-support/sqlite/files/CVE-2020-11655.patch
@@ -0,0 +1,32 @@
+From a4601326d61bf1a11151ac6b78b50804bfd03b4d Mon Sep 17 00:00:00 2001
+From: Sakib Sajal <sakib.sajal@windriver.com>
+Date: Thu, 30 Apr 2020 10:46:16 -0700
+Subject: [PATCH 2/2] In the event of a semantic error in an aggregate query,
+ early-out the resetAccumulator() function to prevent problems due to
+ incomplete or incorrect initialization of the AggInfo object. Fix for ticket
+ [af4556bb5c285c08].
+
+FossilOrigin-Name: 4a302b42c7bf5e11ddb5522ca999f74aba397d3a7eb91b1844bb02852f772441
+Upstream Status: Backport [c415d91007e1680e4eb17def583b202c3c83c718]
+
+CVE: CVE-2020-11655
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ sqlite3.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index 1df6633..726adf7 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -133242,6 +133242,7 @@ static void resetAccumulator(Parse *pParse, AggInfo *pAggInfo){
+   struct AggInfo_func *pFunc;
+   int nReg = pAggInfo->nFunc + pAggInfo->nColumn;
+   if( nReg==0 ) return;
++  if( pParse->nErr ) return;
+ #ifdef SQLITE_DEBUG
+   /* Verify that all AggInfo registers are within the range specified by
+   ** AggInfo.mnReg..AggInfo.mxReg */
+-- 
+2.17.1
+
diff --git a/meta/recipes-support/sqlite/sqlite3_3.29.0.bb b/meta/recipes-support/sqlite/sqlite3_3.29.0.bb
index cf3b179845..95e1174b07 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.29.0.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.29.0.bb
@@ -12,6 +12,7 @@ SRC_URI = "http://www.sqlite.org/2019/sqlite-autoconf-${SQLITE_PV}.tar.gz \
            file://CVE-2019-19926.patch \
            file://CVE-2019-19959.patch \
            file://CVE-2019-20218.patch \
+           file://CVE-2020-11655.patch \
 "
 SRC_URI[md5sum] = "8f3dfe83387e62ecb91c7c5c09c688dc"
 SRC_URI[sha256sum] = "8e7c1e2950b5b04c5944a981cb31fffbf9d2ddda939d536838ebc854481afd5b"
-- 
2.17.1

