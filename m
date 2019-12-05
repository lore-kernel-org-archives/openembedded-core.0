Return-Path: <luca.boccassi@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2C9B77F7E0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2019 20:13:11 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id c14so5146471wrn.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Dec 2019 12:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/nSGTsVApb+d12Om3xUTdinqr3qI6/u4OPiGPXASep0=;
	b=g3GrFEgRKZ0BNPzyEQ4qVmSMP8kTm9Ci3B8sDhWxZY7XDx2eiTt1UhzusLEu4Y4ZLT
	gvJPPNJxAe7FRDMIx9ZTokdd0SlnWx44ArMrc0Agh8emjDxjmIIbWZEh7QL8JiTEi2dk
	nNhrfkv+01BY9E3qb6X7psgy5FDSloYWV5GmgYviFVl9EU79atuOhrZnSM25l2O/YGAI
	YgpzPfJfTFf4pyfn1V+DO85h9TmK792GJmSwI/hcNEDQW/XGs2fDctLoGzDca6VcUjS/
	gNtvlhZejTKWh8V4jNM8NqUbg3r7r2zc8HoqqkF8u6ljzHOVjp5g6bK/yZ+aehALoBAG
	sp6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/nSGTsVApb+d12Om3xUTdinqr3qI6/u4OPiGPXASep0=;
	b=HWZf50gacSAZ/UyrqIn1nuIzXaM9AaIioHLhUHzjsHrwkjS4qCzmUuspAw2tdzpwlk
	fJLckZFeuROosDoagSgBoZdCNbCp4MiI+cJBbW3EjxGmtN/RyCE5pwxyu1lppvV3lAjo
	S/LuntzIbA/3Kj/s1etHu3OfBYGgutpqYQI7mv52+ZuHqcwbjlUomH1U2B/pMewoJiT3
	iFVwfSNnna0q0setsxtAZyJ2fL3ZLMsxmH2XTu/XecaUwheM2evFXSg1Yf142O/gzLde
	vVN1DitKKWtVH1iAl401DXn2bkmT4/u4Y9oHT5qPdLwOkRULDTkDM18yGxRbi/tLeClH
	nSOA==
X-Gm-Message-State: APjAAAVBXuu7EziFSLdgrGeuJk+ZRSqAYusRHaLgLRyZhL2W3Fs4gbXF
	qiWaJOrq5DKsOpNjwg5+ifn8ctSFI5U=
X-Google-Smtp-Source: APXvYqyG/ezaTKeH/qE4B6/IupScV/amZeYJo9xtOVRcr9oi9u0TqOU/jGojjJms46h1zzwAEqCxXQ==
X-Received: by 2002:adf:ef10:: with SMTP id e16mr11368309wro.336.1575576791265;
	Thu, 05 Dec 2019 12:13:11 -0800 (PST)
Received: from localhost ([88.98.246.218])
	by smtp.gmail.com with ESMTPSA id m8sm1051343wmf.8.2019.12.05.12.13.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Dec 2019 12:13:10 -0800 (PST)
From: luca.boccassi@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Dec 2019 20:13:05 +0000
Message-Id: <20191205201305.12854-1-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] util-linux: split uuid in separate recipe to allow bootstrapping
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
X-List-Received-Date: Thu, 05 Dec 2019 20:13:11 -0000
Content-Transfer-Encoding: 8bit

From: Luca Boccassi <luca.boccassi@microsoft.com>

In the next release util-linux will gain an (optional) build
dependency on libcryptsetup. But libcryptsetup build-depends on
util-linux for blkid (optional, can be disabled) and uuid (mandatory).
Split out util-linux-uuid in a different recipe to break the cycle.

https://github.com/karelzak/util-linux/pull/898

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
util-linux 2.35 is not out yet, but I'd like to get the preparatory work
underway as I'm not sure if this is the best approach or if there are
alternatives. Suggestions and comments very welcome. Thanks!

 .../util-linux/util-linux-uuid_2.34.bb        | 35 +++++++++++++++++++
 meta/recipes-core/util-linux/util-linux.inc   |  6 ++++
 meta/recipes-extended/wget/wget.inc           |  2 +-
 3 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/util-linux/util-linux-uuid_2.34.bb

diff --git a/meta/recipes-core/util-linux/util-linux-uuid_2.34.bb b/meta/recipes-core/util-linux/util-linux-uuid_2.34.bb
new file mode 100644
index 0000000000..f106c6a18c
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux-uuid_2.34.bb
@@ -0,0 +1,35 @@
+SUMMARY = "Builds libuuid separately from util-linux for bootstrapping"
+HOMEPAGE = "http://userweb.kernel.org/~kzak/util-linux/"
+
+SECTION = "base"
+
+LICENSE = "GPLv2+ & LGPLv2.1+ & BSD-3-Clause & BSD-4-Clause"
+
+LIC_FILES_CHKSUM = "file://README.licensing;md5=972a134f1e14b2b060e365df2fab0099 \
+                    file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://Documentation/licenses/COPYING.GPL-2.0-or-later;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://Documentation/licenses/COPYING.LGPL-2.1-or-later;md5=4fbd65380cdd255951079008b364516c \
+                    file://Documentation/licenses/COPYING.BSD-3-Clause;md5=58dcd8452651fc8b07d1f65ce07ca8af \
+                    file://Documentation/licenses/COPYING.BSD-4-Clause-UC;md5=263860f8968d8bafa5392cab74285262 \
+                    file://libuuid/COPYING;md5=6d2cafc999feb2c2de84d4d24b23290c \
+                    file://libmount/COPYING;md5=7c7e39fb7d70ffe5d693a643e29987c2 \
+                    file://libblkid/COPYING;md5=693bcbbe16d3a4a4b37bc906bc01cc04"
+
+MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
+SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-linux-${MAJOR_VERSION}.tar.xz \
+           "
+
+SRC_URI[md5sum] = "a78cbeaed9c39094b96a48ba8f891d50"
+SRC_URI[sha256sum] = "743f9d0c7252b6db246b659c1e1ce0bd45d8d4508b4dfa427bbb4a3e9b9f62b5"
+
+inherit autotools gettext pkgconfig
+
+S = "${WORKDIR}/util-linux-${PV}"
+EXTRA_OECONF += "--disable-all-programs --enable-libuuid"
+RPROVIDES_libuuid-dev = "util-linux-libuuid-dev"
+RPROVIDES_libuuid = "util-linux-libuuid"
+
+do_install_append() {
+	rmdir ${D}${bindir} ${D}${sbindir}
+	rm -rf ${D}${datadir}
+}
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 1fa82363b1..ef6f95776a 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -288,6 +288,12 @@ ALTERNATIVE_LINK_NAME[utmpdump.1] = "${mandir}/man1/utmpdump.1"
 ALTERNATIVE_LINK_NAME[uuid.3] = "${mandir}/man3/uuid.3"
 ALTERNATIVE_LINK_NAME[wall.1] = "${mandir}/man1/wall.1"
 
+# split uuid out to allow in the near future a build-dependency on packages depending on it
+RPROVIDES_remove_class-target_${PN}-dev = "util-linux-libuuid-dev"
+PACKAGES_remove_class-target = "libuuid1 util-linux-libuuid1"
+DEPENDS_append_class-target = " util-linux-uuid"
+EXTRA_OECONF_remove_class-target = "--enable-libuuid"
+EXTRA_OECONF_append_class-target = " --disable-libuuid"
 
 BBCLASSEXTEND = "native nativesdk"
 
diff --git a/meta/recipes-extended/wget/wget.inc b/meta/recipes-extended/wget/wget.inc
index 2338328216..7b7a3fae7a 100644
--- a/meta/recipes-extended/wget/wget.inc
+++ b/meta/recipes-extended/wget/wget.inc
@@ -32,7 +32,7 @@ PACKAGECONFIG[gnutls] = "--with-ssl=gnutls,,gnutls"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
 PACKAGECONFIG[iri] = "--enable-iri,--disable-iri,libidn2"
 PACKAGECONFIG[libpsl] = "--with-libpsl,--without-libpsl,libpsl"
-PACKAGECONFIG[libuuid] = "--with-libuuid,--without-libuuid,util-linux"
+PACKAGECONFIG[libuuid] = "--with-libuuid,--without-libuuid,util-linux-uuid"
 PACKAGECONFIG[openssl] = "--with-ssl=openssl,,openssl"
 PACKAGECONFIG[pcre] = "--enable-pcre,--disable-pcre,libpcre"
 PACKAGECONFIG[zlib] = "--with-zlib,--without-zlib,zlib"
-- 
2.20.1


