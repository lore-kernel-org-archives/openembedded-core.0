Return-Path: <tom.rini@gmail.com>
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7AD7978819
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jan 2018 17:47:29 +0000 (UTC)
Received: by mail-yw0-f194.google.com with SMTP id q6so8188443ywg.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jan 2018 09:47:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=MTeBNuQmGbmRivdr3IAKelpow8GIYCkiGjMoez3npDI=;
	b=QGw/SkhY4Z5n14m6K/iOgKie2E7k+4uuJSuV0WXrPabWG44806FzdAm4pvNNMGl4cY
	071W1/isdDUVw4kqsQUiP14NHY3TljqE+6XhY7B0FrTzajCeZnOp71ouVVTJV1gEFOM3
	hueAgxPnKrv1bZr8SaIcRrkJ0LeXvZNfwjafrHQHHCcQi3SdbE9vmrbZ3RfFxd93RiDt
	uDzEjB0KvZDvTRbxgggFxke0qr+AJ1lwU6Rr+pA0dBR9iWNvfyvG8MSi9vuwJLtgdlxG
	g+U6peRk+sKn5Wx8FYBUZMN0hhZxMtIhYQq1iKsoEcArHHgloJuDzcfbAM+C1TMWorb9
	8gJA==
X-Gm-Message-State: AKwxytc6oU3BIPOzz5TFnSXjtUP0uQseMdf6K46wHrszs3ToLfyvbZBD
	5SvyBg/Smk6n5PmbCuvaaZfl
X-Google-Smtp-Source: AH8x224tNwtqBPWkn2t3GlOpu3bPpAIYJF+Ky8XtGR0M08tdAlcOQdcJqOZoTccHsn7SRSUL2E0WPw==
X-Received: by 10.129.104.133 with SMTP id d127mr22097222ywc.276.1517420851018;
	Wed, 31 Jan 2018 09:47:31 -0800 (PST)
Received: from localhost.localdomain (cpe-65-184-142-68.ec.res.rr.com.
	[65.184.142.68]) by smtp.gmail.com with ESMTPSA id
	e140sm6524789ywa.77.2018.01.31.09.47.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 31 Jan 2018 09:47:30 -0800 (PST)
From: Tom Rini <trini@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 Jan 2018 12:47:27 -0500
Message-Id: <1517420847-7592-1-git-send-email-trini@konsulko.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCHv2] security_flags.inc: Use SECURITY_X_LDFLAGS for all xf86 modules
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
X-List-Received-Date: Wed, 31 Jan 2018 17:47:30 -0000

We need to ensure that all xorg modules are linked with
SECURITY_X_LDFLAGS to ensure that they will be able to resolve their run
time dependencies.  Update the current list of recipes and add a comment
for future reference.

Cc: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Tom Rini <trini@konsulko.com>
---
 meta/conf/distro/include/security_flags.inc | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index 7ea1049edff8..4fa29b5e67bf 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -59,6 +59,14 @@ TARGET_LDFLAGS_append_class-target = " ${SECURITY_LDFLAGS}"
 SECURITY_LDFLAGS_remove_pn-gcc-runtime = "-fstack-protector-strong"
 SECURITY_LDFLAGS_remove_pn-glibc = "-fstack-protector-strong"
 SECURITY_LDFLAGS_remove_pn-glibc-initial = "-fstack-protector-strong"
+# All xorg module drivers need to be linked this way
+SECURITY_LDFLAGS_pn-xf86-input-evdev = "${SECURITY_X_LDFLAGS}"
+SECURITY_LDFLAGS_pn-xf86-input-keyboard = "${SECURITY_X_LDFLAGS}"
+SECURITY_LDFLAGS_pn-xf86-input-libinput = "${SECURITY_X_LDFLAGS}"
+SECURITY_LDFLAGS_pn-xf86-input-mouse = "${SECURITY_X_LDFLAGS}"
+SECURITY_LDFLAGS_pn-xf86-input-synaptics = "${SECURITY_X_LDFLAGS}"
+SECURITY_LDFLAGS_pn-xf86-input-vmmouse = "${SECURITY_X_LDFLAGS}"
+SECURITY_LDFLAGS_pn-xf86-video-cirrus = "${SECURITY_X_LDFLAGS}"
 SECURITY_LDFLAGS_pn-xf86-video-fbdev = "${SECURITY_X_LDFLAGS}"
 SECURITY_LDFLAGS_pn-xf86-video-intel = "${SECURITY_X_LDFLAGS}"
 SECURITY_LDFLAGS_pn-xf86-video-omapfb = "${SECURITY_X_LDFLAGS}"
-- 
2.7.4


