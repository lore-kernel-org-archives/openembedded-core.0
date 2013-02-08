Received: from out5-smtp.messagingengine.com ([66.111.4.29])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <walters@verbum.org>) id 1U3ngS-0004Kd-8N
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 14:08:09 +0100
Received: from compute3.internal (compute3.nyi.mail.srv.osa [10.202.2.43])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 77EBC207A9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Feb 2013 07:52:12 -0500 (EST)
Received: from frontend2.nyi.mail.srv.osa ([10.202.2.161])
	by compute3.internal (MEProxy); Fri, 08 Feb 2013 07:52:12 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=subject:from:to:content-type:date
	:message-id:mime-version; s=smtpout; bh=ohSZ1xWHUkOYInQ46WjADQue
	Vd8=; b=qCqO+l1Y/k3gOAU4c0sMCPt30mCbwrZ4FCvGYuyEHzg1ghcAooVsRvNX
	rD6kdg+dB5OTy8EwH+FMVUdE3o3FbmxwjapnUhXQzW75AsAASG0w8W9aUEQpcB8n
	MUxN7kBw1+lM9lnAE/MbYTklreQPvgUwLIoFcXMe8rYqUzWcPgM=
X-Sasl-enc: H5JgIOn31sLo9Fbiis+7uH3NlonvLx9yjHFI6NKFkNJN 1360327932
Received: from [192.168.1.6] (unknown [50.138.225.153])
	by mail.messagingengine.com (Postfix) with ESMTPA id 1947B48258D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Feb 2013 07:52:12 -0500 (EST)
From: Colin Walters <walters@verbum.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 08 Feb 2013 07:52:11 -0500
Message-ID: <1360327931.9905.799.camel@localhost>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 (2.28.3-30.el6) 
Subject: [PATCH] make-3.82: Add patch from git to fix parallel make race
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Feb 2013 13:08:10 -0000
X-Groupsio-MsgNum: 35213
Content-Type: multipart/mixed; boundary="=-Z26DmUAkau3T7O5Y7S1o"

--=-Z26DmUAkau3T7O5Y7S1o
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

See: http://savannah.gnu.org/bugs/?30653

This only shows up for projects which have a number of intermediate
targets.  For me, systemd fails to build without this patch, and does
build consistently with it.

WebKitGtk+ is another known affected project.

Signed-off-by: Colin Walters <walters@verbum.org>
---
 .../make-3.82/intermediate-target-bugfix.patch     |   23 ++++++++++++++++++++
 meta/recipes-devtools/make/make_3.82.bb            |    1 +
 2 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/make/make-3.82/intermediate-target-bugfix.patch




--=-Z26DmUAkau3T7O5Y7S1o
Content-Disposition: attachment; filename*0=0001-make-3.82-Add-patch-from-git-to-fix-parallel-make-ra.pat; filename*1=ch
Content-Type: text/x-patch; name="0001-make-3.82-Add-patch-from-git-to-fix-parallel-make-ra.patch"; charset="UTF-8"
Content-Transfer-Encoding: 7bit

From 62d497f50828ea62bf0b15cd9b43f509da3da52e Mon Sep 17 00:00:00 2001
From: Colin Walters <walters@verbum.org>
Date: Fri, 8 Feb 2013 07:48:52 -0500
Subject: [PATCH] make-3.82: Add patch from git to fix parallel make race

See: http://savannah.gnu.org/bugs/?30653

This only shows up for projects which have a number of intermediate
targets.  For me, systemd fails to build without this patch, and does
build consistently with it.

WebKitGtk+ is another known affected project.

Signed-off-by: Colin Walters <walters@verbum.org>
---
 .../make-3.82/intermediate-target-bugfix.patch     |   23 ++++++++++++++++++++
 meta/recipes-devtools/make/make_3.82.bb            |    1 +
 2 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/make/make-3.82/intermediate-target-bugfix.patch

diff --git a/meta/recipes-devtools/make/make-3.82/intermediate-target-bugfix.patch b/meta/recipes-devtools/make/make-3.82/intermediate-target-bugfix.patch
new file mode 100644
index 0000000..b416e64
--- /dev/null
+++ b/meta/recipes-devtools/make/make-3.82/intermediate-target-bugfix.patch
@@ -0,0 +1,23 @@
+Upstream-Status: Backport [The fix is already in upstream git repo, but not in the stable release]
+
+From fbe5b2c9cd612b962836b9391fa2b58c8baed6fc Mon Sep 17 00:00:00 2001
+From: Paul Smith <psmith@gnu.org>
+Date: Mon, 10 Sep 2012 02:36:05 +0000
+Subject: Force intermediate targets to be considered if their non-intermediate
+
+parent needs to be remade.  Fixes Savannah bug #30653.
+---
+diff --git a/remake.c b/remake.c
+index c0bf709..b1ddd23 100644
+--- a/remake.c
++++ b/remake.c
+@@ -612,6 +612,10 @@ update_file_1 (struct file *file, unsigned int depth)
+                 d->file->dontcare = file->dontcare;
+               }
+ 
++            /* We may have already considered this file, when we didn't know
++               we'd need to update it.  Force update_file() to consider it and
++               not prune it.  */
++            d->file->considered = !considered;
+ 
+ 	    dep_status |= update_file (d->file, depth);
diff --git a/meta/recipes-devtools/make/make_3.82.bb b/meta/recipes-devtools/make/make_3.82.bb
index 65b044b..b4292b5 100644
--- a/meta/recipes-devtools/make/make_3.82.bb
+++ b/meta/recipes-devtools/make/make_3.82.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 require make.inc
 
 SRC_URI += "file://expand_MAKEFLAGS.patch \
+            file://intermediate-target-bugfix.patch \
             file://make-savannah-bug30612-handling_of_archives.patch;striplevel=0"
 
 SRC_URI[md5sum] = "1a11100f3c63fcf5753818e59d63088f"
-- 
1.7.1


--=-Z26DmUAkau3T7O5Y7S1o--
