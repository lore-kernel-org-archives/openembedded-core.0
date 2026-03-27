Return-Path: <francesco@valla.it>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DB3E10F2855
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 16:49:48 +0000 (UTC)
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.7])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.78051.1774630179345973812
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2026 09:49:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@antispam.mailspamprotection.com header.s=default header.b=wI8Ka7MF;
 dkim=pass header.i=@valla.it header.s=default header.b=ZHAnJaob;
 spf=pass (domain: valla.it, ip: 185.56.87.7, mailfrom: francesco@valla.it)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-j8h9.prod.antispam.mailspamprotection.com; s=arckey; t=1774630179;
	 b=biqXqe2Ld/nc40M1RReWs5i1zFKZz/PaQ5+0spfnGCWi2W5Y0mFxHweZBS80piUv1J7rgU0mab
	  NZ4UQl+nJo6xdo4yoeiFoGYiZtIO/nVopqGgvQbUJUGK7sCwB6mS/Oe57gfdN3UEEV6rrHA9hT
	  1De5kcq+mCw39GGp9ZiZdktmV1bUUaM5dPxeCmOhVrNxP3ToGclHLPS73Jx0i+qsmS6qg0AnK6
	  zFkKsqYVlIS+nmQqLDQ5nD9gudmcmLUtOBF3C0polpUa7PvBzAVhc8gWUnyVndOnC8yUDxmbwQ
	  hidzuwOTRmT6/ATreJTIFUyQQrzJKet9HqK0KQPQ7qlDow==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-j8h9.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-j8h9.prod.antispam.mailspamprotection.com; s=arckey; t=1774630179;
	bh=XnwhN8nBQEQvPGAop2qSXD069+U9GM/OieiHxzF0Zsg=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=e+svC/LVb5ycH2CLXEv1hFQqKdXLvTW8gB3VtqKqw4q8PZX4CzNQcYX5LiQlLKOMLcWj19UYHS
	  o4Pn/P/iOkMBAZznXKdDNzLqIFCdYPJgk5Ps6kK3Q+lsk6mltp7FG4pMpHn3U3gCF0uI/yeHN/
	  rSathhgMvmllNyDYp15x1nXdUvEzOTeLqtZQywId934PBcAd8I70ZGWdhBxohC3Ym/mt+wKW2d
	  pR2Ws/oA3Qx+LaeDiM5AQNYuoj4fCt1wAvKASRCcT02uQRoxyxqyb3jMJ4nhBYLT/4M2HTvvgi
	  iLEj1R9AFSB7iYDOA0aOPd6kHUbV0p4X18PvGW+rET7wYg==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=phKlSbE6Ix2kPngK6PvnqbX74RU/qo6blhBEpSsaX+E=; b=wI8Ka7MFNGof+v0NQkMYaPffcq
	6caxBNmUb+VU3jYJsQaZrmdnbMwInpdddyfTJeqnaqIp7KwOoJZWMmmBWo1QKHH4NQqmcLDH9ozFJ
	prVnCEkhei9kpT1cCt3C2t1oyQPyZnFjkW5u4Kjr0TeFKova9Pyjoxqzgvzw+qVhYyI8=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-j8h9.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1w6ANL-000000096zx-0yQZ
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Mar 2026 16:49:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=phKlSbE6Ix2kPngK6PvnqbX74RU/qo6blhBEpSsaX+E=; b=ZHAnJaobvr2U2lxHoGi38Wew+Q
	Q1Ed+amrlDaBAr7HTUbXwGg7Y4kjfu3ce5G/LzbaqN4pM/U+gmjmN7qetEai5nOEflwW0rYM02LDc
	SbU+TpzXIywOa9JUik2418JPW5vn/URzCa4WMzd6mkctF5OPAWHDuB0FORmmOeRrYnI4=;
Received: from [95.248.129.24] (port=61428 helo=[192.168.178.175])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <francesco@valla.it>)
	id 1w6ANE-000000007CG-3DyO;
	Fri, 27 Mar 2026 16:49:28 +0000
From: Francesco Valla <francesco@valla.it>
Date: Fri, 27 Mar 2026 17:49:15 +0100
Subject: [PATCH RFC v2 3/4] recipes-test: add bootconfig-test recipe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-bootconfig-v2-3-891975014056@valla.it>
References: <20260327-bootconfig-v2-0-891975014056@valla.it>
In-Reply-To: <20260327-bootconfig-v2-0-891975014056@valla.it>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>, 
 Bruce Ashfield <bruce.ashfield@gmail.com>, 
 Francesco Castagnotto <fcastagnotto@linux.com>, 
 Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1747; i=francesco@valla.it;
 h=from:subject:message-id; bh=XnwhN8nBQEQvPGAop2qSXD069+U9GM/OieiHxzF0Zsg=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDJnHtoodvP73p/6TjPSL9eoVcyW+3jjn8/GJ1qF1B9MS9
 rSEvT67t6OUhUGMi0FWTJElZN2Ne3vmmn9L28D4CGYOKxPIEAYuTgGYiHU+wz+1mw5TS1+dsOiW
 Kgvo0Pq74RPPZ7Nt87ziYifmBd7Z1sHJ8M/way5vSXTq+TKuU8aLPvw9eODoHs+Z0TuChYrTN6W
 rXGUCAA==
X-Developer-Key: i=francesco@valla.it; a=openpgp;
 fpr=CC70CBC9AA13257C6CCED8669601767CA07CA0EA
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 1c739b0ec835f3e29c6c456c25e1c711
X-AntiAbuse: ID - 1c739b0ec835f3e29c6c456c25e1c711
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1w6ANL-000000096zx-0yQZ-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-j8h9.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 16:49:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234099

Add a test recipe deploying a fixed bootconfig source file to
DEPLOY_DIR_IMAGE, to be used in tests that expect a bootconfig to be
available.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 .../recipes-test/bootconfig/bootconfig-test.bb       | 20 ++++++++++++++++++++
 .../bootconfig/bootconfig-test/bootconfig-test.txt   |  6 ++++++
 2 files changed, 26 insertions(+)

diff --git a/meta-selftest/recipes-test/bootconfig/bootconfig-test.bb b/meta-selftest/recipes-test/bootconfig/bootconfig-test.bb
new file mode 100644
index 0000000000000000000000000000000000000000..0cf74fa93652009466220f21001923a81d628a2e
--- /dev/null
+++ b/meta-selftest/recipes-test/bootconfig/bootconfig-test.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Test bootconfig"
+DESCRIPTION = "This generates a dummy bootconfig to be used to for testing."
+LICENSE = "MIT"
+
+SRC_URI = "file://bootconfig-test.txt"
+
+EXCLUDE_FROM_WORLD = "1"
+ 
+inherit deploy nopackages
+
+do_configure[noexec] = "1"
+do_compile[noexec] = "1"
+deltask do_stash_locale
+deltask do_install
+deltask do_populate_sysroot
+
+do_deploy() {
+    install -m0664 ${UNPACKDIR}/bootconfig-test.txt ${DEPLOYDIR}/bootconfig-test.txt
+}
+addtask deploy after do_unpack before do_build
diff --git a/meta-selftest/recipes-test/bootconfig/bootconfig-test/bootconfig-test.txt b/meta-selftest/recipes-test/bootconfig/bootconfig-test/bootconfig-test.txt
new file mode 100644
index 0000000000000000000000000000000000000000..c194018b0bd0e225aaf01a49dff78fcaebe8a7d4
--- /dev/null
+++ b/meta-selftest/recipes-test/bootconfig/bootconfig-test/bootconfig-test.txt
@@ -0,0 +1,6 @@
+kernel {
+  root = 01234567-89ab-cdef-0123-456789abcd
+}
+init {
+  splash
+}

-- 
2.53.0


