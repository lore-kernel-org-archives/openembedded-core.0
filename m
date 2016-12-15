Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 4D58860107
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2016 13:31:16 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id t79so45715108wmt.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2016 05:31:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=vikXyF3vdIKNOA1oqHdg9l27yt6qZf3p145lizdy0Pg=;
	b=DVCVznKR5qnr3j8bzpoVgekKtIHLSaO8Kele+zQ7wYuwTOXyipMEt/tn4IMSJ9VsQ+
	XHFnpI4pU5iRH8MLTVlY9JHspm/29nqZG1quxdyZjnOpMgpy12H5H+njAKWBA/tGtFxR
	N5FxqRDFOqnvwGumUzXaIbTp0AVA4xDNcZ9HvAVW3lD7wptaSYDB65jIObldptug1T1h
	vGwSqMgDRDHO7EVXkeQpGD3xx1c6GOIii1Od0cynObaLPJK98sbXSeTZhYvAJX/FiPn0
	cxm0on0ZJFoR29+OYgO9q0K7/ExiDnsgSmqgoxNWNOFcC5QatPV5YYOUwJju/qDYm/9Z
	i1kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=vikXyF3vdIKNOA1oqHdg9l27yt6qZf3p145lizdy0Pg=;
	b=JCo9d+6tuoP3CHaA72IO0Z6kG86SHcDenERyBMPszFNQMrLkweltlsn121iydLAPgX
	sAewxEaH3sYBVWka2jN8B2m6SPLPuS/F56oSxnSCjm+NjSEkcsGVLzxJtMgXVMruWexl
	sHIoKxkOW/fFdNur+FuHg8leh+UfFHoDhz4eLOSecBqT5uZe05YFSJjk6JIy8oKcxoPy
	1nmeUJcOzxLSt1UupWzrF9jX04gGyEUNIdUziAGMp8Su24HRBPJ0yIRB+ECgLuTREHqa
	0TuQglt2mmvjcqnkQo2t0ONrmUn/fBFpeBmY3yWw90eq5qdltmYtOZ+VqrdcJGQ2tfcP
	LyPg==
X-Gm-Message-State: AKaTC028rBVm7pwKW4fnDlFq8V021DArmW4RCE6XeHbizoM+CkfpqqtKrZitCRCsdWq8bQ==
X-Received: by 10.46.78.1 with SMTP id c1mr564989ljb.39.1481808677774;
	Thu, 15 Dec 2016 05:31:17 -0800 (PST)
Received: from comp_016_pc_buildenv.localdomain
	(staticline-31-182-60-238.toya.net.pl. [31.182.60.238])
	by smtp.gmail.com with ESMTPSA id z1sm457683lja.27.2016.12.15.05.31.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Dec 2016 05:31:16 -0800 (PST)
From: Maciej Borzecki <maciej.borzecki@rndity.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Dec 2016 14:31:08 +0100
Message-Id: <3c889318aa635d1aaf30646b1152e2d07171e63c.1481808649.git.maciej.borzecki@rndity.com>
X-Mailer: git-send-email 2.5.5
Cc: Maciej Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH] selftest: wic: qemux86: use weak assignment for WKS_FILE
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
X-List-Received-Date: Thu, 15 Dec 2016 13:31:17 -0000

A follow-up of a fix introduced in
1b32c6ed025745cb06b7c28ca0fe9e416ce7abfa (selftest: wic: fix test_qemu).

Wic test_qemu fails on qemux86 due to a direct assignment of WKS_FILE in machine
configuration. Using default assignment allows WKS_FILE to be overwritten in
test setup.

Signed-off-by: Maciej Borzecki <maciej.borzecki@rndity.com>
---
 meta/conf/machine/qemux86.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/qemux86.conf b/meta/conf/machine/qemux86.conf
index 8997f6ba701a91f0adc82dfaf410c7dd1a9777f3..1b478e92ad7fdf6f3cb2dd4f6dc35684a319848c 100644
--- a/meta/conf/machine/qemux86.conf
+++ b/meta/conf/machine/qemux86.conf
@@ -28,5 +28,5 @@ MACHINE_FEATURES += "x86"
 
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "v86d"
 
-WKS_FILE = "directdisk.wks"
+WKS_FILE ?= "directdisk.wks"
 do_image_wic[depends] += "syslinux:do_build syslinux-native:do_populate_sysroot mtools-native:do_populate_sysroot dosfstools-native:do_populate_sysroot"
-- 
2.5.5


