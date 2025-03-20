Return-Path: <matthias.schiffer@ew.tq-group.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 114D8C36000
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 11:03:08 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by mx.groups.io with SMTP id smtpd.web11.4822.1742468582489515698
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Mar 2025 04:03:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@tq-group.com header.s=key1 header.b=gVc5LY3/;
 dkim=fail reason="dkim: no key for signature: lookup dkim._domainkey.ew.tq-group.com on 100.100.100.100:53: no such host" header.i=@ew.tq-group.com header.s=dkim header.b=U0rtOfV/;
 spf=pass (domain: ew.tq-group.com, ip: 93.104.207.81, mailfrom: matthias.schiffer@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1742468582; x=1774004582;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=S0u8YCJTGTLU6qcl+paSosX1KoP6E+ZV2efKarKTdfo=;
  b=gVc5LY3/9Z8Yg1cUZiurikZCSrhAVz7PY3QQoVUQEdrLnSuyzKNLrbIh
   qFXut4suh+xu0h2O3iWkN3P0Bq3Rw7V/cLhDV2e65aQzN+CZJYAa0G0ob
   Dy/vy1EX2DwLjTPQ1RCzzC9tnX9VpSSnXXLbx+O+WngMfuZAOdB6u7k0k
   Rd3XXIHxU+wZJo76RVEo5Vw+kmkUO6V5EeGiDparlwqDgKwmdG3GEwMZR
   o9/1HTK3CReivMfX395NHREep0u2njmc9wsnGEL7Ec7Nq9uwZTrpeqEK8
   tMbYSozzJM1Yo9CSSQ0s2QVv2PPK/80JKS4hafXgp3DC4EF/E1UCfXoKx
   Q==;
X-CSE-ConnectionGUID: k4vGYlLRQ7mTfYyTCQ1ooQ==
X-CSE-MsgGUID: CeaB7eK1TDi+V5EqVQFs3g==
X-IronPort-AV: E=Sophos;i="6.14,261,1736809200"; 
   d="scan'208";a="43068518"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 20 Mar 2025 12:03:00 +0100
X-CheckPoint: {67DBF5E4-11-F35B2447-E1635CDE}
X-MAIL-CPID: 1A54BE06641CF7A6CF202749BAF2B943_1
X-Control-Analysis: str=0001.0A006378.67DBF5DB.0026,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 78F1216921D;
	Thu, 20 Mar 2025 12:02:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1742468575;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=S0u8YCJTGTLU6qcl+paSosX1KoP6E+ZV2efKarKTdfo=;
	b=U0rtOfV/H5g8SGNad3itGWLYBDJQeOugTWuOBKu+6l2ZtUP+nzuWuMHizW1r2NxP59iimJ
	A5Ck9wlmRDE3s4kUEFkChjWwqiMtax/mtFaaLp6oZINCSwZwxeKTwLx8oW7RZ+xQXPNwms
	7UOiFwVLIbodZrm75QazwbCSr+w+pKNUst3nZURgOjlCC9BXq7XsUqgtYjIdOQveeLEaOZ
	TRGV1u5y9i1FL5QyeNoxCM24sOufpccmRyYy1t9/8X6Gf/ETvAY4cjhjdkLyL3q0IOzpMy
	R7UhCu/kDqO/3u3IVygHMKhhh/R0A3KDeyUQChYDQlQtzB/VPGUVZC8iw+iH/A==
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: openembedded-core@lists.openembedded.org
Cc: Max Krummenacher <max.krummenacher@toradex.com>,
	oss@ew.tq-group.com,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH v2 1/2] curl: only set CA bundle in target build
Date: Thu, 20 Mar 2025 12:02:33 +0100
Message-ID: <c6dc4b6aead7933112e653982dccbb8f5db55928.1742467277.git.matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 11:03:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213381

In native/nativesdk builds, sysconfdir refers to a recipe sysroot
directory, which will disappear once the workdir is cleaned up, breaking
libcurl's HTTPS connections.

By simply not setting --with-ca-bundle at all in non-target builds, curl
defaults to the host system's CA certificates, which is desirable anyways
to allow builds in environments that require local CA certificates.

Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---

v2: new patch to address the root cause of the issue that prompted the
    change reverted in patch 2

 meta/recipes-support/curl/curl_8.12.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/curl/curl_8.12.1.bb b/meta/recipes-support/curl/curl_8.12.1.bb
index 1e9e5a0229..dd1c89979a 100644
--- a/meta/recipes-support/curl/curl_8.12.1.bb
+++ b/meta/recipes-support/curl/curl_8.12.1.bb
@@ -72,12 +72,14 @@ PACKAGECONFIG[zstd] = "--with-zstd,--without-zstd,zstd"
 
 EXTRA_OECONF = " \
     --disable-libcurl-option \
-    --with-ca-bundle=${sysconfdir}/ssl/certs/ca-certificates.crt \
     --without-libpsl \
     --enable-optimize \
     ${@'--without-ssl' if (bb.utils.filter('PACKAGECONFIG', 'gnutls mbedtls openssl', d) == '') else ''} \
     WATT_ROOT=${STAGING_DIR_TARGET}${prefix} \
 "
+EXTRA_OECONF:append:class-target = " \
+    --with-ca-bundle=${sysconfdir}/ssl/certs/ca-certificates.crt \
+"
 
 fix_absolute_paths () {
 	# cleanup buildpaths from curl-config
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


