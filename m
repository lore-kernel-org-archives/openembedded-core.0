Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id A88CF60123
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 12:57:23 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id r126so180672773wmr.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 04:57:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=HmJoNNzLpQ/6RlLtJFMRcz0aUFYGbnLjEtNCWNCnTK0=;
	b=U2PjKiaPViyjfnCBDS5FkAAsFuYuMF8RNJMIu7teBa9ZnU9KzHNg7icorLnTGOcmSW
	bFDH4Nh5PVMp3vTESkpljhwnxHga+ipZUwWosqSpUtUmwxOuAgr3XZUEWbtl/DfAzoQH
	7WGR0YLxvxr0DfPRMwt1lSUUEG1rwFwHhdKEj8oWnk0iVb+w75PuJaQ/wcG0XHo5fgvK
	s2yIye+xozAmXUeNFy5BNJP7x2mia1BX0fv3heUfR7A+dNjqTBBXmDAX9IjrpRoohNPS
	PPxY0hCeq5dFZBIyQqobxiaENYnHwXThr5d42L+DKQua1gLvDUj0jyeCgXJeHR7O4l0r
	dFPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=HmJoNNzLpQ/6RlLtJFMRcz0aUFYGbnLjEtNCWNCnTK0=;
	b=atw586bgVaq9EMesqPuCiFUFCuR/nEOEqY5Cn7v3jOGS2685bolVaVzzyYy2JFNtgC
	NfOtakQLmgZOFUOFe3kiVRVf/a1jdg3tIRZp84x+AJtEbb+OuZQkg8dU/Cr/ROh79t57
	rnnWeoU9zF7UpubkOJnHPJbSfybonsChX/eVDYverJY7Q/5MA5Ik58u/PkxcHe8LRiTW
	ve6iGUfzr3oJj49oLN5n1wiuX4wbLgUdR8caoFppBwaE29BcVkhF6dWmQb0/jRhS511o
	McyiabRKxXwSzLtHjEjy+uO8XO5TKd3dWXxPM3vQNjSBW7M2ZFZFC6zc03b/UpP0lTVB
	Jueg==
X-Gm-Message-State: AIkVDXIYJG8WUaEKvWQ1OgpASkbn7sV6ScCvjtfGo0t0P1gfov5GRLvTDyEGSlK3s1U7iMQQ
X-Received: by 10.223.165.1 with SMTP id i1mr28061135wrb.82.1485262643091;
	Tue, 24 Jan 2017 04:57:23 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	y127sm26156015wmg.12.2017.01.24.04.57.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 24 Jan 2017 04:57:22 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Jan 2017 12:57:19 +0000
Message-Id: <1485262639-11335-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] wipe-sysroot: remove
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
X-List-Received-Date: Tue, 24 Jan 2017 12:57:24 -0000

This script was useful to delete the sysroot so that future builds happen from a
clean sysroot.  Now that recipes have their own sysroot this script doesn't need
to exist anymore, and if in fact if used will break your TMPDIR.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 scripts/wipe-sysroot | 54 ----------------------------------------------------
 1 file changed, 54 deletions(-)
 delete mode 100755 scripts/wipe-sysroot

diff --git a/scripts/wipe-sysroot b/scripts/wipe-sysroot
deleted file mode 100755
index 5e6b1a4..0000000
--- a/scripts/wipe-sysroot
+++ /dev/null
@@ -1,54 +0,0 @@
-#! /bin/sh
-
-# Wipe out all of the sysroots and all of the stamps that populated it.
-# Author: Ross Burton <ross.burton@intel.com>
-#
-# Copyright (c) 2012 Intel Corporation
-#
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
-#
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
-# See the GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License
-# along with this program; if not, write to the Free Software
-# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
-
-set -e
-
-if [ $# -gt 0 ]; then
-    echo "Wipe all sysroots and sysroot-related stamps for the current build directory." >&2
-    echo "Usage: $0" >&2
-    exit 1
-fi
-
-ENVS=`mktemp --suffix -wipe-sysroot-envs`
-bitbake -p -e > $ENVS
-
-eval `grep -F SSTATE_MANIFESTS= $ENVS`
-eval `grep -F STAGING_DIR= $ENVS`
-eval `grep -F STAMPS_DIR= $ENVS`
-rm -f $ENVS
-
-if [ -z "$SSTATE_MANIFESTS" -o -z "$STAGING_DIR" -o -z "$STAMPS_DIR" ]; then
-    echo "Could not determine SSTATE_MANIFESTS/STAGING_DIR/STAMPS_DIR from bitbake, check above for errors"
-    exit 1
-fi
-
-echo "Deleting the sysroots in $STAGING_DIR, and selected stamps in $SSTATE_MANIFESTS and $STAMPS_DIR."
-
-# The sysroots themselves
-rm -rf $STAGING_DIR ${STAGING_DIR}-uninative
-
-# The stamps that said the sysroot was populated
-rm -rf $STAMPS_DIR/*/*/*.do_populate_sysroot.*
-rm -rf $STAMPS_DIR/*/*/*.do_populate_sysroot_setscene.*
-rm -rf $STAMPS_DIR/*/*/*.do_packagedata.*
-rm -rf $STAMPS_DIR/*/*/*.do_packagedata_setscene.*
-
-# The sstate manifests
-rm -rf $SSTATE_MANIFESTS/manifest-*.populate_sysroot
-- 
2.8.1


