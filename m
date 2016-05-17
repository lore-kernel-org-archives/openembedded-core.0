Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f65.google.com (mail-qg0-f65.google.com
	[209.85.192.65])
	by mail.openembedded.org (Postfix) with ESMTP id D05C7731CD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 16:38:42 +0000 (UTC)
Received: by mail-qg0-f65.google.com with SMTP id 90so1857071qgz.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 09:38:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=DEn93ETYrGO7ORry67nlwhaP27laNJOTVzpmImnrgok=;
	b=FsppuSwLfMfknjRY0kkcSs4w+VJwda+jqbZYZwLOUTmmkAFG+rXtKKmg9RPOBxD/Nc
	wO1OXua9pXT/E9gl5dWTuOND9No0B7htRmsnwqkosLAhE8aFmyEz0gv4KLEoZiz14iTt
	Ak09UtUBbV7YRwUEt08ojD7ETvzTEHtMpgc7SULQPYaBegLB1xwNErcTztb4aX/aAAN+
	OLpH0fKGdZvQlF7/7XXNJOMB6YHhyy8JYmjxnNP2VjYxpL8RCeAiZg/Cb3+nprilEkW/
	BVaAh0dWo/YLigSx6LIo8Amk6qCN1ujLJtyhf+F/z1iIxjse8kds7zoKJL7UoNvxL8ac
	tvxA==
X-Gm-Message-State: AOPr4FWLI9V/qfsm9opsEvHwCjyaM0o2cIenKYISVBGqUqF0SbY48TtFlI4StjdeqEgdwQ==
X-Received: by 10.140.97.7 with SMTP id l7mr2627000qge.71.1463503123382;
	Tue, 17 May 2016 09:38:43 -0700 (PDT)
Received: from localhost ([187.23.154.250])
	by smtp.gmail.com with ESMTPSA id n1sm1747823qkn.3.2016.05.17.09.38.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 May 2016 09:38:42 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Tue, 17 May 2016 13:38:33 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 17 May 2016 13:36:24 -0300
Message-Id: <1463502985-5428-13-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1463502985-5428-1-git-send-email-otavio@ossystems.com.br>
References: <1463502985-5428-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: prabhu.sundararaj@nxp.com, Otavio Salvador <otavio@ossystems.com.br>,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: [oe-core PATCH v7 12/13] weston-init: Use weston-launch when starting weston as the first windowing system
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
X-List-Received-Date: Tue, 17 May 2016 16:38:43 -0000

From: Tom Hochstein <tom.hochstein@nxp.com>

When  weston is started as the first windowing system (i.e. not under X
nor under another Wayland server), it should be done with  the  command
weston-launch to set up proper privileged access to devices.

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

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
index 17b0c16..2d398b6 100755
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


