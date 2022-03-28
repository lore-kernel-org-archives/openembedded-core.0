Return-Path: <luca.boccassi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A992C433F5
	for <webhook@archiver.kernel.org>; Mon, 28 Mar 2022 15:27:00 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web08.12441.1648481219423490450
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 08:26:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=X8Y05Hsy;
 spf=pass (domain: gmail.com, ip: 209.85.218.52,
 mailfrom: luca.boccassi@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id j15so29405476eje.9
        for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 08:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cdG48/Uo2bc6qIIoclXya/7+FMMZJoTonbweDCKONG0=;
        b=X8Y05Hsy5VwCDoZRIKdqVYeLUQ83H+UvDbe75QOZHMKNDueiUtq3B2XnZ0HQFy/Jhk
         EbAmio7bUbiD7BQIvPoZzra+sdtxpwXsFuOyzB7ncSbRoo8gIZ9IcteRHvB9xEZO2WgU
         Tiy4nwE0Tcwx4FfsJrxugGrjI+3enb+mtsBKooZqbkHXJ06c/jewJBkF3zJs5zzQwZuB
         QAMAXPULD2IBuGXqTsMbHY6vLRQJAsvjn3nEtSxeZNYf52iO1+9nYRfclHMuKUt25pKg
         HT3c3bJgtEb5ichxn7fq6XW/EO3c8/VYK8gTsTeoSb5+CVi8mo6aD2rFQZpVnx1EHpSZ
         U0XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cdG48/Uo2bc6qIIoclXya/7+FMMZJoTonbweDCKONG0=;
        b=WeEw0jSSteLl0aoaZF6jIJdtxoWXjvk8V+MUUqGU4oUOAXlc+KNqgUFtgLVNnjVxv6
         rY3nfPktSp954khObK2JNvgcOSp5BaitGt63L/GoDufPhHtqMwHNn3xx5iyfFwTsbO8z
         M3tidP705AknC37wgP4lBxN8woUJqMgAKvWkZcZYVKtOYDvkyZtkfEGKHQeYvxToNede
         s4NJ6BZIStKrjjZ9vDRNFJXB8J+C2vZx+9gLnUCw/ZuhF0nPdfEV59f11UQWVbYqYa2L
         L0YqBuanNrHYfc9uAG6ANdiqAzmamXjDlRgQc0CJEI0AuS0MgUrE0quE+0b39YvnXH3U
         C7Pg==
X-Gm-Message-State: AOAM531PDzOeJKsIVF0XdNT5kWPrsJoIYy/4/4rAcTBabJK0tuy40jFq
	1ERP5ov/43u9fjXhlY1L/2DOh4gKvgP+UA==
X-Google-Smtp-Source: 
 ABdhPJwjHIxZSkt2068p1eEOeJGIqWFS4NGoZuAHuMJpxFIO399VFBG3sMc2VeuS2ughwpPohbitfA==
X-Received: by 2002:a17:907:94ca:b0:6da:b785:f067 with SMTP id
 dn10-20020a17090794ca00b006dab785f067mr29031680ejc.654.1648481217402;
        Mon, 28 Mar 2022 08:26:57 -0700 (PDT)
Received: from localhost ([137.220.125.106])
        by smtp.gmail.com with ESMTPSA id
 f3-20020a056402004300b004162aa024c0sm7080002edu.76.2022.03.28.08.26.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Mar 2022 08:26:56 -0700 (PDT)
From: luca.boccassi@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] volatile-binds: add recipe variable to allow disabling
 OverlayFS
Date: Mon, 28 Mar 2022 16:26:54 +0100
Message-Id: <20220328152654.81608-1-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Mar 2022 15:27:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163710

From: Luca Boccassi <luca.boccassi@microsoft.com>

Use the new MOUNT_COPYBIND_AVOID_OVERLAYFS flag provided by mount-copybind.
When SELinux is enabled, processes accessing OverlayFS mounts will get a denial
if the process setting up the mount doesn't have all the permissions that
the accessor has.

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
 .../volatile-binds/files/volatile-binds.service.in            | 1 +
 meta/recipes-core/volatile-binds/volatile-binds.bb            | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/meta/recipes-core/volatile-binds/files/volatile-binds.service.in b/meta/recipes-core/volatile-binds/files/volatile-binds.service.in
index e2ad39f258..6612d2aae0 100644
--- a/meta/recipes-core/volatile-binds/files/volatile-binds.service.in
+++ b/meta/recipes-core/volatile-binds/files/volatile-binds.service.in
@@ -11,6 +11,7 @@ ConditionPathIsReadWrite=!@where@
 Type=oneshot
 RemainAfterExit=Yes
 TimeoutSec=0
+Environment=MOUNT_COPYBIND_AVOID_OVERLAYFS=@avoid_overlayfs@
 ExecStart=/sbin/mount-copybind @what@ @where@
 ExecStop=/bin/umount @where@
 
diff --git a/meta/recipes-core/volatile-binds/volatile-binds.bb b/meta/recipes-core/volatile-binds/volatile-binds.bb
index d5c5538cd7..3fefa9abde 100644
--- a/meta/recipes-core/volatile-binds/volatile-binds.bb
+++ b/meta/recipes-core/volatile-binds/volatile-binds.bb
@@ -37,6 +37,9 @@ SYSTEMD_SERVICE:${PN} = "${@volatile_systemd_services(d)}"
 
 FILES:${PN} += "${systemd_system_unitdir}/*.service ${servicedir}"
 
+# Set to 1 to forcibly skip OverlayFS, and default to copy+bind
+AVOID_OVERLAYFS = "0"
+
 do_compile () {
     while read spec mountpoint; do
         if [ -z "$spec" ]; then
@@ -47,6 +50,7 @@ do_compile () {
         servicefile="$(echo "$servicefile" | tr / -).service"
         sed -e "s#@what@#$spec#g; s#@where@#$mountpoint#g" \
             -e "s#@whatparent@#${spec%/*}#g; s#@whereparent@#${mountpoint%/*}#g" \
+            -e "s#@avoid_overlayfs@#${@d.getVar('AVOID_OVERLAYFS')}#g" \
             volatile-binds.service.in >$servicefile
     done <<END
 ${@d.getVar('VOLATILE_BINDS').replace("\\n", "\n")}
-- 
2.34.1


