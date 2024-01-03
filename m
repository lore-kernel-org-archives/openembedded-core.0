Return-Path: <enrico.scholz@sigma-chemnitz.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4C28C3DA6E
	for <webhook@archiver.kernel.org>; Wed,  3 Jan 2024 12:00:04 +0000 (UTC)
Received: from smtpout.cvg.de (smtpout.cvg.de [87.128.211.67])
 by mx.groups.io with SMTP id smtpd.web11.15892.1704283193436677727
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jan 2024 03:59:55 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@sigma-chemnitz.de header.s=v2022040800 header.b=byE/vzvl;
 spf=pass (domain: sigma-chemnitz.de, ip: 87.128.211.67, mailfrom: enrico.scholz@sigma-chemnitz.de)
Received: from mail-mta-2.intern.sigma-chemnitz.de (mail-mta-2.intern.sigma-chemnitz.de [192.168.12.70])
	by mail-out-2.intern.sigma-chemnitz.de (8.17.1/8.17.1) with ESMTPS id 403BxpC8392509
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Wed, 3 Jan 2024 12:59:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2022040800; t=1704283191;
	bh=t+dYEOgnmwgbWFc+5UrR9INlBopmfDLVuqxDMR14ScQ=; l=2536;
	h=From:To:Cc:Subject:Date;
	b=byE/vzvlJFCUiUDMedSffSj0MQEKDfq3CKTNAez6pwGD9rm2b0Gns1Zvulsb66XAP
	 2j2h8cI/jj/rkUbs170e+WdFwKQbPWYj33u7OsBwwgwTJMZQLZgbdpZ9BNJIYyPIdE
	 yTW1RLOlDTta+nXIzgaob4gwFP66JE1sS9y/BoNyaksrXyd27pJbTDc2guEmz01SCf
	 syk4Le4iYY/lUP0su2sNRtDLqZQbBuRq1kEI8l+hcIWTqsZwLwVl4fputWE0Gaa6QK
	 etVgW7p32fyr+5UMepaTBi5V9EkzX296eE92ia2pSxQPzsCfBMaT0dvff5V2iM0ciC
	 8kbBI/fjvbrag==
Received: from reddoxx.intern.sigma-chemnitz.de (reddoxx.sigma.local [192.168.16.32])
	by mail-mta-2.intern.sigma-chemnitz.de (8.17.1/8.17.1) with ESMTP id 403BxnLJ492997
	for <openembedded-core@lists.openembedded.org> from enrico.scholz@sigma-chemnitz.de; Wed, 3 Jan 2024 12:59:49 +0100
Received: from mail-msa-2.intern.sigma-chemnitz.de ([192.168.12.72])
	by reddoxx.intern.sigma-chemnitz.de with ESMTP
	id 4FUGDKHAXO; Wed, 03 Jan 2024 12:59:47 +0100
Received: from ensc-pc.intern.sigma-chemnitz.de (ensc-pc.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-2.intern.sigma-chemnitz.de (8.17.1/8.17.1) with ESMTPS id 403BxmsA382652
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Wed, 3 Jan 2024 12:59:48 +0100
Received: from ensc by ensc-pc.intern.sigma-chemnitz.de with local (Exim 4.96.2)
	(envelope-from <ensc@sigma-chemnitz.de>)
	id 1rKzuW-001sGR-1K;
	Wed, 03 Jan 2024 12:59:48 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH] tcp-wrappers: drop libnsl2 build dependency
Date: Wed,  3 Jan 2024 12:59:44 +0100
Message-ID: <20240103115944.446914-1-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-REDDOXX-Id: 65954c33a867f08c5db38249
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jan 2024 12:00:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193285

From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>

The only libnsl2 function which is used by tcp-wrappers is
'yp_get_default_domain()'.  When USE_GETDOMAIN is set, this is
implemented as a simple wrapper around getdomainname() so that libnsl2
is not used at all.

We added a patch which does '#include <rpcsvc/ypclnt.h>' to avoid
implicit forward declaration.  By conditionalizing this, the libnsl2
dependency can be dropped completely.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 ...0001-Fix-implicit-function-declaration-warnings.patch | 9 +++++++--
 meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb   | 2 --
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Fix-implicit-function-declaration-warnings.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Fix-implicit-function-declaration-warnings.patch
index ec793ac8ffed..474703885d9b 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Fix-implicit-function-declaration-warnings.patch
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Fix-implicit-function-declaration-warnings.patch
@@ -20,11 +20,16 @@ diff --git a/hosts_access.c b/hosts_access.c
 index 0133e5e..58697ea 100644
 --- a/hosts_access.c
 +++ b/hosts_access.c
-@@ -33,6 +33,7 @@ static char sccsid[] = "@(#) hosts_access.c 1.21 97/02/12 02:13:22";
+@@ -33,6 +33,12 @@ static char sccsid[] = "@(#) hosts_access.c 1.21 97/02/12 02:13:22";
  #endif
  #include <netinet/in.h>
  #include <arpa/inet.h>
-+#include <rpcsvc/ypclnt.h>
++#ifdef USE_GETDOMAIN
++/* defined in workarounds.c */
++extern int     yp_get_default_domain(char **ptr);
++#else
++#  include <rpcsvc/ypclnt.h>
++#endif	/* USE_GETDOMAIN */
  #include <stdio.h>
  #include <stdlib.h>
  #include <syslog.h>
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
index c655da1199e7..bcd1d6f7929e 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
@@ -7,8 +7,6 @@ SECTION = "console/network"
 LICENSE = "BSD-1-Clause"
 LIC_FILES_CHKSUM = "file://DISCLAIMER;md5=071bd69cb78b18888ea5e3da5c3127fa"
 
-DEPENDS += "libnsl2"
-
 PACKAGES = "${PN}-dbg libwrap libwrap-doc libwrap-dev libwrap-staticdev ${PN} ${PN}-doc"
 FILES:libwrap = "${base_libdir}/lib*${SOLIBS}"
 FILES:libwrap-doc = "${mandir}/man3 ${mandir}/man5"
-- 
2.43.0


