Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web08.30557.1607925698184572863
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Dec 2020 22:01:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=a50lEwVb;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id y8so8056892plp.8
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Dec 2020 22:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bDmyecUK7PFz9++WjMZwWisIZNytFEpCidTtHAk4Zio=;
        b=a50lEwVbFl1gdkeAt0R1pvAdc+lQVEEe+le75ckJwDa7me1k6V1X6PsOPdb5LJY0FS
         2rqIuTgC6LpsKMoouKGKtpFIUjqmBJSgpk/F7pGQ5vQ9KLBljjohp7gT7iqBa53/Vzet
         8g5yOvEHjxfJn4F02vng5iJuHSSFD+tf4p2qIj2qdRPX6afgX23IciKU3QH0r5g8qe9g
         EPv+GkPiUxq06hpoXDosTxrX4vj4OaXfxFL2TqCwP8acAs92ALXrr7m9kjZms5Nji9Gc
         cORLPHFQLkTIC+Sv9xCZhLy0e7RxlYv+z5O1LW382naGHLabvoivk4fbW13xBG5SBw4L
         bVnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bDmyecUK7PFz9++WjMZwWisIZNytFEpCidTtHAk4Zio=;
        b=jON+E30GRG02qa16pJqOPpPRnYMlNdebT6Y1Rzxy1cEq+kRsnYLs32kgK/8C/NdY9J
         elIk3qsZ4brhxVz2rCwBtfV1WV3UN+jy3LNOWML5EhjVhzUM47k4ONSAzMTvyD683WTE
         vG/kBB4L70oIuGUiYIrYGHXq18NYF5OwVdArausyQa5MOKO9I3UGWO+LL5xKlwWLe1hX
         Iex96FaUNXYWRCjP/JlQ99F+uMv4yG4v0r1vw3/laVH37Av2iPNXfPpsR3bIIbmsjaeM
         4fFBHxThVn6csOqFs8/kdr1j2+YohANQEXL+lFdUw+KOTkK7m7bA9gMEEvyTg+ioVZkf
         8o1w==
X-Gm-Message-State: AOAM532FKXzEMv7wE9GPo98W1PQvowcnv+hVLK+FIclaGT6isX56J7A6
	c9LqsiZJIYsCLqX1H9Bqo2IDPwndUEA2OQ==
X-Google-Smtp-Source: ABdhPJwwtT0ST6SUIikivjwjnFa7ItK8ktfMijRDTd1GBcPzJzvkzRX3KUExX6LVsQ6d9ArguC9WJQ==
X-Received: by 2002:a17:90a:6842:: with SMTP id e2mr23751498pjm.190.1607925697306;
        Sun, 13 Dec 2020 22:01:37 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::64a3])
        by smtp.gmail.com with ESMTPSA id l13sm11663016pgq.51.2020.12.13.22.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Dec 2020 22:01:36 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 2/3] busybox-inittab: Implement SYSVINIT_ENABLED_GETTYS and USE_VT
Date: Sun, 13 Dec 2020 22:01:26 -0800
Message-Id: <20201214060127.1727-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201214060127.1727-1-raj.khem@gmail.com>
References: <20201214060127.1727-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This ensures that busybox init can generate matching tty's in inittab as
system defines, secondly resepcts USE_VT for creating virtual ttys

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../busybox/busybox-inittab_1.32.0.bb         | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/meta/recipes-core/busybox/busybox-inittab_1.32.0.bb b/meta/recipes-core/busybox/busybox-inittab_1.32.0.bb
index 61fb8cbad1..8d0f419f4d 100644
--- a/meta/recipes-core/busybox/busybox-inittab_1.32.0.bb
+++ b/meta/recipes-core/busybox/busybox-inittab_1.32.0.bb
@@ -23,6 +23,53 @@ do_install() {
 		id=`echo ${i} | sed -e 's/^.*;//' -e 's/;.*//'`
 		echo "$id::respawn:${base_sbindir}/getty ${j}" >> ${D}${sysconfdir}/inittab
 	done
+	if [ "${USE_VT}" = "1" ]; then
+		cat <<EOF >>${D}${sysconfdir}/inittab
+# ${base_sbindir}/getty invocations for the runlevels.
+#
+# The "id" field MUST be the same as the last
+# characters of the device (after "tty").
+#
+# Format:
+#  <id>:<runlevels>:<action>:<process>
+#
+
+EOF
+
+		for n in ${SYSVINIT_ENABLED_GETTYS}
+		do
+			echo "tty$n:12345:respawn:${base_sbindir}/getty 38400 tty$n" >> ${D}${sysconfdir}/inittab
+		done
+		echo "" >> ${D}${sysconfdir}/inittab
+	fi
+
+}
+
+pkg_postinst_${PN} () {
+# run this on host and on target
+if [ "${SERIAL_CONSOLES_CHECK}" = "" ]; then
+       exit 0
+fi
+}
+
+pkg_postinst_ontarget_${PN} () {
+# run this on the target
+if [ -e /proc/consoles ]; then
+        tmp="${SERIAL_CONSOLES_CHECK}"
+        for i in $tmp
+        do
+                j=`echo ${i} | sed -e s/^.*\;//g -e s/\:.*//g`
+                k=`echo ${i} | sed s/^.*\://g`
+                if [ -z "`grep ${j} /proc/consoles`" ]; then
+                        if [ -z "${k}" ] || [ -z "`grep ${k} /proc/consoles`" ] || [ ! -e /dev/${j} ]; then
+                                sed -i -e /^.*${j}\ /d -e /^.*${j}$/d /etc/inittab
+                        fi
+                fi
+        done
+        kill -HUP 1
+else
+        exit 1
+fi
 }
 
 # SERIAL_CONSOLES is generally defined by the MACHINE .conf.
@@ -33,3 +80,6 @@ FILES_${PN} = "${sysconfdir}/inittab"
 CONFFILES_${PN} = "${sysconfdir}/inittab"
 
 RCONFLICTS_${PN} = "sysvinit-inittab"
+
+USE_VT ?= "1"
+SYSVINIT_ENABLED_GETTYS ?= "1"
-- 
2.29.2

