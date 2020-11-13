Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web08.5321.1605279037055005781
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Nov 2020 06:50:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FyvHPxFE;
 spf=pass (domain: gmail.com, ip: 209.85.221.67, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wr1-f67.google.com with SMTP id o15so10199159wru.6
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2020 06:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vvn0bU2bUBSJKYwGMLL326A+7SCh/VtwyWQG1+wAT1I=;
        b=FyvHPxFERd0ef4zE+51mvOzhYFBeegb55MDm4lamSbc61mdp7pFuTwXhanOuEF47ph
         drwHoTOe7rRwCULWgm3WLUTzqwZzeVpiawW17ihpN+rpJfgl+IKykUwJDNyx0g4rIdES
         XndmuVTexW/k9hXn25NO8S3FiEC2yk4P87qhiqkD87P6X/wqylBmUcgGyN6bLHkqpf7O
         IJa9Sp28b9SI6QT2NDUbZDtDZJhlBJ/EfLy4ju7z3i8NROSrq6mPhspBrc4ovJM74C7m
         y4HB4ChqbT++zs9kB87DCcJ0Hnuz82yOIpLhF6VUdK8shShKXkwzS2p9+nt8PfgBXhXU
         StFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vvn0bU2bUBSJKYwGMLL326A+7SCh/VtwyWQG1+wAT1I=;
        b=ehgxlgfj7ujx7b4fZKmJer9OzpxhMsE4lQShbEljXCW68yV7Umy4gYcY1URfKzYgb2
         m+kCTQFzNF3No3we78+mh0iPMRULi+YmTc9IFpFR69J5dXD+bhSaAwWw4COoZ/ZJk4JY
         YE7Tym+KD8q/4PP53ExUVHFLXGHc8qlmw+Bwd1t5KTRz9EPe6kl2JZXMcm4OUE48nWlx
         YPvxA//9MtqwnfJvp/jLlV2rOgb1ogxXH5zqhPWVa0BnZKUJhQOuJ3ZDsCNVV99hxte+
         Kq4cGpLuB3M0mSNs66eAt5r3olkdzlns2oiq2AQeE9dEuDDKZRd8caSJ61zShSolxwCi
         fjWA==
X-Gm-Message-State: AOAM5329h1kaQ4K/i9JRFkkrr4dkvvmbQbVX6zCG5LI4uDLXvTyqjVkL
	Qqfdo2xaZBtERyQMy56sgdnAWRu0k9jxNw==
X-Google-Smtp-Source: ABdhPJxB4giMXWMQy1NKgNwLKnaEobXJgzghvYq3QmgWt8G11hZUet1lGj0c38QVnaP56BykbngVHg==
X-Received: by 2002:a05:6000:1d2:: with SMTP id t18mr3963965wrx.14.1605279035149;
        Fri, 13 Nov 2020 06:50:35 -0800 (PST)
Return-Path: <luca.boccassi@gmail.com>
Received: from localhost ([88.98.246.218])
        by smtp.gmail.com with ESMTPSA id r10sm10259956wmg.16.2020.11.13.06.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 06:50:34 -0800 (PST)
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org
Subject: [PATCH v4] dbus: split -common and -tools out of main package
Date: Fri, 13 Nov 2020 14:50:31 +0000
Message-Id: <20201113145031.1099300-1-luca.boccassi@gmail.com>
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
v4: use ${PN} again in RDEPENDS, and instead set RDEPENDS_${PN}_class-native
    to empty string as suggested

 meta/recipes-core/dbus/dbus_1.12.20.bb | 36 ++++++++++++++++----------
 1 file changed, 22 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus_1.12.20.bb b/meta/recipes-core/dbus/dbus_1.12.20.bb
index cf6f7dc0ef..4040fdb22a 100644
--- a/meta/recipes-core/dbus/dbus_1.12.20.bb
+++ b/meta/recipes-core/dbus/dbus_1.12.20.bb
@@ -11,6 +11,8 @@ RDEPENDS_dbus_class-nativesdk = ""
 PACKAGES += "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '${PN}-ptest', '', d)}"
 ALLOW_EMPTY_dbus-ptest = "1"
 RDEPENDS_dbus-ptest_class-target = "dbus-test-ptest"
+RDEPENDS_${PN} += "${PN}-common ${PN}-tools"
+RDEPENDS_${PN}_class-native = ""
 
 inherit useradd update-rc.d
 
@@ -31,7 +33,7 @@ CONFFILES_${PN} = "${sysconfdir}/dbus-1/system.conf ${sysconfdir}/dbus-1/session
 
 DEBIANNAME_${PN} = "dbus-1"
 
-PACKAGES =+ "${PN}-lib"
+PACKAGES =+ "${PN}-lib ${PN}-common ${PN}-tools"
 
 OLDPKGNAME = "dbus-x11"
 OLDPKGNAME_class-nativesdk = ""
@@ -41,31 +43,37 @@ RPROVIDES_${PN} = "${OLDPKGNAME}"
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

