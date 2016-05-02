Return-Path: <otavio.salvador@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 2386A731E6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 May 2016 20:14:41 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id r5so80295820pag.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 May 2016 13:14:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=TgWpw/VibbBSaZBQVNb/rtBfGohb4LnaJBPIOjx8vlA=;
	b=C2vPB1SOB+L7eMWEFIXoQq72l99bfmo7Q9D/AuYuOcPhbNC32ZB7aCgWfRQhRxrNJR
	/5uohswAq0QV2hhOLdoqwPcjdlBtssTlj8RM6V3kXrzHFsOQm4pGKtLHvzLOYZOtwTRm
	4VMsLIS8LY/oMlWU6J+t28UUPMV5LAtNFkRIvmLQgdNbyrltwKvfyeMx21YrF7m3cPDX
	FEyj1icXFvcXEs28clbQT9QHCzZYmU6XPZ6T3wTnmWieC1sHFTb4kL5cb0qCt/7qmTuu
	93YWJK8dhBzQuPfrxwvUxZ0y2PpLOco1h2c88V/OtXtZ5NjHMeR85zoVYjrmWo+aLRFB
	0VxA==
X-Gm-Message-State: AOPr4FXShtoy2DOYHVWowB69BgVqmiIQDjZ5ltHE9WMfN9+XThAsNYiZpIt295iV4ADIcQ==
X-Received: by 10.66.148.2 with SMTP id to2mr45349519pab.72.1462220082155;
	Mon, 02 May 2016 13:14:42 -0700 (PDT)
Received: from localhost ([187.23.154.250]) by smtp.gmail.com with ESMTPSA id
	i67sm47499931pfb.56.2016.05.02.13.14.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 May 2016 13:14:41 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Mon, 02 May 2016 17:14:35 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon,  2 May 2016 17:13:42 -0300
Message-Id: <1462220023-17811-7-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1462220023-17811-1-git-send-email-otavio@ossystems.com.br>
References: <1462220023-17811-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: prabhu.sundararaj@nxp.com, Otavio Salvador <otavio@ossystems.com.br>,
	neenareddy.busireddy@nxp.com,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: [oe-core PATCH 6/7] weston-init: Add module support for the weston-start helper
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
X-List-Received-Date: Mon, 02 May 2016 20:14:41 -0000

To make weston-start more flexible we now support module loading. For
such modules, following functions can be used:

 - add_weston_argument
 - add_openvt_argument
 - use_launch

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 .../wayland/weston-init/weston-start               | 39 +++++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston-init/weston-start b/meta/recipes-graphics/wayland/weston-init/weston-start
index ff52ba3..63a459e 100755
--- a/meta/recipes-graphics/wayland/weston-init/weston-start
+++ b/meta/recipes-graphics/wayland/weston-init/weston-start
@@ -9,6 +9,24 @@ usage() {
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
+# Use weston-launch for initialization
+use_launch() {
+	use_weston_launch=1
+}
+
 if test $# -lt 2; then
 	usage
 	exit 1
@@ -32,10 +50,29 @@ done
 
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
+if [ "$use_weston_launch" = "1" ]; then
+	weston_init=weston-launch
+else
+	weston_init=weston
+fi
+
 if test -z "$XDG_RUNTIME_DIR"; then
     export XDG_RUNTIME_DIR=/run/user/`id -u`
     mkdir --parents $XDG_RUNTIME_DIR
     chmod 0700 $XDG_RUNTIME_DIR
 fi
 
-exec openvt "$openvt_args" weston -- $weston_args /var/log/weston.log 2>&1
+exec openvt "$openvt_args" "$weston_init" -- $weston_args /var/log/weston.log 2>&1
-- 
2.8.2


