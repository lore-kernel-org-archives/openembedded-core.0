Return-Path: <asharma@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F18E7C3DA61
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 20:12:14 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.1815.1722283927662477967
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jul 2024 13:12:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=I1vyIPFI;
 spf=pass (domain: mvista.com, ip: 209.85.214.174, mailfrom: asharma@mvista.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1fc569440e1so32608485ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 13:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1722283926; x=1722888726; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FzCuuNuik23EgkJiacQjXYn3JcfIFBN63QMnWmFQf/4=;
        b=I1vyIPFIytpR4JCVGe+rc1M4Y28zlIvFh0nMfYcZceM04CBP/XGnZLOgedl6IQFUAE
         KiHJnxo4boQ2j5Ng3p/RjKPYAJa3twbcg3DBO7tPcdVDQfuNAQjw2eg3AQwfqI7lZv62
         cTfoP5HvBMZYezzJEi7isjL0szLh44wGOv9tA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722283926; x=1722888726;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FzCuuNuik23EgkJiacQjXYn3JcfIFBN63QMnWmFQf/4=;
        b=fQCvlExhaDiu6fCrYHr1DVVIrbin3JVCJawQu+oN2ynRVYD3GpV/FN/7pa9kqV+rhe
         t54LebFtwnX9p4RAws8Vje9PpAiHQSXWYzFaj7ov5PpSvGItLeXBVwXjFpphk0sshzoe
         +n+GgibDCeqXdb+JGWu6Awrys2gffB//zjiCKL8ZBjScli/BEDhGl/N6ekSvx/HEGilz
         Oad44bPfijgAMfMMGTKmCpMdLG/8qGaHcU/VSV9GG3ZgnWLWg+vWrRdTBKS6HYP8XyGz
         W6XbbdXmJ6k+lwz3+g7DVzej1TFAYf47hw8OALnl+DlmNBHjOsZxM8/uBYbF31Gv9y/v
         6Q9A==
X-Gm-Message-State: AOJu0YzWc2U54s9AwmD20FvnQW7BeIPQ5t/TFtAUWwpH67hri2q8goAd
	VJMUaaBcfO1DpXoT62tvZOTuV8QbIPyaK6FpwGEiOCI/Q9YuHtamtQDgjaJR53zcM+OYVlP20sP
	x
X-Google-Smtp-Source: AGHT+IHqsjdDR3N5+suY3e444Us32nISYXjlsTqijZSK+TP27lQlhMGQ8z9D8BNDZP8QW0IGigC06g==
X-Received: by 2002:a17:902:ea03:b0:1fd:5e91:2b13 with SMTP id d9443c01a7336-1ff047e461emr100013525ad.1.1722283926471;
        Mon, 29 Jul 2024 13:12:06 -0700 (PDT)
Received: from asharma-Latitude-3400 ([223.190.82.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7c8d376sm87651045ad.18.2024.07.29.13.12.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Jul 2024 13:12:06 -0700 (PDT)
Received: by asharma-Latitude-3400 (sSMTP sendmail emulation); Tue, 30 Jul 2024 01:39:50 +0530
From: Ashish Sharma <asharma@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Ashish Sharma <asharma@mvista.com>
Subject: [OE-core][kirkstone][PATCH] bind: Upgrade 9.18.24 -> 9.18.28
Date: Tue, 30 Jul 2024 01:39:38 +0530
Message-Id: <20240729200938.16785-1-asharma@mvista.com>
X-Mailer: git-send-email 2.35.7
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 20:12:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202661

Includes security fixes for:
			CVE-2024-1975
			CVE-2024-1737
			CVE-2024-0760
			CVE-2024-4076

Changelog:
=========
https://gitlab.isc.org/isc-projects/bind9/-/blob/v9.18.28/CHANGES

Signed-off-by: Ashish Sharma <asharma@mvista.com>
---
 .../recipes-connectivity/bind/bind_9.18.28.bb | 114 ++++++++++++++++++
 1 file changed, 114 insertions(+)
 create mode 100644 meta/recipes-connectivity/bind/bind_9.18.28.bb

diff --git a/meta/recipes-connectivity/bind/bind_9.18.28.bb b/meta/recipes-connectivity/bind/bind_9.18.28.bb
new file mode 100644
index 0000000000..67628a8650
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind_9.18.28.bb
@@ -0,0 +1,114 @@
+SUMMARY = "ISC Internet Domain Name Server"
+HOMEPAGE = "https://www.isc.org/bind/"
+DESCRIPTION = "BIND 9 provides a full-featured Domain Name Server system"
+SECTION = "console/network"
+
+LICENSE = "MPL-2.0"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=c7a0b6d9a1b692a5da9af9d503671f43"
+
+DEPENDS = "openssl libcap zlib libuv"
+
+SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
+           file://conf.patch \
+           file://named.service \
+           file://bind9 \
+           file://generate-rndc-key.sh \
+           file://make-etc-initd-bind-stop-work.patch \
+           file://init.d-add-support-for-read-only-rootfs.patch \
+           file://bind-ensure-searching-for-json-headers-searches-sysr.patch \
+           file://0001-named-lwresd-V-and-start-log-hide-build-options.patch \
+           file://0001-avoid-start-failure-with-bind-user.patch \
+           "
+
+SRC_URI[sha256sum] = "e7cce9a165f7b619eefc4832f0a8dc16b005d29e3890aed6008c506ea286a5e7"
+
+UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
+# follow the ESV versions divisible by 2
+UPSTREAM_CHECK_REGEX = "(?P<pver>9.(\d*[02468])+(\.\d+)+(-P\d+)*)/"
+
+# Issue only affects dhcpd with recent bind versions. We don't ship dhcpd anymore
+# so the issue doesn't affect us.
+CVE_CHECK_IGNORE += "CVE-2019-6470"
+
+inherit autotools update-rc.d systemd useradd pkgconfig multilib_header update-alternatives
+
+# PACKAGECONFIGs readline and libedit should NOT be set at same time
+PACKAGECONFIG ?= "readline"
+PACKAGECONFIG[httpstats] = "--with-libxml2=${STAGING_DIR_HOST}${prefix},--without-libxml2,libxml2"
+PACKAGECONFIG[readline] = "--with-readline=readline,,readline"
+PACKAGECONFIG[libedit] = "--with-readline=libedit,,libedit"
+PACKAGECONFIG[dns-over-http] = "--enable-doh,--disable-doh,nghttp2"
+
+EXTRA_OECONF = "  --disable-auto-validation  \
+                 --with-gssapi=no --with-lmdb=no --with-zlib \
+                 --sysconfdir=${sysconfdir}/bind \
+                 --with-openssl=${STAGING_DIR_HOST}${prefix} \
+               "
+LDFLAGS:append = " -lz"
+
+# dhcp needs .la so keep them
+REMOVE_LIBTOOL_LA = "0"
+
+USERADD_PACKAGES = "${PN}"
+USERADD_PARAM:${PN} = "--system --home ${localstatedir}/cache/bind --no-create-home \
+                       --user-group bind"
+
+INITSCRIPT_NAME = "bind"
+INITSCRIPT_PARAMS = "defaults"
+
+SYSTEMD_SERVICE:${PN} = "named.service"
+
+do_install:append() {
+
+	install -d -o bind "${D}${localstatedir}/cache/bind"
+	install -d "${D}${sysconfdir}/bind"
+	install -d "${D}${sysconfdir}/init.d"
+	install -m 644 ${S}/conf/* "${D}${sysconfdir}/bind/"
+	install -m 755 "${S}/init.d" "${D}${sysconfdir}/init.d/bind"
+
+	# Install systemd related files
+	install -d ${D}${sbindir}
+	install -m 755 ${WORKDIR}/generate-rndc-key.sh ${D}${sbindir}
+	install -d ${D}${systemd_system_unitdir}
+	install -m 0644 ${WORKDIR}/named.service ${D}${systemd_system_unitdir}
+	sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
+	       -e 's,@SBINDIR@,${sbindir},g' \
+	       ${D}${systemd_system_unitdir}/named.service
+
+	install -d ${D}${sysconfdir}/default
+	install -m 0644 ${WORKDIR}/bind9 ${D}${sysconfdir}/default
+
+	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+		install -d ${D}${sysconfdir}/tmpfiles.d
+		echo "d /run/named 0755 bind bind - -" > ${D}${sysconfdir}/tmpfiles.d/bind.conf
+	fi
+}
+
+CONFFILES:${PN} = " \
+	${sysconfdir}/bind/named.conf \
+	${sysconfdir}/bind/named.conf.local \
+	${sysconfdir}/bind/named.conf.options \
+	${sysconfdir}/bind/db.0 \
+	${sysconfdir}/bind/db.127 \
+	${sysconfdir}/bind/db.empty \
+	${sysconfdir}/bind/db.local \
+	${sysconfdir}/bind/db.root \
+	"
+
+ALTERNATIVE:${PN}-utils = "nslookup"
+ALTERNATIVE_LINK_NAME[nslookup] = "${bindir}/nslookup"
+ALTERNATIVE_PRIORITY = "100"
+
+PACKAGE_BEFORE_PN += "${PN}-utils"
+FILES:${PN}-utils = "${bindir}/host ${bindir}/dig ${bindir}/mdig ${bindir}/nslookup ${bindir}/nsupdate"
+FILES:${PN}-dev += "${bindir}/isc-config.h"
+FILES:${PN} += "${sbindir}/generate-rndc-key.sh"
+
+PACKAGE_BEFORE_PN += "${PN}-libs"
+# special arrangement below due to
+# https://github.com/isc-projects/bind9/commit/0e25af628cd776f98c04fc4cc59048f5448f6c88
+FILES_SOLIBSDEV = "${libdir}/*[!0-9].so ${libdir}/libbind9.so"
+FILES:${PN}-libs = "${libdir}/named/*.so* ${libdir}/*-${PV}.so"
+FILES:${PN}-staticdev += "${libdir}/*.la"
+
+RDEPENDS:${PN}-dev = ""
-- 
2.35.7


