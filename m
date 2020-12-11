Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web08.13201.1607718421991617725
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Dec 2020 12:27:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=R3LIyHy7;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id p6so5155628plr.7
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Dec 2020 12:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bDmyecUK7PFz9++WjMZwWisIZNytFEpCidTtHAk4Zio=;
        b=R3LIyHy7TNAWe5yUppTyPC/gs5y06B3Gk27wIeCnev2CgmWB0y6l4ADNzoyIa2WILD
         uO7+ZOYRuCO0q7lXVZ91rjeySKpMZ9bQqq0pjwVLRjK/EJCvEe4qePN8e+e2LvTNDdEH
         ePJ0Kp3ucI2Uh2wsYGw1ao2/BrSIs9VH2GbzkmquYEvAxhzZXO1ruz3+EoNLz69TJQj8
         cRY37WoWzqVcVi6r8sLN8fzY+T866vnxa+fGCEk9Z5pGt1tJ5byKVu/s70fb/u82BgCT
         Y1jfMKiDjFnM2uQ6rHELrAOKxCe5C8rbMIb5Nau9gBW35uo3FiTaWl/k0lDl+DA0Gv1e
         vq3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bDmyecUK7PFz9++WjMZwWisIZNytFEpCidTtHAk4Zio=;
        b=eIMl5j7ocgm7fAWeGs52PFmlWG08ujmEiGtMB67mjqdQEn9gQahbI5fuPm0CNBF72s
         fKclFSzkQkCcDpiqU9t30j/OtYmBoHKi9jpszW8KZSbJH1laDeY7XKjtswn40OuPRy6Z
         pz2U6F4a7XMjMuVIT/J+FGARMd5TuW89UiXUdDYGCa8PJX9rlPlIEOlTLbAfjyqpm/RB
         wwotTPCPXznudpJWNWkT1qUbhNOitKhINL6vtTD0AYxrMBBhEBa3MUES5E2NRIi/9RE+
         7u6ePcYLJGOtQ9Pl4DEyIdOxjR3K+/U00kyLL/JpKv9L9LISS47ZFpjRxJ5tMXg/pnI9
         hfEg==
X-Gm-Message-State: AOAM531h98GPhXwjD//2As69g6SRC+U/mSzAyyzQ5UoMsU8NpPRtiSIy
	3/8mN83A768KtmyAa5j8CsXgC/VXmu+GzQ==
X-Google-Smtp-Source: ABdhPJwsuT3A8ORRoE4shsfj5fylaCrGkL0IIjyANIg5aTDG5PInS54l+77A1lKW1pZ60bzS4qJFSg==
X-Received: by 2002:a17:90a:4dcd:: with SMTP id r13mr14558511pjl.74.1607718421040;
        Fri, 11 Dec 2020 12:27:01 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::5bf5])
        by smtp.gmail.com with ESMTPSA id b11sm10986794pjl.41.2020.12.11.12.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Dec 2020 12:27:00 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] busybox-inittab: Implement SYSVINIT_ENABLED_GETTYS and USE_VT
Date: Fri, 11 Dec 2020 12:26:57 -0800
Message-Id: <20201211202657.1237295-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201211202657.1237295-1-raj.khem@gmail.com>
References: <20201211202657.1237295-1-raj.khem@gmail.com>
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

