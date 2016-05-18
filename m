Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id DFD7F731D4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 16:42:50 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id q184so4872898qkf.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 09:42:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=tVX2oHQvJOpOn2CsDP4JA6YxmZjwmki2khOQwA7zBSA=;
	b=g0g5xs8U47eRk+SAitg9lvodAek3FT7lz/VhdwxLSRaJphFAZDEjIFxnbSrScSWm0g
	FUfMDSr7dADfEgYRgc84Dxe1X8f528UagoIcqNUXds9e3V8m2PhGTOv9JKo9B39BRszk
	pnWl4rAXp2xz7LuHaBlgColiNjDrWEKwysL9VTSkwLNt70ONk4X3DqelOAr26Ih2d1rt
	MVVkK/jQesMcTYpjTQYQxO3r3iRHvgrCUqdu/ZNIc1on4jan/ZWOXdUKYissQ4YLQ8M8
	En8oDjcZZ4Z/8T256epyzwt8kv+hl3h5CwXa+Tis9/binWoCKit9GABSzVWnvtexHdFU
	wYbQ==
X-Gm-Message-State: AOPr4FVnhrN2nMXIETum9xh7V8Q8ZhgzuuEuAVx3Ew3NyQi5y5uH5S+PHM8ff9zGS+f+4Q==
X-Received: by 10.55.88.5 with SMTP id m5mr8796221qkb.134.1463589771335;
	Wed, 18 May 2016 09:42:51 -0700 (PDT)
Received: from localhost ([187.23.154.250]) by smtp.gmail.com with ESMTPSA id
	p128sm4512301qha.41.2016.05.18.09.42.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 May 2016 09:42:49 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Wed, 18 May 2016 13:42:40 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 18 May 2016 13:40:45 -0300
Message-Id: <1463589648-28641-11-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1463589648-28641-1-git-send-email-otavio@ossystems.com.br>
References: <1463589648-28641-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: prabhu.sundararaj@nxp.com, Otavio Salvador <otavio@ossystems.com.br>,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: [oe-core PATCH v8 10/13] weston-init: Add module support for the weston-start helper
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
X-List-Received-Date: Wed, 18 May 2016 16:42:51 -0000

To make weston-start more flexible we now support module loading. For
such modules, following functions can be used:

 - add_weston_argument
 - add_openvt_argument

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v8:
- Use ${datadir} for module path (Ross)

Changes in v7: None
Changes in v6: None
Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2:
- Drop weston-lunch use as it requires PAM

 meta/recipes-graphics/wayland/weston-init.bb       |  3 +++
 .../wayland/weston-init/weston-start               | 26 ++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index 3a2251e..e4e2701 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -11,7 +11,10 @@ S = "${WORKDIR}"
 do_install() {
 	install -Dm755 ${WORKDIR}/init ${D}/${sysconfdir}/init.d/weston
 	install -Dm0644 ${WORKDIR}/weston.service ${D}${systemd_system_unitdir}/weston.service
+
+	# Install weston-start script
 	install -Dm755 ${WORKDIR}/weston-start ${D}${bindir}/weston-start
+	sed -i 's,@DATADIR@,${datadir},g' ${D}${bindir}/weston-start
 }
 
 inherit allarch update-rc.d distro_features_check systemd
diff --git a/meta/recipes-graphics/wayland/weston-init/weston-start b/meta/recipes-graphics/wayland/weston-init/weston-start
index dc2b1ef..4aa7c66 100755
--- a/meta/recipes-graphics/wayland/weston-init/weston-start
+++ b/meta/recipes-graphics/wayland/weston-init/weston-start
@@ -9,6 +9,19 @@ usage() {
 EOF
 }
 
+## Module support
+modules_dir=@DATADIR@/weston-start
+
+# Add weston extra argument
+add_weston_argument() {
+	weston_args="$weston_args $1"
+}
+
+# Add openvt extra argument
+add_openvt_argument() {
+	openvt_args="$openvt_args $1"
+}
+
 if test $# -lt 2; then
 	usage
 	exit 1
@@ -32,6 +45,19 @@ done
 
 weston_args=$*
 
+# Load and run modules
+if [ -d "$modules_dir" ]; then
+	for m in "$modules_dir"/*; do
+		# Skip backup files
+		if [ "`echo $m | sed -e 's/\~$//'`" != "$m" ]; then
+			continue
+		fi
+
+		# process module
+		. $m
+	done
+fi
+
 if test -z "$XDG_RUNTIME_DIR"; then
     export XDG_RUNTIME_DIR=/run/user/`id -u`
     mkdir --parents $XDG_RUNTIME_DIR
-- 
2.8.2


