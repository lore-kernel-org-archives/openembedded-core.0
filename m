Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web12.1819.1585964083506429560
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2020 18:34:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gx2k+rqz;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: jpuhlman@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id ay1so3521094plb.0
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2020 18:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WOUnWDaps/Wtgudown/m1l4z0sOSRfzlETNWxyT1fsY=;
        b=gx2k+rqzqcKLF6KK2gCP+s/dBGzZ0BgP0D8YvCBWwXNVehoU20B2L9PYLqmmBVsHQi
         ePw0aQC4YFwMqPzZq0iSpxTw9ICLXCICIovV/c97U/7RMc3OUFANVLoyAPWADZI+KQEW
         hHUR6CHrfhOH8OH4JApq1hBHfO0YKzxhvsYFQviFVapWKdvTWngT+FboqzOENQAX25Mk
         Fh5EJB3YzIbRYda1qWF9sBZGVgP2Cgad/VbhVWqPqFc8pABLiVpQ1Wm3YhVlrK/Eak+X
         iWhI47CnoIiSmL4xkt6ZNRf2MUJzibxumRr2BtBtaUkgk95axKLD+jlDd7PaTNyAefj9
         IQ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=WOUnWDaps/Wtgudown/m1l4z0sOSRfzlETNWxyT1fsY=;
        b=hOjObdIQ6Ircpxy4sg0/t1osy31CHjuECm4DbKyDHSEHPyko+eG6lLDHEkEsTMmXKH
         l/5Z6lP/zRJkXsrSMpx4SY7QevEcnq7PvQjOucGN3OjYxloQ9bWsizIlF6tGYoqIMD9A
         bGX8oO7HZzkxBsUqi6uWkGKOtFBzlvLR8Z5h9mIcdFTJkRojlqfx1DY8FcAKJXWlH0Kw
         bCtexoNPC7QqYemXpB6NkpW1fL5i0a5kaFcVfyQPHFoSaVgDynOt9Ldk+O8qpzz8QmCa
         SKxTOhgzqJfXHDFmkEcjw6pZ1GJarPhQhH9uPGU5ytjtprzSYawY7jGSxtl/fy3hThit
         lSKA==
X-Gm-Message-State: AGi0PuaIAoA6zLSgiZ305UlC4EFb/cfs4nxyq1is22f12WQbGZgPhaRL
	vz3sRVLp3jdamC6x32tTFw0QFcWNklY=
X-Google-Smtp-Source: APiQypKZkc9UFA1XDel7JeTuv8Ue2k5ACeK215CznHuzK7QlP/THniRd0KwDCxjBlnZLmEeATj9Nnw==
X-Received: by 2002:a17:90a:206a:: with SMTP id n97mr13368746pjc.16.1585964082722;
        Fri, 03 Apr 2020 18:34:42 -0700 (PDT)
Return-Path: <jpuhlman@gmail.com>
Received: from workhorse.localdomain (99-14-97-149.lightspeed.frokca.sbcglobal.net. [99.14.97.149])
        by smtp.gmail.com with ESMTPSA id m68sm10126682pjb.0.2020.04.03.18.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2020 18:34:42 -0700 (PDT)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id 3F8EF2A0567; Fri,  3 Apr 2020 18:34:41 -0700 (PDT)
From: "Jeremy Puhlman" <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Jeremy Puhlman <jpuhlman@mvista.com>
Subject: [thud][PATCH] busybox: on upgrade save busybox if it is the last shell
Date: Fri,  3 Apr 2020 18:34:39 -0700
Message-Id: <20200404013439.6143-1-jpuhlman@mvista.com>
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

Backported from master and reworked for thud since the postinst
scripts are handled slightly differently in the metadata.

[YOCTO 13850]
---
 meta/recipes-core/busybox/busybox.inc | 51 +++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 0c0d26ed3a..571a9dd626 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -418,6 +418,40 @@ pkg_postinst_${PN} () {
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
@@ -438,9 +472,26 @@ pkg_prerm_${PN} () {
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

