Return-Path: <jonas@norrbonn.se>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id C7BEA6BA9D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Jan 2019 16:11:55 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id i26so21323784lfc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Jan 2019 08:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=norrbonn-se.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=WS0KaFQr0bS8d+36Cbg+QkbiXRoLpu3NLZIWZU8AomM=;
	b=kgCdfnQq/67Lykrpp+NtlZ3NUQ/eRIDp1zfNDd0vFrJUIxNRnk4iDTDcVT98MTGtqo
	E1eOrwO9w4l658iYJxbW8fUhaAf55EKgTv8Mzux6O8kALUPkVIuKgxtbW+rBpYLEzQPe
	DbDxQytVzxBjpv1oSvBSz+OIjATq5H4sTyKmItv6W4N/smgBb/Wl59nUN7iKdeKarm6V
	kZOkJuYMD8VWUM/m7awZ/EXlmzMGT+gBRCdP9yidgjOiELfOpsxiasHSxjdyd4BKo7cw
	oNs73ascHNrbcEpKYPfujNd540yQO99fqx6Php7a6cQ7d7ci/o+AXtTIoUwhBQpCohlJ
	Wt1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=WS0KaFQr0bS8d+36Cbg+QkbiXRoLpu3NLZIWZU8AomM=;
	b=lu0wGJk/zWGFx9IkUPmtLhF6UBA47/tPouJISFLf2jhUULRx+vM+vqTEdBfjlktQRl
	LEsYXZgIWGkJbFk3dolo5yKEH18Wwx21WXogSLhN/c9M3L1ftB1UtJudv9hxLVsIMEDu
	Ad1Y8boH1nzg0wI9j0JrWmjevNclfQ/+JM65h99xzjL+gslLdaeiAaUIRz/P0iZ7rEoT
	QTEYtJMfI1F1IZAKdDpJi96vq/nxcakakB8gXIIn4YnKoGFD83XkPJ5mILuJKPe+zbBf
	aXK5VFA4OJiRFY22vHkkfLcPm2pIqAp/cEytWh0gd9PMLwTJ06wFojy18PAubTov3q09
	6uTg==
X-Gm-Message-State: AA+aEWaH7vYonI9juBaiLAv9qS8zvT99MifqyMd+HaW//G0JP9ErhEIp
	Ll+sUIMh38aB+x7b8gV4eGvaWMFsLMo=
X-Google-Smtp-Source: AFSGD/XA6LTvof9w3vT8ZKHCf1HyhBQvsIhF2Eu2i3ZmWd25o777Zb6R8BHNkodKXVIKSUiEVhhPYQ==
X-Received: by 2002:a19:4402:: with SMTP id r2mr19955175lfa.111.1546445515962; 
	Wed, 02 Jan 2019 08:11:55 -0800 (PST)
Received: from mimer.lan (h-29-16.A159.priv.bahnhof.se. [79.136.29.16])
	by smtp.gmail.com with ESMTPSA id
	o17sm10040195lff.77.2019.01.02.08.11.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Jan 2019 08:11:55 -0800 (PST)
From: Jonas Bonn <jonas@norrbonn.se>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Jan 2019 17:11:44 +0100
Message-Id: <20190102161144.11264-6-jonas@norrbonn.se>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190102161144.11264-1-jonas@norrbonn.se>
References: <20190102161144.11264-1-jonas@norrbonn.se>
MIME-Version: 1.0
Subject: [PATCH v2 5/5] rootfs-postcommands: call preset-all for read-only-rootfs
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
X-List-Received-Date: Wed, 02 Jan 2019 16:11:56 -0000
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


