Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web12.5430.1616664671930403253
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Mar 2021 02:31:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Idc1Rdif;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id u5-20020a7bcb050000b029010e9316b9d5so765470wmj.2
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Mar 2021 02:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=35yG0aHgFeCoMWbT0C3nSl4k9P9KwyoLyDb2iL0FxkM=;
        b=Idc1RdifNJ0BrZBDitGVcT9icX00+yWIpNGRHYxqb1ylOP5eHiPtt+Lv/abGLC7nI/
         GYTVkv52MfOND0We/YXASl/wihKn8rUA8AJzthAUMR4M+/eX2YdaRQ9GJ86DOPNxSse0
         cxGN4yz1J4T9ZO/0dYmuu4hmHN5BRs89DOYXA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=35yG0aHgFeCoMWbT0C3nSl4k9P9KwyoLyDb2iL0FxkM=;
        b=WRwVl0ddt+2YuxiiMh3LmAa2PKoAGfXd2YJXBx3mCmvjWd76W6UekaDMb2MG9TdgTI
         u36YOBjVGqwlc2qa5ZmOeiB699oHtoXSpzHxBF9XNYRr2OEPZ0neexc7eX9q6CQQ/WuY
         4CEqowaIPI4V5rF8aJI9jcBFxY9OGHxf76qbT7thwq63XeJeCMInKjM0JJJppXasHutf
         EE/l7U7tp2GrIBne8CYOq//ISrBIPxZYxBaR2OE7jAs9rnB811+WFQ3UftqrYPMWEAUq
         2yVsZ1BOPMVPhVTdKNjevJy2T6eEbkimFDBrtxlqFKeEX6I1LStQLOfFSSpMRaTDHh7L
         LdZw==
X-Gm-Message-State: AOAM532sO3nvxZud3O0Ly0WMf7PWxqQlzitabcBkWrg3GVudMgFz80xp
	m1X+LgwbV4LiWdPmgHZZMZA+TCl3FISgbQ==
X-Google-Smtp-Source: ABdhPJzvGrJ1DnUVJmtlIt6mBHF2R9V02Njok63iRvILNVZY2/rMAyH/wbp7lH6pX6AWhCvyT3cw4Q==
X-Received: by 2002:a7b:cb04:: with SMTP id u4mr6880993wmj.122.1616664670101;
        Thu, 25 Mar 2021 02:31:10 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:6a6e:24cd:b165:9075])
        by smtp.gmail.com with ESMTPSA id i26sm5887562wmb.18.2021.03.25.02.31.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 02:31:09 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] util-linux-libuuid: Simplify recipe and rename from util-linux-uuid
Date: Thu, 25 Mar 2021 09:31:09 +0000
Message-Id: <20210325093109.394031-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the recipe from util-linux-uuid to util-linux-libuuid which means
we can drop the custom PACKAGES and FILES defintions which simplifies
things. Also move the LICENSE setting to the libuuid recipe so that
it is correctly applied to the right packages.

This means the standard definitions from bitbake.conf are used, avoiding
errors from situations where users have customised settings causing
failures.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/maintainers.inc                    | 2 +-
 ...il-linux-uuid_2.36.2.bb => util-linux-libuuid_2.36.2.bb} | 6 +-----
 meta/recipes-core/util-linux/util-linux.inc                 | 1 -
 meta/recipes-core/util-linux/util-linux_2.36.2.bb           | 6 +++---
 4 files changed, 5 insertions(+), 10 deletions(-)
 rename meta/recipes-core/util-linux/{util-linux-uuid_2.36.2.bb => util-linux-libuuid_2.36.2.bb} (56%)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index e1cdf40073c..62763318576 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -722,7 +722,7 @@ RECIPE_MAINTAINER_pn-update-rc.d = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-usbinit = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-usbutils = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-util-linux = "Chen Qi <Qi.Chen@windriver.com>"
-RECIPE_MAINTAINER_pn-util-linux-uuid = "Chen Qi <Qi.Chen@windriver.com>"
+RECIPE_MAINTAINER_pn-util-linux-libuuid = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-util-macros = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-v86d = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-vala = "Alexander Kanavin <alex.kanavin@gmail.com>"
diff --git a/meta/recipes-core/util-linux/util-linux-uuid_2.36.2.bb b/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb
similarity index 56%
rename from meta/recipes-core/util-linux/util-linux-uuid_2.36.2.bb
rename to meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb
index 65e4d23b7e9..9612c491cd9 100644
--- a/meta/recipes-core/util-linux/util-linux-uuid_2.36.2.bb
+++ b/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb
@@ -7,11 +7,7 @@ inherit autotools gettext pkgconfig
 
 S = "${WORKDIR}/util-linux-${PV}"
 EXTRA_OECONF += "--disable-all-programs --enable-libuuid"
-PACKAGES = "util-linux-libuuid util-linux-libuuid-dev util-linux-libuuid-staticdev util-linux-libuuid-dbg"
-FILES_util-linux-libuuid = "${libdir}/libuuid.so.*"
-FILES_util-linux-libuuid-dev = "${libdir}/libuuid.so ${includedir} ${libdir}/pkgconfig"
-FILES_util-linux-libuuid-staticdev = "${libdir}/libuuid.a"
-FILES_util-linux-libuuid-dbg = "/usr/src ${libdir}/.debug"
+LICENSE = "BSD-3-Clause"
 
 do_install_append() {
 	rm -rf ${D}${datadir} ${D}${bindir} ${D}${base_bindir} ${D}${sbindir} ${D}${base_sbindir} ${D}${exec_prefix}/sbin
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 4031c586c91..cbf6102ee0a 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -11,7 +11,6 @@ LICENSE_${PN}-libblkid = "LGPLv2.1+"
 LICENSE_${PN}-libfdisk = "LGPLv2.1+"
 LICENSE_${PN}-libmount = "LGPLv2.1+"
 LICENSE_${PN}-libsmartcols = "LGPLv2.1+"
-LICENSE_${PN}-libuuid = "BSD-3-Clause"
 
 LIC_FILES_CHKSUM = "file://README.licensing;md5=0fd5c050c6187d2bf0a4492b7f4e33da \
                     file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
diff --git a/meta/recipes-core/util-linux/util-linux_2.36.2.bb b/meta/recipes-core/util-linux/util-linux_2.36.2.bb
index 50a70cd4522..c79cf782d15 100644
--- a/meta/recipes-core/util-linux/util-linux_2.36.2.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.36.2.bb
@@ -2,7 +2,7 @@ require util-linux.inc
 
 #gtk-doc is not enabled as it requires xmlto which requires util-linux
 inherit autotools gettext manpages pkgconfig systemd update-alternatives python3-dir bash-completion ptest
-DEPENDS = "libcap-ng ncurses virtual/crypt zlib util-linux-uuid"
+DEPENDS = "libcap-ng ncurses virtual/crypt zlib util-linux-libuuid"
 
 PACKAGES =+ "${PN}-swaponoff"
 PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'pylibmount', '${PN}-pylibmount', '', d)}"
@@ -49,7 +49,7 @@ python util_linux_binpackages () {
 # we must execute before update-alternatives PACKAGE_PREPROCESS_FUNCS
 PACKAGE_PREPROCESS_FUNCS =+ "util_linux_binpackages "
 
-# skip libuuid as it will be packaged by the util-linux-uuid recipe
+# skip libuuid as it will be packaged by the util-linux-libuuid recipe
 python util_linux_libpackages() {
     do_split_packages(d, root=d.getVar('UTIL_LINUX_LIBDIR'), file_regex=r'^lib(?!uuid)(.*)\.so\..*$',
                       output_pattern='${PN}-lib%s',
@@ -201,7 +201,7 @@ do_install_append_class-native () {
 	rm -f ${D}${base_bindir}/kill
 }
 
-# dm-verity support introduces a circular build dependency, so util-linux-uuid is split out for target builds
+# dm-verity support introduces a circular build dependency, so util-linux-libuuid is split out for target builds
 # Need to build libuuid for uuidgen, but then delete it and let the other recipe ship it
 do_install_append () {
 	rm -rf ${D}${includedir}/uuid ${D}${libdir}/pkgconfig/uuid.pc ${D}${libdir}/libuuid* ${D}${base_libdir}/libuuid*
-- 
2.30.2

