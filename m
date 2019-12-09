Return-Path: <luca.boccassi@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 77FD27FC9C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Dec 2019 16:24:25 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id g17so16916289wro.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Dec 2019 08:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=csmgMrSJsCZbgSkaV5Gw6n22q/G/V6TVgFMD2anXuOE=;
	b=cxn0e/omuXQ5BlS3IzzTEQHbPZUfMf0CN8fqL+juZ2if1LhwVqQeNV+87k6inUzvu0
	eXWJ4ezBzWV0WTHk0V0k/Mhmnrt4fomfSNBqKAcPSvfQHX12nutduo4nDD81GTFDMltQ
	jAAGeoCjw7Fw+Ecs7TptwS6jiG7Id5MZDSlUvpwI0yTObt16qTjy/MuD5g1nmNC5MMR8
	ceRCtrZECHWh5b3wUZ0+JFQXPiJNHs8xjGSH9qYqkx893o6uJY4j0478DFanZSvUf+Nt
	Dl47oC9KkmJ/bK1HoCvNnBqMGxI5nm1kgffwYXMWZhfvTtvKQ+qbi5pB2BY7JPgN9RXO
	H/Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=csmgMrSJsCZbgSkaV5Gw6n22q/G/V6TVgFMD2anXuOE=;
	b=D9KMCkLDL4IVgje7X68cSMeDYv7C3+nn2vEjCAK/yHyMzQhECjj27ZS2QnOhP3fz7h
	wijvPxLv38Yz2qj8LQ6gEORtSHKFCwbAm6cZb4I5OHrAWVyV3noqfWmmJO8qu+nXempY
	9l4xvFuH66q3A3CqedxQ/YhrJqCkZDHhPYFUYkG1kJO8ovCTl2zLu1LLxVCQ6korrDQk
	KZXC+yyO55YLLKHFXvLUF8ChmLnIkbgEEBwftl1y/Ws+xYqqqe0Zv8da/rebyLq9Wxo4
	AnL9L2lOuS9QS2/AZtd5+Fk/vuj+2+iHNmGPy4vJXdF8DkAApdU4ixfkMfmoU7gC+1kC
	76+w==
X-Gm-Message-State: APjAAAWZxAKLZw5HMNXsqqCpqHDaSIA8bALJPzL3rgjc8T8G+k5aq5Vw
	Zg3WZy75FnyCsoLPlyl/1iEYl1gr038=
X-Google-Smtp-Source: APXvYqwcVNvl7KUBSfh61gBD/sKr14o13DcWMMeTuOsgtYpXntJZK0Ef8eRbY1oAy8iGe1C8L2jjBQ==
X-Received: by 2002:adf:fa87:: with SMTP id h7mr3029841wrr.172.1575908665715; 
	Mon, 09 Dec 2019 08:24:25 -0800 (PST)
Received: from localhost ([88.98.246.218]) by smtp.gmail.com with ESMTPSA id
	u205sm278014wmu.35.2019.12.09.08.24.24
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 09 Dec 2019 08:24:24 -0800 (PST)
From: luca.boccassi@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Dec 2019 16:24:19 +0000
Message-Id: <20191209162419.4343-1-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191205201305.12854-1-luca.boccassi@gmail.com>
References: <20191205201305.12854-1-luca.boccassi@gmail.com>
MIME-Version: 1.0
Cc: Peter.Morrow@microsoft.com
Subject: [PATCH v2] util-linux: split uuid in separate recipe to allow bootstrapping
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
X-List-Received-Date: Mon, 09 Dec 2019 16:24:26 -0000
Content-Transfer-Encoding: 8bit

From: Luca Boccassi <luca.boccassi@microsoft.com>

In the next release util-linux will gain an (optional) build
dependency on libcryptsetup. But libcryptsetup build-depends on
util-linux for blkid (optional, can be disabled) and uuid (mandatory).
Split out util-linux-uuid in a different recipe to break the cycle.

https://github.com/karelzak/util-linux/pull/898

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
v1: util-linux 2.35 is not out yet, but I'd like to get the preparatory work
    underway as I'm not sure if this is the best approach or if there are
    alternatives. Suggestions and comments very welcome. Thanks!
v2: changed packages names to reflect old ones (eg: libuuid1 -> util-linux-libuuid)
    and leave uuid build enable in main recipe to allow for uuidgen build to happen,
    as it does not have its own autoconf switch. Delete the library manualy from
    the main recipe after build instead, and add dependency.
    Might help to break loop python3 -> util-linux -> libselinux -> python3, as it's
    only libuuid that is needed, see https://lists.yoctoproject.org/g/yocto/message/47570

 .../util-linux/util-linux-uuid_2.34.bb        | 40 +++++++++++++++++++
 meta/recipes-core/util-linux/util-linux.inc   | 11 +++++
 meta/recipes-extended/wget/wget.inc           |  2 +-
 3 files changed, 52 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/util-linux/util-linux-uuid_2.34.bb

diff --git a/meta/recipes-core/util-linux/util-linux-uuid_2.34.bb b/meta/recipes-core/util-linux/util-linux-uuid_2.34.bb
new file mode 100644
index 0000000000..ec47f9ae62
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux-uuid_2.34.bb
@@ -0,0 +1,40 @@
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
+DEBIAN_NOAUTONAME_util-linux-libuuid = "1"
+DEBIAN_NOAUTONAME_util-linux-libuuid-dev = "1"
+DEBIAN_NOAUTONAME_util-linux-libuuid-dbg = "1"
+PACKAGES = "util-linux-libuuid util-linux-libuuid-dev util-linux-libuuid-dbg"
+FILES_util-linux-libuuid = "${libdir}/libuuid.so.*"
+FILES_util-linux-libuuid-dev = "${libdir}/libuuid.so ${includedir} ${libdir}/pkgconfig"
+FILES_util-linux-libuuid-dbg = "/usr/src ${libdir}/.debug"
+
+do_install_append() {
+	rmdir ${D}${bindir} ${D}${sbindir}
+	rm -rf ${D}${datadir}
+}
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 1fa82363b1..6973670589 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -288,6 +288,17 @@ ALTERNATIVE_LINK_NAME[utmpdump.1] = "${mandir}/man1/utmpdump.1"
 ALTERNATIVE_LINK_NAME[uuid.3] = "${mandir}/man3/uuid.3"
 ALTERNATIVE_LINK_NAME[wall.1] = "${mandir}/man1/wall.1"
 
+# dm-verity support introduces a circular dependency, so util-linux-uuid is split out for target builds
+# Need to build libuuid for uuidgen, but then delete it and let the other recipe ship it
+RPROVIDES_remove_class-target_${PN}-dev = "util-linux-libuuid-dev"
+PACKAGES_remove_class-target = "util-linux-libuuid util-linux-libuuid-dev util-linux-libuuid-dbg"
+DEPENDS_append_class-target = " util-linux-uuid"
+RDEPENDS_append_class-target_${PN}-dev = " util-linux-libuuid-dev"
+RDEPENDS_append_class-target_${PN} = " util-linux-libuuid"
+do_install_append_class-target() {
+    rm -rf ${D}${includedir}/uuid ${D}${libdir}/pkgconfig/uuid.pc ${D}${libdir}/libuuid* ${D}/lib/libuuid*
+}
+
 
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


