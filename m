Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
	[209.85.208.181])
	by mail.openembedded.org (Postfix) with ESMTP id E28977C603
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Jul 2019 15:58:27 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id h10so33554110ljg.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Jul 2019 08:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=VpKxMPY5zgMKS7luS5gW0sl/ZGaBDwh00uw9Un9RwGU=;
	b=I7lFwhK5IKMz4wgvTlJqJyFW/K3hs8VH/C79R2i7ExRyxgQyyGK0T7rPSEZV57Dm6m
	10tS2dBxvMH7JFlRDzzpfwW19LH8hLQiPcvNfbi39Nv1qgRhn1z/CvakoJ81v9Uhi97A
	upZ/1qlFJuK4iYvI6B/UCNMXZ7hr+pyTxHHpAGYTQ2VGSOTDlZx+ya+SZWBGLhbK/NBZ
	OYKGruHCMV3phjuopTw/M3xc/HpgbPV3HxczAQRZwUJ35b/k+IjYz44CVjQL+Ug8pp5j
	SSMSPYhHVEG4Q9snUDIvtH+Ib85vxDy6sK0U33PEeeP/SSQmpgPSYvILanC8tPbB7fwo
	vEHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=VpKxMPY5zgMKS7luS5gW0sl/ZGaBDwh00uw9Un9RwGU=;
	b=dktaG7+Nrp1166YmuPTLRXfcSrQz4iG6w1TdChYkZ66ocPF//C+QMYMc4TtNFa1ziX
	61jqZkdnTgEsvnm8DWwfWCRFMAz/sDma7ArK0Lyhvy8b2GJnl902We/0YDpFZQtQ4hEh
	l0I+/jODgXPpwsNqbz00yu3jsYxgJ729wvqJDFkRQtyt7VgGQ4vjiqKmSbb6L3f76E81
	jKFpLPMhIf7wPuCN7utfJmaR64HAs8UrHNie5ZO+kgrfZLdEZAxOvvPJwDaxwwtZH0XT
	kLaISCpnwZ2yZjON6H9s9Da9dmdY4modVzvw6U8FgJO07A2ACjVL0a6Cd2h81ZfRldhq
	szcw==
X-Gm-Message-State: APjAAAV0nGJ7TmRtgdltIf79fjsqAW38TAJy16XfpMknbLuRbDNeqCbR
	N2gEcQ0wcBvECMKI8KLZTbcxFHKJ
X-Google-Smtp-Source: APXvYqzrbaHGnmURlxxZHqfi0Fd/fPSFg7fJOw5bQiHKo0kfKGhai0tByc135wgYWG/REpnYmMjhGA==
X-Received: by 2002:a2e:86c3:: with SMTP id n3mr31879264ljj.129.1563638308045; 
	Sat, 20 Jul 2019 08:58:28 -0700 (PDT)
Received: from lund.luxoft.com (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	d21sm5167446lfc.73.2019.07.20.08.58.26
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 20 Jul 2019 08:58:27 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
X-Google-Original-From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 20 Jul 2019 17:57:50 +0200
Message-Id: <20190720155750.28692-1-oleksandr.kravchuk@pelagicore.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
Subject: [PATCH] udev-extraconf: do not mount swap partitions
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 20 Jul 2019 15:58:28 -0000

Swap is a special filesystem that cannot be mounted, so do not try to,
otherwise we will have service that tries and fails to mount it with
the following error:

systemd[1]: Mounting /run/media/nvme0n1p3...
mount[1229]: mount: /run/media/nvme0n1p3: unknown filesystem type 'swap'.

Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
---
 meta/recipes-core/udev/udev-extraconf/mount.sh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/udev/udev-extraconf/mount.sh b/meta/recipes-core/udev/udev-extraconf/mount.sh
index 3ee67b1318..79eb0145c2 100644
--- a/meta/recipes-core/udev/udev-extraconf/mount.sh
+++ b/meta/recipes-core/udev/udev-extraconf/mount.sh
@@ -57,6 +57,8 @@ automount_systemd() {
     vfat|fat)
         MOUNT="$MOUNT -o umask=007,gid=`awk -F':' '/^disk/{print $3}' /etc/group`"
         ;;
+    swap)
+        return ;;
     # TODO
     *)
         ;;
@@ -98,6 +100,8 @@ automount() {
 	vfat|fat)
 		MOUNT="$MOUNT -o umask=007,gid=`awk -F':' '/^disk/{print $3}' /etc/group`"
 		;;
+	swap)
+		return ;;
 	# TODO
 	*)
 		;;
-- 
2.17.1


