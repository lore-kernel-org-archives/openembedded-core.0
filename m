Return-Path: <jonas@norrbonn.se>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 4EF4B6BA9C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Dec 2018 12:06:08 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id t18-v6so23495942ljd.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Dec 2018 04:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=norrbonn-se.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=SELgdOdyssnPbpZCieMJAwcMn4R2/uhNx/UARPtsnfs=;
	b=zrExj0Z6iMy7HQ7vR0IIb8w2vC2r8oqOfSw1NmcSfV1sR8zADwL8tXnqek9fyhXwgf
	Gv+0upLUYFWHkGRKdtmC6lkEWjpEqM+/g7m6lgUWxqha5jEpjOnJ6QDja3CFnfEDfJgN
	fhFi0hQpiSDToNglcOjlPWeE4CFsuwGUe1/Qn0Uhfgiqk0zOGOYwR9/0CXVXdK3/IFhH
	ltFJPgFhDMUBIjm+99f5vqnWqudITp0j1tGUNzY9vHuGnET+WlJPNTMj9OSgJLmb5i0K
	fnI70j+gLR8UAjJnQAumPwIijFQ7rk6iOBdM1E/aVN8dnkX0OLbEXrCsT4TS8cuVjONW
	dTWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=SELgdOdyssnPbpZCieMJAwcMn4R2/uhNx/UARPtsnfs=;
	b=ai0eVMCTSlw6Ift8QGd+KhHTqdcHs7cDkT2fi1KGWTbzJGxDIpuzsogEEMzKcYvMu6
	pSvPG/PSivF8TGT1V2Kxrdbu7JSwblpBzfWl9rSqZUUsvvgyfkc1koj0p1sHj00Ywu4b
	gBoq+vfBzlitn/2Ab6K+XGwmVQRGA5V1X9D/XqdNDE1apbiy7xOuDJlB/ny5iFwtpwVM
	Fba/dcaHAmFNCaYqQMzTKdnPwtbUg40f5CiDg594bQ9UuwuXt97l9z7V74Sckl7oINdK
	lslkn+aYkXJkMMYgnrNKrcSPAVdJF0mzfDSvKoy2Nhj+Qrl5K/chtLAqdBYbW1d26RJo
	H0pA==
X-Gm-Message-State: AA+aEWaSiSYS+mwBb6X7bgV2lyB6dg27XdHEUHYflsPJP8CLyntAEofh
	PIrhamnlRKC2i+ujDmxTg1uHoazI4vI=
X-Google-Smtp-Source: ALg8bN5nUwrxRYML0++CJskHF5z9nARxn4z7zxgh99cP8/8dtPm/3QzalDw2m5WUxwaOg3gmfv0m9Q==
X-Received: by 2002:a2e:20f:: with SMTP id
	15-v6mr21528626ljc.172.1546257968606; 
	Mon, 31 Dec 2018 04:06:08 -0800 (PST)
Received: from mimer.lan (h-29-16.A159.priv.bahnhof.se. [79.136.29.16])
	by smtp.gmail.com with ESMTPSA id
	r76-v6sm10246379ljr.83.2018.12.31.04.06.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 31 Dec 2018 04:06:07 -0800 (PST)
From: Jonas Bonn <jonas@norrbonn.se>
To: openembedded-core@lists.openembedded.org
Date: Mon, 31 Dec 2018 13:05:58 +0100
Message-Id: <20181231120559.25470-7-jonas@norrbonn.se>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181231120559.25470-1-jonas@norrbonn.se>
References: <20181231120559.25470-1-jonas@norrbonn.se>
MIME-Version: 1.0
Subject: [PATCH 6/7] rootfs-postcommands: call preset-all for read-only-rootfs
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
X-List-Received-Date: Mon, 31 Dec 2018 12:06:08 -0000
Content-Transfer-Encoding: 8bit

When the rootfs is read-only, we cannot rely on systemd's default
invocation of preset-all at runtime in order to enable services.  As
such, we need to do it at image creation time.
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


