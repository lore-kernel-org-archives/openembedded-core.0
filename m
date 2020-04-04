Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.1854.1585964040325409358
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2020 18:34:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=h1rsUJeK;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: jpuhlman@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id k18so3511404pll.6
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2020 18:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tv/SAYJqwVLjd1zV+ayQEDott6l6JSAAOTFmAjfIoZk=;
        b=h1rsUJeKpL1b3K2l40/19SUTUQuPCSzx9pzIyB/aaK4jL4GQJY1RkUWZUeSaS2e4Ld
         +u8WLcTFcxOur86cCjqBs/T3cIccPT5PVo1XXRHoSZEDZD5YVmiGdCgojBdRIWE63to2
         Pd91Xl+O7ucV5CT+QYm/fZ98ojShk6rVWcbHXYw2yCQBHnXQ0ncdexKVkuq97aQyv/v4
         OFWs2Vbdp7TpqgpHJywJDNTuUP68hDuGYHHpWHpyWxVc7n5N6gfYZhlMS2dCf5e7fXaB
         V+wJ+pSCMmUjn8MYQRQwp+5j+OvPGPq9ardhYd0KafzqJWoxRapBBgb6MRFzJVq2ZGFF
         6l9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=tv/SAYJqwVLjd1zV+ayQEDott6l6JSAAOTFmAjfIoZk=;
        b=UFv4T9uxFyy8ZJlzFA0K2n8tMKdmuz3cnCyLqW2JqzRXL/glSKCWz9MtwDzUiohpnS
         LpK+OpIYaaGx3ellnTfswNZek0Hn/sP7Zgrr5Bv7a7T+/AoZmgI3rgCieEVtfJR4CxGc
         YX3gvwzGxnFVI8vXA84rRo/x3h7tsyZJC1xchcUGIW3JjCt+OobgaOXPhYufIYXgsU1e
         3+eG6U6Lyxwx3BkfIXwxo8OO3VAMyUPodJKCVYrn8A0ZV+LAj87u3M5iTv34+BJWWnE0
         Jfp5DfrTUyzGLDYOuoTRhexFhL3GmJ1A78LmRWXXJ8rOj4YKdUBG//5V72eh1cDXYr3o
         31LA==
X-Gm-Message-State: AGi0PubfdcooMF0my5PGFE2Td6BVy/kPT4egi1dZZZhgtVCnEpv91sxC
	MqzCErFC+91nxuhe8yD32v9V4Ct5BDI=
X-Google-Smtp-Source: APiQypJuOgDvoGok8z+1kruelxBVHh8s+ihiHwj4fdl0Vu2dCs0ZTUVfTT5vkjxlg5ldsPYxz5zKWA==
X-Received: by 2002:a17:902:b60d:: with SMTP id b13mr10902307pls.324.1585964039616;
        Fri, 03 Apr 2020 18:33:59 -0700 (PDT)
Return-Path: <jpuhlman@gmail.com>
Received: from workhorse.localdomain ([2600:1700:4c90:60a0:56be:f7ff:fe12:d0bd])
        by smtp.gmail.com with ESMTPSA id b25sm6621589pfp.201.2020.04.03.18.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2020 18:33:59 -0700 (PDT)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id 01CD52A0567; Fri,  3 Apr 2020 18:33:57 -0700 (PDT)
From: "Jeremy Puhlman" <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Jeremy Puhlman <jpuhlman@mvista.com>
Subject: [warrior][PATCH] busybox: on upgrade save busybox if it is the last shell
Date: Fri,  3 Apr 2020 18:33:56 -0700
Message-Id: <20200404013356.6040-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.20.1
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

Backported from master and reworked for warrior since the postinst
scripts are handled slightly differently in the metadata.

[YOCTO 13850]
---
 meta/recipes-core/busybox/busybox.inc | 51 +++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 174ce5a8c0..64ab79aa60 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -422,6 +422,40 @@ pkg_postinst_${PN} () {
 	fi
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
+busybox_postinst_close () {
+        # If busybox exists in the remove directory it is because it was the only shell left.
+        if [ "x$D" = "x" ] ; then
+           if [ "x$BUSYBOX" != "x" ] ; then
+              update-alternatives --remove sh $BUSYBOX
+              rm -f $BUSYBOX
+           fi
+        fi
+} 
+
+populate_packages_updatealternatives_append () {
+    pkg=d.getVar("PN")
+    closing = d.getVar("busybox_postinst_close")
+    postinst = d.getVar('pkg_postinst_%s' % pkg)
+    postinst += closing
+    d.setVar('pkg_postinst_%s' % pkg, postinst)
+}
+
 pkg_prerm_${PN} () {
 	# This is so you can make busybox commit suicide - removing busybox with no other packages
 	# providing its files, this will make update-alternatives work, but the update-rc.d part
@@ -442,9 +476,26 @@ pkg_prerm_${PN} () {
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
2.20.1

