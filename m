Return-Path: <armccurdy@gmail.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 85A31609B1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 07:37:16 +0000 (UTC)
Received: by mail-pd0-f180.google.com with SMTP id v10so12267846pde.39
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 00:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=XsCJp3xI5IqcBndQiCZhHCSgWiv7WhPZCt2R2yqnThA=;
	b=Y2V5nnHF7dEhW3mVYHYAFRN/b+eRE35bMY8HM97MvDF8+FhlD+NXOmSrviNB6ax/QN
	I0+5v6CuwGmLugYRHRLAqxyCBWl3V4rk3Jzq7ak5ousrOJwZ/gnjOlfA8l4Y/OVq8nKW
	XKAeWvRbHvnXltXw3VbyZ34AJ/9nGaUD9Rvxof2RM5CVt+SUFJYxosoV2HPwgQUr1b4v
	UfdBxDmGu1FyLcySB4UQJMirnwJXX0f+1/53yK/yEd6tbGCD6OIRDa98+1crAnvU5C9R
	rnHSlyiileP/YFPlx/CzV91owEfpH26bk/XdTcmPvVSz9Q8QvjM1kX44+wmtHrm2gTYc
	UH3A==
X-Received: by 10.70.130.35 with SMTP id ob3mr871658pdb.149.1407915437572;
	Wed, 13 Aug 2014 00:37:17 -0700 (PDT)
Received: from localhost.localdomain (c-73-162-180-210.hsd1.ca.comcast.net.
	[73.162.180.210])
	by mx.google.com with ESMTPSA id am2sm1130593pbc.59.2014.08.13.00.37.16
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 13 Aug 2014 00:37:17 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Aug 2014 00:36:54 -0700
Message-Id: <1407915415-9047-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1407915415-9047-1-git-send-email-armccurdy@gmail.com>
References: <1407915415-9047-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 2/3] curl: let configure find gnutls via pkg-config
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
X-List-Received-Date: Wed, 13 Aug 2014 07:37:18 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-support/curl/curl_7.37.1.bb | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta/recipes-support/curl/curl_7.37.1.bb b/meta/recipes-support/curl/curl_7.37.1.bb
index e51e06d..4b7f9ec 100644
--- a/meta/recipes-support/curl/curl_7.37.1.bb
+++ b/meta/recipes-support/curl/curl_7.37.1.bb
@@ -25,7 +25,7 @@ PACKAGECONFIG_class-nativesdk = "ipv6 ssl zlib"
 
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
 PACKAGECONFIG[ssl] = "--with-ssl,--without-ssl,openssl"
-PACKAGECONFIG[gnutls] = "--with-gnutls=${STAGING_LIBDIR}/../,--without-gnutls,gnutls"
+PACKAGECONFIG[gnutls] = "--with-gnutls,--without-gnutls,gnutls"
 PACKAGECONFIG[zlib] = "--with-zlib=${STAGING_LIBDIR}/../,--without-zlib,zlib"
 
 EXTRA_OECONF = "--without-libssh2 \
@@ -37,10 +37,6 @@ EXTRA_OECONF = "--without-libssh2 \
                 --with-ca-bundle=${sysconfdir}/ssl/certs/ca-certificates.crt \
 "
 
-do_configure_prepend() {
-	sed -i s:OPT_GNUTLS/bin:OPT_GNUTLS:g ${S}/configure.ac
-}
-
 do_install_append() {
 	oe_multilib_header curl/curlbuild.h
 }
-- 
1.8.3.2


