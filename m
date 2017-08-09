Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f178.google.com (mail-pf0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id 3AED8719C4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Aug 2017 16:45:41 +0000 (UTC)
Received: by mail-pf0-f178.google.com with SMTP id t86so30045706pfe.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Aug 2017 09:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=67WtNbc+uzX12/JeALJlAlDfWQ+FlvQjZcAhH0NDnUE=;
	b=BV6ruGx1qQE/h3jCD/q6SDIyQQSMjKFV4u6+Vi1WQShKZI10dyhqi+AVEyAoOJEaCr
	i2o9U8EIJQBfVNVxSkyIHMItboLX/zcC1GZ3++6poQKcsj0NS44WXpvK/nkfGYfjS7n4
	lmtPJ/aOCEOoQkqjh3CqLUDXX0aRygTK/48ZmZPVJ89j4sal23ysGVwHDJlNWMUqGU4F
	AG60ZrV5RGOj2J9vA1NCGhazYKaKHuOK9KZy8ejgRSsA9gjgKbJaDvDDLj6W1Q8e+6Dr
	hmj+OQS4OZklgKmZIjeZi290TG4elPNt1b55AohsFsXhMdSqUS5NCR2N5GQ0k7yzCRcM
	14hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=67WtNbc+uzX12/JeALJlAlDfWQ+FlvQjZcAhH0NDnUE=;
	b=m8ooJHREDqcz/rkWulrWT9+DfWhd6FPgI4jV6DwBdx21YzafWpjvjKm7kGhypA2Vws
	84VNvNzo/PxomZobG/auTPcQ+5wu5c11uFP8UAyBDppN4RTAkqBTY02/REjZOk9BeMl5
	wmAFoZteYfzJfsXQyQJFwx+bXjlHe5s19/hmbpCa69iDC8/+GORjAxCiwA4T6wtBEH6Y
	WYVwlGi2L4Neo2Uj5kRpVAE91x8pT82iOQVASMS/BNyG37YTWqaso9lvJeqNKkS/RnJP
	uwNClMe40STYRF55QWADUPxKxzyfq7xuJxxPjWiDNUrlKy6Xr+agI4W77ET4QQBOmvIH
	9S8A==
X-Gm-Message-State: AHYfb5ha8UAoeNo1x3nufB7/YqWl2LlWLIcTXMBiYOn8AvpST4YQjJwm
	9N3yhteCYbis/PkP
X-Received: by 10.98.147.131 with SMTP id r3mr8808274pfk.80.1502297143076;
	Wed, 09 Aug 2017 09:45:43 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::8e89])
	by smtp.gmail.com with ESMTPSA id g2sm6658170pgu.86.2017.08.09.09.45.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 Aug 2017 09:45:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Aug 2017 09:45:18 -0700
Message-Id: <20170809164518.35834-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.0
Subject: [PATCH] rootfs-postcommands.bbclass: Filter out dangling symlinks in ssh_allow_empty_password()
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
X-List-Received-Date: Wed, 09 Aug 2017 16:45:42 -0000

In images built with pam in DISTRO_FEATURES, we end up with dangling symlinks
if su is not packaged into image

$ ls /mnt/a/oe/build/tmp/work/raspberrypi3-bec-linux-gnueabi/core-image-minimal/1.0-r0/rootfs/etc/pam.d/su-l -l
lrwxrwxrwx 1 kraj users 2 Aug  9 07:56 /mnt/a/oe/build/tmp/work/raspberrypi3-bec-linux-gnueabi/core-image-minimal/1.0-r0/rootfs/etc/pam.d/su-l -> su

This causes image do_rootfs to fail

| sed: can't read /mnt/a/oe/build/tmp/work/raspberrypi3-bec-linux-gnueabi/core-image-minimal/1.0-r0/rootfs/etc/pam.d/s
u-l: No such file or directory
| WARNING: /mnt/a/oe/build/tmp/work/raspberrypi3-bec-linux-gnueabi/core-image-minimal/1.0-r0/temp/run.ssh_allow_empty_
password.19238:1 exit 2 from 'sed -i 's/nullok_secure/nullok/' /mnt/a/oe/build/tmp/work/raspberrypi3-bec-linux-gnueabi
/core-image-minimal/1.0-r0/rootfs/etc/pam.d/*'

Therefore we need to filter out dangling symlinks before sed'ing
things out

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/rootfs-postcommands.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index 78f7c55933..e26aa90d73 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -158,7 +158,10 @@ ssh_allow_empty_password () {
 	fi
 
 	if [ -d ${IMAGE_ROOTFS}${sysconfdir}/pam.d ] ; then
-		sed -i 's/nullok_secure/nullok/' ${IMAGE_ROOTFS}${sysconfdir}/pam.d/*
+		for f in `find ${IMAGE_ROOTFS}${sysconfdir}/pam.d -type l -exec test -e {} \; -print`
+		do
+			sed -i 's/nullok_secure/nullok/' $f
+		done
 	fi
 }
 
-- 
2.14.0


