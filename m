Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 71E99784A3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 20:36:45 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id r133so1176857pgr.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 13:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=lgziW7g50HUh8FAEOcQAEaPt2r1W3fySMJ6tuZn113I=;
	b=XwI1MsoNoZEiDie6hc6cuBGKKYF8xiH1GnvB9VPVtXqzOix3qb3qLGcxAgEpByXQ7p
	lKZyOgeuO72cnSY7XGlsjMrQGD+nvxUOIN+g+wppZ3lJB4To6qjeXzY4r8BlN/N950Bd
	IznMGBjOsYIyWOCb3OmqS87yknJrKHrNZj9tE2bY2UoLSe+qpifApbCd0Gcdsm4+ve3c
	WOzM35OgF5Sd283gnVJFgGLvPhuYD7u6HbU6Q5X9oqm8qTf7nxb4qSMjHuvvvcR9Q7ev
	0p5A9r3AkTZX1xDVQo1oeggOlxDuw3Y8gepA2zoyVcIjRhbT0CMziET7eDXBLLRIHecw
	lpbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=lgziW7g50HUh8FAEOcQAEaPt2r1W3fySMJ6tuZn113I=;
	b=a2b18zuB8H7I2KEtEsS0RUFabgq01RL44+gVIxzY0i2bH1SSBgVkJS99ZWxNVrXX8I
	mlQWqWjm7B8rPqTkjz8J5PgmLSsIJDqS5ewdoT23QcHxPa8cnG1uDYKff1FtNAx4eiw/
	imYefoYTdUB2XH/fvBOZjKXgpyYS1g33F/w+iZytE2blJpAfVk+sNJd/WvyAYJ3+XdYC
	H0lj1ZYwBosRXH0F7UDOt8bsLqXqS73zb5EZHh06t0O+ifRxlU2EVjE1yE2rs4l+ebog
	Iz1bFha8wklMqFdrlNRFZxQD6jCDvVuX4kZaNn3smMJbesOlwGxdFwkIjYjgdwi9jpoL
	0f3g==
X-Gm-Message-State: AHYfb5hZT0Y8aEQANnFsVzbSPpJRNc+FbMoODwVfcFplIK0MpOrxgcrx
	+nSsAUAMQ4zwbca6
X-Received: by 10.99.43.65 with SMTP id r62mr10819310pgr.241.1503693406324;
	Fri, 25 Aug 2017 13:36:46 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id v3sm1290104pgc.7.2017.08.25.13.36.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 25 Aug 2017 13:36:45 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Aug 2017 13:36:31 -0700
Message-Id: <1503693392-7893-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1503693392-7893-1-git-send-email-armccurdy@gmail.com>
References: <1503693392-7893-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 2/3] terminal.py: fix devshell with mate-terminal
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
X-List-Received-Date: Fri, 25 Aug 2017 20:36:45 -0000

Without the --disable-factory option, mate-terminal fails to start
with the error:

 | There was an error creating the child process for this terminal
 | Failed to execute child process "oe-gnome-terminal-phonehome" (No such file or directory)

The --disable-factory option was removed by:

  http://git.openembedded.org/openembedded-core/commit/?id=e8dca725ed8211a874472300a3ed50e494039ab9

apparently based on an assuption that mate-terminal continues to
track gnome-terminal since forking from it. However, based on the
mate-terminal man page in the upstream master branch, the option is
still supported:

  https://github.com/mate-desktop/mate-terminal

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/lib/oe/terminal.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
index 714772f..89ddb46 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -65,7 +65,7 @@ class Gnome(XTerminal):
         XTerminal.__init__(self, sh_cmd, title, env, d)
 
 class Mate(XTerminal):
-    command = 'mate-terminal -t "{title}" -x {command}'
+    command = 'mate-terminal --disable-factory -t "{title}" -x {command}'
     priority = 2
 
 class Xfce(XTerminal):
-- 
1.9.1


