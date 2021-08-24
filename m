Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web12.33803.1629769919501415000
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Aug 2021 18:52:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=O89lkXf3;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id BF9AF82D52;
	Tue, 24 Aug 2021 03:51:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1629769916;
	bh=pCxZQTVxR93CB7JS9YxV2MxjkNPjYk9oMda2reqm3b8=;
	h=From:To:Cc:Subject:Date:From;
	b=O89lkXf3M3cX78w17xuFi+jOTItojJY+alWrSAf7AbJP91V6n6HfSZCveoQFMUacO
	 YyvaHWJQF5NsYghxTSBvkwwqMzVRAaPp0m6pFn9tPbc7R+tALYHTQXFb4aPD71fcnt
	 2p6CkDRHgDiQuTp08yn6BJzIwDDXHT5jeuJcZbRybd2/BXpyhsE9xX58MuCU8Aiiri
	 0sgAU6c7NMSzA/O4+90SuzIZbaQYhtu+aR5SJ0Ey6lfvr/exR69Lj6wmWj+yIg5Z8V
	 nDoaohuTnxVwAXJ+Jy3Dt9YG//08B4sLJ0Dxgv8GIbU8SRR/OfEFUCHVQfmI0pWySp
	 V5voYApEUixWQ==
From: "Marek Vasut" <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ross Burton <ross.burton@arm.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Steve Sakoman <steve@sakoman.com>
Subject: [dunfell][PATCH] image_types: Restore pre-btrfs-tools 4.14.1 mkfs.btrfs shrink behavior
Date: Tue, 24 Aug 2021 03:51:36 +0200
Message-Id: <20210824015136.305640-1-marex@denx.de>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Currently the mkfs.btrfs generates large images with a lot of wasted
space. This happens since OE-core updated btrfs-tools from 4.13.3 to
4.15.1 in commit 94b645aa77 ("btrfs-tools: update to 4.15.1") .

Note in mkfs.btrfs(8) manpage section -r says the following:
"
  -r|--rootdir <rootdir>
...
       Note This option may enlarge the image or file to ensure
       it=E2=80=99s big enough to contain the files from rootdir. Since
       version 4.14.1 the filesystem size is not minimized. Please
       see option --shrink if you need that functionality.

  --shrink
     Shrink the filesystem to its minimal size, only works with
     --rootdir option.
...
       Note prior to version 4.14.1, the shrinking was done
       automatically.
"

Add the --shrink option to EXTRA_IMAGECMD_btrfs to reinstate the
original behavior and un-waste the space.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c4a99d36967302c176b62fad840b5e79486ea356)
Cc: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/image_types.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.=
bbclass
index ff42ac9423..6dc0e094d0 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -240,7 +240,7 @@ EXTRA_IMAGECMD_jffs2 ?=3D "--pad ${JFFS2_ENDIANNESS} =
--eraseblock=3D${JFFS2_ERASEBLO
 EXTRA_IMAGECMD_ext2 ?=3D "-i 4096"
 EXTRA_IMAGECMD_ext3 ?=3D "-i 4096"
 EXTRA_IMAGECMD_ext4 ?=3D "-i 4096"
-EXTRA_IMAGECMD_btrfs ?=3D "-n 4096"
+EXTRA_IMAGECMD_btrfs ?=3D "-n 4096 --shrink"
 EXTRA_IMAGECMD_f2fs ?=3D ""
=20
 do_image_cpio[depends] +=3D "cpio-native:do_populate_sysroot"
--=20
2.32.0

