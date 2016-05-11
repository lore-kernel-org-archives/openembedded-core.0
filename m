Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f48.google.com (mail-lf0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id 09B4C60290
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 11:26:05 +0000 (UTC)
Received: by mail-lf0-f48.google.com with SMTP id m64so45737317lfd.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 04:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=78F1+yCDFba7wX5qS+d+3+Yx56InwyOuhVEwlDOilqY=;
	b=F9HqnXy2vU1pZ0wZOIoDLP5FizN+Dhoz1cpzVPmiC0Sn7f9UsTcD5duYA4g8EGCYQX
	ceMXPUTp0tb92vtuzmZyMclCz9pHruN+SvE42cYdPo6yPeMu3CflksZn+2/Hrqdvgr/M
	/98cBUfgWQjw6d+kPqz8m5NXr0o+B2zN6ijyBX2/iZGFgXC835TySUq1eZsNvsWk3BDg
	yVssSe6JSoAWT+i5dr95kvkSnTp0YjOkgRG9tcD7bv3wV0J6LsPnqr7xeopfqXzHsYHm
	jklCRBAHTahurgmwTM/6DiLaRNBVhd8jxoP4hPzYBLJ/2XlSZqJbK2eiWzXhwkwHYKmh
	6Dow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=78F1+yCDFba7wX5qS+d+3+Yx56InwyOuhVEwlDOilqY=;
	b=aN08Shwgh92ERt4IpDBoCyibxxJ7jWLpvABbyUJu6Gdxd6b5apyIIu6g7b7O0HOV80
	2tvLZvnJjYqHe0lpmfEfR9t0nEOPSISJwPCrMF7e144QAwB82rkVZHDybJ6FXuiLInR7
	adAOSDpL9HrOgG9D/ygONOc2t4BC7vTdADkx0ksldvcG5wJ83tbU7KlIYuzsgWggMIL1
	hIr3mbA08B5pKxNeFG7amjf2WOZ7Uj6sec+FwdhGaZGWP+Giqf+ze6QeOZEYMcIldiYv
	lZZ/XrqM27p+Ee+qd9llS1Nw1M40MUeRNCJYzMC1+QXjENMk6aXUKhfFnaX7vDSfDgx6
	19Rw==
X-Gm-Message-State: AOPr4FURhIwEEEpZFBycX76PcUyUTHizuObXc95T4HMnwf9Z1IojGwrvZnNZ3u8baibCvg==
X-Received: by 10.112.201.105 with SMTP id jz9mr1257740lbc.6.1462965964593;
	Wed, 11 May 2016 04:26:04 -0700 (PDT)
Received: from localhost (213-64-218-130-no126.business.telia.com.
	[213.64.218.130])
	by smtp.gmail.com with ESMTPSA id s4sm1217100lbr.34.2016.05.11.04.26.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 May 2016 04:26:03 -0700 (PDT)
From: Anders Darander <anders@chargestorm.se>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Wed, 11 May 2016 13:25:57 +0200
Message-Id: <1462965957-31604-1-git-send-email-anders@chargestorm.se>
X-Mailer: git-send-email 2.8.1
Cc: Anders Darander <anders@chargestorm.se>
Subject: [PATCH][krogoth] lib/oe/rootfs: Fix DEBUGFS generation for opkg & openssl-cnf
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
X-List-Received-Date: Wed, 11 May 2016 11:26:07 -0000

When enabling extra DEBUGFS image generation with opkg, the following error is
seen when openssl-cnf is included in the image.

Collected errors:
 * file_md5sum_alloc: Failed to open file /mnt/cs-builds/anders/oe-build/build-ccu/tmp/work/ccu-oe-linux-gnueabi/ccu-image/1.0-r0/rootfs/usr/lib/ssl/openssl.cnf: No such file or directory.

Lots of similar issues was fixed by an earlier commit in oe-core,
5084ed9401250ed269a49d27b303806ab173c5d5, but openssl-cnf is outside of that fix.

Followup to [YOCTO #9490]

Signed-off-by: Anders Darander <anders@chargestorm.se>
Signed-off-by: Ross Burton <ross.burton@intel.com>
(cherry picked from commit 20ea6d274bb0a9a5addb111f32793de49b907865)
---
 meta/lib/oe/rootfs.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 0546c1e..95fd3ab 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -907,7 +907,7 @@ class OpkgRootfs(DpkgOpkgRootfs):
 
         self.pm.install_complementary()
 
-        self._setup_dbg_rootfs(['/etc', '/var/lib/opkg'])
+        self._setup_dbg_rootfs(['/etc', '/var/lib/opkg', '/usr/lib/ssl'])
 
         execute_pre_post_process(self.d, opkg_post_process_cmds)
 
-- 
2.8.1


