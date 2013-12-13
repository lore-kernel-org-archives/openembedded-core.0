Return-Path: <kergoth@gmail.com>
Received: from mail-ea0-f169.google.com (mail-ea0-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id 88C68610D4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2013 14:47:17 +0000 (UTC)
Received: by mail-ea0-f169.google.com with SMTP id l9so796466eaj.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2013 06:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=JaiI5OUeJDfqtQjX6te7/+Ijqn6G6ltrA8w9Y/i88Rg=;
	b=e3+KoLxp3jdVZvPWRFpe1R9d7KDI1obT51A4I4kMo2yTl36ZAw70N+33XvzZkiNt2C
	N0IoRkNtZK087irCT8vMXrB/Mrx6eTy/7IGdO1XPstbGp+GYsveKVrL6ZRKswpxqjwCA
	UM6NjYVn5FAMeE2OfMlCEiTxWth/Zy1LwRdImmPxOMKphPhRumN500lydcgSL5rET9HO
	ALoaBQL+GSJ6VDkYyGPkOj4LjQHlScMOiNp/OfK0+g+oevTpkmNGkKDdeX9J9bC9G8bo
	OE5J9mvk2f+0QgFG6jrYuIUCASSIveNT2RJeOL2hfHgYFQZzHzB6IiZCa6urudDvX+eU
	X9dg==
X-Received: by 10.15.63.134 with SMTP id m6mr3370690eex.74.1386946036496;
	Fri, 13 Dec 2013 06:47:16 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id v7sm7569336eel.2.2013.12.13.06.47.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 13 Dec 2013 06:47:15 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Dec 2013 07:47:11 -0700
Message-Id: <1386946031-6292-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.8.3.4
Subject: [PATCH] pulseaudio: only package consolekit module when x11 is enabled
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
X-List-Received-Date: Fri, 13 Dec 2013 14:47:19 -0000

As requested by Martin Jansa <martin.jansa@gmail.com>.

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 2bee9eb..dce8555 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -74,7 +74,7 @@ USERADD_PARAM_pulseaudio-server = "--system --home /var/run/pulse \
 # adding the console-kit module to an image, we also get the necessary
 # consolekit package produced.
 PACKAGES =+ "libpulsecore libpulsecommon libpulse libpulse-simple libpulse-mainloop-glib \
-             pulseaudio-server pulseaudio-misc pulseaudio-module-console-kit"
+             pulseaudio-server pulseaudio-misc ${@base_contains('PACKAGECONFIG', 'x11', 'pulseaudio-module-console-kit', '', d)}"
 
 #upgrade path:
 RREPLACES_pulseaudio-server = "libpulse-bin libpulse-conf"
-- 
1.8.3.4


