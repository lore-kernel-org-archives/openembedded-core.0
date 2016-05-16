Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 8770960620
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 19:14:44 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id l68so15352654qkf.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 12:14:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=1teGfgm5T2y48Ab/QnFv3M5jdMMiUuA+npJYzdag57c=;
	b=ZwXzWFezS13AJz0FzvL8NMWuMvrFuMWYdEgIhM9M9f9T+1I1MNHiZSGwafZYe2QC4A
	dAY5JOFZb6UY1xSAHA9c2XyaScVciwHrPdx4sWD4eRYMJZH3+xwHkU3WeBp6IBN4Anx9
	kRyXXEl1OgQ3lbeGniezdMAGV2li+wN20/CXdSljbnriB9JvAOgXNx18GIKMIy24MoxY
	SIFVgBlafFsP3oG1iCDmaxE2YnfYpVaxjh03AfqskBI3eES/fUU4XEZAypCpvHdw6EVX
	LHNLzu7S0egAKlxjP3GyoJpUEkUDM+EL59E96ih8WntFqUId19+KjbpngXlp4IOLxUJy
	PfBA==
X-Gm-Message-State: AOPr4FVOk7xPTMHo7YvAAcIb5zzDB8L74wxEojWnLpJdLEw6arNnJwQ/HdG35TD5FeOr9w==
X-Received: by 10.55.104.137 with SMTP id d131mr10820189qkc.93.1463426083890; 
	Mon, 16 May 2016 12:14:43 -0700 (PDT)
Received: from localhost ([187.23.154.250]) by smtp.gmail.com with ESMTPSA id
	z62sm15481144qka.26.2016.05.16.12.14.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 May 2016 12:14:42 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Mon, 16 May 2016 16:14:34 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 16 May 2016 16:12:11 -0300
Message-Id: <1463425932-10080-14-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1463425932-10080-1-git-send-email-otavio@ossystems.com.br>
References: <1463425932-10080-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: prabhu.sundararaj@nxp.com, Otavio Salvador <otavio@ossystems.com.br>,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: [oe-core PATCH v6 13/14] weston-init: Use weston-launch when starting weston as the first windowing system
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
X-List-Received-Date: Mon, 16 May 2016 19:14:44 -0000

From: Tom Hochstein <tom.hochstein@nxp.com>

When  weston is started as the first windowing system (i.e. not under X
nor under another Wayland server), it should be done with  the  command
weston-launch to set up proper privileged access to devices.

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

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


