Return-Path: <leobsd@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id ADDA77C55C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Feb 2019 08:14:22 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id v28so1244313pgk.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2019 00:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=KhVhjBhxM86POUfuLke9r7QasUV4t6yVW6boScm0Jfs=;
	b=gUcr34OiURJN/SZy0bVcpT2Tj6AW/GXNIZJayTMaQLDkeZi7tftBDcdbAhA7i91CY9
	0is9NqiuD11Rc6mA1IVFElk9f/pRTdY9YZqhsWKr0XEGLz3t2yqUueSS6VlKmZFOvaHM
	llKvAwfF+duSgKKoAhdHAKxtANXEiUIs+MjzBnFe2iJ5FGadhC7tGEGyi4kT2plMavg9
	TMAN9cMyWWCBquos2kiQeJljpltfEv8D4X2zx8HoZtJ16dQQkezyM//2Dq/5qiJgfoJc
	trAkLkhJWCa8I1v6yclPRzzTug/sOyvNfxz+GZBSeYgNFzFm0lrRaUffU9jP2pRqldH6
	XYrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=KhVhjBhxM86POUfuLke9r7QasUV4t6yVW6boScm0Jfs=;
	b=DFF+ojny7jT6n+mkw9pO6M6/fBnjXoNVLDcgwzl9SrCj33VIlSkric25WaXE4rZ9ez
	YA0JeFN32wFuE/r/VmyHayMkBmJ9SPtk5UJ5W5X7uyHB/NXbKrkahSP+4MdPswzQu4Dp
	ah60yKW4LpmL5OH5MpPAx+Oqq7mvOhbQVkAgBRoMA7rf1yz5nwO8vDjX9uu4ivxdbDzw
	gaPVYB7WnRM/m3uzdfa3nXWdYLE+Tv5Jjp0Ua2VoNtJ73v9iby3eXnMirTVAGWeAbU1F
	tfSrn9DcTCxYh6lBJsft+x9leMgz8dhq3A8LD3zPqHwKHDYE6uYUKF+BXbdvVOZ1lP/r
	UlVw==
X-Gm-Message-State: AHQUAubDiIfJv2C9+eJjdRBkT1yERkLYY1C/EOqLalyECxs536VuhnrF
	HosHJJaG/G3AayoQou8uuVaO0znmDj2cAA==
X-Google-Smtp-Source: AHgI3IZiPdhjD6XbKyJzta78NqzNxCty+a3sTmvoD6m13uvos/OhaKaJwtnscWJBJVD60PEXM3eKQg==
X-Received: by 2002:a63:e545:: with SMTP id z5mr19393409pgj.195.1549613663155; 
	Fri, 08 Feb 2019 00:14:23 -0800 (PST)
Received: from localhost.localdomain
	(node-1w7jr9qpx9oqtmftzk0df307j.ipv6.telus.net.
	[2001:569:790a:d400:8541:be6d:a320:e6cf])
	by smtp.gmail.com with ESMTPSA id
	n186sm2548465pfn.137.2019.02.08.00.14.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Feb 2019 00:14:22 -0800 (PST)
From: Leonardo Augusto <leobsd@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Feb 2019 00:14:15 -0800
Message-Id: <20190208081415.23989-1-leobsd@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] Fix cp's target path for ext* filesystems Python subprocess' shell=True defaults to /bin/sh[1][2], which often refers to a POSIX-compliant shell. As the -e flag is not defined in the POSIX standard[3], some shells may interpret "-e" as the first argument to the echo command, causing the rest of the command line to fail.
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
X-List-Received-Date: Fri, 08 Feb 2019 08:14:22 -0000

In this particular case, "echo -e 'cd {}'" is interpreted
as "-e cd {}", which causes the first line of the command
to fail, and causing cp to always place the source file
in the filesystem's root.

This issue only affects "wic cp" for ext* filesystems.

[1] https://docs.python.org/2/library/subprocess.html
[2] https://docs.python.org/3/library/subprocess.html
[3] http://pubs.opengroup.org/onlinepubs/9699919799

Signed-off-by: Leonardo Augusto <leobsd@gmail.com>
---
 scripts/lib/wic/engine.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index 4662c665c0..b4be796752 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -331,7 +331,7 @@ class Disk:
     def copy(self, src, pnum, path):
         """Copy partition image into wic image."""
         if self.partitions[pnum].fstype.startswith('ext'):
-            cmd = "echo -e 'cd {}\nwrite {} {}' | {} -w {}".\
+            cmd = "echo 'cd {}\nwrite {} {}' | {} -w {}".\
                       format(path, src, os.path.basename(src),
                              self.debugfs, self._get_part_image(pnum))
         else: # fat
-- 
2.17.1


