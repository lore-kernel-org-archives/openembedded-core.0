Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id E00E46BE2A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 15:12:31 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id n4so14382681wrw.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 08:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=OIANtHcpitxcSR0FBs9ULKmE+YENv2ws3yKckOGzAPU=;
	b=1yPW0u9Bz3kg04+lKJfCuIxranIGKzEmo2ZejrDs//YECKGmn5s0VgVI5XUyIV5Rev
	72SGBqfK8JUl9a6J76nPHKs18RQazB3v5EwhTwgqUDKn6VV4FP7eXo263fsGE5ZgXEJG
	t/vKdZmWCU6AVwzGRoFL9P+jcizyMdDTQvy3daGP4dYM7BXNAFpRwJNnXSru4hWzwkZC
	8LeQiubq2fITBLBQBgqOe2QZhXbSL9OqnjSgRR9cDNvQ0R6lkV8VhS4mk0+PWaK9opXt
	zVbdYtyo4rKHLJrq5hL0AoRinlg1DVQdqkaZi3Z1XgQ5+UMiOC03w1HN+dzwMQXa2Wnd
	/SUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=OIANtHcpitxcSR0FBs9ULKmE+YENv2ws3yKckOGzAPU=;
	b=SZzKgg1ttKQk30eASFFbEOZ+4Bj+ae0AIZeAuMDWjDd36iTc2MJmlZejYkITCowUIG
	/Jay5gJQ2S81wr0Kuyhe0ni98qCsrZHMDJ0FDBxsPr7Zex/xcU2Ib+EADNzxmWZqyWFJ
	07j+1Iory07xebDojQ1iwiJD32x38CeFAT8EXcUzcrtkIQ7lYn4szABhYwsbInulhuuo
	+9CxiKnUmdpn8mmlZm5XnZtLnojnrvHjR1wtbhx9iCbUXcnK+Zdf3/WsK/ajrpLnNiXv
	bg74Pf+fSPrzRVkHEgvyKG8zVnFx3HfFJWWzFQoX8K/h046BVO/9CJp6hwbD6zgXy69s
	PSWQ==
X-Gm-Message-State: APjAAAU+bc6ubHZJprEfJNav4VyOC6Fz1ibMzivrmyPsCzKJ71RfGvSN
	P5LdlDrKRaUpjOH+E1GofKmTLX3fn0g=
X-Google-Smtp-Source: APXvYqyuhuAKbq0ZUEKAmYPLA2IiZQJHmk890lXKG0WZRHMe5Yszcf9hwTzuraEiQ0BSPfr9TBC2Xg==
X-Received: by 2002:a5d:6a05:: with SMTP id m5mr28888496wru.161.1560870752242; 
	Tue, 18 Jun 2019 08:12:32 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	g17sm13626919wrm.7.2019.06.18.08.12.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Jun 2019 08:12:31 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Jun 2019 16:12:29 +0100
Message-Id: <20190618151229.4786-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] glib-2.0: fix host path appearing in gsocketclient-slow test script
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
X-List-Received-Date: Tue, 18 Jun 2019 15:12:32 -0000

Glib's build looks for the 'env' binary and embeds that path into the test
script, but thanks to hosttools this is /path/to/tmpdir/hosttools/env.

Fix this by hardcoding the path to env in the cross file.

Also as the cross file is only used in target builds only add it to SRC_URI for
target builds, so that changes to the cross file don't cause a rebuild of
glib-2.0-native.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/glib-2.0/glib-2.0/glib-meson.cross | 3 +++
 meta/recipes-core/glib-2.0/glib-2.0_2.60.3.bb        | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/glib-meson.cross b/meta/recipes-core/glib-2.0/glib-2.0/glib-meson.cross
index 8420f9874e1..b5df4007275 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/glib-meson.cross
+++ b/meta/recipes-core/glib-2.0/glib-2.0/glib-meson.cross
@@ -4,3 +4,6 @@ have_c99_snprintf = true
 have_unix98_printf = true
 va_val_copy = true
 growing_stack = false
+
+[binaries]
+env = "/usr/bin/env"
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.60.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.60.3.bb
index f4ade098ef1..bb77294e1e0 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.60.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.60.3.bb
@@ -16,10 +16,10 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://0001-Do-not-write-bindir-into-pkg-config-files.patch \
            file://0001-meson.build-do-not-hardcode-linux-as-the-host-system.patch \
            file://0001-meson-do-a-build-time-check-for-strlcpy-before-attem.patch \
-           file://glib-meson.cross \
            "
 
 SRC_URI_append_class-native = " file://relocate-modules.patch"
+SRC_URI_append_class-target = " file://glib-meson.cross"
 
 SRC_URI[md5sum] = "112a850caa8d2c21e24d4c9844e8b1fe"
 SRC_URI[sha256sum] = "04ab0d560d45790d055f50db2d69974eab8b693a77390075462c56e652b760b9"
-- 
2.11.0


