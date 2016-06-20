Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id BAF696010D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jun 2016 13:01:59 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id a66so77786580wme.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jun 2016 06:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=XqyRQH7aq8f9WQ1w+04ov1OkoHCOJvJ+6sDn+BXlXbM=;
	b=vtoO8A3onJvA4QdlRsaaXMfZyuA7Hmi/Mq9jYTa8EkgsVGSv68wnp9zeu4AcZwpBjn
	cj27D8PKoBKyv3qTyimWIbPpkNDWCoGSnHRfk6TXoGYaNlIYu0drxzORr9+DE/VOub+8
	mp2Iwx813MINTBO8OWf5ZTMSZBIaaOQBqYSwAmIEfXNmQkq52xekRen55koRLIKuO8LB
	X2TMD3h0Faz5BDYPCuQ2Duc/sHQ6ndfSisgeY17hVcywz/MCvJ1ltR09Zd/9gLJeGGZl
	2AqHYs9atXcYS1dL7Ld/VgKcJz27X9pciGfwL5zCspk2WMqc8QCKHQCjRhRzGumUHi2I
	jRMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=XqyRQH7aq8f9WQ1w+04ov1OkoHCOJvJ+6sDn+BXlXbM=;
	b=ca6HgJSVILfP4RF6hFuyxNGDdGZ8QNniMbI67IAJTZpqu9olA9/MqQ12F6Y07zJtrn
	QyGSR6mlBXZwdbkPLJlR19WoXI//FAfADrsmJg3LG+9kzpuwfnZ3q/awnHUbpbUy7ES4
	W9aN2aS2Fka2q71hL02nruwd48Sqip0lY5aeKeiadj7lVsZj9yH7BC0Ct59+p5ffIrDb
	k2p8dc2xxTqXyqwFSMWraYyl7o4vt2K8EA9d2rL0N46HzvNUVnLF7naRMcKawT+oPVzV
	WIQHtH80vhu6qOn+Dt5kCRVgjqv/7HoqIuItqRkTOicdEFA/rVfSOpHHnB2b9DAhKya+
	3pog==
X-Gm-Message-State: ALyK8tJMzLDoTvtvd8NE23SSBY5w21iJupLc2mB8ghNu9S/t1B0it5GUwsD0SZiR/9covGlm
X-Received: by 10.28.226.138 with SMTP id z132mr10568557wmg.97.1466427714463; 
	Mon, 20 Jun 2016 06:01:54 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	f189sm3774475wmf.19.2016.06.20.06.01.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 Jun 2016 06:01:53 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jun 2016 14:01:51 +0100
Message-Id: <1466427711-3638-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] bitbake.conf: don't set CCACHE_DIR to $HOME by default
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
X-List-Received-Date: Mon, 20 Jun 2016 13:02:01 -0000

If the user hasn't inherited ccache.bbclass then CCACHE_DIR is set to $HOME.

This was to work around a bug (#2554) for some users where if ccache < 3.1.10
(released 2014-10-19) was installed and enabled by default (i.e. /usr/bin/gcc is
a symlink to ccache) and ccache.bbclass wasn't being inherited then autogen
would fail to build because it sets $HOME to /dev/null during the build and
ccache (prior to 3.1.10) would always create CCACHE_DIR even if it was disabled.
As the default is $HOME/.ccache, this results in ccache attempting to create
/dev/null/.ccache.

However there was a mistake in this assignment of CCACHE_DIR - it should be
$HOME/.ccache - as ccache will do cleanup inside CCACHE_DIR which will result in
it deleting $HOME/tmp.  In the future when we can assume that everyone has
ccache 3.1.10 onwards this assignment can be deleted, but as of now we still
support OpenSUSE 13.2 which ships with 3.1.9 so fix the assignment to be
$HOME/.ccache.

[ YOCTO #9798 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/bitbake.conf | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 942b8b1..a72d2f6 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -450,10 +450,10 @@ CCACHE ??= ""
 # Disable ccache explicitly if CCACHE is null since gcc may be a symlink
 # of ccache some distributions (e.g., Fedora 17).
 export CCACHE_DISABLE ??= "${@[0,1][d.getVar('CCACHE', True) == '']}"
-# Assign CCACHE_DIR a default value to fix a bug of ccache 3.1.7,
-# since it would always create CCACHE_DIR/.ccache even if
-# CCACHE_DISABLE = 1.
-export CCACHE_DIR ??= "${@os.getenv('HOME')}"
+# ccache < 3.1.10 will create CCACHE_DIR on startup even if disabled, and
+# autogen sets HOME=/dev/null so in certain situations builds can fail.
+# Explicitly export CCACHE_DIR until we can assume ccache >3.1.10 on the host.
+export CCACHE_DIR ??= "${@os.getenv('HOME')}/.ccache"
 
 TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_TARGET}"
 
-- 
2.8.1


