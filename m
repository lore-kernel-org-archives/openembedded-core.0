Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2FC0D44149
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 08:32:02 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8576.1765528301537716803
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Dec 2025 00:31:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=a1h76eor;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1765528301; x=1797064301;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=RN/lP7Tzgq30U9qCcaSlAM1PUpoHOvdkIdSiuAzfVLE=;
  b=a1h76eor7TdYzdejNfHJGb5dr4OQ0nmg6l51gKhgOZdYyp/8ktywUdAb
   Rn7/bJkM4i3cgiS68lFhE4oH5KqQ+xB94r5xW+x0/R6QmOMme0M76EliY
   hm7OP321wUCQ2gAJywMDKWdKWMmym9oFNc8gofhdqtnTfSqKg9DaATAcQ
   xVKI0qjr6+Hc8f020aOS1llw/jsmhZ/Pi+yrAQiZvnpz9cQcMf+dotR7F
   hFZs+GJAQi1NjxgLOb7fv0PA/56gYxsSBt3CBjzZNly0T+HMiOdKp1qgn
   XpI/+XQwtsTdcu30cnQau8h1faNhwSOP6n6tf0wxd1FJpy/0Z3kxt0ZQi
   A==;
X-CSE-ConnectionGUID: GsJnFz1IRsaIBvlHJyW5nQ==
X-CSE-MsgGUID: JK0zTpl4S7a2ldAy/VqiVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="210967057"
X-IronPort-AV: E=Sophos;i="6.21,143,1763391600"; 
   d="scan'208";a="210967057"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.19])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 17:31:39 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id A062682071C
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Dec 2025 08:31:39 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 4F36C180A309
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Dec 2025 08:31:39 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 347CC1400ACB
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Dec 2025 08:31:36 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH v2] gnutls: fix postinst script for ${PN}-fips for multilibs
Date: Fri, 12 Dec 2025 16:31:31 +0800
Message-ID: <20251212083131.26859-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Dec 2025 08:32:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227571

Append "-p" parameter to mkdir to fix failure like following:

When use "gnutls-cli --fips140-mode" command in multilib environment, it shows library not found error.
  root@qemux86-64:~# gnutls-cli --fips140-mode
  library is NOT in FIPS140-2 mode
   
And it was caused by lacking hmac files.
  root@qemux86-64:~# ls /usr/lib64/.*hmac
  ls: cannot access '/usr/lib64/.libgnutl*': No such file or directory

The reason is as following:

  When '${sysconfdir}/gnutls' was created by 'mkdir' with lib32-gnutls, the dir will not be created again by 'mkdir' with lib-gnutls again, and the subsequent command will not be executed, so hmac files were missing in lib64 environment.
  ${bindir}/fipshmac ${libdir}/libgnutls.so.30.*.* > ${libdir}/.libgnutls.so.30.hmac
 
So append "-p" parameter can avoid this error.

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 meta/recipes-support/gnutls/gnutls_3.8.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/gnutls/gnutls_3.8.10.bb b/meta/recipes-support/gnutls/gnutls_3.8.10.bb
index 2ef71a1213..56a84f76f0 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.10.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.10.bb
@@ -90,7 +90,7 @@ BBCLASSEXTEND = "native nativesdk"
 pkg_postinst_ontarget:${PN}-fips () {
     if test -x ${bindir}/fipshmac
     then
-        mkdir ${sysconfdir}/gnutls
+        mkdir -p ${sysconfdir}/gnutls
         touch ${sysconfdir}/gnutls/config
         ${bindir}/fipshmac ${libdir}/libgnutls.so.30.*.* > ${libdir}/.libgnutls.so.30.hmac
         ${bindir}/fipshmac ${libdir}/libnettle.so.8.* > ${libdir}/.libnettle.so.8.hmac
-- 
2.43.0


