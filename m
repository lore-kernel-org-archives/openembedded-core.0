Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 924FF7DBCA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 14:43:46 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id b10so1117403wmj.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 07:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=PUgMa+2zeKAP/IwdMOsiaqNTCzHpVyPbLGO8UsMFBdM=;
	b=Ul5JZisMOnJhnp4e1HcOMr/AX8pJkI6Nu6nrOHwp0aFyNtn9g4EreoEQNCFXmS++7l
	Pp+lTDXrQwGFa4lUETkcCuCfa1l9C5QLNBZc6N3nYWRhvBSgPRvNjuJsPtzHBhXADtD8
	Qz99xj9jtWN4+Yle/H/UtqR/KaEhuNW949lizk31ajpjtvEmV30QTPUYuZMuh8zy9sfr
	JHXLSkkYC1gX9WqQ416ZejmATV8r1LX0qbnZad/j2fq5d2bZC+pt3+ecw+BoJTkwS9hW
	Ft+408pX1PfcLVusJC8LSIJpMs2hsLJVUSzNhYaoeGqnyNiIN2mScA2emFdOKYMcQRYT
	DUKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=PUgMa+2zeKAP/IwdMOsiaqNTCzHpVyPbLGO8UsMFBdM=;
	b=jMzucjur0LB45qUbV8XJaWEcf/7K95f59tbEexuZJ0FYbKgSLIR212qTrGujkLsZit
	i8iHg/GNUdOmSZ8fhoEv9h8OuIdb6PF3dZI75a5U2IwxahAM70IiGrXve+WwJEAzLd2g
	VNF+X2cVdtvZD6DqxqGccV0jD2+k4adsURdAmHtxHy1zw+nmWrIAvNMnd2lJRGvl8rGP
	6m1x/lrUfQMYLdzhiypUHWvi1yyRlPkVD0IhpIu6x5SmuqcKzdQXkJOVomibSG1ZZnk1
	Ay4mS9MBcE6TOSMpjz/tjJ6a6/8kicogGZEi30OcqRkrvWmpvkAsDmpP+o+feCXCmsCb
	Ol2w==
X-Gm-Message-State: APjAAAW1x8i96zkZSnDJY1mYKcYMTSdqQrXwQJUGuoe7aowVaE2D88gi
	JhsuHeOhsk9faNscWDnPQBctNB6FUyE=
X-Google-Smtp-Source: APXvYqxCmtsSoeeILnYZofQDvJOSXi957e0h01ixbsrLXv3do0ZF56XLpiw+dSjctl45iYRekT0lqg==
X-Received: by 2002:a05:600c:203:: with SMTP id
	3mr17447183wmi.77.1556549027059; 
	Mon, 29 Apr 2019 07:43:47 -0700 (PDT)
Received: from localhost.localdomain ([89.197.133.108])
	by smtp.gmail.com with ESMTPSA id y70sm9452860wmc.8.2019.04.29.07.43.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Apr 2019 07:43:46 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Apr 2019 15:43:25 +0100
Message-Id: <20190429144325.63744-7-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190429144325.63744-1-alex.kiernan@gmail.com>
References: <20190429144325.63744-1-alex.kiernan@gmail.com>
Subject: [PATCH v5 6/6] rootfs-postcommands: call preset-all for read-only-rootfs
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
X-List-Received-Date: Mon, 29 Apr 2019 14:43:46 -0000

From: Jonas Bonn <jonas@norrbonn.se>

When the rootfs is read-only, we cannot rely on systemd's default
invocation of preset-all at runtime in order to enable services.  As
such, we need to do it at image creation time.

Signed-off-by: Jonas Bonn <jonas@norrbonn.se>
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/classes/rootfs-postcommands.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index 89f8efd32363..5fcd53c4ca7a 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -16,6 +16,7 @@ ROOTFS_POSTPROCESS_COMMAND += "rootfs_update_timestamp ; "
 
 # Tweak the mount options for rootfs in /etc/fstab if read-only-rootfs is enabled
 ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs", "read_only_rootfs_hook; ", "",d)}'
+IMAGE_EXTRADEPENDS += '${@bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs", "systemd-systemctl-native", "", d)}'
 
 # We also need to do the same for the kernel boot parameters,
 # otherwise kernel or initramfs end up mounting the rootfs read/write
@@ -131,6 +132,7 @@ read_only_rootfs_hook () {
 	# Create machine-id
 	# 20:12 < mezcalero> koen: you have three options: a) run systemd-machine-id-setup at install time, b) have / read-only and an empty file there (for stateless) and c) boot with / writable
 		touch ${IMAGE_ROOTFS}${sysconfdir}/machine-id
+		systemctl --root=${IMAGE_ROOTFS} preset-all
 	fi
 }
 
-- 
2.17.1


