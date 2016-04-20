Return-Path: <bjorn.forsman@gmail.com>
Received: from mail-lb0-f170.google.com (mail-lb0-f170.google.com
	[209.85.217.170])
	by mail.openembedded.org (Postfix) with ESMTP id AF550606BF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Apr 2016 18:24:36 +0000 (UTC)
Received: by mail-lb0-f170.google.com with SMTP id u8so14092708lbk.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Apr 2016 11:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pzaIqSoSD2lc3ZHVoKxw5AyLbltREFG7ZySSGRSWYZs=;
	b=Ro7EiUoC7uYWqrKZKeK04zJwHBtV624cgFGwq62vhCN/TR10H0RTiPN7APHC+/bP++
	im7C258vYNtm6EK7K+a8kjNZ1lNZ/+RIuxzB6sRE7HX+fz945w6ota1j9RVQcOFq/+JC
	Y0AKkfDwzE6brUGSnoRAf2qgkUdgjIywYNxT8DuC88XPbRSbRnaNbykl5OBlSQ4psUBt
	RqlyRMk1KEivIXkvJeNZjVx+77WTj8HTaxfCogCK2LwamBEdCK8/p2cotlSBZNj2Qwt9
	N3zf4BLydTsIkRLEmNndCJWHQgSD+AYZXD+rGhlmtLjwPf2MuWxdSBor+W+e0xfj7URO
	0yFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pzaIqSoSD2lc3ZHVoKxw5AyLbltREFG7ZySSGRSWYZs=;
	b=AcrdMMJlJ4RW+0utbWQt2F6yCx7JlWtGNnEmZq8TgbKKaixDbFnFN09q7dmrKo/LDU
	ydbfvX0U1/WjLXY6C+q8KIU7zYpJ56NuevyJCmcdNvNIg9qKnZju2F60GaWj/uR1nqYJ
	EmOfjC3f4OM1hkNqEg3maU6jWiDD7CSDShP/QRnd5GqWtYAGskKO/COsNQ69izcGC2/S
	h2Rv+KX6FZazhG/0Kg/7djV47Zdg8dIB2SEUzCs5HHVjFnVewWCZD/LwzCOmKq8Q6ktu
	UcOVuaSTHbi7TxxPvPUayu9SgqYPRABogJHbyLN4Xbvuw4YKo4dDamDNmz2zyiUr1CVv
	Rhrw==
X-Gm-Message-State: AOPr4FWyEM4MrkDRkCmPEyf0xMjyVhFadylF5s1pRWCQ+b7+JrtEED7tLvILnap29wA7eg==
X-Received: by 10.112.22.131 with SMTP id d3mr4296083lbf.145.1461176675463;
	Wed, 20 Apr 2016 11:24:35 -0700 (PDT)
Received: from localhost (cm-84.208.208.120.getinternet.no. [84.208.208.120])
	by smtp.gmail.com with ESMTPSA id
	w125sm1320859lfa.10.2016.04.20.11.24.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Apr 2016 11:24:34 -0700 (PDT)
From: =?UTF-8?q?Bj=C3=B8rn=20Forsman?= <bjorn.forsman@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Apr 2016 20:24:34 +0200
Message-Id: <1461176674-29389-1-git-send-email-bjorn.forsman@gmail.com>
X-Mailer: git-send-email 2.5.4
MIME-Version: 1.0
Subject: [PATCH] [jethro] license.bbclass: fix warnings when run in unprivileged "container" env
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
X-List-Received-Date: Wed, 20 Apr 2016 18:24:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

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
---
Richard's sign-off is from the commit that went into master branch. I wasn't
sure whether or not to keep it.

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
2.7.4


