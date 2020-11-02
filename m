Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web11.2494.1604340366182469577
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 10:06:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TYZxwHz7;
 spf=pass (domain: gmail.com, ip: 209.85.221.66, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wr1-f66.google.com with SMTP id n15so15734798wrq.2
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 10:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oadp9aRJeRlkwquF19EibIA9UMLvE4hCNwH1hn+FqK8=;
        b=TYZxwHz7gMBs2T+j52a6hsBP7YK1jWcYzs09PcNwD/0/K7le9tJ6bQHOTMQsY+FSy7
         6kg49WkxCP0kta/UyMHh9rlUgHoz90ZprfQldPQUbePKcmtgo7hYQh2bJBqgpNj5MKtz
         Bpuw3V+g5YucOC6S0py22QIlI+D2yM30htA8R5TBEN1tc0K3eDT5mIWEhMvUaD5nHtwP
         QOatuQk9RU1j2LuUHiukRRrMEmm54eGrwQU1k035H6xwFwAUxRseSpIwFFF/Lo85MY42
         eLY1Rxfw9k8y+orKGyTfEBe0ZXk9BZjnJE17JtNpuDf9wV20iqG81deQMmKZP19hwTx2
         bUBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oadp9aRJeRlkwquF19EibIA9UMLvE4hCNwH1hn+FqK8=;
        b=YbnvnoTiNpca7lb9Dx7DyaqqkyaGdHZwI0YwO7mn02q5wOujb4pdUk7ChCpcjSTOFo
         7vx+qIcsme/S1OXytEvsX6yxwJzX/tfeY2fhZ8E/Fw7x/uAfuc2lzDdT3TD3b3mYOOBJ
         Lt1UjhpbcZAgmNEB6Zm4vxk+T+zvJpN+pLnpy43dpv7pbh/sDf44kd9cT8ENV40hvYBf
         vypS16h0GNbMW2oKeQHySIj5ifKAEAjMOuGsvnvrISjBGuJRGJO8DLark8SbUM2Eux4y
         pYRO8wBD8nYTCuJ6hoL1KQcj4Po/kZAhtpYhmAJewWy2eNB6x8lfNhSHlNta+PpxrhEZ
         yU7g==
X-Gm-Message-State: AOAM5329jlDBhnPd3ix4SmgROJisJpflTB77T3nlIExjYrT2yKwslafJ
	0C1yEF9YCBQ+xWSfZrPWWpTrAhYMHTIAew==
X-Google-Smtp-Source: ABdhPJwcwFf0N5EjlRB8l5AoOVbtQgTk5a0QOei96KG60KKRUbrjHEBad4VPPjSw4Xx1k/cUq0UY4A==
X-Received: by 2002:a5d:494c:: with SMTP id r12mr21213226wrs.406.1604340364293;
        Mon, 02 Nov 2020 10:06:04 -0800 (PST)
Return-Path: <luca.boccassi@gmail.com>
Received: from localhost ([88.98.246.218])
        by smtp.gmail.com with ESMTPSA id y200sm266250wmc.23.2020.11.02.10.06.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 10:06:03 -0800 (PST)
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] dbus: split -common and -tools out of main package
Date: Mon,  2 Nov 2020 18:05:59 +0000
Message-Id: <20201102180559.1177417-1-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.20.1
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
 meta/recipes-core/dbus/dbus_1.12.20.bb | 39 +++++++++++++++-----------
 1 file changed, 23 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus_1.12.20.bb b/meta/recipes-core/dbus/dbus_1.12.20.bb
index cf6f7dc0ef..f0b44207d6 100644
--- a/meta/recipes-core/dbus/dbus_1.12.20.bb
+++ b/meta/recipes-core/dbus/dbus_1.12.20.bb
@@ -11,6 +11,7 @@ RDEPENDS_dbus_class-nativesdk = ""
 PACKAGES += "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '${PN}-ptest', '', d)}"
 ALLOW_EMPTY_dbus-ptest = "1"
 RDEPENDS_dbus-ptest_class-target = "dbus-test-ptest"
+RDEPENDS_${PN} += "${PN}-common ${PN}-tools"
 
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
-               ${systemd_system_unitdir} \
-               ${systemd_user_unitdir} \
-               ${nonarch_libdir}/sysusers.d/dbus.conf \
+               ${systemd_system_unitdir}/dbus.service \
+               ${systemd_user_unitdir}/dbus.service \
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
2.20.1

