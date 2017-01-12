Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 1D9026FEFA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2017 10:34:41 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id r126so13174976wmr.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2017 02:34:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=S0qrJ8UoyqgrFg7NTdMrXmkfp45IBtsHh1f6t1Xlhl4=;
	b=TL0E1bhErZCyxOoUeSnewetssYRhiqRzAJ8sCXA0obReaOxR6qObTu+A9J5wRkaj/8
	ekar9AhEXOnb7syB5jb/T2kQNv3eBgVAvB+vrrQP5o38JYpKgpkNtfqDBqK+cmhI48oA
	bVMef9c7DPT/V8rij/BlBrNFp/OvHEWNoclX8dgmMs1wJU71X9FOwFf6ZBNdGc69oJjm
	ersJSLxQxI/mL6hnMs6KI90Hje3fxcp3mGtPd81q059Phpsv5ES2xrjQ24PJbLlA6QeL
	1JMmUZV7F6wEr80KVpetgmDWOLLZkPueqJlq4rEZidDeSbi2DD1Yyr7piQdgDmBkCZBd
	/ecA==
X-Gm-Message-State: AIkVDXIHHHdcoxeKGGcDAqkkbgJfm7yz7/brQbIN/GCjggp3fb6z8AW5PPn1Avc8Unap+w==
X-Received: by 10.28.11.11 with SMTP id 11mr5642540wml.80.1484217281108;
	Thu, 12 Jan 2017 02:34:41 -0800 (PST)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	yo9sm12869427wjc.14.2017.01.12.02.34.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Jan 2017 02:34:40 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Jan 2017 10:34:39 +0000
Message-Id: <20170112103439.24779-1-git@andred.net>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH] lib/oe/rootfs: reliably handle alternative symlinks
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
X-List-Received-Date: Thu, 12 Jan 2017 10:34:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

When removing unneeded packages from a (read-only) rootfs
during rootfs creation, alternative symlinks from those
packages may or may not be removed.

The reason is as follows:

update-alternatives(-native) is used during package
installation as part of the image creation. It uses
a database which contains entries for all the
alternative symlinks possible, and the -native version
uses the target's database by means of $OPKG_OFFLINE_ROOT,
i.e. the rootfs we're in the process of creating.

Once the rootfs has been created, OE removes certain
packages because we have a read-only rootfs - in
particular ROOTFS_RO_UNNEEDED which includes
VIRTUAL-RUNTIME_update-alternatives, i.e. the
update-alternatives. Recently, a change was made in
OE, where uninstallation of update-alternatives from the
rootfs causes removal of its database, too, to save space
(700KiB (uncompressed) in a busybox system)
  b24a63d71b517af701dfedbc7f7b541d25af708f
  http://git.openembedded.org/openembedded-core/commit/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb?id=b24a63d71b517af701dfedbc7f7b541d25af708f

Following from that, if update-alternatives is removed
from the target file system, update-alternatives-native
has no database anymore, meaning it can't manage any of
the alternative symlinks anymore.

Because the order of packages to uninstall is
non-deterministic, and update-alternatives could well
be removed before any packages that use the mechanism
provided, sometimes the extra symlinks are removed,
sometimes not.

By sorting the list of packages to be removed such that
update-alternatives is removed last, we can ensure that
that tings work reliably. (Certainly opkg seems to
uninstall packages in the order given on the command
line.)

[YOCTO #10916]

Signed-off-by: André Draszik <adraszik@tycoint.com>
---
 meta/lib/oe/rootfs.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index d9a473006a..b848e1cf2c 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -262,7 +262,12 @@ class Rootfs(object, metaclass=ABCMeta):
             # Remove components that we don't need if it's a read-only rootfs
             unneeded_pkgs = self.d.getVar("ROOTFS_RO_UNNEEDED").split()
             pkgs_installed = image_list_installed_packages(self.d)
-            pkgs_to_remove = [pkg for pkg in pkgs_installed if pkg in unneeded_pkgs]
+            # Make sure update-alternatives is last on the command line, so
+            # that it is removed last. This makes sure that its database is
+            # available while uninstalling packages, allowing alternative
+            # symlinks of packages to be uninstalled to be managed correctly.
+            provider = self.d.getVar("VIRTUAL-RUNTIME_update-alternatives")
+            pkgs_to_remove = sorted([pkg for pkg in pkgs_installed if pkg in unneeded_pkgs], key=lambda x: x == provider)
 
             if len(pkgs_to_remove) > 0:
                 self.pm.remove(pkgs_to_remove, False)
-- 
2.11.0


