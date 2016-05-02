Return-Path: <otavio.salvador@gmail.com>
Received: from mail-pf0-f173.google.com (mail-pf0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id AF45D75C61
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 May 2016 20:14:27 +0000 (UTC)
Received: by mail-pf0-f173.google.com with SMTP id 77so50711492pfv.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 May 2016 13:14:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=/zHSKu+XZgoTXmsEray63WEDuebpMAZZ7zeOmjshCWU=;
	b=ipyQrG/NmfpYhZPgDj7NK7UWUZPujv20p8QazFWxoju5h3SlHh/MY4FjxJQih05WdS
	2oxJjmKJduT95YW1mR/fBS73mwZFfLEapxGT0yH2/M/3pslFPup5OMnmyouClojBLsWa
	d91ppSvuPTSTwaMoW+F9C5YOe/4QEx9crfMfteg50HC9tFwsBgRUz78lLFqDKAxIRIsT
	wc1Dx78z0LFd4U6/lph5fKJ7wQXiQRyZ/5x/QXeRGEAwn0lm52dPGwXxa8VcLk3maBYs
	H9iKw45VoOCNksuANGhDxFCBESPkVNcbFCfWDtjbDlkUrT3+g2S3OXZOwVE83fLhv/Ur
	/f0g==
X-Gm-Message-State: AOPr4FVGD3gwg9fgQ+ctd2oAyLhMddKf7ysqOBrK+H1a9OU7hRq5tgkN9a9jnANJBdg7CA==
X-Received: by 10.98.43.7 with SMTP id r7mr54577017pfr.24.1462220068119;
	Mon, 02 May 2016 13:14:28 -0700 (PDT)
Received: from localhost ([187.23.154.250]) by smtp.gmail.com with ESMTPSA id
	p189sm47498067pfb.51.2016.05.02.13.14.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 May 2016 13:14:26 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Mon, 02 May 2016 17:14:21 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon,  2 May 2016 17:13:40 -0300
Message-Id: <1462220023-17811-5-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1462220023-17811-1-git-send-email-otavio@ossystems.com.br>
References: <1462220023-17811-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: prabhu.sundararaj@nxp.com, Otavio Salvador <otavio@ossystems.com.br>,
	neenareddy.busireddy@nxp.com,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: [oe-core PATCH 4/7] weston-init: Rework init sequence to avoid code duplication
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
X-List-Received-Date: Mon, 02 May 2016 20:14:27 -0000

The new 'weston-start' script redcues the code duplication for SysV
and SystemD based images.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

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
index 0000000..eb4b600
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
+exec openvt "$openvt_args" weston -- $weston_args /var/log/weston.log 2>&1
diff --git a/meta/recipes-graphics/wayland/weston-init/weston.service b/meta/recipes-graphics/wayland/weston-init/weston.service
index 4f1f7ff..f61d353 100644
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


