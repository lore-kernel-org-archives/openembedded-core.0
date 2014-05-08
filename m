Return-Path: <paul.betafive@gmail.com>
X-Greylist: delayed 466 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 08 May 2014 17:02:53 UTC
Received: from mail-ee0-f51.google.com (unknown [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id 0E63D65ED6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 May 2014 17:02:53 +0000 (UTC)
Received: by mail-ee0-f51.google.com with SMTP id e51so1928193eek.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 May 2014 10:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=Z5UJd5aPIHUbqyb8FWXqQ6awkcUyxf6bjaA38I+saFY=;
	b=MeZY1up8EOkKzueS8PX86NO2NsYMpBs6UTXYCM4f0M6+oPS/I7r606ZzDBuNGF+/Ci
	fgJqGQPyNXEatSAylBrke+BOFgyoxbs2mnm7zGraPhGU5YqMncqR0wYr79F8OvTTLXdV
	k0wHrkVatWehFkHY2EnvutESsYANHuUZlixqolvlPQXcZ91mBOpieoWzQOUyXwgMgmFM
	ztCmZfREpgAQcW+YAvnh495yMh5UOijueezzO6cDB/3XRdCKz+3B9uc+TryLc9WJaPcV
	Ftv8NOi2HCIbm3XRRGLirmjPzsLvQ3Qg5qxaisuI5G/zKRnleASoRtQMD2ZGL5itNBdD
	/j3g==
X-Received: by 10.15.111.195 with SMTP id cj43mr7096022eeb.17.1399568107791;
	Thu, 08 May 2014 09:55:07 -0700 (PDT)
Received: from localhost.localdomain (ygg.betafive.co.uk. [5.9.90.21])
	by mx.google.com with ESMTPSA id n41sm5424793eeg.4.2014.05.08.09.55.06
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 08 May 2014 09:55:07 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 May 2014 16:55:04 +0000
Message-Id: <1399568104-11641-1-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.9.2
Subject: [PATCH RFC] Support hierarchical ipk feeds
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
X-List-Received-Date: Thu, 08 May 2014 17:02:56 -0000

This is an RFC only and is not suitable for merging yet. The necessary patches
for opkg-utils have also been posted for review but have not been merged yet. I
want to know if there is general approval for adding this feature to oe-core. If
there is, I'll go ahead and merge the opkg-utils patches and post a new patch
series which includes the update to the SRCREV used for opkg-utils in oe-core.

This patch has been tested on qemuarm:

  A feed was created with IPK_HIERARCHICAL_FEED unset and opkg was pointed at
  that feed. 'opkg update && opkg install ncurses-terminfo-base' worked
  correctly, downloading a package file from the same directory as the package
  feed.
  
  IPK_HIERARCHICAL_FEED was then set to "1" in local.conf and the feed was
  rebuilt by running 'bitbake core-image-minimal && bitbake package-index'. On
  qemu 'opkg update && opkg install ncurses-terminfo' worked correctly,
  downloading the package from the subdirectory 'n/ncurses-terminfo'.

  Finally, IPK_HIERARCHICAL_FEED was unset again and the feed was rebuilt. On
  qemu 'opkg update && opkg install ncurses' worked correctly, downloading
  package files from the same directory as the package feed again.

Those tests prove that changes to IPK_HIERARCHICAL_FEED do not break the upgrade
path of an existing system provided that 'bitbake pacakge-index' is re-ran after
the change.

The proposed commit message follows...



package_ipk.bbclass: Support hierarchical feed

This patch allows for an optional new layout for ipk feed directories which I've
called a 'hierarchical feed' and is based on how Debian pools package files. It
is disabled by default and is enabled by setting IPK_HIERARCHICAL_FEED to "1".

In the traditional feed layout, package files are placed in <outdir>/<arch>/.
This can lead to several thousand files existing in a single directory which is
often a problem if developers want to upload a package feed to a shared web
hosting provider. For example, in my case, listing files via FTP only shows the
first 2000 files, breaking my scripts which attempt to upload only new and
changed files via FTP.

In the hierarchical feed, package files are written to
'<outdir>/<arch>/<pkg_prefix>/<pkg_subdir>', where pkg_prefix is the first
letter of the package file name for non-lib packages or "lib" plus the 4th
letter of the pacakge file name for lib pacakges (eg, 'l' for less, 'libc' for
libc6).  pkg_subdir is the root of the pacakge file name, discarding the version
and architecture parts and the common suffixes '-dbg', '-dev', '-doc',
'-staticdev' and '-locale-*'.

This change relies on recent patches to opkg-utils which support hierarchical
package feeds.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 meta/classes/package_ipk.bbclass | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index 2949d1d..680b9bf 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -63,7 +63,26 @@ python do_package_ipk () {
         bb.data.update_data(localdata)
         basedir = os.path.join(os.path.dirname(root))
         arch = localdata.getVar('PACKAGE_ARCH', True)
-        pkgoutdir = "%s/%s" % (outdir, arch)
+        if localdata.getVar('IPK_HIERARCHICAL_FEED') == "1":
+            # Spread packages across subdirectories so each isn't too crowded
+            if pkgname.startswith('lib'):
+                pkg_prefix = 'lib' + pkgname[3]
+            else:
+                pkg_prefix = pkgname[0]
+
+            # Keep -dbg, -dev, -doc, -staticdev and -locale-* packages together
+            if pkgname[-4:] in ('-dbg', '-dev', '-doc'):
+                pkg_subdir = pkgname[:-4]
+            elif pkgname.endswith('-staticdev'):
+                pkg_subdir = pkgname[:-10]
+            elif '-locale-' in pkgname:
+                pkg_subdir = pkgname[:pkgname.find('-locale-')]
+            else:
+                pkg_subdir = pkgname
+
+            pkgoutdir = "%s/%s/%s/%s" % (outdir, arch, pkg_prefix, pkg_subdir)
+        else:
+            pkgoutdir = "%s/%s" % (outdir, arch)
         bb.utils.mkdirhier(pkgoutdir)
         os.chdir(root)
         cleanupcontrol(root)
-- 
1.9.2


