Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f176.google.com (mail-ea0-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id 333536EE4E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2014 11:04:34 +0000 (UTC)
Received: by mail-ea0-f176.google.com with SMTP id b10so3690197eae.21
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2014 03:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=yU5jtqeabyJLle38MFfzA5BIPKe8q/MqEOP0lDj2RHE=;
	b=cFFbC6vsTMKILOs1eOTZlAHU9Vqf5CGejqjWV8JvTLWgn2JH5Lx2r7Kln6Xkb7A+Z9
	iwEOFwGjG91y/UVSjS483ImmBodbJWOpbO95ABpkaadMmDtgT37Cj5Vde8U+qRjRzO28
	bONUsd/ZUzIGHsiV3o4Z0CTXOmCEEskvNlLc3HEqBiixByNbqY5rdz8qWDg5Cq5u495s
	j7ec79NvrNrht9BcfYsZaL1ZDYQjp6oZVTkpjtRm4H4fwGvOjYqqUJVOmgZRhV6mqFN8
	IpfzLgK21X/7l/k0ZjKcM7vhvZ0wxHv7AcVdm9gR4VIjwGMn0W7XaYuWs0am8PtTBps3
	6I8w==
X-Received: by 10.14.29.6 with SMTP id h6mr2856037eea.84.1392721474294;
	Tue, 18 Feb 2014 03:04:34 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	j41sm68896004eey.15.2014.02.18.03.04.32 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Feb 2014 03:04:33 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Feb 2014 12:05:03 +0100
Message-Id: <1392721503-27383-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [PATCH] libxkbcommon: Add PACKAGECONFIG for x11
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
X-List-Received-Date: Tue, 18 Feb 2014 11:04:34 -0000

* allow to explicitly disable x11 with --disable-x11, otherwise
  do_configure fails for DISTROs without x11 in DISTRO_FEATURES:
  | No package 'xcb-xkb' found
  | configure:18763: $? = 1
  | configure:18777: result: no
  | No package 'xcb' found
  | No package 'xcb-xkb' found
  | configure:18793: error: xkbcommon-x11 requires xcb-xkb >= 1.10 which
    was not found. You can disable X11 support with --disable-x11.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/xorg-lib/libxkbcommon_0.4.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_0.4.0.bb b/meta/recipes-graphics/xorg-lib/libxkbcommon_0.4.0.bb
index 2726302..2ad5448 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbcommon_0.4.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_0.4.0.bb
@@ -15,3 +15,6 @@ SRC_URI[sha256sum] = "2dc018e830d1befaf4822615204138318da3fff0112f78f3a7c638fa61
 inherit autotools pkgconfig
 
 EXTRA_OECONF = "--disable-docs"
+
+PACKAGECONFIG ?= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
+PACKAGECONFIG[x11] = "--enable-x11,--disable-x11,libxcb"
-- 
1.8.5.3


