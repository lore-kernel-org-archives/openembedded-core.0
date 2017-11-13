Return-Path: <vomegaz@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 90A4E7867F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 19:32:17 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id u40so15416756wrf.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 11:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=w5j6OZJj/SGaLXuSamsuVqnAxJOhJXXWjqNo5+8F08k=;
	b=fBqwoWHtyUXCfCrcLdo1fPuzon70NssXP6ABYE0bHQEptO1tl6QKrWcSvcfCDrklxC
	rDRcaNmVMSRN++E5Y4zV6rrwd6ff6XdfDgcAe+5eEZp9PZ1fRTGxCFCqq/oMKf9juU5v
	KZJVu8HC71EgU7/teV32ormnRkBmHmTCjzi53REUebtz3Z9Os/CX114l74wgZId9aj36
	y7JfhJzmEtvZe7SxZjZvizfjoYnUgdDjLfqP6dBpYCbfimFK0ArAaype9HAdTLEnmkgG
	mOS5mchTISyzRSeEWcE0tk23k15jmHIMHFN2nriIKf6FOWKluJwXyZynpLD3BXPkM/nu
	JMsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=w5j6OZJj/SGaLXuSamsuVqnAxJOhJXXWjqNo5+8F08k=;
	b=gtgpnNdP7PGbQdnU0jLPcn7bXGUM90r/JKprYU7eR4nd7iwgwS0BLZ/CIIrHOGrizq
	IV1gcAM+tNG7Du1qnng66W/U65A+Ia2AkXdCJI4QrPPbkGa1dcPbdVjk8HU0SflgvqiN
	BgJaIccmDk9NLXVLIH9iraWfqjzNjETfVcYtc6CJ1MrrGk6kNuV8v6/MOOYoQiin4oV9
	ewt7Xlb8MDYHp2qof/rDUrO1pdc9XDjI3OEN0gecg/Ri81HeQLQgbc557HGME3zqpMU/
	666fsBMicVCfSFx53wlWlxzA2danHW0wVCRq2Gt5vW3VQrOBGARYWdpog0djBgwWk9Fe
	3x4Q==
X-Gm-Message-State: AJaThX6UfZ1RyW5IX6jP8kDWeWa0FI39g67f+KZJaovc7K8DwAeMwATn
	NplqTcs/5bGN5yvJoTVNx8xHxl1U
X-Google-Smtp-Source: AGs4zMahNxdxg6Jo8ISCCdezNFZ8EVavUBZLRcUh7sBWJNiu1npELHTkVLZTdqXUlPPLUeA9f1R+zQ==
X-Received: by 10.223.128.162 with SMTP id 31mr8312998wrl.258.1510601537888;
	Mon, 13 Nov 2017 11:32:17 -0800 (PST)
Received: from sgxcmp483.sigfox.io (ram31-1-82-234-79-177.fbx.proxad.net.
	[82.234.79.177]) by smtp.gmail.com with ESMTPSA id
	g65sm16418242wmd.16.2017.11.13.11.32.16
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 13 Nov 2017 11:32:17 -0800 (PST)
Sender: Thomas PERROT <vomegaz@gmail.com>
From: Thomas Perrot <thomas.perrot@tupi.fr>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Nov 2017 20:32:13 +0100
Message-Id: <20171113193213.28208-1-thomas.perrot@tupi.fr>
X-Mailer: git-send-email 2.13.6
Subject: [PATCH] kernel-fitimage: Fix bad image type replacement for aarch64
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
X-List-Received-Date: Mon, 13 Nov 2017 19:32:18 -0000

Signed-off-by: Thomas Perrot <thomas.perrot@tupi.fr>
---
 meta/classes/kernel-fitimage.bbclass | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 179185b6b2..9baf399f2e 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -7,9 +7,12 @@ python __anonymous () {
         depends = "%s u-boot-mkimage-native dtc-native" % depends
         d.setVar("DEPENDS", depends)
 
-        if d.getVar("UBOOT_ARCH") == "mips":
+        uarch = d.getVar("UBOOT_ARCH")
+        if uarch == "arm64":
+            replacementtype = "Image"
+        elif uarch == "mips":
             replacementtype = "vmlinuz.bin"
-        elif d.getVar("UBOOT_ARCH") == "x86":
+        elif uarch == "x86":
             replacementtype = "bzImage"
         else:
             replacementtype = "zImage"
-- 
2.13.6


