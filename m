Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web12.11075.1599130062528276118
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Sep 2020 03:47:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=HNWoTF4I;
 spf=pass (domain: burtonini.com, ip: 209.85.221.68, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f68.google.com with SMTP id k15so2651167wrn.10
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2020 03:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XDZU7UdtJC4uYVKMRdEGduqlmN2e0PGOmOpVAUfKilA=;
        b=HNWoTF4I3GZPJ/QRC+K+SGSv6xjPeiSCseKXQ0Oiy0GEm9KZPaPvEIcM91VfSC7hbo
         45fdGwFEXcvaGPaLePGqH6+1Xemza/kqn8XbaWpjyOVzT/AoVO5LFuS8VMPYcfNSh9CL
         EYyeoVqfNg4NvTWe2xO68uWW+KUhyMGCS6nXThkcsvWnF87baH9q+Fvz2roezYoLdGDr
         8Aa7741DOO9/5XLaacKVt05jlLxDGr3oEL+q6i73rmdQuB83cmco8a6Pjgwf3a9UaQq3
         MYMNWOClDOzJL5nL6lDqPDszE7y5fQW9RPpsv8u+D6pQ9kNxqd2XgLTsSY/sG8f6/J7f
         7hDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XDZU7UdtJC4uYVKMRdEGduqlmN2e0PGOmOpVAUfKilA=;
        b=bfeyHSgjoq2pMNT9itbVxMKVugamYhr6NoHLz5H7quRJ7bgQMo8Hu8sLhdQjMOgbPV
         d3v3lZ2PYn+XqbxPWceaGBXNP+qGkz3Y8KqXfZAEXD3/ngbUlaxmaDkXd7nE4+JM0bdi
         BDd7dh+GQANVS9hhcEVH9IvDjrbc1kX20u8kiKnvCEUiRtkxmunXqsgO+BK1IF1kT8fL
         07Kj+bbP8q958X9m7fnC6ufq6ProjBkdGfJgJU9lQ3I92gwLbw6iaztPBlGWp+S1buYi
         c8f5pg8bmL1TberI6fwprKa9xFWnAr6IIr2YEzh7JBYI4VDHeyiwKh34ccVEGnh5yazH
         5ufA==
X-Gm-Message-State: AOAM533GZI97+Q6IN6Z55BvsbzYZcoCD5Kh9Or8MzN1i7SuREreHZ5fy
	DFCC3fGQ155xxLAegFxA+3+7uzngCCswUvGd
X-Google-Smtp-Source: ABdhPJxXjm+KICotHWZkmJ+eZkdeslfyH1qfFExKPIkS3YUSOXxdzM/EthjcMwDbH3KronPNK+DuMQ==
X-Received: by 2002:a05:6000:ce:: with SMTP id q14mr1773043wrx.112.1599130060255;
        Thu, 03 Sep 2020 03:47:40 -0700 (PDT)
Return-Path: <ross@burtonini.com>
Received: from localhost.localdomain (35.106.2.81.in-addr.arpa. [81.2.106.35])
        by smtp.gmail.com with ESMTPSA id 5sm3668895wmz.22.2020.09.03.03.47.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2020 03:47:39 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
X-Google-Original-From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] kea: no need to depend on kea-native
Date: Thu,  3 Sep 2020 11:47:29 +0100
Message-Id: <20200903104731.4165-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kea-msg-compiler is only needed if you alter the messages and the
generated sources need to be rebuilt.  When this is the case, there are
better ways to build kea-msg-compiler that don't involve building all of
Kea.

Don't depend on kea-native, remove BBCLASSEXTEND=native, and the target
overrides.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-connectivity/kea/kea_1.7.7.bb | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-connectivity/kea/kea_1.7.7.bb b/meta/recipes-connectivity/kea/kea_1.7.7.bb
index e25f8e6fb0..c69a180833 100644
--- a/meta/recipes-connectivity/kea/kea_1.7.7.bb
+++ b/meta/recipes-connectivity/kea/kea_1.7.7.bb
@@ -5,8 +5,6 @@ SECTION = "connectivity"
 LICENSE = "MPL-2.0 & Apache-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=68d95543d2096459290a4e6b9ceccffa"
 
-DEPENDS += "kea-native"
-
 SRC_URI = "\
     http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.gz \
     file://0001-remove-AC_TRY_RUN.patch \
@@ -32,16 +30,14 @@ DEBUG_OPTIMIZATION_append_mipsel = " -O"
 BUILD_OPTIMIZATION_remove_mipsel = " -Og"
 BUILD_OPTIMIZATION_append_mipsel = " -O"
 
-do_configure_prepend_class-target() {
-    mkdir -p ${B}/src/lib/log/compiler/
-    ln -sf ${STAGING_BINDIR_NATIVE}/kea-msg-compiler ${B}/src/lib/log/compiler/kea-msg-compiler
+do_configure_prepend() {
     # replace abs_top_builddir to avoid introducing the build path
     # don't expand the abs_top_builddir on the target as the abs_top_builddir is meanlingless on the target
     find ${S} -type f -name *.sh.in | xargs sed -i  "s:@abs_top_builddir@:@abs_top_builddir_placeholder@:g"
     sed -i "s:@abs_top_srcdir@:@abs_top_srcdir_placeholder@:g" ${S}/src/bin/admin/kea-admin.in
 }
 
-do_install_append_class-target() {
+do_install_append() {
     install -d ${D}${systemd_system_unitdir}
     install -m 0644 ${WORKDIR}/kea-dhcp*service ${D}${systemd_system_unitdir}
     sed -i -e 's,@SBINDIR@,${sbindir},g' -e 's,@BASE_BINDIR@,${base_bindir},g' \
@@ -62,6 +58,4 @@ PACKAGECONFIG[boost] = "--with-boost-libs=-lboost_system,,boost,boost"
 FILES_${PN}-staticdev += "${libdir}/kea/hooks/*.a ${libdir}/hooks/*.a"
 FILES_${PN} += "${libdir}/hooks/*.so"
 
-BBCLASSEXTEND += "native"
-
 PARALLEL_MAKEINST = ""
-- 
2.25.1

