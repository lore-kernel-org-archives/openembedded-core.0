Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web09.891.1613673385877211221
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Feb 2021 10:36:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IMhlQrtk;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id t15so4005528wrx.13
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Feb 2021 10:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VHS/2A0SDzoDefKp3yIfs9RX7HFW2Kg+CqyZ1pQHUyo=;
        b=IMhlQrtkScmAx47yheEt/o41oAHbSz8PGNwqCm/dio4D8mxYkIojrIJCVs1r9N0Q6h
         CFFlfwjJMMs1qC+dRrSQ9t6FHVLSraMEKB2bmW/jxL3MeSbMrV9ViRTtIIG4s9p6NGum
         387kV/xjgvQnkKtJZ0q0jxLUxQp+J9x6K0xEgXCpL0lJkjkYaMsY1rd20b26jWthAVTP
         3+aEgJqd8G6eETCC0PurE1S6K+H4Dnxm8rFQnUXTWawJZHKBC05Lca5JXWfiIJSnmg2Q
         tCf6Q0JmyPAg7zUZNq0HaG8aNU6w25O9wGA8FzRllobCaVKlcQ0sjHsyJ683SsOn2BwZ
         X1+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VHS/2A0SDzoDefKp3yIfs9RX7HFW2Kg+CqyZ1pQHUyo=;
        b=qGYRLUrKq5rmGfRfQkqc7JgEIZGgZVnVPW/scNP7ncaJw0p9nFl30i8bYPqn2Gb+1z
         xDtpHOMMvcZaSf/CL3tpOTRPPm8zNLl2WT9ThVCGwQi2YqhooR+SFP95ZtNy05UxjP6l
         4cO5SXuoS5NXQFnsIj+SL5cKbukfYgjrjbViAkewOz29I7x+hF0isNbE1JDXib47q8JO
         KFA2iTGaHRCvqAz659S0JpFfAD9BpaWW6gjeU2w/X4/1XFB6Ky+wjt4y4442/ZbnITLW
         23iW92VnHGDPkc4cc5davC/L4SIYDXLhGg4g6zBjBuIwxZSn/fh57Bw+h5FpVXPdZDHk
         bmbQ==
X-Gm-Message-State: AOAM530DVPjvsZGlnu0sWkrpzfiu1n8/uQDFET1yySh4ehFgXqMFJVJq
	czs8bQ5ZKjGuEy9t3jSfmdj92JRzDS8=
X-Google-Smtp-Source: ABdhPJwaTq9FXDf2Y0hJ9dWnKXC2VlJ0pI7t2jOv/rG7MhBjbPUsNEbVkAVMC9DJ0RIKmL4fI9FPkw==
X-Received: by 2002:adf:eb8e:: with SMTP id t14mr5518935wrn.20.1613673383410;
        Thu, 18 Feb 2021 10:36:23 -0800 (PST)
Return-Path: <luca.boccassi@gmail.com>
Received: from localhost ([2a01:4b00:f419:6f00:7a8e:ed70:5c52:ea3])
        by smtp.gmail.com with ESMTPSA id f17sm9931889wrx.57.2021.02.18.10.36.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Feb 2021 10:36:22 -0800 (PST)
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] systemd: add hostname fallback when polkit is not available
Date: Thu, 18 Feb 2021 18:36:20 +0000
Message-Id: <20210218183620.1527716-1-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Boccassi <luca.boccassi@microsoft.com>

When polkit is not available, networkd will not have permissions
to call hostnamed's dbus methods, as it runs without privileges.
To solve this, when building without polkit, make a new PACKAGECONFIG
'polkit_hostnamed_fallback' available which changes hostnamed so that
it runs as the 'systemd-network' user, the same as networkd, so that
the authorization works (and also with CAP_SYS_ADMIN since it loses
root).
Also run it with a separate 'systemd-hostname' group which also owns
the bus, to avoid giving the 'systemd-network' additional privileges.

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
 .../systemd/00-hostnamed-network-user.conf    |  6 ++++++
 .../org.freedesktop.hostname1_no_polkit.conf  | 11 +++++++++++
 meta/recipes-core/systemd/systemd_247.3.bb    | 19 ++++++++++++++++++-
 3 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/systemd/systemd/00-hostnamed-network-user.conf
 create mode 100644 meta/recipes-core/systemd/systemd/org.freedesktop.hostname1_no_polkit.conf

diff --git a/meta/recipes-core/systemd/systemd/00-hostnamed-network-user.conf b/meta/recipes-core/systemd/systemd/00-hostnamed-network-user.conf
new file mode 100644
index 0000000000..6b224ba9b9
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/00-hostnamed-network-user.conf
@@ -0,0 +1,6 @@
+[Service]
+# By running with these options instead of root, networkd is allowed to request
+# a hostname change via DBUS when policykit is not present
+User=systemd-network
+Group=systemd-hostname
+AmbientCapabilities=CAP_SYS_ADMIN
diff --git a/meta/recipes-core/systemd/systemd/org.freedesktop.hostname1_no_polkit.conf b/meta/recipes-core/systemd/systemd/org.freedesktop.hostname1_no_polkit.conf
new file mode 100644
index 0000000000..f4d0271cdb
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/org.freedesktop.hostname1_no_polkit.conf
@@ -0,0 +1,11 @@
+<?xml version="1.0"?> <!--*-nxml-*-->
+<!DOCTYPE busconfig PUBLIC "-//freedesktop//DTD D-BUS Bus Configuration 1.0//EN"
+        "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
+
+<busconfig>
+        <policy group="systemd-hostname">
+                <allow own="org.freedesktop.hostname1"/>
+                <allow send_destination="org.freedesktop.hostname1"/>
+                <allow receive_sender="org.freedesktop.hostname1"/>
+        </policy>
+</busconfig>
diff --git a/meta/recipes-core/systemd/systemd_247.3.bb b/meta/recipes-core/systemd/systemd_247.3.bb
index a99e543a77..59e000f1dd 100644
--- a/meta/recipes-core/systemd/systemd_247.3.bb
+++ b/meta/recipes-core/systemd/systemd_247.3.bb
@@ -16,6 +16,8 @@ REQUIRED_DISTRO_FEATURES = "systemd"
 
 SRC_URI += "file://touchscreen.rules \
            file://00-create-volatile.conf \
+           ${@bb.utils.contains('PACKAGECONFIG', 'polkit_hostnamed_fallback', 'file://org.freedesktop.hostname1_no_polkit.conf', '', d)} \
+           ${@bb.utils.contains('PACKAGECONFIG', 'polkit_hostnamed_fallback', 'file://00-hostnamed-network-user.conf', '', d)} \
            file://init \
            file://99-default.preset \
            file://systemd-pager.sh \
@@ -164,6 +166,10 @@ PACKAGECONFIG[openssl] = "-Dopenssl=true,-Dopenssl=false,openssl"
 PACKAGECONFIG[pam] = "-Dpam=true,-Dpam=false,libpam,${PAM_PLUGINS}"
 PACKAGECONFIG[pcre2] = "-Dpcre2=true,-Dpcre2=false,libpcre2"
 PACKAGECONFIG[polkit] = "-Dpolkit=true,-Dpolkit=false"
+# If polkit is disabled and networkd+hostnamed are in use, enabling this option and
+# using dbus-broker will allow networkd to be authorized to change the
+# hostname without acquiring additional privileges
+PACKAGECONFIG[polkit_hostnamed_fallback] = ",,,,dbus-broker,polkit"
 PACKAGECONFIG[portabled] = "-Dportabled=true,-Dportabled=false"
 PACKAGECONFIG[qrencode] = "-Dqrencode=true,-Dqrencode=false,qrencode,,qrencode"
 PACKAGECONFIG[quotacheck] = "-Dquotacheck=true,-Dquotacheck=false"
@@ -306,6 +312,15 @@ do_install() {
 		fi
 	fi
 
+	# If polkit is not available and a fallback was requested, install a drop-in that allows networkd to
+	# request hostname changes via DBUS without elevating its privileges
+	if ${@bb.utils.contains('PACKAGECONFIG', 'polkit_hostnamed_fallback', 'true', 'false', d)}; then
+		install -d ${D}${systemd_unitdir}/system/systemd-hostnamed.service.d/
+		install -m 0644 ${WORKDIR}/00-hostnamed-network-user.conf ${D}${systemd_unitdir}/system/systemd-hostnamed.service.d/
+		install -d ${D}${datadir}/dbus-1/system.d/
+		install -m 0644 ${WORKDIR}/org.freedesktop.hostname1_no_polkit.conf ${D}${datadir}/dbus-1/system.d/
+	fi
+
 	# create link for existing udev rules
 	ln -s ${base_bindir}/udevadm ${D}${base_sbindir}/udevadm
 
@@ -370,7 +385,8 @@ USERADD_PACKAGES = "${PN} ${PN}-extra-utils \
                     ${@bb.utils.contains('PACKAGECONFIG', 'microhttpd', '${PN}-journal-remote', '', d)} \
                     ${@bb.utils.contains('PACKAGECONFIG', 'journal-upload', '${PN}-journal-upload', '', d)} \
 "
-GROUPADD_PARAM_${PN} = "-r systemd-journal"
+GROUPADD_PARAM_${PN} = "-r systemd-journal;"
+GROUPADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'polkit_hostnamed_fallback', '-r systemd-hostname;', '', d)}"
 USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'coredump', '--system -d / -M --shell /sbin/nologin systemd-coredump;', '', d)}"
 USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'networkd', '--system -d / -M --shell /sbin/nologin systemd-network;', '', d)}"
 USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'polkit', '--system --no-create-home --user-group --home-dir ${sysconfdir}/polkit-1 polkitd;', '', d)}"
@@ -589,6 +605,7 @@ FILES_${PN} = " ${base_bindir}/* \
                 ${datadir}/dbus-1/system.d/org.freedesktop.network1.conf \
                 ${datadir}/dbus-1/system.d/org.freedesktop.resolve1.conf \
                 ${datadir}/dbus-1/system.d/org.freedesktop.systemd1.conf \
+                ${@bb.utils.contains('PACKAGECONFIG', 'polkit_hostnamed_fallback', '${datadir}/dbus-1/system.d/org.freedesktop.hostname1_no_polkit.conf', '', d)} \
                 ${datadir}/dbus-1/system.d/org.freedesktop.hostname1.conf \
                 ${datadir}/dbus-1/system.d/org.freedesktop.login1.conf \
                 ${datadir}/dbus-1/system.d/org.freedesktop.timesync1.conf \
-- 
2.29.2

