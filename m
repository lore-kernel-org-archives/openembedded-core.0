Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
 by mx.groups.io with SMTP id smtpd.web08.12162.1608823873622414987
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Dec 2020 07:31:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Z9vBeLR5;
 spf=pass (domain: gmail.com, ip: 209.85.166.53, mailfrom: twoerner@gmail.com)
Received: by mail-io1-f53.google.com with SMTP id w18so2326730iot.0
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Dec 2020 07:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=1XEhCJFMT9r0pFRZ409OXEU9cJVx3kp6UHoRtM6if90=;
        b=Z9vBeLR5QFp7Xan4elYB9Y7LU8kHFxz4DB7LMzp/Yh636v/spWaJyLx4sFub7nPH4i
         YzezAv+r/+Q0gPVVd9QkEowSdIshQ1W8S8drKtvtmhCOKxPbFEBrMepmjifXN368ZWs6
         9/OqaEvlsR0bWSJw6BuiJZHqFod+JHOu2PyHY2i1vITHz6UvyIPq0E2wsWB2fqnTluXu
         HB+F51bDvO2gx1Ar0XPvgv9NrJEroNXB90dZKjplQ4f741V30tatzHSf5HCjikZsICW6
         kQKj+0A5eSCJVznDZssVHJnIBT0VTrGhN12EkqTQgU5qfp9bNJl7UqUBvlhwpCRYScAM
         9o4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1XEhCJFMT9r0pFRZ409OXEU9cJVx3kp6UHoRtM6if90=;
        b=cZnNQsPEUPc0YNbqUK36SjkIfucNp6CxjEFnLtm9W0iN1ioCvHdGc3jxS6/87xm1XU
         FyFUxfalnei9JSx0s4OacgsI4K7sBDqNlTsBTDooho9cz/AYormrsqJ2cC/WFE05Xrqe
         ZnpVXCdNGxzQ8nEBESHhu2lyEnKF+SRHXmet1jSXs00ruNbIRGhNYpAWSf0YIozyk5dn
         ZYwR1JrK3oxWYTzW1z+00Yrm8HIdfl3kIAyLue+lPG/I0shfSCN4ZxS0/iuQbVDFz+VB
         EOiPWDmOqQ+PmZb1soZ9KQ0uPo5qKJsn6slnM1W8AjDdxHwsh/TEQRVU3X8u6Cn28jIP
         hR+g==
X-Gm-Message-State: AOAM530uFLhdJ+/FQbCjMRwZmx+oOfWqdvSLw8JeR5Fd+ZS4OI19XAvK
	yZ/EIwBNdJ83OLleVTWjL55dxKA4ZbMNMQ==
X-Google-Smtp-Source: ABdhPJzZwdzNWFZbyepIWEOYIpdxL5TIGzi/RxBXNddHpoDfm+BgUBfKH769sZNcDBA0VoSZDAy9xQ==
X-Received: by 2002:a6b:6f17:: with SMTP id k23mr26230802ioc.147.1608823872799;
        Thu, 24 Dec 2020 07:31:12 -0800 (PST)
Return-Path: <twoerner@gmail.com>
Received: from localhost.localdomain ([206.248.190.95])
        by smtp.gmail.com with ESMTPSA id f6sm26448064ioh.2.2020.12.24.07.31.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Dec 2020 07:31:12 -0800 (PST)
From: "Trevor Woerner" <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [master-next][PATCH 3/3] psplash (sysvinit): add textual updates
Date: Thu, 24 Dec 2020 10:31:05 -0500
Message-Id: <20201224153105.21211-3-twoerner@gmail.com>
X-Mailer: git-send-email 2.30.0.rc0
In-Reply-To: <20201224153105.21211-1-twoerner@gmail.com>
References: <20201224153105.21211-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The psplash program contains a hidden text box immediately above the
progress bar. Any text sent via a "MSG" command through psplash's fifo will
be displayed, centred, above the progress bar. Add the ability to show
which startup script is currently running, in sync with updates to the
progress bar. If a startup script takes a bit longer than others and the
progress bar stops momentarily, this allows the user to know which script
is responsible.

This feature is added with a knob, default off, for enabling or disabling
this feature. The knob is in the form of a PACKAGECONFIG against the
sysvinit recipe: psplash-text-updates

NOTE: this knob can be changed in the filesystem at runtime by editing
/etc/default/rcS regardless of how it is set in the build.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/recipes-core/sysvinit/sysvinit/rc          | 3 +++
 meta/recipes-core/sysvinit/sysvinit/rcS-default | 2 ++
 meta/recipes-core/sysvinit/sysvinit_2.97.bb     | 7 ++++++-
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit/rc b/meta/recipes-core/sysvinit/sysvinit/rc
index 8e76f987c1..41196ec90b 100755
--- a/meta/recipes-core/sysvinit/sysvinit/rc
+++ b/meta/recipes-core/sysvinit/sysvinit/rc
@@ -160,6 +160,9 @@ startup() {
 			#
 			[ -f $previous_start ] && [ ! -f $stop ] && continue
 		fi
+		if [ x"${PSPLASH_TEXT_UPDATES}" = x"yes" ]; then
+			psplash-write "MSG $(basename $i .sh | cut -c 4-)" || true
+		fi
 		case "$runlevel" in
 			0|6)
 				startup $i stop
diff --git a/meta/recipes-core/sysvinit/sysvinit/rcS-default b/meta/recipes-core/sysvinit/sysvinit/rcS-default
index 76af22b359..f7c4a2f841 100644
--- a/meta/recipes-core/sysvinit/sysvinit/rcS-default
+++ b/meta/recipes-core/sysvinit/sysvinit/rcS-default
@@ -32,3 +32,5 @@ ROOTFS_READ_ONLY=no
 INIT_SYSTEM=sysvinit
 # set the psplash fifo directory
 PSPLASH_FIFO_DIR=/mnt
+# psplash textual updates knob
+PSPLASH_TEXT_UPDATES=#PSPLASH_TEXT#
diff --git a/meta/recipes-core/sysvinit/sysvinit_2.97.bb b/meta/recipes-core/sysvinit/sysvinit_2.97.bb
index 98916f7f19..03099bf157 100644
--- a/meta/recipes-core/sysvinit/sysvinit_2.97.bb
+++ b/meta/recipes-core/sysvinit/sysvinit_2.97.bb
@@ -29,6 +29,8 @@ inherit update-alternatives features_check
 DEPENDS_append = " update-rc.d-native base-passwd virtual/crypt"
 do_package_setscene[depends] = "${MLPREFIX}base-passwd:do_populate_sysroot"
 
+PACKAGECONFIG[psplash-text-updates] = ",,"
+
 REQUIRED_DISTRO_FEATURES = "sysvinit"
 
 ALTERNATIVE_${PN} = "init mountpoint halt reboot runlevel shutdown poweroff last lastb mesg utmpdump wall"
@@ -91,7 +93,10 @@ do_install () {
 		install -d ${D}${sysconfdir}/rc$level.d
 	done
 
-	install -m 0644    ${WORKDIR}/rcS-default	${D}${sysconfdir}/default/rcS
+	sed -e \
+		's:#PSPLASH_TEXT#:${@bb.utils.contains("PACKAGECONFIG","psplash-text-updates","yes","no", d)}:g' \
+		${WORKDIR}/rcS-default > ${D}${sysconfdir}/default/rcS
+	chmod 0644 ${D}${sysconfdir}/default/rcS
 	install -m 0755    ${WORKDIR}/rc		${D}${sysconfdir}/init.d
 	install -m 0755    ${WORKDIR}/rcS		${D}${sysconfdir}/init.d
 	install -m 0755    ${WORKDIR}/bootlogd.init     ${D}${sysconfdir}/init.d/bootlogd
-- 
2.30.0.rc0

