Return-Path: <otavio.salvador@gmail.com>
Received: from mail-pf0-f180.google.com (mail-pf0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 3C594731C8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 May 2016 20:01:43 +0000 (UTC)
Received: by mail-pf0-f180.google.com with SMTP id 206so15065924pfu.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 May 2016 13:01:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=0p9xIZN9yl4Xgha16nQeQG+/6+qK311w4/LvHc0Xqvo=;
	b=VnZolVYX3yc18yC+o2XmEJnqmZnnAEvI9drKkkEb/DNWzfOGTzXI/kTNbOsAMaU3K9
	QqIZVJSY+ix2Hv19G7aRjOQXBLYltrjyKYi0GTikabWLF+y3+fP3SQ69slxC5iUw5Ybf
	MQKtzlweKKz7mRFhuxOthEjM3F9LBMGjqkXTopOIGLHIOdYVDVtQAQAzzGRUd+CA1/C7
	zU71qtlWNK8NNJ9NwOIcwJLgkyvdtDMO/RSMMfZcknZcT/F8qf8c0BfDycAxZtpnWRw+
	85lg/Q9568TL6Yc7NrkMl/asogJloStZOv8Rsoz1SgVwlXV8Jf/u6dpGRLXpCiNlut3C
	oa+w==
X-Gm-Message-State: AOPr4FVt0JP9Hq99BRrIDxJfEMXX4sLBX5YRo1iGlUXURji1AS61g9dV/Efr/Olx4Nn9aw==
X-Received: by 10.98.16.150 with SMTP id 22mr6252781pfq.165.1462305704673;
	Tue, 03 May 2016 13:01:44 -0700 (PDT)
Received: from localhost ([187.23.154.250])
	by smtp.gmail.com with ESMTPSA id u127sm61382pfb.82.2016.05.03.13.01.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 May 2016 13:01:43 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Tue, 03 May 2016 17:01:38 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue,  3 May 2016 17:00:50 -0300
Message-Id: <1462305651-16593-7-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1462305651-16593-1-git-send-email-otavio@ossystems.com.br>
References: <1462305651-16593-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: prabhu.sundararaj@nxp.com, Otavio Salvador <otavio@ossystems.com.br>,
	neenareddy.busireddy@nxp.com,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: [oe-core PATCH v2 6/7] weston-init: Add module support for the weston-start helper
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
X-List-Received-Date: Tue, 03 May 2016 20:01:44 -0000

To make weston-start more flexible we now support module loading. For
such modules, following functions can be used:

 - add_weston_argument
 - add_openvt_argument

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v2:
- Drop weston-lunch use as it requires PAM

 .../wayland/weston-init/weston-start               | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/meta/recipes-graphics/wayland/weston-init/weston-start b/meta/recipes-graphics/wayland/weston-init/weston-start
index ff52ba3..f83d545 100755
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


