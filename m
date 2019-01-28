Return-Path: <jonas@norrbonn.se>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id 088747C5B8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 20:58:58 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id f5so12919957lfc.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 12:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=norrbonn-se.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=WS0KaFQr0bS8d+36Cbg+QkbiXRoLpu3NLZIWZU8AomM=;
	b=BwbcMV1+8vF+47a9nMsQu2Y+aiWKQVwxeKkgC0wdf30ag93AvrwLRLL149NQ0wgGdE
	dTRIWUH3oKiA9upyXciS9FGVTz3xdBGlASscYzsNjc47b2wmEQUJxVx8zl5zjeheEGnI
	O+JVvFJqTdEecsDJdAJbVJw9PAshqsf+rVORaT9FxkZF4SnQuocgMZIaP4QnSCNoUInJ
	k2lQaUoP+JtJx0Rmb+I9OR/0lXmsiQcYvR07o+HEq4WbCX/+obidckUsobuclAH5l3bO
	cCJmHquZ2VO0XD0HKs/tJMqWnbkNYjxC3+GIPY4Q/xvTKIwNQ0MXp3pMSvObUTuZUsNt
	e9qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=WS0KaFQr0bS8d+36Cbg+QkbiXRoLpu3NLZIWZU8AomM=;
	b=PVZ19rPZzIVEoXrftAcjJz+GKgg+wb4dXnQ+Yd0Z392bzIGLC3xTPBTlve/M7zI4Lo
	jtmcWksCXSLDGoYTLVL8ZHfHcupxTOvb5eHHZn78e8pGPyVmQv5DaXEEOEClaTGohyyH
	Rb67WfdrzEQ+cl7vUwKEj67pyCheIaP6+e14UBabMPUsJ84gVWhgz7d0T0+WnmuKT9m1
	hCXQMS+i5ky+lcFSveZroEnoMOqjvavlsTksAEIZ9QMzK8qt9h8W2YCik5dPfcTZdNL4
	2odRK6nvoaWHVhAne5gn6l4VkmVT2LtMPwKOOfP9iDmKZYVhrNdmD2+M8BTyczA8TpZt
	/22Q==
X-Gm-Message-State: AJcUukcZ11zQaxiWI/V4IAyft0zy9y55MIP0ulYisD7SoozZBynF8GSd
	nLZRWJjZqyvtgMLum/Bcb3iyDQxbzXo=
X-Google-Smtp-Source: ALg8bN6U3d6JjekPYGhxwWpeEY/033M9UYrHvLvKr3Yfuww4wSwcBryS9j+BoYiDhwln/syoECn6GQ==
X-Received: by 2002:a19:c396:: with SMTP id
	t144mr17551202lff.110.1548709138463; 
	Mon, 28 Jan 2019 12:58:58 -0800 (PST)
Received: from mimer.lan (h-29-16.A159.priv.bahnhof.se. [79.136.29.16])
	by smtp.gmail.com with ESMTPSA id w9sm3142340lfc.66.2019.01.28.12.58.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Jan 2019 12:58:57 -0800 (PST)
From: Jonas Bonn <jonas@norrbonn.se>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Jan 2019 21:58:48 +0100
Message-Id: <20190128205848.12834-7-jonas@norrbonn.se>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190128205848.12834-1-jonas@norrbonn.se>
References: <20190128205848.12834-1-jonas@norrbonn.se>
MIME-Version: 1.0
Subject: [PATCH v4 6/6] rootfs-postcommands: call preset-all for read-only-rootfs
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
X-List-Received-Date: Mon, 28 Jan 2019 20:58:58 -0000
Content-Transfer-Encoding: 8bit

When the rootfs is read-only, we cannot rely on systemd's default
invocation of preset-all at runtime in order to enable services.  As
such, we need to do it at image creation time.

Signed-off-by: Jonas Bonn <jonas@norrbonn.se>
---
 meta/classes/rootfs-postcommands.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index 89f8efd323..5fcd53c4ca 100644
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
2.19.1


