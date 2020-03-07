Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id C46D66021F
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Mar 2020 15:01:56 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id v11so5721221wrm.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 Mar 2020 07:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=nchtyOXYJ8LBvL8ohWeuGh0h7cHQcLYCRTJFNFXLgA0=;
	b=g+P7CJpm9QnLB4zl3uRjpLfvaxzYudeE5cW2gv9yl4Z/dhm8/RvyeZ94B8UyVk9jm6
	AgAK2PZbpAOtqTl3gnpGxmnasbyxEb6OYehOOPCYz9ptp5RjfzYw0Kd3wDpzbiB2Rrog
	W3FGfZg/GedQ+WJx4evop3MPzrpiRYN6yhXiht27MoYibi2KT0kc2NhiT/P6WpRWt9H+
	RAGyD+IgIlhAka91zo0/jzLCG314Kc8C352hKQLctOReC8WyTOX/2gkS1h3mT6AdLjV0
	QMMvTjPFcT5tdBRR6s/1/CeL7EXW1Tu5KoAhK7tMug8T5F0LLPOfi4d1yUOYbO84OZam
	+7kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=nchtyOXYJ8LBvL8ohWeuGh0h7cHQcLYCRTJFNFXLgA0=;
	b=QIVY5wYROX6nO32wT1fuvVITdDXFqBVHxIDyuNXw6hrLtwzckUPOHCiR+ZaGsRmR6+
	0v/nTqKMZk9KKGV7Uge/Of1igyjkq79ZdVoR5JFpzLGP5ajrj+JVR8LSV+YS3FN3IoM/
	YnmrHg4Vitr1OYHRyh4k6puACtnV+iiiOx4ZmIEQ1+dw8T2NixBw2+QMUGvVJC146m3t
	l3ZqYZCS32EIGNEshHpNAvxaGRk1Gyip6LXeVbDUgvVtXTLfj6tDgJagv+rVik7jiCOg
	ZCtzsqkZZze6v0jUOC/0Rsl1YyuhC+kuKBlAFJAF+RXFEo5MRL06iIFgKjmU8ntcu4yD
	B2uQ==
X-Gm-Message-State: ANhLgQ1X5RF/A2ZNtT9QhKz1zrZ15YBWmhfvLBNI3te1lr+tpKmZbdqt
	Fz8qgu2LL29ftEQMQM03vnwwv30vXfnENQ==
X-Google-Smtp-Source: ADFU+vuAve018lCPs+4t899RmYbIqZ3oD/HPz+8+7SguU9HshN28ngDMLQAOZZRsBxyANBYwlU/yoA==
X-Received: by 2002:a5d:5188:: with SMTP id k8mr9971279wrv.265.1583593316831; 
	Sat, 07 Mar 2020 07:01:56 -0800 (PST)
Received: from md2pfrec.ad001.siemens.net (c-82-192-240-69.customer.ggaweb.ch.
	[82.192.240.69]) by smtp.gmail.com with ESMTPSA id
	f17sm44203596wrj.28.2020.03.07.07.01.55
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 07 Mar 2020 07:01:56 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  7 Mar 2020 16:01:45 +0100
Message-Id: <20200307150145.3100113-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v3] runqemu: support multiple NICs
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
X-List-Received-Date: Sat, 07 Mar 2020 15:01:57 -0000
Content-Transfer-Encoding: 8bit

Emulating more than one network interface with runqemu is sometimes a
bit tricky, but possible. For example, this leads to an emulated device
with eth0 and eth1:

QB_NETWORK_DEVICE_prepend = " \
    -device virtio-net-device,mac=52:54:00:12:34:03 \
"

Note:
 On some emulated NIC types, Qemu and the kernel enumerate the eths in
 the guest in reverse order to how the device parameters are passed to
 Qemu. So in this case it is important that the additional NICs are
 prepended to the -device parameter, which gets automatically added by
 Qemu. Otherwise, the interface eth1 will be connected to the host, but
 eth0 will be assigned the IP address 192.168.7.x, which obviously does
 not work.

When booting Qemu with two NICs, but only one set of network
configuration parameters gets passed to the kernel, the kernel seems to
search for a configuration for all NICs. This delays the boot process
for a very long time.

This change solves the timeout problem. Tested with:
 oe-selftest --run-tests runqemu

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/runqemu | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index dd0aa4b28f..d34f8eec25 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1147,7 +1147,7 @@ class BaseConfig(object):
         client = gateway + 1
         if self.fstype == 'nfs':
             self.setup_nfs()
-        netconf = "192.168.7.%s::192.168.7.%s:255.255.255.0" % (client, gateway)
+        netconf = "192.168.7.%s::192.168.7.%s:255.255.255.0::eth0" % (client, gateway)
         logger.info("Network configuration: %s", netconf)
         self.kernel_cmdline_script += " ip=%s" % netconf
         mac = "%s%02x" % (self.mac_tap, client)
-- 
2.24.1


