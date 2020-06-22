Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web11.15014.1592823509756762638
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 03:58:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=J+lDe82d;
 spf=pass (domain: gmail.com, ip: 209.85.221.66, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f66.google.com with SMTP id q2so13755090wrv.8
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2020 03:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=rQocP8QK0GYP2VNj/tTae6DLfR1ipqbsouSExmyrKc4=;
        b=J+lDe82dVuwOj9Fzwutq20hQvT5RIoSVll/2OLN1Ago7DZNdz+tx9UhiDoyk2iL08e
         YwSPqTQCcPp3+9zVyObQIGm8SNak8bBX/MXtexJqH/XdIfChmjjucwJROZIemF0ECwU5
         h0jvX4tq4xeRG1KN7n+PO6r+wm0+hcoVsqRwKieSiCzPxAJRiNrQvYvb16Aj1J9aZFug
         b5PdMW6nMRxRR34c4juW0/gA+P67WjahIaT4pNF/WhAZX0DjZ9rfe9+hU/y+xSUL0y/u
         6ZqW8SlVKMrJbhSWOKutgB+nZlaDiIT9N613tgDt0WC5hYwtOElKiOBa7iKKlogZ/moP
         n5ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=rQocP8QK0GYP2VNj/tTae6DLfR1ipqbsouSExmyrKc4=;
        b=NeDv46wHa69zC1CMBq4NU2wuGfVmmlUOIg+64ZGawV2qz9X0XXVvOWndMggEMuC2Yk
         ZF0VwZbSzIpYLz7kp3HfGE4sJgwkXLltI/zrSesAdmdV1Lre+ic2vHR4lQemg/ylWPo/
         zn5v2RiIwbDY0Yzlvz/O2K8n0h/uZOn+Barj/RxwmQDdNG0wa7yG08lKZ0mCNnO8xFlO
         5A3OpmR4vAua0dH8aG2JdMUKabzTLPj1NdYAqe9bOHdfZha1XsLaD0uqt8cumFvDm7VT
         YQXhYtcGVhKS//5DwnU6goQDfLO7ebKJ7IAdzk6ucGUByybk+TVNCEvU104ah+xrDVne
         Ithg==
X-Gm-Message-State: AOAM531xXIqKaEktdWVvdnxBW4I/H8MCf2g/QIk7Benn8Lv8t9Qrwrf8
	MTnkA9mvh3LUgjBRC+PnF8aOBzaO
X-Google-Smtp-Source: ABdhPJxYae06V4OZuvyIaUHnKKrtiOLA+cIC1KOx4+/xsH9W163bEMs+oqcQ8nHO2/2jVlzKm8KtlQ==
X-Received: by 2002:adf:f7c6:: with SMTP id a6mr11334831wrq.355.1592823507761;
        Mon, 22 Jun 2020 03:58:27 -0700 (PDT)
Return-Path: <alex.kiernan@gmail.com>
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id c2sm17977172wrv.47.2020.06.22.03.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 03:58:26 -0700 (PDT)
From: "Alex Kiernan" <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v2] rootfs-postcommands: Enable rootfs_check_host_user_contaminated
Date: Mon, 22 Jun 2020 11:57:17 +0100
Message-Id: <20200622105717.108062-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1

Generate output for each contaminated path so it's visible in the main
log file, then enable rootfs_check_host_user_contaminated by default.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

Changes in v2:
- expose each contaminated path in the main log

 meta/classes/rootfs-postcommands.bbclass | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index 2f171836fa0c..8dde15fc3407 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -37,7 +37,7 @@ POSTINST_LOGFILE ?= "${localstatedir}/log/postinstall.log"
 SYSTEMD_DEFAULT_TARGET ?= '${@bb.utils.contains("IMAGE_FEATURES", "x11-base", "graphical.target", "multi-user.target", d)}'
 ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("DISTRO_FEATURES", "systemd", "set_systemd_default_target; systemd_create_users;", "", d)}'
 
-ROOTFS_POSTPROCESS_COMMAND += 'empty_var_volatile;'
+ROOTFS_POSTPROCESS_COMMAND += 'empty_var_volatile; rootfs_check_host_user_contaminated;'
 
 # Sort the user and group entries in /etc by ID in order to make the content
 # deterministic. Package installs are not deterministic, causing the ordering
@@ -311,10 +311,9 @@ rootfs_check_host_user_contaminated () {
 	find "${IMAGE_ROOTFS}" -wholename "${IMAGE_ROOTFS}/home" -prune \
 	    -user "$HOST_USER_UID" -o -group "$HOST_USER_GID" >"$contaminated"
 
-	if [ -s "$contaminated" ]; then
-		echo "WARNING: Paths in the rootfs are owned by the same user or group as the user running bitbake. See the logfile for the specific paths."
-		cat "$contaminated" | sed "s,^,  ,"
-	fi
+	sed -e "s,${IMAGE_ROOTFS},," $contaminated | while read line; do
+		bbwarn "Path in the rootfs is owned by the same user or group as the user running bitbake:" $line
+	done
 }
 
 # Make any absolute links in a sysroot relative
-- 
2.17.1

