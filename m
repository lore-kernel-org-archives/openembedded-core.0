Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F8B1C4332F
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 11:50:40 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.6288.1639137039423485852
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 03:50:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PUm7Ehrw;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 137so6612173wma.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 03:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=//yyx2bjYorCsFwWUhzI7/bdTFJUsYUkWr7HK6+G9fI=;
        b=PUm7EhrwqPNbgv5KHUk+1/psRnp/j5fMVZlfqZdtrV6vgR4rxbtl2OiBIzJ9EP8GSI
         0rjMjx/ZYPje0LW7dpxQZY1Afs9Ei3qF6GWu/YQ/2+TTG8ZEGI6YPbIrcfRSz2Aaiddk
         jEZK6HgugFx43s1NnV0FcmKVsCd9r4wR0cqZDzYJopv2v+q7gvwafr0UX3N+UevWWHhT
         QNXuMRrXCbWNMP/otFdefm/chtvg6jzdLERBzZCx43yPf69CMpCc91yVUp5lOWkNjhEy
         AnhZGUMozSfOo3vPsSs0dJF0STLrYo5yBgRJ1NyDr/dBqR1XpWYAgAhHSxAOvkaI7sQR
         whgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=//yyx2bjYorCsFwWUhzI7/bdTFJUsYUkWr7HK6+G9fI=;
        b=VkfWQOTB8AGU+nBrHlSlC8wt0uQEvd4/E2QHe9UphMb0snwPPz2uCsZI8rB6zvaRr0
         RRQu8PJtvgJor/ihBuKFSyM1Si35y86cShmWbWSLvaZ4rJxNsAWiAyNHvVTaGW6nFBte
         PyXchFSOqWU+WkK7j5mhD+E/a7GwTS3j4wQsqVhZQAQaDtKu1N/ewDspzLUpZwy/QIBg
         NYr0PK0UdECcc2AQ1MiFIBTliOyR/2EA/E9kKZvN2SCsVYp4LWIkIHzdsMfwRfYoMsdh
         IqZO5hprxDvqFYS+QrQf4Dz9xKoDvnm/o4W5eWWRHZ3pTyumaaQcpgjtPETxNTFpxLPG
         /JtQ==
X-Gm-Message-State: AOAM532m4b25klNDg6JW/de8ElYacr8LfwUkOFY+Sd9hESNUTUrT6QFb
	kU9L+oPN+CPlP6xIZ+IIi5B7yaegOq+yBg==
X-Google-Smtp-Source: 
 ABdhPJzh0V1738/Qz5B8ofUcZkopDAmJZdL8/A+uUhGgDR09HR+aQqy5vxgeaOqd4H49no8/MxxpnQ==
X-Received: by 2002:a05:600c:34c2:: with SMTP id
 d2mr16576271wmq.102.1639137037727;
        Fri, 10 Dec 2021 03:50:37 -0800 (PST)
Received: from slackware.local
 (dslb-002-205-007-123.002.205.pools.vodafone-ip.de. [2.205.7.123])
        by smtp.gmail.com with ESMTPSA id
 y6sm11496662wma.37.2021.12.10.03.50.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 03:50:37 -0800 (PST)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 8/8] overlayfs: move templates to files directory
Date: Fri, 10 Dec 2021 12:50:27 +0100
Message-Id: 
 <2bf815fb272d04fd82965e014d69504ef52cfcad.1639136706.git.uvv.mail@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1639136706.git.uvv.mail@gmail.com>
References: <cover.1639136706.git.uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Dec 2021 11:50:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159506

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 meta/classes/overlayfs.bbclass               | 52 ++++----------------
 meta/files/overlayfs-all-overlays.service.in | 12 +++++
 meta/files/overlayfs-create-dirs.service.in  | 14 ++++++
 meta/files/overlayfs-unit.mount.in           | 13 +++++
 4 files changed, 49 insertions(+), 42 deletions(-)
 create mode 100644 meta/files/overlayfs-all-overlays.service.in
 create mode 100644 meta/files/overlayfs-create-dirs.service.in
 create mode 100644 meta/files/overlayfs-unit.mount.in

diff --git a/meta/classes/overlayfs.bbclass b/meta/classes/overlayfs.bbclass
index f1b8086ea8..4a860f7308 100644
--- a/meta/classes/overlayfs.bbclass
+++ b/meta/classes/overlayfs.bbclass
@@ -37,51 +37,19 @@ REQUIRED_DISTRO_FEATURES += "systemd overlayfs"
 
 inherit systemd features_check
 
+OVERLAYFS_CREATE_DIRS_TEMPLATE ??= "${COREBASE}/meta/files/overlayfs-create-dirs.service.in"
+OVERLAYFS_MOUNT_UNIT_TEMPLATE ??= "${COREBASE}/meta/files/overlayfs-unit.mount.in"
+OVERLAYFS_ALL_OVERLAYS_TEMPLATE ??= "${COREBASE}/meta/files/overlayfs-all-overlays.service.in"
+
 python do_create_overlayfs_units() {
     from oe.overlayfs import mountUnitName
 
-    CreateDirsUnitTemplate = """[Unit]
-Description=Overlayfs directories setup
-Requires={DATA_MOUNT_UNIT}
-After={DATA_MOUNT_UNIT}
-DefaultDependencies=no
-
-[Service]
-Type=oneshot
-ExecStart=mkdir -p {DATA_MOUNT_POINT}/workdir{LOWERDIR} && mkdir -p {DATA_MOUNT_POINT}/upper{LOWERDIR}
-RemainAfterExit=true
-StandardOutput=journal
-
-[Install]
-WantedBy=multi-user.target
-"""
-    MountUnitTemplate = """[Unit]
-Description=Overlayfs mount unit
-Requires={CREATE_DIRS_SERVICE}
-After={CREATE_DIRS_SERVICE}
-
-[Mount]
-What=overlay
-Where={LOWERDIR}
-Type=overlay
-Options=lowerdir={LOWERDIR},upperdir={DATA_MOUNT_POINT}/upper{LOWERDIR},workdir={DATA_MOUNT_POINT}/workdir{LOWERDIR}
-
-[Install]
-WantedBy=multi-user.target
-"""
-    AllOverlaysTemplate = """[Unit]
-Description=Groups all overlays required by {PN} in one unit
-After={ALL_OVERLAYFS_UNITS}
-Requires={ALL_OVERLAYFS_UNITS}
-
-[Service]
-Type=oneshot
-ExecStart=/bin/true
-RemainAfterExit=true
-
-[Install]
-WantedBy=local-fs.target
-"""
+    with open(d.getVar("OVERLAYFS_CREATE_DIRS_TEMPLATE"), "r") as f:
+        CreateDirsUnitTemplate = f.read()
+    with open(d.getVar("OVERLAYFS_MOUNT_UNIT_TEMPLATE"), "r") as f:
+        MountUnitTemplate = f.read()
+    with open(d.getVar("OVERLAYFS_ALL_OVERLAYS_TEMPLATE"), "r") as f:
+        AllOverlaysTemplate = f.read()
 
     def prepareUnits(data, lower):
         from oe.overlayfs import helperUnitName
diff --git a/meta/files/overlayfs-all-overlays.service.in b/meta/files/overlayfs-all-overlays.service.in
new file mode 100644
index 0000000000..74ee4e90ae
--- /dev/null
+++ b/meta/files/overlayfs-all-overlays.service.in
@@ -0,0 +1,12 @@
+[Unit]
+Description=Groups all overlays required by {PN} in one unit
+After={ALL_OVERLAYFS_UNITS}
+Requires={ALL_OVERLAYFS_UNITS}
+
+[Service]
+Type=oneshot
+ExecStart=/bin/true
+RemainAfterExit=true
+
+[Install]
+WantedBy=local-fs.target
diff --git a/meta/files/overlayfs-create-dirs.service.in b/meta/files/overlayfs-create-dirs.service.in
new file mode 100644
index 0000000000..17204145f2
--- /dev/null
+++ b/meta/files/overlayfs-create-dirs.service.in
@@ -0,0 +1,14 @@
+[Unit]
+Description=Overlayfs directories setup
+Requires={DATA_MOUNT_UNIT}
+After={DATA_MOUNT_UNIT}
+DefaultDependencies=no
+
+[Service]
+Type=oneshot
+ExecStart=mkdir -p {DATA_MOUNT_POINT}/workdir{LOWERDIR} && mkdir -p {DATA_MOUNT_POINT}/upper{LOWERDIR}
+RemainAfterExit=true
+StandardOutput=journal
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta/files/overlayfs-unit.mount.in b/meta/files/overlayfs-unit.mount.in
new file mode 100644
index 0000000000..1d33b7e39c
--- /dev/null
+++ b/meta/files/overlayfs-unit.mount.in
@@ -0,0 +1,13 @@
+[Unit]
+Description=Overlayfs mount unit
+Requires={CREATE_DIRS_SERVICE}
+After={CREATE_DIRS_SERVICE}
+
+[Mount]
+What=overlay
+Where={LOWERDIR}
+Type=overlay
+Options=lowerdir={LOWERDIR},upperdir={DATA_MOUNT_POINT}/upper{LOWERDIR},workdir={DATA_MOUNT_POINT}/workdir{LOWERDIR}
+
+[Install]
+WantedBy=multi-user.target
-- 
2.28.0


