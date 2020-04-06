Received: from mga14.intel.com (mga14.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.12871.1586185918252682432
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Apr 2020 08:12:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: qQL+urFoCGC/s+ixjSrTXxHun/BD2Twzo8JR28qP2wG1Ue52RW/cZG3C9i/TfsfMJqdFm4heLc
 eHDlyAEW8CRQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2020 08:12:04 -0700
IronPort-SDR: UANdg7BvwEJPJFWxBM43ewr4VWQYsHe4mepXVXnTa1qG0IyujgS78E/O0YVoDZuyX/TuLgdC4J
 13MxdALJbaFg==
X-IronPort-AV: E=Sophos;i="5.72,351,1580803200"; 
   d="scan'208";a="424391155"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.249.70.63])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2020 08:12:03 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 05/13] busybox: on upgrade save busybox if it is the last shell
Date: Mon,  6 Apr 2020 23:11:33 +0800
Message-Id: <443d1c8c7fb5a69c03c813f3e90758e0add7df4b.1586185832.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1586185832.git.anuj.mittal@intel.com>
References: <cover.1586185832.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jeremy Puhlman <jpuhlman@mvista.com>

During a busybox upgrade on a ipk based system, it is possible
that busybox is the only shell in the system. During the uninstall
the alternative for /bin/sh is removed and everything after that
goes down hill.

* Add a check to verify if busybox is the shell, and save it to
the busyboxrm directory created in tmp. Then add an alternative
for /bin/sh that points to that busybox at the lowest priority.

* Add PATH to the busyboxrm directory using shell(as during an upgrade
busybox and its links are missing).

* When install over remove extra busybox if present.

deb and rpm are uneffected by the bug because they both drag in bash,
however neither upgrade seemed to have issue with the changes.

[YOCTO 13850]

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a9d2af8f5b3da8239cf00a52883ca596a19ea23a)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-core/busybox/busybox.inc | 43 +++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index bf6ddae7d1..33c84bc2c1 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -431,6 +431,32 @@ fi
     d.prependVar('pkg_postinst_%s' % pkg, postinst)
 }
 
+pkg_postinst_${PN}_prepend () {
+        # Need path to saved utils, but they may have be removed on upgrade of busybox
+        # Only use shell to get paths. Also capture if busybox was saved.
+        BUSYBOX=""
+        if [ "x$D" = "x" ] ; then 
+           for busybox_rmdir in /tmp/busyboxrm-*; do
+               if [ "$busybox_rmdir" != '/tmp/busyboxrm-*' ] ; then
+                  export PATH=$busybox_rmdir:$PATH
+                  if [ -e $busybox_rmdir/busybox* ] ; then
+                    BUSYBOX="$busybox_rmdir/busybox*"
+                  fi
+               fi
+           done
+        fi
+}
+
+pkg_postinst_${PN}_append () {
+        # If busybox exists in the remove directory it is because it was the only shell left.
+        if [ "x$D" = "x" ] ; then
+           if [ "x$BUSYBOX" != "x" ] ; then
+              update-alternatives --remove sh $BUSYBOX
+              rm -f $BUSYBOX
+           fi
+        fi
+} 
+
 pkg_prerm_${PN} () {
 	# This is so you can make busybox commit suicide - removing busybox with no other packages
 	# providing its files, this will make update-alternatives work, but the update-rc.d part
@@ -451,9 +477,26 @@ pkg_prerm_${PN} () {
 	ln -s ${base_bindir}/busybox $tmpdir/grep
 	ln -s ${base_bindir}/busybox $tmpdir/tail
 	export PATH=$PATH:$tmpdir
+
+        # If busybox is the shell, we need to save it since its the lowest priority shell
+        # Register saved bitbake as the lowest priority shell possible as back up.
+        if [ -n "$(readlink -f /bin/sh | grep busybox)" ] ; then
+           BUSYBOX=$(readlink -f /bin/sh)
+           cp $BUSYBOX $tmpdir/$(basename $BUSYBOX)
+           update-alternatives --install /bin/sh sh $tmpdir/$(basename $BUSYBOX) 1 
+        fi
 }
 
 pkg_postrm_${PN} () {
+        # Add path to remove dir in case we removed our only grep
+        if [ "x$D" = "x" ] ; then
+           for busybox_rmdir in /tmp/busyboxrm-*; do
+               if [ "$busybox_rmdir" != '/tmp/busyboxrm-*' ] ; then
+                  export PATH=$busybox_rmdir:$PATH
+               fi
+           done
+        fi
+
 	if grep -q "^${base_bindir}/bash$" $D${sysconfdir}/busybox.links* && [ ! -e $D${base_bindir}/bash ]; then
 		printf "$(grep -v "^${base_bindir}/bash$" $D${sysconfdir}/shells)\n" > $D${sysconfdir}/shells
 	fi
-- 
2.25.1

