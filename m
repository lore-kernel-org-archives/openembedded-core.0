Return-Path: <armccurdy@gmail.com>
Received: from mail-qc0-f174.google.com (mail-qc0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id 7448760425
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jun 2014 17:29:16 +0000 (UTC)
Received: by mail-qc0-f174.google.com with SMTP id x13so2361423qcv.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jun 2014 10:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=NsDg27Yd/Vd8QZBiEaP9sZJ+7hGs/82dA6U6vAsI4RQ=;
	b=ggLYE9u75HyYwRwwDFI8GZDsj3078JjEi3zdACfhx9Dq0p+PmUWi3DPOjVHN9cR25h
	gG2fbNuHZNLqJ29leBTvgkUjx0gptNu/vgrBfQ45xuEM6TSmKfZYfEkLveAN0PiyoqSm
	fv+A5v0+GxfxuDGABUOGLTktYgd492tbRElOoLAEUjiHBgBFEux0V5SlHIV/5NNHf1PO
	Bb8M8IesuG1xqoUGJQWHIutWICFiT33Wlhf734lYXBC4eMTCbveZ8JXMYkjv0Uw+XEQM
	YD7N/zprPCHhUioHfujNZYebP4ESKOGN+knY122KEI59DW9pnORCiEjTvH0NyrzKTsbg
	sVhA==
X-Received: by 10.140.25.37 with SMTP id 34mr59723715qgs.60.1402594156583;
	Thu, 12 Jun 2014 10:29:16 -0700 (PDT)
Received: from localhost.localdomain (c-76-24-48-141.hsd1.nh.comcast.net.
	[76.24.48.141])
	by mx.google.com with ESMTPSA id c6sm2361084qaw.47.2014.06.12.10.29.15
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 12 Jun 2014 10:29:16 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Jun 2014 10:29:02 -0700
Message-Id: <1402594142-26539-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] curl: control ipv6 support based on DISTRO feature
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
X-List-Received-Date: Thu, 12 Jun 2014 17:29:23 -0000

By default ipv6 is auto detected for native builds but disabled when
cross compiling.

This commit adds a PACKAGECONFIG option, unconditionally enabled for
native and nativesdk builds and controlled by the ipv6 DISTRO feature
for target builds.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-support/curl/curl_7.36.0.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-support/curl/curl_7.36.0.bb b/meta/recipes-support/curl/curl_7.36.0.bb
index 56eb1a2..54ea6d4 100644
--- a/meta/recipes-support/curl/curl_7.36.0.bb
+++ b/meta/recipes-support/curl/curl_7.36.0.bb
@@ -40,6 +40,12 @@ CURLGNUTLS = " --with-gnutls=${STAGING_LIBDIR}/../ --without-ssl"
 CURLGNUTLS_class-native = "--without-gnutls --with-ssl"
 CURLGNUTLS_class-nativesdk = "--without-gnutls --without-ssl"
 
+PACKAGECONFIG ??= "${@bb.utils.contains("DISTRO_FEATURES", "ipv6", "ipv6", "", d)}"
+PACKAGECONFIG_class-native = "ipv6"
+PACKAGECONFIG_class-nativesdk = "ipv6"
+
+PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
+
 do_configure_prepend() {
 	sed -i s:OPT_GNUTLS/bin:OPT_GNUTLS:g ${S}/configure.ac
 }
-- 
1.8.1.2


