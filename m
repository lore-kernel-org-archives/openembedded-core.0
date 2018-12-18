Return-Path: <pespin.shar@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7984C6E47A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 15:29:33 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id l9so16284248wrt.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 07:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9lwryDHhxMqVBMPxai77DAVmZaoL7aZc9OwSqN7/pmY=;
	b=N+jDHE/zvSvrHWvJ8A0myt/CgnPDKxPXRd/EW240Q8IV50OoPjh/7bEiNCWbnyj969
	dC5vo5fBefXc888pRRPeBKBXWa73d82hOz5vdRN+//obMMLhsTxUW8LFDsks2ffWmokC
	9qZnGwv59FZnfrx2+xivUwTDeNAa73RnNGQQL/Fn1dW3Kbn7tKeZRyi4qbCwDNnbvhd5
	D+lB945sI9+3o6sC4LKkMxMLY2RJ9rCgl1HIOWWq6UHqZYMDnbsLg0t59o0pEzb6dvzT
	rSvcMUuo9VRzTBPM1MZOS4J0y3IdQVjVYnTG2fBwtZC/3nHMK0Jt3r1Z+HPRTkKYqHVp
	Rg3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9lwryDHhxMqVBMPxai77DAVmZaoL7aZc9OwSqN7/pmY=;
	b=jUYIoYjpEMmXZv4/opTo7SvMr84N1+DLDKLc7AgfJyDfz8pbtI2dVJXLmViAltyHNa
	mdJ9aVbMxPKQwb1mLIrmmA+/CfXDfj74ErwpSADXGNy77y7oSvGSO6EcxOYiKgrhoNXx
	SX1vvUTI1KnUV12tKa59e6dgG35QlSuwCBGP0mD1Ti/ZS5jAS6AY29Slet74Tl7X0+Td
	3dxFcELHKUZkoQAPeCBpmkCA9l5BcWdBdJunJso/gNKfMWlmD8osgI7GMQbkAFZLuax+
	4z2dp1/R8a65tAjhRXbZNk+PCIthKQvWknWcnwloe10q5UpSowwZRIXYNjHzzeIcUesu
	hWJA==
X-Gm-Message-State: AA+aEWZuJuS986V9LmeK2o5W1J5rg+PcVpBH5HJVPgicbHRYI3Bk4Xxf
	KuB56k/Vi3xFx8nXcSC8LF7z7PZ1
X-Google-Smtp-Source: AFSGD/XsXVQIkqwHxNP/+Wu/u4QtCgpCt+4k3WunMD+mPhs7kqe2GoLXy3YyEqoiiNfejmYlEbZO7w==
X-Received: by 2002:a05:6000:1251:: with SMTP id
	j17mr14799080wrx.315.1545146973614; 
	Tue, 18 Dec 2018 07:29:33 -0800 (PST)
Received: from pespin-thinkpad.Home ([93.176.187.83])
	by smtp.gmail.com with ESMTPSA id
	l37sm5338509wre.69.2018.12.18.07.29.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Dec 2018 07:29:32 -0800 (PST)
From: pespin.shar@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Dec 2018 16:29:10 +0100
Message-Id: <20181218152910.11276-1-pespin.shar@gmail.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Cc: Pau Espin Pedrol <pespin@sysmocom.de>
Subject: [PATCH] kernel-module-split.bbclass: Fix modinfo decoding in old kernels
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
X-List-Received-Date: Tue, 18 Dec 2018 15:29:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Pau Espin Pedrol <pespin@sysmocom.de>

Before linux commit d36b691077dc59c74efec0d54ed21b86f7a2a21a, some
strings contained invalid utf-8 character which made
split_kernel_module_packages unhappy when parsing ums-isd200.ko:

Exception: UnicodeDecodeError: 'utf-8' codec can't decode byte 0xf6 in position 21: invalid start byte
---
 meta/classes/kernel-module-split.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/kernel-module-split.bbclass
index 67ab4161da..e8996cf59b 100644
--- a/meta/classes/kernel-module-split.bbclass
+++ b/meta/classes/kernel-module-split.bbclass
@@ -48,7 +48,8 @@ python split_kernel_module_packages () {
         tmpfile = tf[1]
         cmd = "%sobjcopy -j .modinfo -O binary %s %s" % (d.getVar("HOST_PREFIX") or "", file, tmpfile)
         subprocess.check_call(cmd, shell=True)
-        f = open(tmpfile)
+        # errors='replace': Some old kernel versions contain invalid utf-8 characters in mod descriptions (like 0xf6, 'ö')
+        f = open(tmpfile, errors='replace')
         l = f.read().split("\000")
         f.close()
         os.close(tf[0])
-- 
2.20.0


