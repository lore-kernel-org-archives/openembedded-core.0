Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f46.google.com (mail-it0-f46.google.com
	[209.85.214.46])
	by mail.openembedded.org (Postfix) with ESMTP id 9B4687842E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Feb 2018 22:03:14 +0000 (UTC)
Received: by mail-it0-f46.google.com with SMTP id 196so4253282iti.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Feb 2018 14:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=5TanbjK/wrL1VOA6aZArgkG4RLpMz5VLgJxq+6KP9Us=;
	b=P25wD9JcjQKXcUwx3U4nDY35dtLLaiECmHiUhz9/NoHqluSUrcmivEn94dJBE0OwHx
	WMdxsBZQeWdugBH55KVMdAGEjOxsOecYoH0+/8Ww9uVKkSFQKnvsbv7+fWtkn9P0hRjF
	yqt+v/KoMN9adQF6+GkGSrz2vNhmIiipF1rxsHFN/Db7jAcgeVcke9EIv7jpl6hiLhGV
	J13tArBmMX2q39UNBg/jPfDE2i0zRx6GIdY7CyMB5wV//5S/SgwoqWfqxFVZsgnYnk12
	q6LW8jg36SHuV73SroiWO7x5R04tFZlpTMNgcuyEgFTwb1uTvsgUQZ8qcgn/UYwqmL5P
	ah9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=5TanbjK/wrL1VOA6aZArgkG4RLpMz5VLgJxq+6KP9Us=;
	b=X7vT0CIMtptXbPti5PO9FLnW5IFbAbSPCN4QKcedNl2ZIvlExWj7/+2zFg+4QtlmpE
	Y4jj/FHEm54iY4DOY2f5MF/ri5lIHgt6189OILakoMnFiCv5axNJA10NNT0VTFof9/14
	FuHV9r2NBEsiIWhFyFI7kmuoxbtq3hx+XQAdPtVPIAHPUuH15FAqdRmFZGep9qgjZHPY
	S57gNut+UuBU0d8yI0AOTR9mrO6B3PEFRBSNTgdzDuKLxLlILvkDUfkmuREIReva5DD6
	YZjNv5jfuxh2ykLv66Xjr26hedDyBDrldlk+4bHxZdo7gZbMXm/sS+K2ieH1R8PyTweM
	e1gA==
X-Gm-Message-State: APf1xPDFGaNMm0MhNNAGAYfPl0xEbFRtTTONGU7Rt2EyU7xjZIP+YwEV
	BdV6Dk67H8QLktqoq/eNn6blZLNO
X-Google-Smtp-Source: AH8x224lzLVbjtZ/utbzx7XCwkEjqnKlbK13wi0FmUUt4Z7xm4OP0l5ln6YIctVV2tabBcsAkz2nFA==
X-Received: by 10.36.217.131 with SMTP id p125mr4838396itg.62.1517954595454;
	Tue, 06 Feb 2018 14:03:15 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	g69sm294785ita.9.2018.02.06.14.03.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 06 Feb 2018 14:03:14 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Date: Tue,  6 Feb 2018 16:01:19 -0600
Message-Id: <cover.1517857764.git.JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.14.3
Subject: [PATCH 00/14] Fix support for Icecream
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
X-List-Received-Date: Tue, 06 Feb 2018 22:03:14 -0000

Fix up support for using Icecream to do distributed builds, which
appears to have been broken for some time.

In addition, Icecream support can now be enabled in the SDK. When
enabled, the SDK install process will check if the host supports icecc
and if so will construct a proper environment tarball and use it when
compiling.

Most of the changes should be straightforward. icecc-create-env has
been almost completely re-written but the changes were broken up into
hopefully logical chunks.

The following changes since commit 385944254d0ef88bd6450a221a54cbcb40020b42:

  tcmode-default.inc: drop preferred version of gzip-native (2018-01-31 17:01:20 +0000)

are available in the Git repository at:

  git://push.yoctoproject.org/poky-contrib jpew/icecream

Joshua Watt (14):
  icecc.bbclass: Move to shared work directory
  icecc.bbclass: Fix STAGING_BINDIR_TOOLCHAIN usage
  icecc.bbclass: Skip canadian-cross compiles
  icecc-create-env: Reformat
  icecc-create-env: Add /bin/true to environment
  icecc-create-env: Use program interpreter for deps
  icecc-create-env: Symlink alternate names
  icecc-create-env: Archive directory
  icecc-create-env: Fix executable rpaths
  icecc-create-env: Add support for nativesdk
  icecc-create-env: Allow multiple tool aliases
  toolchain-shar-extract: Add post-relocate scripts
  icecc-toolchain: Add SDK icecream setup
  icecc.bbclass: Add IceCream support to SDK

 meta/classes/icecc.bbclass                         |  37 ++-
 meta/classes/toolchain-scripts.bbclass             |  15 +
 meta/files/toolchain-shar-extract.sh               |   8 +
 meta/recipes-core/meta/meta-environment.bb         |   2 +
 .../icecc-create-env/icecc-create-env              | 328 ++++++++++++++-------
 ...e-env-native_0.1.bb => icecc-create-env_0.1.bb} |   4 +-
 .../icecc-toolchain/icecc-toolchain/icecc-env.sh   |  37 +++
 .../icecc-toolchain/icecc-toolchain/icecc-setup.sh |  43 +++
 .../nativesdk-icecc-toolchain_0.1.bb               |  38 +++
 9 files changed, 390 insertions(+), 122 deletions(-)
 rename meta/recipes-devtools/icecc-create-env/{icecc-create-env-native_0.1.bb => icecc-create-env_0.1.bb} (98%)
 create mode 100644 meta/recipes-devtools/icecc-toolchain/icecc-toolchain/icecc-env.sh
 create mode 100644 meta/recipes-devtools/icecc-toolchain/icecc-toolchain/icecc-setup.sh
 create mode 100644 meta/recipes-devtools/icecc-toolchain/nativesdk-icecc-toolchain_0.1.bb

-- 
2.14.3


