Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web11.3652.1604344734241930700
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 11:18:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vW8w4ZB0;
 spf=pass (domain: gmail.com, ip: 209.85.128.65, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wm1-f65.google.com with SMTP id v5so10491535wmh.1
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 11:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=DwdGotuARqdQxTI1FFy5S50B5lDZvZco3H6Cfrx2IRQ=;
        b=vW8w4ZB0GrnnSETD4cY4Q8J1jvmAeRsmWyQLcWx1qIfu6iCB2PUQPTu3yOiiRhMe2U
         bz0O4SAERpcyKHgTfEMeLLRjElUA4DoLIBX/AMHDssV0GLdLGhxwfU3ZCOwG4PG0fUpZ
         V2BkdUCmTHvJUZ3q7eGOlFxxki5iUKYTxAloBwLIQ+NOvCOe8CgSoH22cSFAWdDC5u7C
         njDrekXGPPz7OX+F2i4EZbctpgEZZdvhjUQJC3xxfJSwXT2rKladsfr3xdSSdY+Q4VK3
         KXD27DI54Us1QqwfjyBXLS8BAgInkptrexIqlT10FH1ONiLpGd6HvCTl3Ux9F2jcVjte
         TAVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DwdGotuARqdQxTI1FFy5S50B5lDZvZco3H6Cfrx2IRQ=;
        b=rtDuZYUW23qaVYsvWIqamaEqsJnopakQd+h45p9UJVgzKJzb/XvQq8qub1qQBFMFPs
         dS19q2lgQk3ytcbLgNP7bcTrDds5UpTSZgrwyxmSH9ZxJKi1Jjm2m8GTWIT15Y0f9Gz0
         t5G3uUal1EfZhqYQE4ECrSDEG+oL+gV/W+O0tB4FnRGLs1g1I6WjmI0tkUvSTBBp3nNA
         TL9b5+6DyGn3/iDwekpdl5xvIXKIsRIGXRpDepttxBdUImiD89VoI233I2D9pdVqFTqb
         SRUXTVSUBxawK/znx6z+iGLDKSSWfr10hLcQYA/IPZX13CuJAOO6bOfPbJs+l1/WplUi
         XaJg==
X-Gm-Message-State: AOAM531T15C1ry2aLV6/oSn+CW8J9yFdUX2IWngmsMqOoffYH7gf2IaP
	HMWGba+eUJ/ypKY1ggUwYKPk3Q+lq06diA==
X-Google-Smtp-Source: ABdhPJyZfX2SZmWZi84Zi7lphMtcWZq3uzABFWJHWpthrXF7eWVme7i6W2ZOP1rnOkw2c5DoglkfaA==
X-Received: by 2002:a1c:4054:: with SMTP id n81mr14190268wma.48.1604344732116;
        Mon, 02 Nov 2020 11:18:52 -0800 (PST)
Return-Path: <luca.boccassi@gmail.com>
Received: from localhost ([88.98.246.218])
        by smtp.gmail.com with ESMTPSA id g5sm421198wmi.4.2020.11.02.11.18.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 11:18:51 -0800 (PST)
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] dbus: split -common and -tools out of main package
Date: Mon,  2 Nov 2020 19:18:48 +0000
Message-Id: <20201102191848.1799747-1-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.20.1
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

 meta/recipes-core/dbus/dbus_1.12.20.bb | 35 +++++++++++++++-----------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus_1.12.20.bb b/meta/recipes-core/dbus/dbus_1.12.20.bb
index cf6f7dc0ef..400c7a1401 100644
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
2.20.1

