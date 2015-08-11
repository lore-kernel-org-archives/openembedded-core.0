Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 1F2AE762D6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 08:45:07 +0000 (UTC)
Received: by ioeg141 with SMTP id g141so195168478ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 01:45:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=q8vc2PrhNLKSUm/ilpbLGFvVjIruhdDfnUqUba6zmCg=;
	b=CbkBdAImkfrpjDQUkcmVXNd+PjB/93IfA8cnXul6z2h2r52TY0kSeR+LWVuiNVGnE/
	W0BZwvje5XsCkURTu2DPiAZ0x+4KqF4SMk2WyGa/e7h91HzlwnLBWexvEeyT0jWc1Eib
	pkWiIegN93jNPWSKl4T3G0NapEqSlD+saCVj6pEFrdH15StcDCT6utb9X98Sv3pkmwFp
	LgcjPGDamA0Cpj2VbzE2OrygUMEA1FEBnCwVdIOWy4/zSpZsr5IN8YumSzjw6dxB8Zdr
	QxSpZjLw4AbVc9hvx5H0WtnSCdkgEf1zDjMNLKlYf6ARu0zLetRZLTJ1NY+cq3X5B9YG
	eY7w==
X-Gm-Message-State: ALoCoQnZzX16WAqf/Bd1W4/miYAsczM6+UhvxaEwXN/7v3oAqcBLet2JPeAyw2FVe2VA6HBWUbvq
X-Received: by 10.107.164.153 with SMTP id d25mr25602592ioj.189.1439282707797; 
	Tue, 11 Aug 2015 01:45:07 -0700 (PDT)
Received: from pohly-mobl1.ger.corp.intel.com (p5DE8C212.dip0.t-ipconnect.de.
	[93.232.194.18]) by smtp.gmail.com with ESMTPSA id
	bd7sm7684942igb.19.2015.08.11.01.45.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 11 Aug 2015 01:45:07 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Aug 2015 10:44:57 +0200
Message-Id: <cover.1439281753.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/3] preserve xattrs in images
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
X-List-Received-Date: Tue, 11 Aug 2015 08:45:08 -0000

Both Smack and IMA/EVM rely on xattrs in the rootfs. This works for
.ext3/.ext4 images, but not for .jffs2 and .tar.bz2. These changes
allow optionally building also such images with xattrs without
changing the default (which still is to ignore xattrs in .jffs2 and
.tar.bz2).

The default does not get changed because supporting xattrs causes a
certain overhead (need to build GNU tar, additional system calls when
creating the images).

See https://github.com/01org/meta-intel-iot-security/pull/34 for code using
these changes.

The following changes since commit 5094354a2811825e6d60963f03959daa349cab23:

  bind: upgrade to 9.10.2-p3 (2015-08-09 15:14:32 -0700)

are available in the git repository at:

  git://github.com/pohly/openembedded-core xattr
  https://github.com/pohly/openembedded-core/tree/xattr

Patrick Ohly (3):
  tar-replacement-native: avoid race condition with host tar
  image_types.bbclass: allow replacing tar command
  mtd-utils: keep xattr support enabled

 meta/classes/image_types.bbclass                         | 13 ++++++++++++-
 meta/recipes-devtools/mtd/mtd-utils_git.bb               |  2 +-
 meta/recipes-extended/tar/tar-replacement-native_1.28.bb | 14 +++++++++++++-
 3 files changed, 26 insertions(+), 3 deletions(-)

-- 
2.1.4


