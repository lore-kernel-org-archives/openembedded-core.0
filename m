Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id 5A892731F4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 22:50:30 +0000 (UTC)
Received: by mail-qg0-f44.google.com with SMTP id 90so31815153qgz.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 May 2016 15:50:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=T4vllDltljhOyGWcpK53GF4zvF3mmrFyIYBbalHuOXY=;
	b=bLxgys8UyUxQ8PsaYpOrTbZHLuqsrgoqBofLjvC0h/2hn7U6kG7j+raW754c5JKyPQ
	V9EVtPjWycW+S5Rb9weV27Eed+iEE/5fnky/XBPFQDxrj4JUqtj+vS66ip2EhdCPYEsG
	ZbHxgG6wWD5uPHQgBGkic+iRmHQUOZurAjM6qnMxesh2NZtLRKAUqx8jUycEuKgpdobl
	vkSQ6HfKeGJmFnwDFCsDgyjxhrxqGQmvpN8LeOE+2grfqA5T/Dc4wNv2sh9/s9+vEb9/
	BSoew9tzNjEV8vZrVDb3fYonCgXud3pJ9jUn15Iy7aZvuIiIEQB+96ribI+gf3BVymke
	n5JQ==
X-Gm-Message-State: AOPr4FUniVAMvl/Agg/b11CFRdRxB35G8ID4p2dXvlQMRPpQ2z8oWIdRtDv/pnlitT7Aqw==
X-Received: by 10.140.216.16 with SMTP id m16mr9794374qhb.37.1462402230913;
	Wed, 04 May 2016 15:50:30 -0700 (PDT)
Received: from localhost ([187.23.154.250]) by smtp.gmail.com with ESMTPSA id
	z92sm2240844qge.18.2016.05.04.15.50.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 May 2016 15:50:29 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Wed, 04 May 2016 19:50:24 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed,  4 May 2016 19:49:38 -0300
Message-Id: <1462402180-16861-7-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1462402180-16861-1-git-send-email-otavio@ossystems.com.br>
References: <1462402180-16861-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: prabhu.sundararaj@nxp.com, Otavio Salvador <otavio@ossystems.com.br>,
	neenareddy.busireddy@nxp.com,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: [oe-core PATCH v3 6/8] weston-init: Add module support for the weston-start helper
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
X-List-Received-Date: Wed, 04 May 2016 22:50:30 -0000

To make weston-start more flexible we now support module loading. For
such modules, following functions can be used:

 - add_weston_argument
 - add_openvt_argument

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v3: None
Changes in v2:
- Drop weston-lunch use as it requires PAM

 .../wayland/weston-init/weston-start               | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/meta/recipes-graphics/wayland/weston-init/weston-start b/meta/recipes-graphics/wayland/weston-init/weston-start
index 760a87b..c691fc4 100755
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


