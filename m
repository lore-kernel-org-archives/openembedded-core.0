Return-Path: <jonas@norrbonn.se>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5077D7C3A1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Jan 2019 09:38:30 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id z13so9756999lfe.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Jan 2019 01:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=norrbonn-se.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=WS0KaFQr0bS8d+36Cbg+QkbiXRoLpu3NLZIWZU8AomM=;
	b=yMTxHR0Zt8xBhFJdk4rOJ7KSU24/eCRTh5OuDA+U9cuk94sMp6/rAj+7ea2ly7lVFI
	AkrE9bb19uR1vx94Nco894ftuwhUKWOg0hfD348XtOF7QiZL1yICFpGESmLcnrmRg7HW
	xbf77yMSVnIQpXm12kCnU+4pExVmCD14sPUu0x/2al+rBQevEQ5BP/iDP9M171Z3nRtD
	M+qDq97U3Md4yUb9WGNMSfMVn/wbzTeR+jfJ/e9s2q1iD3alkdiYi4+aaQvHaXjZ57vW
	2iLsqP+Qf4nsuM419IOSrDnhgOtY7vT4J71UMzwhL6NhOo3V+OomNAH5Gw5Trfc3jlDg
	IHPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=WS0KaFQr0bS8d+36Cbg+QkbiXRoLpu3NLZIWZU8AomM=;
	b=DHArFRRnvBOFgtI/CcT3e1M3OnDFJZPHDis/EcoBiEWsQdEu/j5hHA/R+jjiOKqiQi
	MzvvHZ243hBzRaPpXZn9kZSNHxnniF5EAa2+Gj1jsviU1/44kh6fei/YUFjTlu6ozZva
	KOfMO6HaUBYo8IjdrfBhPzc31aBWrK7qmYGebZIKEjGAjzPM1OuO4Cmf7siuiQE2nwrD
	iBsZlWHbwD1DJFIlx7eqbLFfaDYtUNJgNVwwHwLS1pXos/vwbbf37Car2uTEcQTWBmPc
	nUuu4JGyGYB9T/Z/4JS7eF27hqPA5f7F8XAvwQyPCU9pP1HjQcqPMh7K6baMQK012rUV
	9wXA==
X-Gm-Message-State: AJcUukcr6uwUgFR1rm8NJ/4IHym9FJnI4vHmaiGo3XW3CctAQG4FERFY
	Z6RYthoVORJeTLvtweTxDMuj1k4JkPo=
X-Google-Smtp-Source: ALg8bN5DFym7K9Q97dg6706fo7oEVZqHwenSQCY2yIyZF4aQpW8JQZc9X0JKwUZrIH6FrFrIHu44Kg==
X-Received: by 2002:a19:2c44:: with SMTP id s65mr14330977lfs.41.1548581910439; 
	Sun, 27 Jan 2019 01:38:30 -0800 (PST)
Received: from mimer.lan (h-29-16.A159.priv.bahnhof.se. [79.136.29.16])
	by smtp.gmail.com with ESMTPSA id
	12-v6sm2398992ljf.96.2019.01.27.01.38.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 27 Jan 2019 01:38:29 -0800 (PST)
From: Jonas Bonn <jonas@norrbonn.se>
To: openembedded-core@lists.openembedded.org
Date: Sun, 27 Jan 2019 10:38:21 +0100
Message-Id: <20190127093821.4803-6-jonas@norrbonn.se>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190127093821.4803-1-jonas@norrbonn.se>
References: <20190127093821.4803-1-jonas@norrbonn.se>
MIME-Version: 1.0
Subject: [PATCH v3 5/5] rootfs-postcommands: call preset-all for read-only-rootfs
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
X-List-Received-Date: Sun, 27 Jan 2019 09:38:30 -0000
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


