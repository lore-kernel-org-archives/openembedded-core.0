Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id CFC266C0F4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2019 11:48:00 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id v8so11583714wrt.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2019 04:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=CkNqO/3ApDcX4TrqR/pC5NrtlNcYoXaAa227xcVPk7o=;
	b=gp8eVPJDZsK3CrC/84iXElB1min+0s8e8a12DLjqF+Q6b9nFLlANELNwqpGv3Cwu28
	+O2AcIRPkvhfuFavYKGIk7ZipyDS6bN5lPzD+EOmxaoL/sWT8l5EUxcvgbodXvirs78p
	D3osutmHH8qOocVDNQH946ySzjoKJuKpiaDEIFMWz7/bfzzA2Uz/9kBzf6OB1NtZMyg5
	nvY3/nNC/5XBY2G4818wf3JTGLqTuymOBZqvi4FA5TK3wGbtpAvrzCsMpPH49bhKrSZ5
	+/sdGzLUKHhtr8hb9d+UcZlYIfjBurGEkOfTreWKdjav6dkPENSFzRgx5mBH0octZU6F
	Pgow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=CkNqO/3ApDcX4TrqR/pC5NrtlNcYoXaAa227xcVPk7o=;
	b=uAB/fgFH1bBOgpZsd4Sl4rJtFRqDV2+ydOgLW5vrLHVrjQs1Mq/+WuXzA4pu2nuIkw
	zXETnQrCnCb0gfa5F/RaR09E7zxhaGF0DOcfaZsHpgIbZ1PbM+p8Auy8+Y5gywPXfGls
	S7j1Dyl+6Zj/pubkFnAaAvxEU98sxJ6F/jRsoRnFBxjmCuJz7zQy8PlzWlKVLvzuKfME
	YjC7IyvDhVbWa5XFQspZQuGmSHrcaxWh59e2adLG1sMZPE1TPqXWs337fgVL7tOYNX5g
	TJgcPw/u40S8Y3GzsyVo4nNlcu+Epnc40lb2ZN/c3yTHeBqHv5zQ6G3eW5OICiWjR6Je
	8iCw==
X-Gm-Message-State: APjAAAWOqd+eS/gpIKyNLZBFI7D1hi9q726tdvKDgS8ZlN2aL+HLfMVK
	dUPH9d3kGpkTSjuB2WgYkkLUFj43
X-Google-Smtp-Source: APXvYqzWyPZge6gu57JRjnedWYHkP0xOL/jApwPjRGIXBj1IBw5C1w8z/uMvFA83U19rfBzVSYkrPA==
X-Received: by 2002:a05:6000:354:: with SMTP id
	e20mr9965768wre.383.1570794481210; 
	Fri, 11 Oct 2019 04:48:01 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id b5sm6964357wmj.18.2019.10.11.04.48.00
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 11 Oct 2019 04:48:00 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Oct 2019 13:47:36 +0200
Message-Id: <20191011114754.91740-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 01/19] runqemu: add options that enable virgl with the SDL frontend
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
X-List-Received-Date: Fri, 11 Oct 2019 11:48:01 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 scripts/runqemu | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 1a5aca98ac7..22671f19ec3 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -67,9 +67,9 @@ of the following environment variables (in any order):
     nographic - disable video console
     sdl - choose the SDL UI frontend
     gtk - choose the Gtk UI frontend
-    gl - enable virgl-based GL acceleration (also needs gtk option)
-    gl-es - enable virgl-based GL acceleration, using OpenGL ES (also needs gtk option)
-    egl-headless - enable headless EGL output; use vnc or spice to see it
+    gl - enable virgl-based GL acceleration (also needs gtk or sdl options)
+    gl-es - enable virgl-based GL acceleration, using OpenGL ES (also needs gtk or sdl options)
+    egl-headless - enable headless EGL output; use vnc (via publicvnc option) or spice to see it
     serial - enable a serial console on /dev/ttyS0
     serialstdio - enable a serial console on the console (regardless of graphics mode)
     slirp - enable user networking, no root privileges is required
@@ -437,7 +437,12 @@ class BaseConfig(object):
                 self.qemu_opt_script += ' -nographic'
                 self.kernel_cmdline_script += ' console=ttyS0'
             elif arg == 'sdl':
-                self.qemu_opt_script += ' -display sdl'
+                if 'gl' in sys.argv[1:]:
+                    self.qemu_opt_script += ' -vga virtio -display sdl,gl=on'
+                elif 'gl-es' in sys.argv[1:]:
+                    self.qemu_opt_script += ' -vga virtio -display sdl,gl=es'
+                else:
+                    self.qemu_opt_script += ' -display sdl'
             elif arg == 'gtk':
                 if 'gl' in sys.argv[1:]:
                     self.qemu_opt_script += ' -vga virtio -display gtk,gl=on'
-- 
2.17.1


