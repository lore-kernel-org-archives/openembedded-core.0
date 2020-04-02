Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web12.245.1585868315100584898
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Apr 2020 15:58:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=azIonce4;
 spf=pass (domain: gmail.com, ip: 209.85.210.50, mailfrom: jpuhlman@gmail.com)
Received: by mail-ot1-f50.google.com with SMTP id a49so5310709otc.11
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2020 15:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jHFdrgrgmWUC+pZayt4VKX2ywJ8mPCi/0rc8QnNi+zk=;
        b=azIonce4o+Lj2brgmfB87fjAJ+9RMwKqeE6iYWDZxKlFQACiERNcw4d8tbDxyjIknj
         GyKlxplkHWSyx70XkXrqvirab8FgxGzRepGNkkW7cTRjHaDkoMm4WL4UhGBhgKXk/gqI
         T8XDqCBmd2MZvod3GI1epRg9jGed4GFE6QXYdlSYtRQyJ86pW4BHNwvYk5mdCEog4IdR
         u3IN+Z8ycm/uZmUCONWZu6qxEQyytAkUoPqMJFSzrp2i6d7LQhmZt2Mdw1iWjYYQXTrk
         Ff3vUiPKv9H8z7MyDPeZuOsbQEtMAGwDQ9zSq6SdA084zD5MY8XqvMxAFFmA7gJWRhYD
         z21g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=jHFdrgrgmWUC+pZayt4VKX2ywJ8mPCi/0rc8QnNi+zk=;
        b=gbu66ZdMViXPmN4N6O+kJC755LaDeJUdVD2wuotjHyfsIKw2DuMHLvFYXxNfZ9K3gz
         PU0Q5orE32ZFcx+SxwNf8jSY4XMCsmuJZjwA7gAR137X/KP4AeSXZ6YoJOoqNoC5gkeQ
         X99B0Kb6+9AQIyPniHpcqAf3FDV5ea4OSYPPaA1x1A8Aoj0luT8ak6tOoP70I5Fc1aa2
         PdkfX0w1i+l33Ma0HqXrWt/JmVeAaTGmXsimgry+GmehQdmRDHKuaaipmHJ5LNiK4yJU
         rdOY+9EFxcaHQoNPcSxefKScKxYQZFllXI1a5hTcEFMwtPWJXez0k0M8jDsHoVHlDoJp
         0eMw==
X-Gm-Message-State: AGi0PubNsfASNM25d0X2DBJEggrQuzbJT1/ZVsfC38MTkld2VF5jxrA9
	CA/ZJ1C4FHT0sgJhxGWmvWl3PvWqiQo=
X-Google-Smtp-Source: APiQypKygSxNvczR1jhV9r68MgwXEH+djTfDLVS7LyI7DtPcFg83rPc+6MLtiJv4ojwjCfmEoPnuww==
X-Received: by 2002:a05:6830:110c:: with SMTP id w12mr3946236otq.175.1585868313898;
        Thu, 02 Apr 2020 15:58:33 -0700 (PDT)
Return-Path: <jpuhlman@gmail.com>
Received: from workhorse.localdomain ([2600:1700:4c90:60a0:56be:f7ff:fe12:d0bd])
        by smtp.gmail.com with ESMTPSA id c18sm1609780ooa.8.2020.04.02.15.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2020 15:58:33 -0700 (PDT)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id C8FC72A05DF; Thu,  2 Apr 2020 15:58:26 -0700 (PDT)
From: "Jeremy Puhlman" <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Jeremy Puhlman <jpuhlman@mvista.com>
Subject: [PATCH] busybox: on upgrade save busybox if it is the last shell
Date: Thu,  2 Apr 2020 15:58:20 -0700
Message-Id: <20200402225820.6709-1-jpuhlman@mvista.com>
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

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 meta/recipes-core/busybox/busybox.inc | 43 +++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 1a82f23b0f..344e891f7a 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -433,6 +433,32 @@ fi
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
@@ -453,9 +479,26 @@ pkg_prerm_${PN} () {
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

