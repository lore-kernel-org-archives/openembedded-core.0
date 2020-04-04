Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.1850.1585964010632045817
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2020 18:33:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VqaCxCy+;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: jpuhlman@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id x1so3511006plm.4
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2020 18:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8P9nlJZLiDYxx2BiE1kFfMw5fi9ntNcujSImp+BXN9s=;
        b=VqaCxCy+wFISIXC7gDLuPcZ1pF1XCx9fY9s2xdIXdqo7PI5D/Ns3iACDmccglh42Pe
         OIPEE5tFgEQRzsRqxiQG0eSXNNwbXRxBadoMFKO+2BB1DyfU4aluJHRe3qCxILSDHts+
         PqVTV8Z3VLkVgSCMIvKcuW5Y2tkJgZ0Re4LXQ45DmCsma79BRv6O7RUpxJofBR20Bwvw
         TnMovcquHBnOLf5ZFYY9QjfTqD4BdAXUtejshfk200JYu0E28dqeGdUCD9Z1vsRSexFp
         PZ/MEVljPvfhQCDJFAGvf49aqyH96DXMWb6Zqr6FjPSbnGId4AuYwjsmfAZyV2JBU9Q7
         KiNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=8P9nlJZLiDYxx2BiE1kFfMw5fi9ntNcujSImp+BXN9s=;
        b=IGrIyQM8N39RmvhW1ChOij3sg3IILrdesMnqxSlblkSM5Gx1lzawyapt2blBTek0M9
         MFRovWdTHL8ARExTKwjSbdLW/GtMOJWefwoX3WMQvNDulAj3XylPWa94GNFFTtez5vCa
         vAwyx4w0rdI3oDxfXBhLUMBeMgkkbIKNMMJJgo26qAccL71BYLxia6Q2RNL8yNppy+co
         wrTBsWiJ3UF7M+qfSIeEgHlOQ0DJ13vlkErAVnC4YQChXAr3EAZ5BY69Ez1AI3+IpAlP
         mdO2wBlcmBLiqUrb3H49Ojv/ZId0k0ywYX29WtqPm8fiWmClmb2C22jGnt24vn4rIbU6
         xt4A==
X-Gm-Message-State: AGi0PubxQI6PHy3k1xe8dqmeLTgxqhwsOcNHKd/N+EnocJmmWT041NlZ
	nm53kO/gw0PwuZ38svIrywEELNeLm08=
X-Google-Smtp-Source: APiQypJmcxtH0EZ8tG5Ne9SdqBQYCTpUJ/XAnqXjRURHoUf78momhAleyfAFEIU9K67TXi3MeTGbtg==
X-Received: by 2002:a17:90a:1acf:: with SMTP id p73mr12915424pjp.53.1585964009606;
        Fri, 03 Apr 2020 18:33:29 -0700 (PDT)
Return-Path: <jpuhlman@gmail.com>
Received: from workhorse.localdomain ([2600:1700:4c90:60a0:56be:f7ff:fe12:d0bd])
        by smtp.gmail.com with ESMTPSA id v4sm6677378pfb.31.2020.04.03.18.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2020 18:33:28 -0700 (PDT)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id 8A1782A0567; Fri,  3 Apr 2020 18:33:27 -0700 (PDT)
From: "Jeremy Puhlman" <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Jeremy Puhlman <jpuhlman@mvista.com>
Subject: [zeus][PATCH] busybox: on upgrade save busybox if it is the last shell
Date: Fri,  3 Apr 2020 18:33:21 -0700
Message-Id: <20200404013321.5932-1-jpuhlman@mvista.com>
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

[YOCTO 13850]
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
2.20.1

