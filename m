Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 40A467964F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Mar 2019 20:29:56 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id j9so5923007wrn.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Mar 2019 13:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=sdIfEQYwhfN03Aj7SJQTLIUZRYxQFbNAvJnYp6hYmpw=;
	b=NG6GL8Q3ykEmC979yycUfj0So2cK1Bm8DJ4pzttJRhLQVtpF1BcpJM4Adm4mW5q2z0
	esEsDh7GYl1g/3L9qHuhoBf5V23JVHcaMtuouBpani7GHDdvWdQ/6sLjVJCb5IhAZdtC
	1dmMuTTSvo9jUX8P62vS8GTVK28irTbqFvGqyJ7/fV6OSxZQAsQbPdgyzF62XmbS8PQ7
	nEKcKVK8hh/WdK7FR+nkNv4MS1GvNJIoRLS48fQ0gqHkYtC9YeOxnd9kewVIxfDALnCQ
	Pc2vuekypNRgIZbmpuPL+8S7R0a5R1a9gRRkKUWkJUujujJhjycm8DIEvwA/q6aYfN8O
	bYZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=sdIfEQYwhfN03Aj7SJQTLIUZRYxQFbNAvJnYp6hYmpw=;
	b=sbo3C7oizJnzIc7n8mVaA7VQvDKif6uxMBET1rxKUJYUJQtH+mTP2dea1eNVsTfmmz
	QaBKkX0XehL64t9aK9qY4chQc9RTux/uwpaqji9Jv5W4OrzV/Rpk+dQhAN9yGPfIwtK1
	D5O2NZPKj7wC+ML8a86ulTiEb6TndYXlAWdyvNygPlqq24aMFj/w8eTQF4BphMctJHTA
	VCBubhFzVnsMfeEmXn3f+A18IlVE9exwme0AZOo0Y8DszKsUEvkSCj2pUp/2+Tvu90Jh
	yGBQ09JXQ+BHy2xqIGmUnIGdXoUDcJi4RA6JK7dpblFUPXbrzVo1E9JFl8nJjuWQss7c
	VtVQ==
X-Gm-Message-State: APjAAAWzlCrV5ANPkoQviZ1zckKfrImHA31/1GkANuKl5Suo+VkXAZCA
	b2lt5GXvUWMJtZc86bJckg0hsn6M
X-Google-Smtp-Source: APXvYqwhg0mX4MzGnjFHrbKcVCCD4Vvq5loDqweJLI9JAvnrMXr8y6aX6fO1tCNKX3rEI61OAHmBLw==
X-Received: by 2002:a5d:4d42:: with SMTP id a2mr11471535wru.130.1553372996224; 
	Sat, 23 Mar 2019 13:29:56 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246]) by smtp.gmail.com with ESMTPSA id
	s130sm14993839wms.13.2019.03.23.13.29.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 23 Mar 2019 13:29:55 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 23 Mar 2019 20:29:51 +0000
Message-Id: <1553372992-3009-1-git-send-email-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] wget: Convert EXTRA_OECONF to PACKAGECONFIG, extend PACKAGECONFIG
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
X-List-Received-Date: Sat, 23 Mar 2019 20:29:56 -0000

Convert existing EXTRA_OECONF and DEPENDS to PACKAGECONFIG, fill out
remaining PACKAGECONFIG options. Note we pass in --without-libpsl, which
we didn't previously, but all this actually ends up doing is silencing a
warning from the configure script, the code still uses an internal
implemention when using this option.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/recipes-extended/wget/wget.inc | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-extended/wget/wget.inc b/meta/recipes-extended/wget/wget.inc
index 3cff656a68d9..99af039f417a 100644
--- a/meta/recipes-extended/wget/wget.inc
+++ b/meta/recipes-extended/wget/wget.inc
@@ -3,12 +3,11 @@ HOMEPAGE = "https://www.gnu.org/software/wget/"
 SECTION = "console/network"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c678957b0c8e964aa6c70fd77641a71e"
-DEPENDS = "gnutls zlib libpcre"
 
 inherit autotools gettext texinfo update-alternatives pkgconfig
 
-EXTRA_OECONF = "--with-ssl=gnutls --disable-rpath --disable-iri \
-                --without-libgnutls-prefix ac_cv_header_uuid_uuid_h=no"
+EXTRA_OECONF = "--without-libgnutls-prefix --without-libssl-prefix \
+                --disable-rpath ac_cv_header_uuid_uuid_h=no"
 
 EXTRA_OEMAKE += 'TOOLCHAIN_OPTIONS="${TOOLCHAIN_OPTIONS}" \
                  DEBUG_PREFIX_MAP="${DEBUG_PREFIX_MAP}"'
@@ -21,9 +20,17 @@ RRECOMMENDS_${PN} += "ca-certificates"
 
 BBCLASSEXTEND = "nativesdk"
 
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-PACKAGECONFIG[libuuid] = "--with-libuuid, --without-libuuid,util-linux"
+PACKAGECONFIG ??= "gnutls pcre zlib \
+                   ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
+PACKAGECONFIG[ares] = "--with-cares,,c-ares"
+PACKAGECONFIG[gnutls] = "--with-ssl=gnutls,,gnutls"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
+PACKAGECONFIG[iri] = ",--disable-iri,libidn2"
+PACKAGECONFIG[libpsl] = ",--without-libpsl,libpsl"
+PACKAGECONFIG[libuuid] = "--with-libuuid,--without-libuuid,util-linux"
+PACKAGECONFIG[openssl] = "--with-ssl=openssl,,openssl"
+PACKAGECONFIG[pcre] = ",--disable-pcre,libpcre"
+PACKAGECONFIG[zlib] = ",--without-zlib,zlib"
 
 # Let aclocal use the relative path for the m4 file rather than
 # absolute, otherwise there might be an "Argument list too long" error
-- 
2.7.4


