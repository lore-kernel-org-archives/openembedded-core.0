Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f46.google.com (mail-it0-f46.google.com
	[209.85.214.46])
	by mail.openembedded.org (Postfix) with ESMTP id 2A02C78259
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Feb 2018 16:52:21 +0000 (UTC)
Received: by mail-it0-f46.google.com with SMTP id k131so7457264ith.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Feb 2018 08:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=HMIUFVaDyNb6Ql5lRh4Y5o+OACxoXovB9wIemjmYEnk=;
	b=TAsbxWY8E1gaig+1+EcVI6O0uLMksTL/dYGHmVa7340kT7QVgu9wUNLoclKAuHDVbq
	s6HZfGvXRLECSEmTFOW8eMGJZLqMg9Kwu42ozm933P7V5U44Ai9TZQmwpmqqzcs+IQYa
	6UIf3ejP9Nlh8BDjxSujQDp/g3B7RglFxBdfuzKLTolRiePEleS9hLHXgnpOyaBFr5IN
	c5oeva5D5dgcip7NkKMQXDrJkX/uEDNyZwm53vR+ShF4VJwVnKAlNgWWd3XkFLVB66Y3
	EGmNIeWVed/3KyoS5eHQG7LN7G+93fe/PLGppr+3t477RE576Sm03nU6uY01t4uWrLV8
	fRSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=HMIUFVaDyNb6Ql5lRh4Y5o+OACxoXovB9wIemjmYEnk=;
	b=a6saVB5bbIDx36e2sjjBi3dZo2ySH675M42l/B2Ujr49q3uTHDP4qKkCjViXYfd+5o
	4Mfoy/gNKFLyCxuYujZHPAxfkXw6uukTRPbXX6MU7bRIFqF7bI9B7u/Pkw3u8SuXWOEM
	BVXrhWn2kbFOyH09KV39Rist8irpSo5QYiPcEp+ZYwR+2d25Ykb80yQB0lJZlP2mArJU
	WxrW7oWmKQuzZjZMH1vrgWxp4nEwceqQoePXagWO8BZQo1tZBUc3LFEWHp6TZs6F9rXi
	4/p+Q3DwTDJAyXffgXOZGsiZLL0ejRCvW/vlNnXb98cJ/a4fRIVp2ksR65a909PfG1n0
	bNTg==
X-Gm-Message-State: APf1xPA20bJCbBglcUXkG/TxIbmbG240dmNPEDMdpkworeCd+ZJrvab5
	yN2UZHafSl/UNzCGXhwX/MQS0nps
X-Google-Smtp-Source: AH8x224m0COCEvL4MzMM3IuDOm0HUHSbBGgXWg32Q+gsYSV7/VO66D3N6yWQ7arbR/Nw5DngPxWvDg==
X-Received: by 10.36.249.129 with SMTP id l123mr6528722ith.30.1518454343088;
	Mon, 12 Feb 2018 08:52:23 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	w132sm12206760iow.51.2018.02.12.08.52.22
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 12 Feb 2018 08:52:22 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Date: Mon, 12 Feb 2018 10:51:55 -0600
Message-Id: <cover.1518453683.git.JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <cover.1517857764.git.JPEWhacker@gmail.com>
References: <cover.1517857764.git.JPEWhacker@gmail.com>
Cc: Tomas Novotny <tomas@novotny.cz>
Subject: [PATCH v2 00/17] Fix support for Icecream
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
X-List-Received-Date: Mon, 12 Feb 2018 16:52:22 -0000

Fix up support for using Icecream to do distributed builds, which
appears to have been broken for some time.

In addition, Icecream support can now be enabled in the SDK. When
enabled, the SDK install process will check if the host supports icecc
and if so will construct a proper environment tarball and use it when
compiling.

Most of the changes should be straightforward. icecc-create-env has
been almost completely re-written but the changes were broken up into
hopefully logical chunks.

V2:
  * Default ICECC_CARET_WORKAROUND = "0" which greatly speeds up build
    times in recipes with a lot of warnings. (Thanks to Tomas Novotny
    <tomas@novotny.cz>)
  * Fix elfutils build when ICECC_CARET_WORKAROUND = "0"
  * Minor fixes to commit messages and patchtest failures

The following changes since commit 44ea6ded0e8e73f5258ce55bd1b851e24243b76a:

  bitbake: bitbake-user-manual: Commented out Placeholder Paragraph (2018-02-06 18:10:35 +0000)

are available in the Git repository at:

  git://push.yoctoproject.org/poky-contrib jpew/icecream

Joshua Watt (17):
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
  icecc.bbclass: Add Icecream support to SDK
  icecc.bbclass: Disable caret workaround by default
  icecc-toolchain: Disable caret workaround
  elfutils: Use fallthrough attribute

 meta/classes/icecc.bbclass                         |  57 +-
 meta/classes/toolchain-scripts.bbclass             |  15 +
 meta/files/toolchain-shar-extract.sh               |   8 +
 meta/recipes-core/meta/meta-environment.bb         |   2 +
 meta/recipes-devtools/elfutils/elfutils_0.170.bb   |   4 +-
 .../files/0001-Use-fallthrough-attribute.patch     | 791 +++++++++++++++++++++
 .../elfutils/files/debian/fallthrough.patch        |  36 -
 .../icecc-create-env/icecc-create-env              | 328 ++++++---
 ...e-env-native_0.1.bb => icecc-create-env_0.1.bb} |   4 +-
 .../icecc-toolchain/icecc-toolchain/icecc-env.sh   |  49 ++
 .../icecc-toolchain/icecc-toolchain/icecc-setup.sh |  43 ++
 .../nativesdk-icecc-toolchain_0.1.bb               |  38 +
 12 files changed, 1214 insertions(+), 161 deletions(-)
 create mode 100644 meta/recipes-devtools/elfutils/files/0001-Use-fallthrough-attribute.patch
 delete mode 100644 meta/recipes-devtools/elfutils/files/debian/fallthrough.patch
 rename meta/recipes-devtools/icecc-create-env/{icecc-create-env-native_0.1.bb => icecc-create-env_0.1.bb} (98%)
 create mode 100644 meta/recipes-devtools/icecc-toolchain/icecc-toolchain/icecc-env.sh
 create mode 100644 meta/recipes-devtools/icecc-toolchain/icecc-toolchain/icecc-setup.sh
 create mode 100644 meta/recipes-devtools/icecc-toolchain/nativesdk-icecc-toolchain_0.1.bb

-- 
2.14.3


