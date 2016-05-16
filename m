Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id D87D3731D7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 19:14:32 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id i7so15372888qkd.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 12:14:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=VHX+Cos0EeNp6ypDlGrRmKlQ0fEm5Pe/5fkGNL5dNek=;
	b=F6/Uu+sLD5MItvv1kYR0aIOrC5coHkYCcyGnDlGrZ2UuBToZavv5p8eKcBX0HwImJQ
	5Vmz9/5pblArniL4cUlfNQ8iVKsCyiUsYEq3b9TImwPC2QNM1haObJ9UI54/3Ddzu7gY
	vg6bHlgtXmDY3dYIqIlXqgDWGtbo+/fW8DKFyZQmSeNIZhsvUrekDGy7p57ZtQm54gaN
	W2auO0KTPLfDvbI0fWAnjKyM/R8NsLbfW0Uyh+52XeMJMz31r0gAr0ZQxO8VUR/Kt2p9
	JLG59NNv72pffgN0KFmtlxryywKkmX4Em5O1Wm73p8qSrbKTFXL8WGsTNpZ62JWg23wZ
	f7Zg==
X-Gm-Message-State: AOPr4FUvXo6HvezqMzlTKkJpcZbZnmsQ97JI6Ye/8f1tthKyk7yom6D7HYMUuaSxjnSgmg==
X-Received: by 10.55.204.3 with SMTP id r3mr23060725qki.65.1463426073711;
	Mon, 16 May 2016 12:14:33 -0700 (PDT)
Received: from localhost ([187.23.154.250]) by smtp.gmail.com with ESMTPSA id
	94sm15437696qgl.11.2016.05.16.12.14.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 May 2016 12:14:32 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Mon, 16 May 2016 16:14:23 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 16 May 2016 16:12:10 -0300
Message-Id: <1463425932-10080-13-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1463425932-10080-1-git-send-email-otavio@ossystems.com.br>
References: <1463425932-10080-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: prabhu.sundararaj@nxp.com, Otavio Salvador <otavio@ossystems.com.br>,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: [oe-core PATCH v6 12/14] weston-init: Add module support for the weston-start helper
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
X-List-Received-Date: Mon, 16 May 2016 19:14:33 -0000

To make weston-start more flexible we now support module loading. For
such modules, following functions can be used:

 - add_weston_argument
 - add_openvt_argument

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v6: None
Changes in v5: None
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


