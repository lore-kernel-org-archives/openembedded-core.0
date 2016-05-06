Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id 65AA7731AF
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 May 2016 20:44:48 +0000 (UTC)
Received: by mail-qg0-f43.google.com with SMTP id f92so62636571qgf.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 May 2016 13:44:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=W0mpKu8xkewYZtpS3IoIo4b1cbFynIeT0DzT//Fc8fg=;
	b=IrnJYF2toMqicnIdgayR74r5Q1NUAjHKB1PFwULpoVlvkNEiTSgX/tdYLsC1MAEwr5
	nMD0cLzulI/v57fFdYVXWJiqlXEJ4zae8Wdp9r7ZilaKler6AgPkVC8oHkO1AybldsSh
	SAszckHjfiYZZeKBBizw1sMGfwUZEvxu5ltPyOTj6aqlUeS24XrOznx+DLJ6krU6GTFe
	oZfXCMDaz18f8RLKDupYW4RSvz6oeINFdjDuQuIekYHxRd+JtpDo2zqjkJ4oLjcEVr/8
	8fPpT4j1s7k2Vrje0KYvQh3ikLhPNaSyO8GjHbdSqQEFDzbmDM9TJpIN/bZrY3gJNtrs
	BlVQ==
X-Gm-Message-State: AOPr4FU0Ja/RjMKoz5yyyi6WZoLlqFKt9RvyGNxDYV74jQx4+vQeo8yT+5NGpLYATSlRiA==
X-Received: by 10.141.42.133 with SMTP id t127mr16639755qhe.12.1462567489637; 
	Fri, 06 May 2016 13:44:49 -0700 (PDT)
Received: from localhost ([187.23.154.250]) by smtp.gmail.com with ESMTPSA id
	z127sm6428608qhz.8.2016.05.06.13.44.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 May 2016 13:44:48 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Fri, 06 May 2016 17:44:42 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri,  6 May 2016 17:43:37 -0300
Message-Id: <1462567419-3459-9-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1462567419-3459-1-git-send-email-otavio@ossystems.com.br>
References: <1462567419-3459-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: prabhu.sundararaj@nxp.com, Otavio Salvador <otavio@ossystems.com.br>,
	neenareddy.busireddy@nxp.com,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: [oe-core PATCH v4 08/10] weston-init: Add module support for the weston-start helper
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
X-List-Received-Date: Fri, 06 May 2016 20:44:49 -0000

To make weston-start more flexible we now support module loading. For
such modules, following functions can be used:

 - add_weston_argument
 - add_openvt_argument

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v4: None
Changes in v3: None
Changes in v2:
- Drop weston-lunch use as it requires PAM

 .../wayland/weston-init/weston-start               | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/meta/recipes-graphics/wayland/weston-init/weston-start b/meta/recipes-graphics/wayland/weston-init/weston-start
index dc2b1ef..17b0c16 100755
--- a/meta/recipes-graphics/wayland/weston-init/weston-start
+++ b/meta/recipes-graphics/wayland/weston-init/weston-start
@@ -9,6 +9,19 @@ usage() {
 EOF
 }
 
+## Module support
+modules_dir=/usr/share/weston-start
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


