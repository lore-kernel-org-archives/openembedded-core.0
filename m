Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f66.google.com (mail-qg0-f66.google.com
	[209.85.192.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5442A70034
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 14:31:58 +0000 (UTC)
Received: by mail-qg0-f66.google.com with SMTP id 90so3070294qgz.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 07:31:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=JT2O1RGDJTEjDP49sNqARzyM2iXF5aNX6rWJRj32AiE=;
	b=VIgbYtXE4ruQ6ZAceklFwxFHn63VqI7GuHfG9aD084n8L4kprcKPPVR6wWSZyevxV4
	WAJLzL+1Mr0kRox/lUP8lEkepO24VIHXriZ2l9FT6yHGtYyTFmFcstM2zQ905HqcX99r
	hWS1R9Gh4SR9r6NnMdyiWRaIeW6BCE9bG7cuYitfD+bjcfi1HwjXPjmndjeXkONVNLBr
	yrmEqZq6dmyoR3HF6FZxWx1MNA5fZPBcPWZfDtqbaxvc6va/4extRvsq1mHA/uYMaauP
	1HrWpIsY+0ShwBxgklUgrfeeGZLJqE2eEB8rTfUgDbUrubmYqF3Nn0JAc8Qbia2uytlB
	44mw==
X-Gm-Message-State: AOPr4FUtkZ3XrxSnVATWfC9GHo1e4m60J4z8lVfVkzB+42S8mKBg7Va/5jw4lT6IRqRB6w==
X-Received: by 10.140.99.106 with SMTP id p97mr3752283qge.94.1462977119154;
	Wed, 11 May 2016 07:31:59 -0700 (PDT)
Received: from localhost ([187.23.154.250]) by smtp.gmail.com with ESMTPSA id
	s184sm3510483qhc.28.2016.05.11.07.31.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 May 2016 07:31:58 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Wed, 11 May 2016 11:31:52 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 11 May 2016 11:30:40 -0300
Message-Id: <1462977042-7436-10-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1462977042-7436-1-git-send-email-otavio@ossystems.com.br>
References: <1462977042-7436-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: prabhu.sundararaj@nxp.com, Otavio Salvador <otavio@ossystems.com.br>,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: [oe-core PATCH v5 09/11] weston-init: Add module support for the weston-start helper
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
X-List-Received-Date: Wed, 11 May 2016 14:31:58 -0000

To make weston-start more flexible we now support module loading. For
such modules, following functions can be used:

 - add_weston_argument
 - add_openvt_argument

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

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


