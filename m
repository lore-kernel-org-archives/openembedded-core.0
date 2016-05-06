Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f47.google.com (mail-qg0-f47.google.com
	[209.85.192.47])
	by mail.openembedded.org (Postfix) with ESMTP id 85672760A6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 May 2016 20:44:32 +0000 (UTC)
Received: by mail-qg0-f47.google.com with SMTP id f92so62633254qgf.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 May 2016 13:44:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=1N82ILWQG4Jk3SYHm5a/afvbSdP4Ebdj64NOgiCGZOM=;
	b=nOFdYsaCqEQBihasV2kGmUfbpjP40TOoGOEeQLKoLbI0duFS9WYyDVbEnOvAGzsYIi
	jmRnuYsFi+qM9ouuALlgOHIZY1YTjJ7lK1xusR22Edy4SfrAF7ZfIOJidqn+JXfaEcho
	97W1aqMmV0LdbLMRc1SJgtfJUkZtRoPUla4fMrMtNg08oSr6Y7QJD4CTRhOUmHMy6vMb
	Ny7Q6R9Ww1W5TYV62Ry/NgyQn/b+t18/r9UJIe/XKxS1d+YuYu9VR3g32d6Cb7RYAOuL
	ozT4EI1P/6YntXHNfb0fNWnw4JAz1GLu6HtwsKINF+OzVfFaZe1s21I75UllN4e8Hojn
	/JfA==
X-Gm-Message-State: AOPr4FXGWYPhXVz+ZIZVqCzr0QSrr9eri9Q0+JJza8ilWw2MkHTWtkey1zsgwy07DraygQ==
X-Received: by 10.140.93.103 with SMTP id c94mr21852703qge.74.1462567473350;
	Fri, 06 May 2016 13:44:33 -0700 (PDT)
Received: from localhost ([187.23.154.250])
	by smtp.gmail.com with ESMTPSA id h83sm6433612qhh.4.2016.05.06.13.44.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 May 2016 13:44:32 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Fri, 06 May 2016 17:44:25 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri,  6 May 2016 17:43:35 -0300
Message-Id: <1462567419-3459-7-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1462567419-3459-1-git-send-email-otavio@ossystems.com.br>
References: <1462567419-3459-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: prabhu.sundararaj@nxp.com, Otavio Salvador <otavio@ossystems.com.br>,
	neenareddy.busireddy@nxp.com,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: [oe-core PATCH v4 06/10] weston-init: Rework init sequence to avoid code duplication
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
X-List-Received-Date: Fri, 06 May 2016 20:44:32 -0000

The new 'weston-start' script redcues the code duplication for SysV
and SystemD based images.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

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


