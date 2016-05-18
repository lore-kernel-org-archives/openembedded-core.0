Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f67.google.com (mail-qg0-f67.google.com
	[209.85.192.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9577773192
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 16:42:28 +0000 (UTC)
Received: by mail-qg0-f67.google.com with SMTP id b14so4641648qge.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 09:42:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=sJBS14F63aNV7VgKLxBH3PCyWRMGs0LE7m5VpHQWkTA=;
	b=SVk6lHNWB6Wrl1hOGK8ayNddEw3pWb6/vbUQiHW9NwCoVyaBSkEgME/oFJg+DmhYgw
	XIEs3pt9lXAfoF35MEX3hAQh1c+nYU8savp9z8jdzZxvZvN1KYdztSZOSEsNcNX+I02R
	XdXT9YesuP1nO1+fyv/BLZJpdSJEKhSrJs8fm4ae8aNyiHU3osZcz9o++jG2/LZMRcqZ
	MRjG+Tx4jZCLvnz/h8kO6+44g5Nx8nckCt2IWrD/swQIG51FW5EIpsnL4SzFIqGZ59h4
	rVgs+PuakJBuZzjzACafxUCArQjucYOH7XO9xK8Prq+dKDZ1T3H+RnUty1+SgU+HHvxj
	GhVQ==
X-Gm-Message-State: AOPr4FXfGWC9qTTOB00EgoCZoDn0JV9p4XwMVNTdynbp0Cad7ADexyjG59ijRbyQcd2e0A==
X-Received: by 10.140.32.37 with SMTP id g34mr8783276qgg.31.1463589749409;
	Wed, 18 May 2016 09:42:29 -0700 (PDT)
Received: from localhost ([187.23.154.250]) by smtp.gmail.com with ESMTPSA id
	f19sm4545635qgd.21.2016.05.18.09.42.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 May 2016 09:42:28 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Wed, 18 May 2016 13:42:19 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 18 May 2016 13:40:43 -0300
Message-Id: <1463589648-28641-9-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1463589648-28641-1-git-send-email-otavio@ossystems.com.br>
References: <1463589648-28641-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: prabhu.sundararaj@nxp.com, Otavio Salvador <otavio@ossystems.com.br>,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: [oe-core PATCH v8 08/13] weston-init: Rework init sequence to avoid code duplication
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
X-List-Received-Date: Wed, 18 May 2016 16:42:28 -0000

The new 'weston-start' script redcues the code duplication for SysV
and SystemD based images.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v8: None
Changes in v7: None
Changes in v6: None
Changes in v5: None
Changes in v4:
- Use --log= for weston call

Changes in v3:
- Fix log redirection
- Fix argument pass for openvt

Changes in v2: None

 meta/recipes-graphics/wayland/weston-init.bb       |  4 ++-
 meta/recipes-graphics/wayland/weston-init/init     |  9 +-----
 .../wayland/weston-init/weston-start               | 36 ++++++++++++++++++++++
 .../wayland/weston-init/weston.service             |  5 +--
 4 files changed, 41 insertions(+), 13 deletions(-)
 create mode 100755 meta/recipes-graphics/wayland/weston-init/weston-start

diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index 4ad62cf..3a2251e 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -3,13 +3,15 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"
 
 SRC_URI = "file://init \
-           file://weston.service"
+           file://weston.service \
+           file://weston-start"
 
 S = "${WORKDIR}"
 
 do_install() {
 	install -Dm755 ${WORKDIR}/init ${D}/${sysconfdir}/init.d/weston
 	install -Dm0644 ${WORKDIR}/weston.service ${D}${systemd_system_unitdir}/weston.service
+	install -Dm755 ${WORKDIR}/weston-start ${D}${bindir}/weston-start
 }
 
 inherit allarch update-rc.d distro_features_check systemd
diff --git a/meta/recipes-graphics/wayland/weston-init/init b/meta/recipes-graphics/wayland/weston-init/init
index 2e938f4..5c925f4 100644
--- a/meta/recipes-graphics/wayland/weston-init/init
+++ b/meta/recipes-graphics/wayland/weston-init/init
@@ -31,14 +31,7 @@ case "$1" in
   start)
         . /etc/profile
 
-        # This is all a nasty hack
-        if test -z "$XDG_RUNTIME_DIR"; then
-                export XDG_RUNTIME_DIR=/run/user/root
-                mkdir --parents $XDG_RUNTIME_DIR
-                chmod 0700 $XDG_RUNTIME_DIR
-        fi
-
-        openvt -s weston -- $OPTARGS
+        weston-start -s -- $OPTARGS
   ;;
 
   stop)
diff --git a/meta/recipes-graphics/wayland/weston-init/weston-start b/meta/recipes-graphics/wayland/weston-init/weston-start
new file mode 100755
index 0000000..b791fd5
--- /dev/null
+++ b/meta/recipes-graphics/wayland/weston-init/weston-start
@@ -0,0 +1,36 @@
+#!/bin/sh
+# Copyright (C) 2016 O.S. Systems Software LTDA.
+
+export PATH="/sbin:/usr/sbin:/bin:/usr/bin"
+
+usage() {
+    cat <<EOF
+    $0 <openvt arguments> -- <weston options>
+EOF
+}
+
+if test $# -lt 2; then
+	usage
+	exit 1
+fi
+
+openvt_args=""
+while [ -n "$1" ]; do
+	openvt_args="$openvt_args $1"
+	shift
+
+	if [ "$1" = "--" ]; then
+		shift
+		break
+	fi
+done
+
+weston_args=$*
+
+if test -z "$XDG_RUNTIME_DIR"; then
+    export XDG_RUNTIME_DIR=/run/user/`id -u`
+    mkdir --parents $XDG_RUNTIME_DIR
+    chmod 0700 $XDG_RUNTIME_DIR
+fi
+
+exec openvt $openvt_args -- weston $weston_args --log=/var/log/weston.log
diff --git a/meta/recipes-graphics/wayland/weston-init/weston.service b/meta/recipes-graphics/wayland/weston-init/weston.service
index 12aedb7..689ce41 100644
--- a/meta/recipes-graphics/wayland/weston-init/weston.service
+++ b/meta/recipes-graphics/wayland/weston-init/weston.service
@@ -5,10 +5,7 @@ RequiresMountsFor=/run
 [Service]
 User=root
 EnvironmentFile=-/etc/default/weston
-Environment="XDG_RUNTIME_DIR=/run/user/root"
-ExecStartPre=/bin/mkdir -p /run/user/root
-ExecStartPre=/bin/chmod 0700 /run/user/root
-ExecStart=/usr/bin/openvt -v -e /usr/bin/weston -- $OPTARGS
+ExecStart=/usr/bin/weston-start -v -e -- $OPTARGS
 
 [Install]
 WantedBy=multi-user.target
-- 
2.8.2


