Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f178.google.com (mail-ob0-f178.google.com
	[209.85.214.178])
	by mail.openembedded.org (Postfix) with ESMTP id D3E39771F4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Feb 2016 00:30:41 +0000 (UTC)
Received: by mail-ob0-f178.google.com with SMTP id is5so49856422obc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Feb 2016 16:30:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Ub9ucxGidk9OcsuRSFeo4Z3U2uAB6bGd/+thJ+gWkKg=;
	b=0yDLEZE4afu35ALvEML4ElwnsfIRr1ZJJvvDfGtSn91FfK0EVHaOwH4PXAGhpaUTRH
	MTY1FyXFHay4TCYEvg2ZFK3lFp3O3FWrz+tCFM+WfQ1ZHuJ1ecNwK2LPD9IDiHEe0h9c
	a/FBdc4AkqxhMn8yvTvLucNSz03DCqmJTdI1C3pe7mmjBE4tezcRS25bMknJM716Bb90
	fftEvEX4aaAwQu7DxIDsQRE4RKZMcyOaNMBI2AJ2DFap3PhhhfqRRou/hExUzvAuCUVp
	+dOHmL96x+pROr0sfDbIUlwd4/PdRTwk3SwX6SwO4oC5KHCzAArl918pgIFAzRdgDuH6
	Ifkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Ub9ucxGidk9OcsuRSFeo4Z3U2uAB6bGd/+thJ+gWkKg=;
	b=K/kiWf9SaTmStStSTSfDVVOIbob3iz9Sqx7jk1hsq+b6aLPSh51MoJ9sSegqixVPx/
	gEkkHgGUwJwnwkx2nnvym5HPlOCSO4xPezUrFrbH7pKVeBlLEYq6wk9aosZMH9B9WiTK
	KnhYnvdlQQ+5uAfEFMZWpHqWcyNyPPAVFOt/93tgE4evlvhfQmWQetE3v3i8a0lQcMI0
	Jb6WP4vdGvdISRzh6zBQFspQxPG267szGrDcIzBYmLfra86pxpMFXHQldnDzPdER8BLp
	+PABOnu1RSRR54KYnPCROjKR/P3hU+6Bd8UW3JfB+Kw6PUWSxUz4nIpUPqrWVz4ZJC3I
	FPuw==
X-Gm-Message-State: AG10YORoSpTLVbZnNqoacc3r5Fmz+BetkAj+ueEnBVub7hPKw9vjHL7haP7FQMHCLnEiJQ==
X-Received: by 10.182.73.225 with SMTP id o1mr5277744obv.80.1454545842400;
	Wed, 03 Feb 2016 16:30:42 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	q189sm831771oif.15.2016.02.03.16.30.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 03 Feb 2016 16:30:41 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Feb 2016 16:30:33 -0800
Message-Id: <1454545833-1237-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] neon: convert to PACKAGECONFIG
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
X-List-Received-Date: Thu, 04 Feb 2016 00:30:43 -0000

Along with the conversion to PACKAGECONFIG, drop unnecessary
dependencies on time (it's an app, not a library?) and libxml2 (neon
requires either expat or libxml2 for xml parsing, defaulting to expat
if both are available).

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-support/neon/neon_0.30.1.bb | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-support/neon/neon_0.30.1.bb b/meta/recipes-support/neon/neon_0.30.1.bb
index 0244314..b6cfd50 100644
--- a/meta/recipes-support/neon/neon_0.30.1.bb
+++ b/meta/recipes-support/neon/neon_0.30.1.bb
@@ -4,24 +4,35 @@ SECTION = "libs"
 LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "file://src/COPYING.LIB;md5=f30a9716ef3762e3467a2f62bf790f0a \
                     file://src/ne_utils.h;beginline=1;endline=20;md5=2caca609538eddaa6f6adf120a218037"
-DEPENDS = "zlib libxml2 expat time gnutls libproxy"
-DEPENDS_class-native = "zlib-native libxml2-native expat-native gnutls-native"
-
-BBCLASSEXTEND = "native"
 
 SRC_URI = "http://www.webdav.org/${BPN}/${BPN}-${PV}.tar.gz \
            file://pkgconfig.patch \
            file://gnutls_4.3_fixup.patch"
+
 SRC_URI[md5sum] = "231adebe5c2f78fded3e3df6e958878e"
 SRC_URI[sha256sum] = "00c626c0dc18d094ab374dbd9a354915bfe4776433289386ed489c2ec0845cdd"
 
-BINCONFIG = "${bindir}/neon-config"
-
 inherit autotools binconfig-disabled lib_package pkgconfig
 
-EXTRA_OECONF = "--with-ssl=gnutls --with-libxml2 --with-expat --enable-shared"
-EXTRA_OECONF += "--without-gssapi"
+# Enable gnutls or openssl, not both
+PACKAGECONFIG ?= "expat gnutls libproxy webdav zlib"
+PACKAGECONFIG_class-native = "expat gnutls webdav zlib"
+
+PACKAGECONFIG[expat] = "--with-expat,--without-expat,expat"
+PACKAGECONFIG[gnutls] = "--with-ssl=gnutls,,gnutls"
+PACKAGECONFIG[gssapi] = "--with-gssapi,--without-gssapi,krb5"
+PACKAGECONFIG[libproxy] = "--with-libproxy,--without-libproxy,libproxy"
+PACKAGECONFIG[libxml2] = "--with-libxml2,--without-libxml2,libxml2"
+PACKAGECONFIG[openssl] = "--with-ssl=openssl,,openssl"
+PACKAGECONFIG[webdav] = "--enable-webdav,--disable-webdav,"
+PACKAGECONFIG[zlib] = "--with-zlib,--without-zlib,zlib"
+
+EXTRA_OECONF += "--enable-shared"
 
 do_compile_append() {
 	oe_runmake -C test
 }
+
+BINCONFIG = "${bindir}/neon-config"
+
+BBCLASSEXTEND = "native"
-- 
1.9.1


