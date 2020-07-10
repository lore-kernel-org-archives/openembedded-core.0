Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web11.5530.1594364309108458449
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2020 23:58:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=Ka7E8Sov;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=cw8d=av=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 4B33m14D6Gz4s
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2020 08:58:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1594364305;
	bh=Wpd0b5LN+ehb0Is5OPJYvwpU5tW7vau2NhjRVDI+gwA=;
	h=From:To:Subject:Date:From;
	b=Ka7E8SovF9eIwgDwcB8QPx7n5Wduws/39pRRMm8bRzl+rarU6bUVfDsGlbJZb5//6
	 mvtjykKe56yEnO5vXrUA+ea89LvKwZvWxhaDpBRaYZvYPcdzm/gID26LL4PGTOyttd
	 hXY5F/Q/iR3UMwh5SfWwVY3mh0NFTvyVeGzS7yD7nx79jMqkzEhzqt3YKbCwGmSMcP
	 jnFKvDMB2cc2RXAlqpf9ByUvZ+U9bb0lg95nHE4G6QTuVWEl1rstcS+wlVW6GX/pBv
	 9m+//wSowAVOyASLwzBBi5b3CSiS3T7I/AMrMNzq/fJZQTzjls+TxfLiOZ2IINwrfX
	 4U2ZVY6hlVvq9ZDOLlmNEgD7gqKZMfv8pryxyoAaIzHQwCDQPcoPwHJldkSDiAnofC
	 E86oyps6jqQhojJjFTCBdIatwSh27jD5uUwr0UFXOCth49OoL+HTdQ7in6/iQu+RLs
	 piS/PjrTiVLRK7FCRBcLrLotHE3dS/5TiGOjQ/akIZUwyhhIdEGERlR2KXXzEyDI+H
	 0l7H4bIuO3N8yoe3FZxQfUYUiiKxLwShWzz2tgRiHO5wjHACOlWWQwfKNM4wMohK8S
	 w5xMOBBx7WPn3ahJz1y0HDCy5uR3rVvmfDgMUBRW8hMTbct8myMazpTLGeYxNK3xDm
	 B/6+5Nt31QH4woCoKZR13/GQ=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][zeus][PATCH v2] sqlite: backport CVE fix
Date: Fri, 10 Jul 2020 09:58:23 +0300
Message-Id: <20200710065823.18954-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1

From: Sakib Sajal <sakib.sajal@windriver.com>

Fixes CVE-2020-11655

(From OE-Core rev: 3b06a6c73f4e49c6d00f758423c2e8865ec2de00)

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
[ without the CVE-2020-11656 fix that did not apply cleanly ]
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
v2: Upstream Status -> Upstream-Status
---
 .../sqlite/files/CVE-2020-11655.patch         | 32 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.29.0.bb |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2020-11655.patch

diff --git a/meta/recipes-support/sqlite/files/CVE-2020-11655.patch b/meta/recipes-support/sqlite/files/CVE-2020-11655.patch
new file mode 100644
index 0000000000..c2360cb867
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
+Upstream-Status: Backport [c415d91007e1680e4eb17def583b202c3c83c718]
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

