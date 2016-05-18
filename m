Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f67.google.com (mail-qg0-f67.google.com
	[209.85.192.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4E6F4731D7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 16:43:13 +0000 (UTC)
Received: by mail-qg0-f67.google.com with SMTP id b14so4643512qge.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 09:43:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=rffToQ0o+LBVU2w3ixqCYlGT+kp4oxiViPl6xRzveu8=;
	b=JRy3DpI55xri/IFosamOZQxQq6CjhShR9/JezysJkMHE3iQ7411URJlGarRAzAqocT
	ggnYVPFclwN+CW0sTxBmRAPnzQfm7wOsujh2YCrUXgriHqHqv213KEgCr0oS41aF5x/m
	jwo8IYYOsihOpRLmeZHzbbD+P37vOCTHuJ1vZLL0DHhhdaMke+BhQaRBw542xY5veaa3
	qdStStFm6jyqx4VbQHMXShJZed1assL0OGIvM7TsATZiTzdR6Icu8DKlF9V3lwUj15vz
	BnjeP0QJqdmVTk/wbP8pTxaRA63oSKWhSLXfFCvDyXbkhsBY9n5z7xyl2Ah57NVlHAjx
	nZLA==
X-Gm-Message-State: AOPr4FVnqhpQkd0HXcXejhzbFOylS8OFg497aGoter9JButBBSOB3IE3OfmJ5ZCQSfie7w==
X-Received: by 10.140.234.130 with SMTP id f124mr8866277qhc.65.1463589793877; 
	Wed, 18 May 2016 09:43:13 -0700 (PDT)
Received: from localhost ([187.23.154.250]) by smtp.gmail.com with ESMTPSA id
	q13sm2138027qkc.36.2016.05.18.09.43.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 May 2016 09:43:12 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Wed, 18 May 2016 13:43:03 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 18 May 2016 13:40:47 -0300
Message-Id: <1463589648-28641-13-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1463589648-28641-1-git-send-email-otavio@ossystems.com.br>
References: <1463589648-28641-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: prabhu.sundararaj@nxp.com, Otavio Salvador <otavio@ossystems.com.br>,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: [oe-core PATCH v8 12/13] weston-init: Use weston-launch when starting weston as the first windowing system
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
X-List-Received-Date: Wed, 18 May 2016 16:43:13 -0000

From: Tom Hochstein <tom.hochstein@nxp.com>

When  weston is started as the first windowing system (i.e. not under X
nor under another Wayland server), it should be done with  the  command
weston-launch to set up proper privileged access to devices.

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v8: None
Changes in v7: None
Changes in v6:
- New patch.

Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2: None

 meta/recipes-graphics/wayland/weston-init/weston-start | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston-init/weston-start b/meta/recipes-graphics/wayland/weston-init/weston-start
index 4aa7c66..72ba4b7 100755
--- a/meta/recipes-graphics/wayland/weston-init/weston-start
+++ b/meta/recipes-graphics/wayland/weston-init/weston-start
@@ -31,6 +31,11 @@ if [ -n "$WAYLAND_DISPLAY" ]; then
 	echo "ERROR: A Wayland compositor is already running, nested Weston instance is not supported yet."
 	exit 1
 fi
+if [ -n "$DISPLAY" ]; then
+	launcher="weston"
+else
+	launcher="weston-launch --"
+fi
 
 openvt_args=""
 while [ -n "$1" ]; do
@@ -64,4 +69,4 @@ if test -z "$XDG_RUNTIME_DIR"; then
     chmod 0700 $XDG_RUNTIME_DIR
 fi
 
-exec openvt $openvt_args -- weston $weston_args --log=/var/log/weston.log
+exec openvt $openvt_args -- $launcher $weston_args --log=/var/log/weston.log
-- 
2.8.2


