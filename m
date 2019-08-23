Return-Path: <armccurdy@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id BBF397F39E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 20:52:52 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id c2so6206159plz.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 13:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=VFiIQResaEOgGAa/V0RLDOcEBRmVNY4IWfSscwEEO6U=;
	b=GzZG8j5ea/kmQer3eJDBv+tSC5fT6B8OZBCaqAP8BciQZLzuABW3zBq/h59WNQn8iF
	8Xi7ndBCJImrTjifKjROBU6i8fQokpq6jNj7ijOSAGvDk5HsncRN0LaR9re6z1TcXOFw
	tC9DABqjyXKKjR/Uj9Ump7cnW+ItIjwEqcH6Q4hU02GFSYMtsxjHe0Usk83xq+LUAkit
	3jevQpulZwsS4lAwm5LIWdho8rS9O266Xy6d+GW0sAozV3mmZVRtUrFdxinLeubsff/0
	EUORF1BcoiqfkmGtXLaIqhZt48PELRqKqRC0M3lRciBUPIEyH2WwopNzBK7j8DwlPpbe
	aQww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=VFiIQResaEOgGAa/V0RLDOcEBRmVNY4IWfSscwEEO6U=;
	b=Ydl5gRPildg7PjynNNtRcfIbBlPQYvygXIp2LOgxLSciy3u+2T6kfBsSNkuY4PRByr
	nGdk+lHk/aWmKPTO5k+EJeO/tp6DUM9SnGaXEHQc4jX2P43dvH1mDv6VOQb5VmCUETyK
	vDrSnFZhpax1BPUmZR5RQLlSi7Jhem7ibH9Yti0/lpOIihgIzAiCcrOXd6WRUeVSAifu
	AMYO9CAFs1rvgvspXYoZHo2o0PadKPpUEdUIXLk5soqeiQIKmrPCoUGTk7YQ2QFoZFvD
	rylXnN1FmTbIp6vQomuyvZx1n7ICnC68+pyJqphkuHy03+5kyxzw1OafGuNtagnT+5JK
	Qe0Q==
X-Gm-Message-State: APjAAAU+pa5SHo5gmf1SZGloaHX/OwlrPyCJYWBU/U/lyNSLEEhKOON4
	LmcakY92GfOB2pN1uM0YXPvVgVO7
X-Google-Smtp-Source: APXvYqxbzspQW+p88ZcPqipb5qdL46FMqqk1q+vUoEEHOMWt0X+6i3FrK/YGbQkyj1Qq4EsluGDyCg==
X-Received: by 2002:a17:902:3064:: with SMTP id
	u91mr6631931plb.244.1566593573814; 
	Fri, 23 Aug 2019 13:52:53 -0700 (PDT)
Received: from localhost.localdomain ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id h9sm2688314pgh.51.2019.08.23.13.52.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 23 Aug 2019 13:52:53 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Aug 2019 13:51:38 -0700
Message-Id: <1566593504-21918-7-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1566593504-21918-1-git-send-email-armccurdy@gmail.com>
References: <1566593504-21918-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 07/13] rootfs-postcommands.bbclass: add inittab tweak to read_only_rootfs_hook()
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
X-List-Received-Date: Fri, 23 Aug 2019 20:52:52 -0000

It's not clear that we actually need to call mount -o remount,XX from
the busybox-inittab inittab at all, but as we currently do, let's
respect read-only-rootfs in IMAGE_FEATURES and not remount / as rw.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/classes/rootfs-postcommands.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index 6cec23e..fc33816 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -95,6 +95,11 @@ read_only_rootfs_hook () {
 		sed -i -e '/^[#[:space:]]*\/dev\/root/{s/defaults/ro/;s/\([[:space:]]*[[:digit:]]\)\([[:space:]]*\)[[:digit:]]$/\1\20/}' ${IMAGE_ROOTFS}/etc/fstab
 	fi
 
+	# Tweak the "mount -o remount,rw /" command in busybox-inittab inittab
+	if [ -f ${IMAGE_ROOTFS}/etc/inittab ]; then
+		sed -i 's|/bin/mount -o remount,rw /|/bin/mount -o remount,ro /|' ${IMAGE_ROOTFS}/etc/inittab
+	fi
+
 	# If we're using openssh and the /etc/ssh directory has no pre-generated keys,
 	# we should configure openssh to use the configuration file /etc/ssh/sshd_config_readonly
 	# and the keys under /var/run/ssh.
-- 
1.9.1


