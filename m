Return-Path: <eran.m@variscite.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 34EDE78535
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Jul 2017 15:24:27 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id m85so56675628wma.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Jul 2017 08:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=variscite.com; s=variscite;
	h=from:to:cc:subject:date:message-id;
	bh=D3xplmkgmP90lCLahQd5TtRy83+ULgJGo+vFv26dD2c=;
	b=DTJSzt+ZDqRNr3XKePv/BREh7I7++m97dQmB0+WBpJ30HGM7odn2cEpgOKTkVCeFUb
	dMf/HVvzOCkI3iTrGkp9W//TsmiELFw73GvKRhiVmBk5fSlDiV5+XBhkaKjEBp0yz9cB
	XpH4ywQwv0TALQ9f5WBJggga0zfE1rOxEKByA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=D3xplmkgmP90lCLahQd5TtRy83+ULgJGo+vFv26dD2c=;
	b=bq5r+DDZNpfnbuXhQvkIfkCbzy1rGUEXeDiB3MYpH23PI9csRoEWk2srtJhq19lGhW
	yT8tupDTqHUy7efLwG8LwTt1N3vfB9vqL7ZSW9NkDhBjXAEaCgdnnZfbP8lRcNoUoQJu
	rtqM3cRaZJxiGACHtOnCCHWrZqzNgQLIq543uC3aw1S68uro+PWjcReZFi731eOjq1tX
	ndHfbH/s/9GDXSWC7hHyqdEQcJCN33UXfx6snvKhSMqT77KQNSW6qsxdNzZs+bBPYQJN
	1cz24JPJb+YRK0bRNYsgPat6syETaZsKY8RabC4MQsY2P891TMLqQ2Kl644eC58sAetA
	TjYg==
X-Gm-Message-State: AIVw110aiUJbRzQxELBfQLIKM6adMaA5WeHAWCAdOFR+sKhTKwFFFUdZ
	9N1Ls7IY48LsG/LkNkQ=
X-Received: by 10.28.19.9 with SMTP id 9mr9926627wmt.171.1501428268718;
	Sun, 30 Jul 2017 08:24:28 -0700 (PDT)
Received: from localhost.localdomain (84.94.130.170.cable.012.net.il.
	[84.94.130.170]) by smtp.gmail.com with ESMTPSA id
	n132sm8624877wmg.42.2017.07.30.08.24.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 30 Jul 2017 08:24:27 -0700 (PDT)
From: Eran Matityahu <eran.m@variscite.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 30 Jul 2017 18:24:19 +0300
Message-Id: <1501428259-4774-1-git-send-email-eran.m@variscite.com>
X-Mailer: git-send-email 2.7.4
Cc: Eran Matityahu <eran.m@variscite.com>
Subject: [PATCH] matchbox-session-sato: Make the battery applet depend on machine features
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
X-List-Received-Date: Sun, 30 Jul 2017 15:24:28 -0000

matchbox-panel enables the battery plugin only if the
acpi/apm machine features are enabled,
so enable the battery applet in the session script
under the same conditions.

This avoids the 'Failed to load applet "battery"' warning at runtime,
in case these machine features are not defined.

Signed-off-by: Eran Matityahu <eran.m@variscite.com>
---
 meta/recipes-sato/matchbox-sato/matchbox-session-sato/session | 5 ++++-
 meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb  | 2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-sato/matchbox-sato/matchbox-session-sato/session b/meta/recipes-sato/matchbox-sato/matchbox-session-sato/session
index f6313bd..3a70574 100644
--- a/meta/recipes-sato/matchbox-sato/matchbox-session-sato/session
+++ b/meta/recipes-sato/matchbox-sato/matchbox-session-sato/session
@@ -20,7 +20,10 @@ matchbox-desktop &
 # doesn't have the feature "foo".
 
 START_APPLETS=showdesktop,windowselector
-END_APPLETS=clock,battery,$KEYBOARD_APPLET,systray,startup-notify,notify
+END_APPLETS=$KEYBOARD_APPLET,systray,startup-notify,notify
+END_APPLETS=battery,$END_APPLETS # feature-acpi
+END_APPLETS=battery,$END_APPLETS # feature-apm
+END_APPLETS=clock,$END_APPLETS
 END_APPLETS=openmoko-panel-gsm,$END_APPLETS # feature-phone
 
 matchbox-panel --start-applets $START_APPLETS --end-applets $END_APPLETS &
diff --git a/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb b/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb
index d146e83..8230e95 100644
--- a/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb
+++ b/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb
@@ -26,7 +26,7 @@ FILES_${PN} += "${datadir}/themes/Sato/index.theme"
 
 do_install() {
 	# This is the set of machine features that the script has markers for
-	FEATURES="phone"
+	FEATURES="acpi apm phone"
 	SCRIPT="${S}/sedder"
 	rm -f $SCRIPT
 	touch $SCRIPT
-- 
2.7.4


