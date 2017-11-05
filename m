Return-Path: <vomegaz@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 544B6783E8
	for <openembedded-core@lists.openembedded.org>;
	Sun,  5 Nov 2017 22:43:32 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id l18so3501344wrc.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Nov 2017 14:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=Rbju5TG0T08VIfFm+yOZznDG5I3fwaGxpMhcaHjs2FM=;
	b=tGw/JvX/NyH97V7G0FQCUIbH5V7IVkzuvOafdLxBk1+EklFbJWkx6fkS6vPP0psX+9
	8bg5gWG6HhXvo8xXFX4cFXx2HRLP/QNTsRe5r8gwF8rAmMAZ7wG2FS+6iEya98cBEmK9
	0kC6g8b4O3MnKn7LOb1XoNVKqUD8QNSDxau36R4C0dLdjUszorkDLCvs1uI4K75vWTRJ
	lHvOKGqeIOcGOpv9/pDP0Q839wfbA6KpVDm2wJCPu0s5etgdvtLGXWAt1r4G14026ilA
	cR80rVumXKzoeOgSprgf0Ujr+zCm1kNBpjL5UKpNPczmCrNmU2y80zxMv2g4mp42J19m
	LwXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=Rbju5TG0T08VIfFm+yOZznDG5I3fwaGxpMhcaHjs2FM=;
	b=RKN72tmvnpp4t/wtN7nie8IXtCEwVDDPgeyBASKha68SHNYazZvqZAICYfBtkakC0s
	knuILOdM6gegQxmwzscpcUBMluRHKlg2TbsFkk9bc24btYvq3VZxLe3PI55SnQ+oPh+K
	ecBCAgkgg8KGjzEo9FCTxg4THtjLzwM/tVAtDJlWAkLPM140KXuJaQDynkR2qrKlN0Jv
	6PPJ8MmJfHpONz5BmX+HlAj7H4K5eSef3HfAi5B31faPaCYC8mOOXljwmyoLUUjuPXSa
	X1f+0h+mEMUlboY9wn4fwFmUBSPd3wzXswqDv6ZSZco6iQ9sKCUjjS/7HSnMhwTsrdFT
	UYkg==
X-Gm-Message-State: AMCzsaXWHfb45Fnx4Vm87Ha5IKRdr02sBVghfBuWK7WUBdrUmJjmwfoL
	q3w+tgmMM2SzCnAqunyGi0UVtDka
X-Google-Smtp-Source: ABhQp+TGMomo54l5WHdMXx49CfAnGYEjTmPXXlzLuGrPi+xCHsGlEFj02KKV7DbeMh1/JsrjI4sJhQ==
X-Received: by 10.223.155.208 with SMTP id e16mr11543585wrc.161.1509921813637; 
	Sun, 05 Nov 2017 14:43:33 -0800 (PST)
Received: from sgxcmp483.sigfox.io (ram31-1-82-234-79-177.fbx.proxad.net.
	[82.234.79.177]) by smtp.gmail.com with ESMTPSA id
	k9sm13707589wrk.88.2017.11.05.14.43.32
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 05 Nov 2017 14:43:32 -0800 (PST)
Sender: Thomas PERROT <vomegaz@gmail.com>
From: Thomas Perrot <thomas.perrot@tupi.fr>
To: openembedded-core@lists.openembedded.org
Date: Sun,  5 Nov 2017 23:43:29 +0100
Message-Id: <20171105224329.25007-1-thomas.perrot@tupi.fr>
X-Mailer: git-send-email 2.13.6
Subject: [PATCH] runqemu: correct rootfs setup to boot an ide hddimg
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
X-List-Received-Date: Sun, 05 Nov 2017 22:43:33 -0000

vm_drive variable is malformed when the drive type is an ide device.

Signed-off-by: Thomas Perrot <thomas.perrot@tupi.fr>
---
 scripts/runqemu | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index f0ddeea1bf..7d3b69bc01 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -990,7 +990,7 @@ class BaseConfig(object):
                                        % (self.rootfs, rootfs_format)
                     elif drive_type.startswith("/dev/hd"):
                         logger.info('Using ide drive')
-                        vm_drive = "%s,format=%s" % (self.rootfs, rootfs_format)
+                        vm_drive = "-drive file=%s,format=%s" % (self.rootfs, rootfs_format)
                     else:
                         # virtio might have been selected explicitly (just use it), or
                         # is used as fallback (then warn about that).
-- 
2.13.6


