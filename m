Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id DB2AB6E688
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 07:47:17 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id g23so64573718wme.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 23:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=MEz3WJ+GRcMCecyufe83zgY5MHXedrXNGacBGTS8/3s=;
	b=hubEXB0EvvcbxsLOY78bU0O5KHxhwqFf2Q/n8umRodtgrT5D7x4rms9eX3CzkDU2Pt
	OeG+FbW6sZxglBX/76Y3aOq25oUzeJLCM3Ud5jCCQMQMz43Y4H8NhxixVbvlBNL+Tcm1
	i1e96+1dqMjz14FDPmNPtf+go4xf/GdK8xkZTHkURYzazjCkvrN5328gAHs/sKwEM2+g
	2GYO+AxsaX7I2PiNsakL95vVhXHwE7Ht+EHylTBzLCYw0lZsTVDZknmhhDKKWG0SgzPe
	6tNEuJDfoAwcAP+dqUp1CrBMeAujISBj1xZzMQFZXkmNyhR1NICPhny/R++yjvEc5L3S
	evnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=MEz3WJ+GRcMCecyufe83zgY5MHXedrXNGacBGTS8/3s=;
	b=UbSphfca5YVLxm2L9IoLZlZv035dpTLm6D8nukO54Y6uvoapvc6MJ+hsEttL07V4qZ
	HELL5WxSN4jl7divjArOoiBOXhzuCuDPXk5Nksi9CRIbiVZvpZPL/V/xCPbgMhSQwufp
	dFdUgsBW9QcFxXLp27KSy3phacv1lBO0d7whuKScDblheJxrg+NYk53r/Oo9TTNZVCvz
	Chf5DACw/3ACK7HOaI+nuf9nS3Noo+pKml8t9crvnzEqc+jKLFpixL5Ad+qLDA88f3Jx
	v6mvLjt2ByYQDPDGmVmyYYJzooW/ekIoAN720Qs6SyW8fwY5zVqFqZC/csmfbXEx+j9B
	TuOg==
X-Gm-Message-State: AKaTC01bgJD8o/zOo3ZOxTCqH5ufDwpxf/tb4jJrWxBlPAmVu2Omfd65Ny3N7HAE8EfV+w==
X-Received: by 10.25.20.199 with SMTP id 68mr421114lfu.111.1479887238582;
	Tue, 22 Nov 2016 23:47:18 -0800 (PST)
Received: from comp_016_pc_buildenv.localdomain
	(staticline-31-182-60-238.toya.net.pl. [31.182.60.238])
	by smtp.gmail.com with ESMTPSA id
	f25sm6988635lji.47.2016.11.22.23.47.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Nov 2016 23:47:17 -0800 (PST)
From: Maciej Borzecki <maciej.borzecki@rndity.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Nov 2016 08:46:26 +0100
Message-Id: <cover.1479887010.git.maciej.borzecki@rndity.com>
X-Mailer: git-send-email 2.5.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Maciej Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH v4 0/7] wic: bugfixes & --fixed-size support, tests, oe-selftest: minor fixes
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
X-List-Received-Date: Wed, 23 Nov 2016 07:47:19 -0000

v4 of patch series previously posted here [1].

Some of the patches that were posted as part of v3 are already in master. This
version contains only the patches that were not merged yet.

Changes since v3:

* Running wic tests on Ubuntu resulted in test_fixed_size to fail. The reason
  was that `parted` is not a part of the base system, but is needed for
  verification of wic-produced partition layout. Parted is built as part of wic
  dependencies, hence oeqa/utils/commands.py:runCmd() was extended to include a
  new paramter - native_sysroot. This allows runCmd() to run binaries from
  STAGING_DIR_NATIVE{/sbin,/usr/bin,/usr/sbin}.

[1]. http://lists.openembedded.org/pipermail/openembedded-core/2016-November/128785.html

Maciej Borzecki (7):
  oe-selftest: enforce en_US.UTF-8 locale
  oeqa/utils/commands.py: allow use of binaries from native sysroot
  wic: add --fixed-size wks option
  wic: selftest: avoid COMPATIBLE_HOST issues
  wic: selftest: do not repeat core-image-minimal
  wic: selftest: do not assume bzImage kernel image
  wic: selftest: add tests for --fixed-size partition flags

 meta/lib/oeqa/selftest/wic.py          | 234 +++++++++++++++++++++++++++------
 meta/lib/oeqa/utils/commands.py        |   9 +-
 scripts/lib/wic/help.py                |  14 +-
 scripts/lib/wic/imager/direct.py       |   2 +-
 scripts/lib/wic/ksparser.py            |  41 +++++-
 scripts/lib/wic/partition.py           |  88 ++++++++-----
 scripts/lib/wic/utils/partitionedfs.py |   2 +-
 scripts/oe-selftest                    |   3 +
 8 files changed, 307 insertions(+), 86 deletions(-)

-- 
2.5.0


