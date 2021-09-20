Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web08.9554.1632131749042069286
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Sep 2021 02:55:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QKp/l3o/;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: jan.vermaete@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id dj4so2921826edb.5
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Sep 2021 02:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c1W06NkM5V/0Y5heYnQbIZu7azzophimuGdHk4z6NeY=;
        b=QKp/l3o/7bkM+t1G7YBvA77ocoN4b5UlGkgY2KbJ9evgQTovi4SWOVPQp2px30Htij
         LiF3W6p0uwoz/HEs6eJLo0tU4Kbh4OhsXKVi+wlTegyZkaoveaP68Hk2VuArsNiSnora
         1dnPXQwTf5Zx9V4APSC4hPxGDkhmyD+tobI3HOj00Rw+1pfiNROusJPL16fkgWZ9ksqg
         0Ca5878tOlUBEftpLLfPojOwjTx4yyj3Ed92AUh+kwXalf8yZ7ZJgQEfVT3y8RHBRXny
         aIDtnvTt+gN3TKzWf/G8X6BM0vvzDUGhS71t1RUzf7ffI/1ZNl5y30PDnOBCG3eapHim
         jM6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c1W06NkM5V/0Y5heYnQbIZu7azzophimuGdHk4z6NeY=;
        b=cilMt3/+Q0jaxY6jCQe3FF16DWNOgXg3fDKg2Yx/Z4X6mUD7cMUKkqMY+YbxZUaoUt
         XNw8cJl8gT9jxvOm/LNGUCdks34IKE4JmIVxYvW3DIovkvgp0nBTX85sHAswPYcnO0Uc
         Kw8RHgQR8gDhlRDbx0v8aYTB8XZXeh+Pt3Zd14tfpsdyPYR2K3xX6JOWWjXcdBQEGcah
         xkU/r6rJ7q1JTPcDpnrnOfnxe5YrLSz5r5nooa7j9bFJlgqk2tmbgWrjR9xJHR7YU2nx
         C3h+3mOByseds3BVaKw84QNBgLW/S0jcjJ3IBFnVa9m741LyJwLqM4ZJpspultHmOxst
         Gt9w==
X-Gm-Message-State: AOAM530hJmaFKfMcX6BhaiPF3TQNknLkfeMGDti1zjnIKmClgI1/ICft
	EIvXEbBC4e/UTK4kn4ASzlYApUEtIvk=
X-Google-Smtp-Source: ABdhPJyby2HvjCKy2gCPcF3B6hI+3/zeZgw1BiXl+CVPGk9OVJ3vxc/jR4184uWwbHrhj7bC4BVdsw==
X-Received: by 2002:a17:906:1299:: with SMTP id k25mr27415101ejb.139.1632131746592;
        Mon, 20 Sep 2021 02:55:46 -0700 (PDT)
Return-Path: <jan.vermaete@gmail.com>
Received: from localhost.localdomain (78-20-166-56.access.telenet.be. [78.20.166.56])
        by smtp.googlemail.com with ESMTPSA id u4sm5901718ejc.19.2021.09.20.02.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 02:55:46 -0700 (PDT)
From: "jan" <jan.vermaete@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [[meta-webserver]] netdata: Fixed the recipe.
Date: Mon, 20 Sep 2021 11:55:31 +0200
Message-Id: <20210920095531.5426-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The netdata website was not accessable due to some (changed) permissions.
The systemd service file will start netdata deamon with the netdata user.
The netdata group as existing, but the netdata user was missing.

I moved some directory creations from systemd to the bitbake recipe.

The project website address changed too.

Tested with meta-raspberrypi on rpi4-32.

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 .../netdata/netdata/netdata.service           | 13 +++++++-----
 .../recipes-webadmin/netdata/netdata_git.bb   | 21 +++++++++++++------
 2 files changed, 23 insertions(+), 11 deletions(-)

diff --git a/meta-webserver/recipes-webadmin/netdata/netdata/netdata.service b/meta-webserver/recipes-webadmin/netdata/netdata/netdata.service
index b244d1866..7d50a7fdd 100644
--- a/meta-webserver/recipes-webadmin/netdata/netdata/netdata.service
+++ b/meta-webserver/recipes-webadmin/netdata/netdata/netdata.service
@@ -1,13 +1,16 @@
+# SPDX-License-Identifier: GPL-3.0-or-later
 [Unit]
-Description=Netdata, Real-time performance monitoring
+Description=Real time performance monitoring
 RequiresMountsFor=/var
+After=network.target
 
 [Service]
-User=root
+Type=simple
+PIDFile=/var/run/netdata/netdata.pid
 ExecStartPre=/bin/mkdir -p /var/log/netdata
-ExecStartPre=/bin/chown -R nobody.netdata @@datadir/netdata/web
-ExecStartPre=/bin/chown -R nobody.netdata /var/cache/netdata
-ExecStart=/usr/sbin/netdata -nd
+ExecStartPre=/bin/chown -R netdata.netdata /var/log/netdata
+ExecStart=/usr/sbin/netdata -D -u netdata
+
 
 [Install]
 WantedBy=multi-user.target
diff --git a/meta-webserver/recipes-webadmin/netdata/netdata_git.bb b/meta-webserver/recipes-webadmin/netdata/netdata_git.bb
index 7c48b8a37..9a2467202 100644
--- a/meta-webserver/recipes-webadmin/netdata/netdata_git.bb
+++ b/meta-webserver/recipes-webadmin/netdata/netdata_git.bb
@@ -1,17 +1,19 @@
-HOMEPAGE = "https://github.com/firehol/netdata/"
+HOMEPAGE = "https://github.com/netdata/netdata/"
 SUMMARY = "Real-time performance monitoring"
+DESCRIPTION = "Netdata is high-fidelity infrastructure monitoring and troubleshooting. \
+               Open-source, free, preconfigured, opinionated, and always real-time."
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fc9b848046ef54b5eaee6071947abd24"
 
-SRC_URI = "git://github.com/firehol/netdata.git;protocol=https"
+SRC_URI:append = " git://github.com/firehol/netdata.git;protocol=https"
 SRCREV = "1be9200ba8e11dc81a2101d85a2725137d43f766"
 PV = "1.22.1"
 
 # default netdata.conf for netdata configuration
-SRC_URI += "file://netdata.conf"
+SRC_URI:append = " file://netdata.conf"
 
 # file for providing systemd service support
-SRC_URI += "file://netdata.service"
+SRC_URI:append = " file://netdata.service"
 
 S = "${WORKDIR}/git"
 
@@ -31,7 +33,7 @@ SYSTEMD_AUTO_ENABLE:${PN} = "enable"
 
 #User specific
 USERADD_PACKAGES = "${PN}"
-GROUPADD_PARAM:${PN} = "--system netdata"
+USERADD_PARAM:${PN} = "--system --no-create-home --home-dir ${localstatedir}/run/netdata --user-group netdata"
 
 do_install:append() {
     #set S UID for plugins
@@ -50,6 +52,13 @@ do_install:append() {
     sed -i -e 's,@@sysconfdir,${sysconfdir},g' ${D}${sysconfdir}/netdata/netdata.conf
     sed -i -e 's,@@libdir,${libexecdir},g' ${D}${sysconfdir}/netdata/netdata.conf
     sed -i -e 's,@@datadir,${datadir},g' ${D}${sysconfdir}/netdata/netdata.conf
+
+    install --group netdata --owner netdata --directory ${D}${localstatedir}/cache/netdata
+    install --group netdata --owner netdata --directory ${D}${localstatedir}/lib/netdata
+
+    chown -R netdata:netdata ${D}${datadir}/netdata/web
 }
 
-RDEPENDS:${PN} = "bash zlib"
+FILES_${PN} += "${localstatedir}/cache/netdata/ ${localstatedir}/lib/netdata/"
+
+RDEPENDS_${PN} = "bash zlib"
-- 
2.25.1

