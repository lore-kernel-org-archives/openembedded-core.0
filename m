Return-Path: <andre.draszik@gmail.com>
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
	[209.85.219.176])
	by mail.openembedded.org (Postfix) with ESMTP id 95EE37BF2E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 12:56:39 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id x9so8560695ybj.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 04:56:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=AI0Y6tSJHGQ6oifepyxcMfOZaXHCmhgAy5teJ9vAYO4=;
	b=DrH9whfGnTV724eV1lSlfWan2zGcF+g5jqNOMiBuxefOZeNYNYfAYP2ibrn8ylGvCq
	jc/uvYDdnboMZr2DiBUa31zsZzQ70BNtvdhaYPjGKhFcvJj65R0nr1O371KZRKS2IS0Q
	OLdF+f+rO5evMIe2ZLeIksd2nIocCyo/xNk82ttLFrqYxgSo+uhWMgN6fnKGlHMqEPkK
	GicVrzBYUVukno1cJiwLGow54+NKBKV1YUe0/S8LBwGGeC2q38fb/zOI7/5ASINRfx/P
	BbOme3yeef3KK+okp0k3SMcgvSjNXARWzwXKQHoJy9oCNjebG0KoCjSVcG27v1me/Eei
	EjZA==
X-Gm-Message-State: AJcUukfxOR+YdY2YFW+bKkVDxIIJS4+aJ++TgeKNhb7o50Hr7Oro28gN
	THBOy1gkRCd8y4xq0Ty85qAsI4ap
X-Google-Smtp-Source: ALg8bN6SgJdMjqPe5wbAI8ilZgxBqktMWBz8yvlOr7jQxAOaHEnrHHl+u1LagT+KcnV2yuhBbbnnMA==
X-Received: by 2002:a25:6652:: with SMTP id z18mr4219534ybm.242.1547470600466; 
	Mon, 14 Jan 2019 04:56:40 -0800 (PST)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	h145sm115143ywc.72.2019.01.14.04.56.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Jan 2019 04:56:39 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Jan 2019 12:56:20 +0000
Message-Id: <20190114125632.4780-1-git@andred.net>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 00/12] RFC: util-linux: one package per binary
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
X-List-Received-Date: Mon, 14 Jan 2019 12:56:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series of patches changes util-linux to splitting into
one package per binary automatically, using do_split_packages()

* the first 5 patches are a general clean-up
* patch 2 could be classed as avoiding a potential crash
* patch 5 is important, as it fixes up some existing packaging
  problems
* the subsequent patches are the actual implementation

The slight 1st problem was that update alternatives was running
right after copying from D to PKGD, and at that point in time
PACKAGES and ALTERNATVE_xxx were expected to be fully populated.
So I changed this slightly, so that util-linux can generate
PACKAGES now right after perform_packagecopy(), but before
update-alternatives processing.

The small 2nd problem was that FILES_${PN} must reference the
renamed file name (after update-alternatives has run). Given
this is quite hard to do automatically when populating packages
using do_split_packages(), I updated update-alternatives to
update the file name in FILES_${PN} if the non-renamed file
was specified in there.
This would also allow updating all recipes to drop knowledge
about that renaming where this is done at the moment.

Finally, I am splitting up the packages, one commit per directory.

Things to note and questions:
* it is unclear to me why util-linux RDEPENDS vs. RRECOMMENDS some
  of the manually splitted packages before this series, and some
  of those pre-existing packages weren't in RRECOMMENDS or RDEPENDS
  at all.
  For that reason, the RDEPENDS on packages from base_sbindir and
  base_bindir that existed before this series, weren't updated,
  only new packages from those two directories have been added
  to RRECOMMENDS of the meta-package.

  I would suggest to drop all RDEPENDS and simply have util-linux
  RRECOMMENDS *all* the packages, but I don't know the origial
  reasoning for that distinction.

* /etc/default/mountall is the only file remaining in the util-linux
  package. I am not sure what to do with it as I coulnd't find any
  user anyway.
  Can it be dropped altogether, should it be moved into the util-linux-mount
  package instead?
  Note that the util-linux-mount and util-linux-umount existed before
  this series, but /etc/default/mountall was still packaged into
  util-linux.

* The pre-existing util-linux-swaponoff is a meta-package now, that
  simply RDEPENDS on -swapon and -swapoff, simply for backwards
  compatibility reasons, but is it really necessary, given people
  can now add -swapon and -swapoff if they want to.
  No harm in keeping it either, though.

* the -dev package RRECOMMENDS some (but not all) of the split -dev
  packages (which don't necessarily exist), e.g. util-linux-losetup-dev
  Should it RPROVIDE those itself instead? Should those be made
  ALLOW_EMPTY? Should the RRECOMMENDS be tweaked?
  What is the preferred approach here?



