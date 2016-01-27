Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 3859A77145
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 14:39:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 6A8792E3BB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 15:39:55 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id qKtnPQebo8aO
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 15:39:54 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id 650D52E163
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 15:39:54 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 4394C157F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 15:39:54 +0100 (CET)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 35DD71566
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 15:39:54 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 342A234279
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 15:39:54 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id u0REdswu021416
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 15:39:54 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id u0REdsVu021412
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jan 2016 15:39:54 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jan 2016 15:39:51 +0100
Message-Id: <cover.1453905512.git.pkj@axis.com>
X-Mailer: git-send-email 2.1.0
Subject: [master, jethro][PATCH 0/1] Make devtool handle read-only .git/hooks directories
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
X-List-Received-Date: Wed, 27 Jan 2016 14:39:56 -0000

When running "devtool extract <recipe> <dir>", it failed for us if the
recipe contained any patches. This was due to devtools modification of
the commit-msg and applypatch-msg Git hooks.

We have a bit unusal setup where .git/hooks is a symbolic link to a
directory in /usr/share, which means that it is not writable by the
user. This of course caused devtool to fail when it tried to modify
the hooks.

The solution provided here temporarily moves away the .git/hooks
directory (or link) instead, which should be safe since the .git
directory should be writable.

We also need this applied to Jethro. Do I need to supply a separate
patch for that?

//Peter

The following changes since commit 3d2c0f5902cacf9d8544bf263b51ef0dd1a7218c:

  cmake: update to 3.4.2 (2016-01-26 22:49:40 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib pkj/devtool_hooks
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=pkj/devtool_hooks

Peter Kjellerstedt (1):
  lib/oe/patch: Make GitApplyTree._applypatch() support read-only
    .git/hooks

 meta/lib/oe/patch.py | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

-- 
2.1.0


