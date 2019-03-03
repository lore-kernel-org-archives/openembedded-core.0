Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8DC5F6D561
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Mar 2019 11:27:59 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id n2so2391392wrw.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 03 Mar 2019 03:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=yc39066Z59kogedpWcaQBpd11/jl6jgu4mbFiHRcIX8=;
	b=UlUrYl4Qzv+IgM3ielDYAU12xhiC2GT1Kn8mQh2+20V4bf29yq/+5t1SCl6nm+49WR
	qZst+fLT+cOUYyXoopsMfljJKTvDNpbZWbfTSuoU2qVskzqVnCgl8vCALTDbDm3gxpkS
	+xUYyqhiU+MH/9+tzCGywENGheh1NamGEwCTREBJZpywBcmk/ZpU52DMv1T9cmN7bLso
	KVQdQQ1J7VSqlz0pzzUYekk+yyK00bZde48hnko4IudmQW4FYfnR2u3pXCegs1oTVZwu
	2fekSSIdhoolUmLmH+MRoPGeE9vQBgd6aAxrIycmMGUZBzlC0OcpscX59wP4WpZwd6ge
	FuGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=yc39066Z59kogedpWcaQBpd11/jl6jgu4mbFiHRcIX8=;
	b=P+5+JiovaOtUSahrLikkMuSCFrMZEjxm7IJxcE4FoBDACkbnmblbumM6klj9wrFZ+N
	h8UkUAFHPhbAHgTM0LBp7V6aWWrm/CdK9ORJO9059BaFZpL8q1VbltqYuaCScb/fwsrK
	7xSGE3H41+mQ3gTamGStFCRDquiotSy4XuTXwZIrdBEbiN5JGT3wespi4/iv31diWkME
	R+EKwD75Zyw7er2YExY9CTMjSHPxVfMgfyaipbJH7K5pVbbv4BuaiDbNak0PC6oJDT0s
	oscMa3sxkp+LATnlt41zqHUy0Jov357Y4yPPjYlTh5CCiKiyy7zsA5r2MeatVlITlSAt
	U4yA==
X-Gm-Message-State: APjAAAWAfri+maZZ/gOTohQohOPpe//TmxfezJsxk6C9JRQPT1kS8XSz
	LkLyF8goiS0Ql+AgeqNExs62w5ub
X-Google-Smtp-Source: APXvYqyEhiYBMFSd1vobIRe5iZtY4HhSAG1XoLmAiwYucYeuywJ7L1nR1lODCf2o/TiSWLS5UxKvYA==
X-Received: by 2002:adf:8061:: with SMTP id 88mr8887988wrk.77.1551612479906;
	Sun, 03 Mar 2019 03:27:59 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id r6sm3773462wrx.48.2019.03.03.03.27.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 03 Mar 2019 03:27:59 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  3 Mar 2019 12:27:44 +0100
Message-Id: <20190303112752.16353-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/9] runqemu: add an option to choose the SDL frontend instead of Gtk+ default
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
X-List-Received-Date: Sun, 03 Mar 2019 11:28:00 -0000

When Gtk+ and SDL are both enabled, qemu defaults to Gtk+.
This option allows to revert to the 'classic' frontend.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 scripts/runqemu | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/runqemu b/scripts/runqemu
index ec6188ba4a2..bbf539a8e67 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -74,6 +74,7 @@ of the following environment variables (in any order):
   MACHINE - the machine name (optional, autodetected from KERNEL filename if unspecified)
   Simplified QEMU command-line options can be passed with:
     nographic - disable video console
+    sdl - choose the SDL frontend instead of the Gtk+ default
     gl - enable virgl-based GL acceleration
     gl-es - enable virgl-based GL acceleration, using OpenGL ES
     egl-headless - enable headless EGL output; use vnc or spice to see it
@@ -404,6 +405,8 @@ class BaseConfig(object):
             elif arg == 'nographic':
                 self.qemu_opt_script += ' -nographic'
                 self.kernel_cmdline_script += ' console=ttyS0'
+            elif arg == 'sdl':
+                self.qemu_opt_script += ' -display sdl'
             elif arg == 'gl':
                 self.qemu_opt_script += ' -vga virtio -display gtk,gl=on'
             elif arg == 'gl-es':
-- 
2.17.1


