Return-Path: <breno.debian@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id D1BDF7D3AC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 May 2019 10:03:27 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id o4so2179199wra.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 May 2019 03:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wVBt5vO7kotPPqFZLtFkJ6jJW47Fs0p6IJx2U9dUQ+Y=;
	b=oLDZqr+5o/Sf8lr3Crp5NUAY2dmT0z9EwPK33DujzIoOdxWC29SYKyjCmAh6VoE8eb
	zeY3OoJChKE+SkaiVcdeD1T+Ctm8T0vVNI5vzIqRH5kVtzRkB1FwL4Qu6vHCiNspVZ/M
	rsrK3cbvrAqbTgZmZAVerHyGFdCkKgvphjPYyAKq14LEHMQtTsSIORJLNGq3O8ZdRN1n
	KvXLWgZYFQ4M+hOMEnUzBD+hMat23haalzbYdb4TBMMbRWoXEv6ieix+hQLDHkM3ENh9
	5jAwrelDg5eqbV7tpfYOS4b/igB8jhHWxFx4+NX9m9Q/XUcxJgUzQW0NBp13/PSl0JoL
	Flhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=wVBt5vO7kotPPqFZLtFkJ6jJW47Fs0p6IJx2U9dUQ+Y=;
	b=OnFSfITwyxfJWMlM56DgLpDQeLSSwjLbhFCGoI1QCfJY7BD84x3hYbxHGiOPkHE7Xb
	p61h9h8fyovUjC04J/e8EG3N6IEr9gdJTRjv6yVWMGuO2mrbXic1nYuEGqPpiaI5V8vw
	8C0RF5wgWYp5caw4/27nWJW78PgvnZ8vx6hQrbI6mAmnSdEfcGESzh0xptEkd3b5qfe7
	iO+TS6+2isyhAhnmjQewlbfl65CGnGfSRqD/vpF//KOZIwyVDHDSUAHdYdOlCFBmDCg3
	aNTrB/79ysN+B2FL3ixt5G9cjbcrVUemW2NC2cTTF02ru9D3VAuvGdKOouWK8qbldUcC
	5Rqg==
X-Gm-Message-State: APjAAAUFDMBQD9RJEyi8cVRfQRlkxtNvG9on5/Wfk/WlUEJhsH/hiy+O
	XmoQQdlRJgDcbaxlFGdgTVQVsYJzUNs=
X-Google-Smtp-Source: APXvYqxp6yQ91xU3UEHjjYS/gqm2cYvTD/jdcGFBWXK1g2S4XCnaGp3xlBrdtp9m6HOelUg5tDYZrA==
X-Received: by 2002:adf:ed4c:: with SMTP id u12mr2516713wro.245.1557396208444; 
	Thu, 09 May 2019 03:03:28 -0700 (PDT)
Received: from leit-mbp.thefacebook.com ([199.201.66.0])
	by smtp.gmail.com with ESMTPSA id 7sm2541125wro.85.2019.05.09.03.03.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 May 2019 03:03:27 -0700 (PDT)
Sender: Breno Leitao <breno.debian@gmail.com>
From: Breno Leitao <leitao@debian.org>
X-Google-Original-From: Breno Leitao <leit@fb.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 May 2019 11:03:24 +0100
Message-Id: <20190509100324.85677-2-leit@fb.com>
X-Mailer: git-send-email 2.13.5
In-Reply-To: <20190509100324.85677-1-leit@fb.com>
References: <20190509100324.85677-1-leit@fb.com>
Subject: [PATCH 2/2] weston-init: Add support for non-root start
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
X-List-Received-Date: Thu, 09 May 2019 10:03:28 -0000

From: Breno Leitao <leitao@debian.org>

This commit adds support for two variables (WESTON_USER and WESTON_TTY) that
would be passed to weston_launch. It allows starting weston as a non-root user.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 .../wayland/weston-init/weston-start            | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/wayland/weston-init/weston-start b/meta/recipes-graphics/wayland/weston-init/weston-start
index 0c4fee23d5..86c68fc533 100755
--- a/meta/recipes-graphics/wayland/weston-init/weston-start
+++ b/meta/recipes-graphics/wayland/weston-init/weston-start
@@ -27,10 +27,19 @@ if [ -n "$WAYLAND_DISPLAY" ]; then
 	echo "ERROR: A Wayland compositor is already running, nested Weston instance is not supported yet."
 	exit 1
 fi
+
+if [ -n "$WESTON_USER" ]; then
+	if [ -z "$WESTON_TTY" ]; then
+		echo "ERROR: If you have WESTON_USER variable set, you also need WESTON_TTY."
+		exit 1
+	fi
+	weston_args_user="-u $WESTON_USER -t $WESTON_TTY"
+fi
+
 if [ -n "$DISPLAY" ]; then
 	launcher="weston"
 else
-	launcher="weston-launch --"
+	launcher="weston-launch $weston_args_user --"
 fi
 
 openvt_args="-s"
@@ -59,11 +68,15 @@ if [ -d "$modules_dir" ]; then
 fi
 
 if test -z "$XDG_RUNTIME_DIR"; then
-	export XDG_RUNTIME_DIR=/run/user/`id -u`
+	export XDG_RUNTIME_DIR=/run/user/`id -u ${WESTON_USER}`
 	if ! test -d "$XDG_RUNTIME_DIR"; then
 		mkdir --parents $XDG_RUNTIME_DIR
 		chmod 0700 $XDG_RUNTIME_DIR
 	fi
+	if [ -n "$WESTON_USER" ]
+	then
+		chown $WEST_USER:$WESTON_USER $XDG_RUNTIME_DIR
+	fi
 fi
 
 exec openvt $openvt_args -- $launcher $weston_args --log=@LOCALSTATEDIR@/log/weston.log
-- 
2.17.1


