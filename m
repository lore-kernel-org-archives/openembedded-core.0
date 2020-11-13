Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web09.2546.1605264481061896778
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Nov 2020 02:48:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eCPeMHH9;
 spf=pass (domain: gmail.com, ip: 209.85.221.66, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wr1-f66.google.com with SMTP id d12so9223882wrr.13
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2020 02:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1/zSWfxAQKeY1e/jh08I3q+PYmz0R4ioq8xaTx7Cr6k=;
        b=eCPeMHH99WpsimVozvRRYrWGII5cihQVGclRLH2G0Uv61WtGQV7hMk1Pm5mXQMDdm2
         GosOHGeONYuY9A2v3WsvdRr88O02jNy6kZml7DHDJ4QPJYBfNV0zNrBDuaVhJGqbTR6x
         w4DBZ7u33R1o1VHPAOsag96McgsR25PzskB5ifWUhnImER6HcMX5U+OhENIkUhKXlW4v
         /Tzy9THV60qd54O8W5MslnfkXlk0+FcInKUK/CHCnWJnnKoI6pecdFJWJ2nS3mOHbV5G
         YPotDFE9TvxqKMd6VflLuNpcoWwtT0C332zhmSVmFFugwpQua2NMlP6YgheXGtMmsKl2
         B+xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1/zSWfxAQKeY1e/jh08I3q+PYmz0R4ioq8xaTx7Cr6k=;
        b=QLdvyyrgCNBeT9oAr5Xew3Zpd4JH8E39eaivDb54A2CiLC7n+Ubo7BCJjFgMDpLyl/
         0H5kh9a86ZegW8UIe8fvWtfm6BLXTPE9z0yuEys3gNTnh/FfW/YWz36g+xciFMAoGtyN
         ys2t8kTp+8+nI6egILrPpk8ysV2Bt/41PB5xVwi2X7A50IUM3n+TobuE0q2RHP7iHjuz
         clquiOgpa2rKYQx6iF+F5Z4/J55U5jKQRn4iVd0Lg2kre5DO9BxGRNpaOzYaf5l17mKM
         CqA8RpSXHbrHzMOArNGEM86Iu0B05mcHiCWFnAZFFCGIyFszjeNe5JKV/FbKKjZJ1oHv
         CfKw==
X-Gm-Message-State: AOAM533KYdHY7NnhyF9vwDkXkyCe0oJ2duDrMlOz/J9Y9kbwmBT3BDsT
	98Weh/m89iPDQqmZEkaezTtMhuSkxFGtWg==
X-Google-Smtp-Source: ABdhPJyqANRcTzDhP9WYMfwgjJGbRz2wiNhT/9cEbxAfqQ6N9BqbcDfulbV+vkJIgVx+Aw4czcNUew==
X-Received: by 2002:a5d:5752:: with SMTP id q18mr2600847wrw.176.1605264479152;
        Fri, 13 Nov 2020 02:47:59 -0800 (PST)
Return-Path: <luca.boccassi@gmail.com>
Received: from localhost ([88.98.246.218])
        by smtp.gmail.com with ESMTPSA id t136sm6472530wmt.18.2020.11.13.02.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 02:47:58 -0800 (PST)
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org
Subject: [PATCH v3] dbus: split -common and -tools out of main package
Date: Fri, 13 Nov 2020 10:47:55 +0000
Message-Id: <20201113104755.1073202-1-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201102180559.1177417-1-luca.boccassi@gmail.com>
References: <20201102180559.1177417-1-luca.boccassi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Boccassi <luca.boccassi@microsoft.com>

Certain config files and units are shared between dbus-daemon and
dbus-broker (available in meta-openembedded), so split them out to
allow installing dbus-broker without pulling in dbus-daemon and its
dependencies.
Stand-alone command line tools can also be used regardless of whether
the buses are provided by dbus-daemon or dbus-broker, so split them
out into dbus-tools.
Finally, move the XML schema files out of the main package and into
the development package.

All these changes follow the same pattern used by Fedora, which was
one of the first distro to switch to dbus-broker by default:

https://src.fedoraproject.org/rpms/dbus/blob/master/f/dbus.spec

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
v2: fix FILES_ regex to correctly include all units but the sockets
    in the main package
v3: do not use ${PN} in RDEPENDS, as bitbake expansion is broken and
    generates wrong values (eg: dbus-native-common-native)

 meta/recipes-core/dbus/dbus_1.12.20.bb | 35 +++++++++++++++-----------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus_1.12.20.bb b/meta/recipes-core/dbus/dbus_1.12.20.bb
index cf6f7dc0ef..16342fc6f2 100644
--- a/meta/recipes-core/dbus/dbus_1.12.20.bb
+++ b/meta/recipes-core/dbus/dbus_1.12.20.bb
@@ -11,6 +11,7 @@ RDEPENDS_dbus_class-nativesdk = ""
 PACKAGES += "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '${PN}-ptest', '', d)}"
 ALLOW_EMPTY_dbus-ptest = "1"
 RDEPENDS_dbus-ptest_class-target = "dbus-test-ptest"
+RDEPENDS_${PN} += "dbus-common dbus-tools"
 
 inherit useradd update-rc.d
 
@@ -31,7 +32,7 @@ CONFFILES_${PN} = "${sysconfdir}/dbus-1/system.conf ${sysconfdir}/dbus-1/session
 
 DEBIANNAME_${PN} = "dbus-1"
 
-PACKAGES =+ "${PN}-lib"
+PACKAGES =+ "${PN}-lib ${PN}-common ${PN}-tools"
 
 OLDPKGNAME = "dbus-x11"
 OLDPKGNAME_class-nativesdk = ""
@@ -41,31 +42,37 @@ RPROVIDES_${PN} = "${OLDPKGNAME}"
 RREPLACES_${PN} += "${OLDPKGNAME}"
 
 FILES_${PN} = "${bindir}/dbus-daemon* \
-               ${bindir}/dbus-uuidgen \
                ${bindir}/dbus-cleanup-sockets \
-               ${bindir}/dbus-send \
-               ${bindir}/dbus-monitor \
                ${bindir}/dbus-launch \
                ${bindir}/dbus-run-session \
-               ${bindir}/dbus-update-activation-environment \
                ${libexecdir}/dbus* \
                ${sysconfdir} \
                ${localstatedir} \
-               ${datadir}/dbus-1/services \
-               ${datadir}/dbus-1/system-services \
-               ${datadir}/dbus-1/session.d \
-               ${datadir}/dbus-1/session.conf \
-               ${datadir}/dbus-1/system.d \
-               ${datadir}/dbus-1/system.conf \
-               ${datadir}/xml/dbus-1 \
                ${systemd_system_unitdir} \
                ${systemd_user_unitdir} \
-               ${nonarch_libdir}/sysusers.d/dbus.conf \
                ${nonarch_libdir}/tmpfiles.d/dbus.conf \
 "
+FILES_${PN}-common = "${sysconfdir}/dbus-1 \
+                      ${datadir}/dbus-1/services \
+                      ${datadir}/dbus-1/system-services \
+                      ${datadir}/dbus-1/session.d \
+                      ${datadir}/dbus-1/session.conf \
+                      ${datadir}/dbus-1/system.d \
+                      ${datadir}/dbus-1/system.conf \
+                      ${systemd_system_unitdir}/dbus.socket \
+                      ${systemd_system_unitdir}/sockets.target.wants \
+                      ${systemd_user_unitdir}/dbus.socket \
+                      ${systemd_user_unitdir}/sockets.target.wants \
+                      ${nonarch_libdir}/sysusers.d/dbus.conf \
+"
+FILES_${PN}-tools = "${bindir}/dbus-uuidgen \
+                     ${bindir}/dbus-send \
+                     ${bindir}/dbus-monitor \
+                     ${bindir}/dbus-update-activation-environment \
+"
 FILES_${PN}-lib = "${libdir}/lib*.so.*"
 RRECOMMENDS_${PN}-lib = "${PN}"
-FILES_${PN}-dev += "${libdir}/dbus-1.0/include ${libdir}/cmake/DBus1 ${bindir}/dbus-test-tool"
+FILES_${PN}-dev += "${libdir}/dbus-1.0/include ${libdir}/cmake/DBus1 ${bindir}/dbus-test-tool ${datadir}/xml/dbus-1"
 
 PACKAGE_WRITE_DEPS += "${@bb.utils.contains('DISTRO_FEATURES','systemd sysvinit','systemd-systemctl-native','',d)}"
 pkg_postinst_dbus() {
-- 
2.27.0

