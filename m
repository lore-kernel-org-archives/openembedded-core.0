Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web12.17615.1585329932205197231
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2020 10:25:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=srYldZd/;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id h9so12339209wrc.8
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2020 10:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ywQxCGqQjqScBdBqljUktsaQOSXKrm5OPoHKUO4jRhw=;
        b=srYldZd/jVX4ztvgFwUCfeNQmRwRhwbu5vMcJTI1VKiEAkJ+4DciP1HYTx+4MN8gJZ
         hyZZC93+3y/vyHaw45ebP47AqhJv/wpaXso6tn9xK3O/LiobR1/BU2KTXjTTnkalpZ62
         zbxug1XX/Nayz3eJGAVi3P9i2+xDVb/vXulM+Y53RxhC3LOql4CeH1iThkREJCgVxgIo
         p6HMcYPUFe63/C+Foza7ylbZgA941W7ACnLfaz/m59tVg47U+8lVk5YYDCFhxSgYVoDi
         K5K+qIWzBz0/i8S+U//Ets4gJNJkmPCb27ugC2TrLAxzHgY2sxgo9RfzJGvv/wYjkzGR
         NRqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ywQxCGqQjqScBdBqljUktsaQOSXKrm5OPoHKUO4jRhw=;
        b=Uc3KE0QgeAJ43KNUS1nFHDdryOvrZsQa4dVxWAQSk+0ERt/f45u4pnKbytpOlqrdUb
         at5O81JuZQwCnYXiJDEQBSg2mRBddcr5dPNzMnEFVwAZYu5d7ok5QpTvGDio5R6LgYHF
         1/CUEKxd4O9k83RHvv1B06C/Iswcx/rWjD+YD+LnUzjYl9OUZQrAlyc/C5k7KbRzxO7f
         HH3Ee50SxowR/SQYVlPVl+EAJ59fHXlKC1FqUUcIYmttdTgU+J5r/ZGFXZgDMNPRPnjg
         jcIbS4GXb8dbNr//LuGw440EUGdlzpKfE8Dnly9hegIqj5BbV1Jxr3Ejt4fUQOIPBUlv
         CnwA==
X-Gm-Message-State: ANhLgQ18pwJnRDY12pkkWcMlwClBvKMiJA/IpMFym3N7JxDaBqocL9tM
	wpBYuDis442l7Rc7pwDODx7qe9So
X-Google-Smtp-Source: ADFU+vvJK6qECW2DNAMXgqgcAs2uzCb5PS0B0pQCCzQ5RlPrtPfwK7i2SxtvRwNeCdCKg3l0hnUHnA==
X-Received: by 2002:adf:e345:: with SMTP id n5mr515553wrj.220.1585329930581;
        Fri, 27 Mar 2020 10:25:30 -0700 (PDT)
Return-Path: <alex.kiernan@gmail.com>
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id g186sm9281419wmg.36.2020.03.27.10.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2020 10:25:30 -0700 (PDT)
From: "Alex Kiernan" <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][RFC PATCH v3 06/13] systemd: Add PACKAGECONFIG for sysvinit
Date: Fri, 27 Mar 2020 17:25:13 +0000
Message-Id: <20200327172520.62888-7-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200327172520.62888-1-alex.kiernan@gmail.com>
References: <20200327172520.62888-1-alex.kiernan@gmail.com>

Add sysvinit PACKAGECONFIG which disables all sysvinit handling in
systemd if it isn't present.

Consolidate sysvinit handling so that when it's disabled we exclude all
sysvinit features.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

Changes in v3:
- sysvinit: remove binding to DISTRO_FEATURES

Changes in v2:
- sysvinit: moved update-rc.d RDEPENDS to PACKAGECONFIG

 meta/recipes-core/systemd/systemd_244.3.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_244.3.bb b/meta/recipes-core/systemd/systemd_244.3.bb
index bb75aa0b9b2b..65deede20042 100644
--- a/meta/recipes-core/systemd/systemd_244.3.bb
+++ b/meta/recipes-core/systemd/systemd_244.3.bb
@@ -82,6 +82,7 @@ PACKAGECONFIG ??= " \
     set-time-epoch \
     smack \
     sysusers \
+    sysvinit \
     timedated \
     timesyncd \
     utmp \
@@ -165,6 +166,7 @@ PACKAGECONFIG[seccomp] = "-Dseccomp=true,-Dseccomp=false,libseccomp"
 PACKAGECONFIG[selinux] = "-Dselinux=true,-Dselinux=false,libselinux,initscripts-sushell"
 PACKAGECONFIG[smack] = "-Dsmack=true,-Dsmack=false"
 PACKAGECONFIG[sysusers] = "-Dsysusers=true,-Dsysusers=false"
+PACKAGECONFIG[sysvinit] = "-Dsysvinit-path=${sysconfdir}/init.d -Dsysvrcnd-path=${sysconfdir},-Dsysvinit-path= -Dsysvrcnd-path=,,update-rc.d"
 # When enabled use reproducble build timestamp if set as time epoch,
 # or build time if not. When disabled, time epoch is unset.
 def build_epoch(d):
@@ -198,7 +200,6 @@ EXTRA_OEMESON += "-Dnobody-user=nobody \
                   -Dnobody-group=nobody \
                   -Drootlibdir=${rootlibdir} \
                   -Drootprefix=${rootprefix} \
-                  -Dsysvrcnd-path=${sysconfdir} \
                   -Ddefault-locale=C \
                   "
 
@@ -234,6 +235,7 @@ do_install() {
 		install -d ${D}${sysconfdir}/init.d
 		install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/systemd-udevd
 		sed -i s%@UDEVD@%${rootlibexecdir}/systemd/systemd-udevd% ${D}${sysconfdir}/init.d/systemd-udevd
+		install -Dm 0755 ${S}/src/systemctl/systemd-sysv-install.SKELETON ${D}${systemd_unitdir}/systemd-sysv-install
 	fi
 
 	chown root:systemd-journal ${D}/${localstatedir}/log/journal
@@ -273,7 +275,6 @@ do_install() {
 		sed -i -e "s%^L! /etc/resolv.conf.*$%L! /etc/resolv.conf - - - - ../run/systemd/resolve/resolv.conf%g" ${D}${exec_prefix}/lib/tmpfiles.d/etc.conf
 		ln -s ../run/systemd/resolve/resolv.conf ${D}${sysconfdir}/resolv-conf.systemd
 	fi
-	install -Dm 0755 ${S}/src/systemctl/systemd-sysv-install.SKELETON ${D}${systemd_unitdir}/systemd-sysv-install
 
 	# If polkit is setup fixup permissions and ownership
 	if ${@bb.utils.contains('PACKAGECONFIG', 'polkit', 'true', 'false', d)}; then
@@ -562,7 +563,7 @@ FILES_${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ $
 
 RDEPENDS_${PN} += "kmod dbus util-linux-mount util-linux-umount udev (= ${EXTENDPKGV}) util-linux-agetty util-linux-fsck"
 RDEPENDS_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'serial-getty-generator', '', 'systemd-serialgetty', d)}"
-RDEPENDS_${PN} += "volatile-binds update-rc.d"
+RDEPENDS_${PN} += "volatile-binds"
 
 RRECOMMENDS_${PN} += "systemd-extra-utils \
                       systemd-compat-units udev-hwdb \
-- 
2.17.1

