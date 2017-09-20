Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 17F9D7814B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Sep 2017 09:42:01 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id r136so1892267wmf.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Sep 2017 02:42:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=P+eKWXyEnrCgaz6+7Nkb277+pZakELas91zQKSdSoHk=;
	b=orXJ1JKc/v0ikKgzdhK5XbLiKof+/W2IgprAC1HOfYlYqVs1YmmoJTNMmss4y3bBwg
	tiXJAAq52xSWQ3Njj+vLDr+2jfnofMhlGgT+Q97JUbwuJFiHslojKb4AkCqSNpsui4Bv
	I1ygpv1VuaO2bU01RXzyo2ibGVwD7UgLdLe+DOldEmOCAxxuj8Nh2sa4Qs/m3Z2cvYiS
	9UNGNFkz8waEHx3QwciSkH121PBZqEwLN6s414yE2wGxt1fqoVEQWh3CrbiEnvD8sLjH
	cUR1yV4sqQ2kCLODmZl4D1vrBHEZZ/TTvQssmS05MJx4itckDrNlt27NohCFjcfhnhMh
	qITA==
X-Gm-Message-State: AHPjjUj2/zppTMKMXufbnTabs3mJwsGAj/IMLI1Gc+QrvL1NT5TW2wgd
	hzWK8BB0l4Grrgly5/mW1YMPAc+3
X-Google-Smtp-Source: AOwi7QBYznBDLEGid60JPmG3sri1Z0p2564Z/h1jvxeIFUEbnkimD9/I9TQTXx6w8YI5tTrY+ys1HQ==
X-Received: by 10.28.16.16 with SMTP id 16mr3663476wmq.62.1505900522706;
	Wed, 20 Sep 2017 02:42:02 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	k52sm1467558wrf.62.2017.09.20.02.42.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Sep 2017 02:42:01 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Sep 2017 10:41:56 +0100
Message-Id: <20170920094157.11340-4-git@andred.net>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170920094157.11340-1-git@andred.net>
References: <20170920094157.11340-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH 4/5] kernel-uboot: support compressed kernel on MIPS
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
X-List-Received-Date: Wed, 20 Sep 2017 09:42:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

MIPS generates vmlinuz.bin when compression in the kernel build is
enabled, including any necessary objcopy so we can leverage that
and skip our manual invocation of objcopy here. We just have to
put the file into the right place for the rest of the build to
find it.

Signed-off-by: André Draszik <adraszik@tycoint.com>
---
 meta/classes/kernel-uboot.bbclass | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel-uboot.bbclass b/meta/classes/kernel-uboot.bbclass
index 868e97d7a7..87f02654fa 100644
--- a/meta/classes/kernel-uboot.bbclass
+++ b/meta/classes/kernel-uboot.bbclass
@@ -3,13 +3,19 @@ uboot_prep_kimage() {
 		vmlinux_path="arch/${ARCH}/boot/compressed/vmlinux"
 		linux_suffix=""
 		linux_comp="none"
+	elif [ -e arch/${ARCH}/boot/vmlinuz.bin ]; then
+		rm -f linux.bin
+		cp -l arch/${ARCH}/boot/vmlinuz.bin linux.bin
+		vmlinux_path=""
+		linux_suffix=""
+		linux_comp="none"
 	else
 		vmlinux_path="vmlinux"
 		linux_suffix=".gz"
 		linux_comp="gzip"
 	fi
 
-	${OBJCOPY} -O binary -R .note -R .comment -S "${vmlinux_path}" linux.bin
+	[ -n "${vmlinux_path}" ] && ${OBJCOPY} -O binary -R .note -R .comment -S "${vmlinux_path}" linux.bin
 
 	if [ "${linux_comp}" != "none" ] ; then
 		gzip -9 linux.bin
-- 
2.14.1


