Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 90564607A4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2016 01:10:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u3P1Agha002115
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Apr 2016 18:10:42 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 24 Apr 2016 18:10:41 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 24 Apr 2016 18:10:35 -0700
Message-ID: <163e19ecf3ef574eb1a9a4214cfa7c4ae0a7e382.1461546574.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1461546574.git.liezhi.yang@windriver.com>
References: <cover.1461546574.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/6] license.bbclass: fix warnings when run in unprivileged "container" env
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
X-List-Received-Date: Mon, 25 Apr 2016 01:10:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Bjørn Forsman <bjorn.forsman@gmail.com>

An unprivileged "container" environment like this[1] doesn't have root
account (uid 0) which causes tons of "Invalid argument" warnings:

  $ bitbake ...
  ...
  WARNING: Could not copy license file [src] to [dest]: [Errno 22] Invalid argument: '[src]'
  WARNING: Could not copy license file [src] to [dest]: [Errno 22] Invalid argument: '[src]'
  WARNING: Could not copy license file [src] to [dest]: [Errno 22] Invalid argument: '[src]'
  ...

Fix it by handling EINVAL similar to existing handling of EPERM (which
was added for when not running under pseudo).

[1]: The real environemnt is buildFHSUserEnv from NixOS/nixpkgs, but a
  demonstration of the issue can be done like this:

    $ touch f
    $ unshare --user --mount chown 0:0 f
    chown: changing ownership of ‘f’: Invalid argument

(From OE-Core master rev: d00b2250a6afebd7d1373c04b4006290f0cd4043)

Signed-off-by: Bjørn Forsman <bjorn.forsman@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/license.bbclass | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index c714da3..db0fc51 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -189,9 +189,11 @@ def copy_license_files(lic_files_paths, destdir):
                     os.chown(dst,0,0)
                 except OSError as err:
                     import errno
-                    if err.errno == errno.EPERM:
-                        # suppress "Operation not permitted" error, as
-                        # sometimes this function is not executed under pseudo
+                    if err.errno in (errno.EPERM, errno.EINVAL):
+                        # Suppress "Operation not permitted" error, as
+                        # sometimes this function is not executed under pseudo.
+                        # Also ignore "Invalid argument" errors that happen in
+                        # some (unprivileged) container environments (no root).
                         pass
                     else:
                         raise
-- 
2.8.0


