Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 7DE17744AE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2018 15:38:25 +0000 (UTC)
Received: from linuxdev2.toradex.int (unknown [46.140.72.82])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 9DC405C0AF7;
	Fri, 19 Oct 2018 17:38:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1539963505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:content-type:content-transfer-encoding:
	in-reply-to:references; bh=7UMqKNrLN9vupFxiLdL12Dp6LGnpCkQizRPfRHmuIJg=;
	b=x21nZLnNb5cel3WAFEiWkz6LHo8OeE363ZXx9JIo3yH5dOuOVWMu9wda7qg/LuNUX/65pU
	psNn5JwDkPGw9GKZ/ZwTvOJ910lVPTghumGc6daARjQ+KyiJk7kVqcBeOk7ms5l8qeNBgN
	xjnvp9qrpWNqr6XMbE3KC1eZCf/8CME=
From: Stefan Agner <stefan@agner.ch>
To: opkg-devel@googlegroups.com, alejandro.delcastillo@ni.com,
	yocto@yoctoproject.org
Date: Fri, 19 Oct 2018 17:38:21 +0200
Message-Id: <20181019153821.21177-1-stefan@agner.ch>
X-Mailer: git-send-email 2.13.6
Cc: Stefan Agner <stefan.agner@toradex.com>,
	openembedded-core@lists.openembedded.org, ricardo@foundries.io
Subject: [opkg-utils PATCH] opkg-make-index: use ctime instead of mtime
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
X-List-Received-Date: Fri, 19 Oct 2018 15:38:25 -0000

From: Stefan Agner <stefan.agner@toradex.com>

When using sstate, two parallel builds can produce two packages
with the same mtime but different checksums. When later one of
those two builds fetches the others ipk, the package index does
not get udpated properly (since mtime matches). This ends up with
messages such as:
  Downloading file:/../tmp/work/../image/...ipk.
  Removing corrupt package file /../sysroot/../var/cache/opkg/volatile/...ipk

However, in that case, ctime is different. Use ctime instead of
mtime to prevent failures like this.

Suggested-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
This addresses the issue discussed here:
http://lists.openembedded.org/pipermail/openembedded-core/2018-October/156348.html

 opkg-make-index | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/opkg-make-index b/opkg-make-index
index 3227fc0..db7bf64 100755
--- a/opkg-make-index
+++ b/opkg-make-index
@@ -115,12 +115,12 @@ for abspath in files:
      pkg = None
      fnameStat = os.stat(abspath)
      if filename in old_pkg_hash:
-          if filename in pkgsStamps and int(fnameStat.st_mtime) == pkgsStamps[filename]:
+          if filename in pkgsStamps and int(fnameStat.st_ctime) == pkgsStamps[filename]:
             if (verbose):
                sys.stderr.write("Found %s in Packages\n" % (filename,))
             pkg = old_pkg_hash[filename]
           else:
-               sys.stderr.write("Found %s in Packages, but mtime differs - re-reading\n" % (filename,))
+               sys.stderr.write("Found %s in Packages, but ctime differs - re-reading\n" % (filename,))
 
      if not pkg:
           if (verbose):
@@ -137,7 +137,7 @@ for abspath in files:
      else:
           old_filename = ""
      s = packages.add_package(pkg, opt_a)
-     pkgsStamps[filename] = fnameStat.st_mtime
+     pkgsStamps[filename] = fnameStat.st_ctime
      if s == 0:
           if old_filename:
                # old package was displaced by newer
-- 
2.13.6


