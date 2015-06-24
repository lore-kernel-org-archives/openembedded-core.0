Return-Path: <kergoth@gmail.com>
Received: from mail-ie0-f170.google.com (mail-ie0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id D29696AC1E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jun 2015 22:17:42 +0000 (UTC)
Received: by iecvh10 with SMTP id vh10so42848143iec.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jun 2015 15:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=JiXCgCZj6KTK+sW9K0jSG51MzccjOoxZcqVj2BNvSyY=;
	b=BfkoNZQL3nSVyCnIW7Cehtrpo8q2q3RWLftkAOTvK8gdi2Sd3uaHt+6SmddVM3E3UY
	BUsmzH2NkY1b5tFGjybxjJnMaOcggBaO/yL4/oCUq5vZ3LsIMJBrJ9Y5r7C5cyhQ6/RR
	01//cJzvSJwHStlsbYTXMtW1BrwudpVzAt+TqSd9yW5edO3vuJ51HgrMU5KTrlhJKF12
	9cja+w+OpnM24xoptH4SwiH1+ELtObrB49v02sU54MMBcg5e7Zl8/YThARN5srYW62N1
	mZtN9PGFI/3fHUZSXn2J4s9QP4FnS0yAlLk67VizJpubeYkIcc3AZn1ZOirZYVvtH7WX
	VMYg==
X-Received: by 10.50.59.211 with SMTP id b19mr41165igr.42.1435184263459;
	Wed, 24 Jun 2015 15:17:43 -0700 (PDT)
Received: from quark.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id r4sm1971015igh.9.2015.06.24.15.17.41
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Jun 2015 15:17:42 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Jun 2015 15:17:22 -0700
Message-Id: <cover.1435183929.git.kergoth@gmail.com>
X-Mailer: git-send-email 2.2.1
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 0/3] recipetool: add appendsrcfile(s) sub-commands
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
X-List-Received-Date: Wed, 24 Jun 2015 22:17:43 -0000

This adds the `appendsrcfile` and `appendsrcfiles` sub-commands, which let the
user add or replace one or more files in the recipe sources, either in a path
relative to `S` or `WORKDIR`. Each file gets added to `SRC_URI` as a file://
URI, using the subdir= parameter to specify the destination directory.

Examples:

    # Adds our defconfig as file://defconfig. If it's already in SRC_URI, it
    # won't be duplicated.
    recipetool appendsrcfile --workdir meta-mylayer linux-mel defconfig
    recipetool appendsrcfiles --workdir meta-mylayer linux-mel defconfig

    # Does the same, handling the different local filename
    recipetool appendsrcfile --workdir meta-mylayer linux-mel defconfig.mine defconfig

    # Adds our device tree files to the source tree
    recipetool appendsrcfiles --destdir arch/arm/boot/dts meta-mylayer linux-mel *.dts

Of course, for the latter example to be of use, the new dts files would need
to be added to `KERNEL_DEVICETREE` as well, and depending on the kernel,
`DEFCONFIG` or `KERNEL_DEFCONFIG` may need to be set.

The following changes since commit 2587b83faabdc8858e8746201805369ed8d53ba8:

  wpa-supplicant: Revert "Make SystemD D-Bus config conditional" (2015-06-24 14:03:25 +0100)

are available in the git repository at:

  git@github.com:kergoth/openembedded-core recipetool-appendsrc

for you to fetch changes up to 375bea6b623a20b529a2d26c226c55785a21f9e8:

  recipetool: add appendsrcfile(s) sub-commands (2015-06-24 15:10:55 -0700)

----------------------------------------------------------------
Christopher Larson (3):
  oe.recipeutils: fix line.split error in bbappend_recipe
  recipetool.append: use argparse types for validation
  recipetool: add appendsrcfile(s) sub-commands

 meta/lib/oe/recipeutils.py       |   2 +-
 scripts/lib/recipetool/append.py | 147 +++++++++++++++++++++++++++++++++------
 2 files changed, 126 insertions(+), 23 deletions(-)

-- 
2.2.1


