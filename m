Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
 by mx.groups.io with SMTP id smtpd.web08.8091.1608795844912512361
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Dec 2020 23:44:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cgKVNpxc;
 spf=pass (domain: gmail.com, ip: 209.85.166.51, mailfrom: twoerner@gmail.com)
Received: by mail-io1-f51.google.com with SMTP id d9so1400710iob.6
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Dec 2020 23:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=jF5xwTZCD0PBFmyHKEb0wUf3zii4QKRRIjM/auiEJ1I=;
        b=cgKVNpxcx62UOkvS1edS3cJFzBWJavvbzjLYNtZzaYMC6s///fe8F6CVc1QErgGf0P
         yyq9IrfpjHmco9De8+pJK5bFlU0DXKfN46uH+16LqGJCZpK/msGj7Pge9CIkutmmdeLP
         Aa08RR56FiTZmeXKGOkjM5hGseA5sh+h3ZV2VWivdqxfMfOLYhsHF+ICCX+euiON7xMm
         8Zf7MCewy5eIbjTwi+oTkOhAHUUYOJmn4gnmpa5jDUBIM5lGb8ybns21ZZipKW5Q20p2
         ToHIK+gjO0REWnOJjTrYpjHSJO82CtyhvpEpMEhVGRZcSiq8GvCoYBIqsjVhQrg/VTVI
         8rAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jF5xwTZCD0PBFmyHKEb0wUf3zii4QKRRIjM/auiEJ1I=;
        b=IhgctOreoC9hpvSPl3/THqnpuzKWenB/6Ef3tRu+oE91LvPuoA+cGj4giwRk1EeLmT
         hOfPVqO2vA3kja31TDwj4N5Aub2ats3RXcggXcWnU2BUvDeuHPHTvljcG/NHSvHvq4rh
         dav2+uBRY5mAq/RI4Y1qd6rNPSODOOZ66LnTbOT0OOzShYdkjkKoq5t6wEZkIW5aff4K
         knTyu2MflyTqyjmvg5gTAE/KVc8FpP+7WOwrFLvk8ZFPUTEgxVduC8gbIgUQcthQ5f1D
         9ik5fMKTJZ8iUZ7YwmD1L1ebUHmLOtZr3WeQ8xMDnmot+zff3/BvT/crCGxg/FSw8Pir
         qfQQ==
X-Gm-Message-State: AOAM533n8Fq95Rwb/yafRtFAc13NLAGBsNqMowd3myVI+BMI+Ob7cDkb
	SRQ28P984N9bqeh7dnmN/Zgyvy0pFk2F3Q==
X-Google-Smtp-Source: ABdhPJxBx5nZy7/h7mFAr/F7URMsbutl+PdEh50JFMslsEebetPxvr7jbRO9DBMaZe1rD1PlB13+Ew==
X-Received: by 2002:a6b:fd03:: with SMTP id c3mr24541952ioi.64.1608795844091;
        Wed, 23 Dec 2020 23:44:04 -0800 (PST)
Return-Path: <twoerner@gmail.com>
Received: from localhost.localdomain ([206.248.190.95])
        by smtp.gmail.com with ESMTPSA id e1sm26181020iod.17.2020.12.23.23.44.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Dec 2020 23:44:03 -0800 (PST)
From: "Trevor Woerner" <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [master-next][PATCH 3/3] psplash sysvinit: add knob for verbose progress
Date: Thu, 24 Dec 2020 02:43:54 -0500
Message-Id: <20201224074354.18751-3-twoerner@gmail.com>
X-Mailer: git-send-email 2.30.0.rc0
In-Reply-To: <20201224074354.18751-1-twoerner@gmail.com>
References: <20201224074354.18751-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, under sysvinit, the psplash screen shows a graphic, a progress
bar, and a textual message just above the progress bar showing the user which
module is currently running during both bootup and shutdown. This way they can
see, roughly, how much time each module takes to run.

Add a knob, default off, so the user can choose whether or not to display the
textual message indicating the currently-running module.

This knob is added as a PACKAGECONFIG to sysvinit:
	verbose-psplash

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/recipes-core/sysvinit/sysvinit/rc          | 4 +++-
 meta/recipes-core/sysvinit/sysvinit/rcS-default | 2 ++
 meta/recipes-core/sysvinit/sysvinit_2.97.bb     | 5 ++++-
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit/rc b/meta/recipes-core/sysvinit/sysvinit/rc
index c4a2f50f88..53a5ce31d2 100755
--- a/meta/recipes-core/sysvinit/sysvinit/rc
+++ b/meta/recipes-core/sysvinit/sysvinit/rc
@@ -160,7 +160,9 @@ startup() {
 			#
 			[ -f $previous_start ] && [ ! -f $stop ] && continue
 		fi
-		psplash-write "MSG $(basename $i .sh | cut -c 4-)" || true
+		if [ x"${PSPLASH_VERBOSITY}" = x"yes" ]; then
+			psplash-write "MSG $(basename $i .sh | cut -c 4-)" || true
+		fi
 		case "$runlevel" in
 			0|6)
 				startup $i stop
diff --git a/meta/recipes-core/sysvinit/sysvinit/rcS-default b/meta/recipes-core/sysvinit/sysvinit/rcS-default
index e4e5782de5..d3a0f32d2a 100644
--- a/meta/recipes-core/sysvinit/sysvinit/rcS-default
+++ b/meta/recipes-core/sysvinit/sysvinit/rcS-default
@@ -32,3 +32,5 @@ ROOTFS_READ_ONLY=no
 INIT_SYSTEM=sysvinit
 # set psplash fifo directory
 PSPLASH_FIFO_DIR=/mnt
+# set the psplash verbosity (sysvinit)
+PSPLASH_VERBOSITY=#PSPLASH_V#
diff --git a/meta/recipes-core/sysvinit/sysvinit_2.97.bb b/meta/recipes-core/sysvinit/sysvinit_2.97.bb
index 98916f7f19..562b20327e 100644
--- a/meta/recipes-core/sysvinit/sysvinit_2.97.bb
+++ b/meta/recipes-core/sysvinit/sysvinit_2.97.bb
@@ -25,6 +25,8 @@ SRC_URI[sha256sum] = "2d5996857519bfd8634d2e1debabb3238fb38440f65fbfdc46420ee8bd
 
 S = "${WORKDIR}/sysvinit-${PV}"
 
+PACKAGECONFIG[verbose-psplash] = ",,"
+
 inherit update-alternatives features_check
 DEPENDS_append = " update-rc.d-native base-passwd virtual/crypt"
 do_package_setscene[depends] = "${MLPREFIX}base-passwd:do_populate_sysroot"
@@ -91,7 +93,8 @@ do_install () {
 		install -d ${D}${sysconfdir}/rc$level.d
 	done
 
-	install -m 0644    ${WORKDIR}/rcS-default	${D}${sysconfdir}/default/rcS
+	sed -e 's:#PSPLASH_V#:${@bb.utils.contains("PACKAGECONFIG","verbose-psplash","yes","no", d)}:g' ${WORKDIR}/rcS-default > ${D}${sysconfdir}/default/rcS
+	chmod 0644 ${D}${sysconfdir}/default/rcS
 	install -m 0755    ${WORKDIR}/rc		${D}${sysconfdir}/init.d
 	install -m 0755    ${WORKDIR}/rcS		${D}${sysconfdir}/init.d
 	install -m 0755    ${WORKDIR}/bootlogd.init     ${D}${sysconfdir}/init.d/bootlogd
-- 
2.30.0.rc0

