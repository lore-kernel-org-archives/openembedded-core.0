Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f172.google.com (mail-ob0-f172.google.com
	[209.85.214.172])
	by mail.openembedded.org (Postfix) with ESMTP id E7A336FF56
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 18:58:08 +0000 (UTC)
Received: by mail-ob0-f172.google.com with SMTP id is5so41058670obc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 10:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=yMd321e62tXHn90tnldPCBX31iPtjp2YXmNcUOKvPKQ=;
	b=KBUYG/6TuNyoutL1Il6/p+HnItSe15+Y6QYP7XXUKLAtj4tNqImbD/go+YwwW64kG3
	gTtLdrJrxoIZv2IT/6ZzhvDzWHsJATO5EjqDJDPl9m8MZqbfAIEuBij+WdgYIG0F3vLT
	C2voxPwKdJNzUv3zwOljX0p6UyNyi+XZKQJiKW0x7DpP1LQ1gjqg90wq+FOPK4uAPIYs
	HM56jQ0rvKDQKC8eIovxL7mYS9g6Sc9El9tLORghv4wtyHyFACPDOlelonZsDg0L9Wbx
	qldMcS9LkuE592nRZeSI6Y8IVDYKACWICFKt8E6JZ+pNoLZONQxXgFNRdL62EJsrNuhl
	AB+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=yMd321e62tXHn90tnldPCBX31iPtjp2YXmNcUOKvPKQ=;
	b=bea9ACvD09sP46M1H5IljeNzQ8/blN5V8VEvYfsUG4YXLWhUhBYKQedrxkl9j5xLKR
	jth4aeYcfTkMgwog2+mFGVhkZ5xLFyGxhgAeXysLo3VT9E9gHz4dIvSvejTmaRGWpK0s
	/eEVI4sykLb/gncCkxkOTQ08w1HfT6DFeRV0v5BX3uuvo5RM/k2r0gZ9fO4E/h9x43Kj
	u+LSSvhEsFg1YYUaC8zLNxfplhyEg92tib6k72ejCsKjqwroJn1Hy/Ry6OY4L5Zc6F+t
	6Ie0bkbyqQtlIz5PPQ5GyatM0aanExJyLTfhbxq6Xc5rO7te7uexmRUYms49SDiAtme5
	lYKg==
X-Gm-Message-State: AG10YOStRq/qF8qi04Co041fXoE/ScdNJC0y+M/fnoy2V6iL6lA4K/tB3vUkJfY228tQaA==
X-Received: by 10.60.58.103 with SMTP id p7mr40556629oeq.2.1455130689096;
	Wed, 10 Feb 2016 10:58:09 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	u142sm497282oia.23.2016.02.10.10.58.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Feb 2016 10:58:08 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Feb 2016 10:58:02 -0800
Message-Id: <1455130682-6818-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] curl: add PACKAGECONFIG options for less common / legacy protocols
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
X-List-Received-Date: Wed, 10 Feb 2016 18:58:09 -0000

As a result of this commit, the following protocols will now be
disabled by default:

  DICT GOPHER IMAP IMAPS POP3 POP3S RTSP SMTP SMTPS TELNET TFTP

Also add a PACKAGECONFIG option for libidn (previously disabled
unconditionally).

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-support/curl/curl_7.47.1.bb | 32 +++++++++++++++++++++++---------
 1 file changed, 23 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-support/curl/curl_7.47.1.bb b/meta/recipes-support/curl/curl_7.47.1.bb
index 210147c..0872dbe 100644
--- a/meta/recipes-support/curl/curl_7.47.1.bb
+++ b/meta/recipes-support/curl/curl_7.47.1.bb
@@ -21,20 +21,34 @@ PACKAGECONFIG ??= "${@bb.utils.contains("DISTRO_FEATURES", "ipv6", "ipv6", "", d
 PACKAGECONFIG_class-native = "ipv6 ssl zlib"
 PACKAGECONFIG_class-nativesdk = "ipv6 ssl zlib"
 
-PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
-PACKAGECONFIG[ssl] = "--with-ssl --with-random=/dev/urandom,--without-ssl,openssl"
+PACKAGECONFIG[dict] = "--enable-dict,--disable-dict,"
 PACKAGECONFIG[gnutls] = "--with-gnutls,--without-gnutls,gnutls"
-PACKAGECONFIG[zlib] = "--with-zlib=${STAGING_LIBDIR}/../,--without-zlib,zlib"
-PACKAGECONFIG[rtmpdump] = "--with-librtmp,--without-librtmp,rtmpdump"
+PACKAGECONFIG[gopher] = "--enable-gopher,--disable-gopher,"
+PACKAGECONFIG[imap] = "--enable-imap,--disable-imap,"
+PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
+PACKAGECONFIG[ldap] = "--enable-ldap,--disable-ldap,"
+PACKAGECONFIG[ldaps] = "--enable-ldaps,--disable-ldaps,"
+PACKAGECONFIG[libidn] = "--with-libidn,--without-libidn,libidn"
 PACKAGECONFIG[libssh2] = "--with-libssh2,--without-libssh2,libssh2"
+PACKAGECONFIG[pop3] = "--enable-pop3,--disable-pop3,"
+PACKAGECONFIG[proxy] = "--enable-proxy,--disable-proxy,"
+PACKAGECONFIG[rtmpdump] = "--with-librtmp,--without-librtmp,rtmpdump"
+PACKAGECONFIG[rtsp] = "--enable-rtsp,--disable-rtsp,"
 PACKAGECONFIG[smb] = "--enable-smb,--disable-smb,"
+PACKAGECONFIG[smtp] = "--enable-smtp,--disable-smtp,"
+PACKAGECONFIG[ssl] = "--with-ssl --with-random=/dev/urandom,--without-ssl,openssl"
+PACKAGECONFIG[telnet] = "--enable-telnet,--disable-telnet,"
+PACKAGECONFIG[tftp] = "--enable-tftp,--disable-tftp,"
+PACKAGECONFIG[zlib] = "--with-zlib=${STAGING_LIBDIR}/../,--without-zlib,zlib"
 
-EXTRA_OECONF = "--without-libidn \
-                --enable-crypto-auth \
-                --disable-ldap \
-                --disable-ldaps \
-                --with-ca-bundle=${sysconfdir}/ssl/certs/ca-certificates.crt \
+EXTRA_OECONF = " \
+    --enable-crypto-auth \
+    --with-ca-bundle=${sysconfdir}/ssl/certs/ca-certificates.crt \
+    --without-libmetalink \
+    --without-libpsl \
+    --without-nghttp2 \
 "
+
 # see https://lists.yoctoproject.org/pipermail/poky/2013-December/009435.html
 # We should ideally drop ac_cv_sizeof_off_t from site files but until then
 EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'largefile', 'ac_cv_sizeof_off_t=8', '', d)}"
-- 
1.9.1


