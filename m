Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web08.3626.1627403121437607787
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jul 2021 09:25:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=N0Fu5d48;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 50CF083205;
	Tue, 27 Jul 2021 18:25:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1627403118;
	bh=PJ0f2an1zFYMg3H4FTj7u4uhSMwoCZn9OLjt4nXqghY=;
	h=From:To:Cc:Subject:Date:From;
	b=N0Fu5d48KDJMzPRMVme4cqa4t7oRPJ+D75qGwFCmuQ0wIIncVFxeXReWNoREo5dwA
	 I2BiEokzzH1GpcH2w1uBSOnd8f+YG7oXsuJYpsDvpLlJZYCGUAEncXwg86nI6fDy8h
	 XeZCAKPSWLIlTRa3XahWxUdII8SSyUxNfNJQYKGvWcvokdTS1WzfV3UyVpOfAWXZ1F
	 9ACX3KQ2es257Rhpk9Zk66mc3KFRsZN9wUDXen73JISB8DcfWrm+0CEOFg42kO2YmX
	 EW86/VVe+zRGwP3+4mgjS4BTeydz31GqDgtLBVAVf6ngL62xACsrd03WrCtGD1hm62
	 LbKpr4Vjflf/g==
From: "Marek Vasut" <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ross Burton <ross.burton@arm.com>
Subject: [PATCH] image_types: Restore pre-btrfs-tools 4.14.1 mkfs.btrfs shrink behavior
Date: Tue, 27 Jul 2021 18:25:04 +0200
Message-Id: <20210727162504.9553-1-marex@denx.de>
X-Mailer: git-send-email 2.30.2
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
---
 meta/classes/image_types.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.=
bbclass
index 954d6739ec..6b28cdbb3c 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -230,7 +230,7 @@ EXTRA_IMAGECMD_jffs2 ?=3D "--pad ${JFFS2_ENDIANNESS} =
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
2.30.2

