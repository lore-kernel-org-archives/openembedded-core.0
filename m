Return-Path: <pespin.shar@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 594886BE2C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Dec 2018 00:05:01 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id p6so23479390wmc.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Dec 2018 16:05:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=3oEDFqwAL43WIlwbCjDzsKLCHZzvWHn3waWzh/D0ikY=;
	b=GDfOTmZMkG46EirwQSsK3aohqTTPS24T6LiBncOuLp3SZB5l6QnRKt14hBV1avpM6p
	1mw6aXWd0yI8iVQ5KlwMgbzGb8RF+CmlZN/ubdwH9HTOmSt/kfTsg1vUxwnznjwBtM7j
	31TACyDh8DH2akIdYunLM3oVtKypQWuV3y0T4jTtpmtUvj+rS3WiCHXh08b1gw7GF0Yq
	kRSWvdBwEvgtx86VwLx+s+AiBP5D4+hiyIgqSnUwV4ta84wmfPF1Q81LILl8WCLT4j14
	hH6rIj2WSr2Ijj4CjJu8q3UUMvlZuGWY9/dw6W4PZ7OF0a+nafcWc8whAuYnSFGtWj2F
	Hjwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=3oEDFqwAL43WIlwbCjDzsKLCHZzvWHn3waWzh/D0ikY=;
	b=SyXzFmIE5CwVJsXiLytZrTlkstcMe72DKvN0vr4Js6Etib2JAzx7H66FJ0W8v/ds4l
	Ud8pCi0MziDHDRTvIhLrSV/RcLlixHc/hK/yzJMvRy6Xa2MnDmhsQGrDKZvwmSke5CVh
	QUPWURMm+2SBR2WgDLSwUFwYRgoDc5TjGExl2itgO4wO5YVeA5wfsHFcExh/rn1YClsg
	zj7s2UNWtvgHtaLEaqsX3b2qWTKS/FHTNmGYJ3Pb0cO/BSKeCsgEDGchKn2F/LBAgrrz
	PnnOBTR3ex6J9sxgKPCLcCtzaVmtyHpW2C3/gj43LefR2YXauCXVcP+ufMqXWu6N+v1T
	wbzw==
X-Gm-Message-State: AJcUukergzxFKgmu4SYlMx9XxO7uPGoXBuRY7b+wHJJWz6YHPgcfToLJ
	zQF2eMdTxH2WZ30nBK/STX/SKaze
X-Google-Smtp-Source: ALg8bN6AE43MmF/S+8DC17S0G/3x+p7GOq5mTJUI+QkxnFyWcXyZMhSVDnHFWOWjLhCkCUbyTHvUmg==
X-Received: by 2002:a1c:c008:: with SMTP id q8mr27224953wmf.99.1546214701652; 
	Sun, 30 Dec 2018 16:05:01 -0800 (PST)
Received: from pespin-thinkpad.Home ([93.176.187.83])
	by smtp.gmail.com with ESMTPSA id
	p4sm30743732wrs.74.2018.12.30.16.04.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 30 Dec 2018 16:05:00 -0800 (PST)
From: pespin.shar@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 31 Dec 2018 01:04:50 +0100
Message-Id: <20181231000450.4992-1-pespin.shar@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Pau Espin Pedrol <pespin@sysmocom.de>
Subject: [PATCH v2] kernel-module-split.bbclass: Fix modinfo decoding in old kernels
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
X-List-Received-Date: Mon, 31 Dec 2018 00:05:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Pau Espin Pedrol <pespin@sysmocom.de>

Before linux commit d36b691077dc59c74efec0d54ed21b86f7a2a21a, some
strings contained invalid utf-8 character which made
split_kernel_module_packages unhappy when parsing ums-isd200.ko:

Exception: UnicodeDecodeError: 'utf-8' codec can't decode byte 0xf6 in position 21: invalid start byte

Signed-off-by: Pau Espin Pedrol <pespin@sysmocom.de>
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
2.20.1


