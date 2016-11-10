Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-lf0-f41.google.com (mail-lf0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id 8762371994
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2016 12:18:47 +0000 (UTC)
Received: by mail-lf0-f41.google.com with SMTP id t196so188553897lff.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2016 04:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=HDbVP6zwKVKCpFgn6VIK+ndS1OuxUHIrMBqlJZopmII=;
	b=eR5IQUDGLRxh8I87bbO+OJ/bNIzXArpbSqHTif7looKr/ca5NQgCdaNrH1qNPcQGf9
	QubIf8HKAvQypyVXuKkwpwEmDkzmi0sptmJw6nvC0aq8s34z506REQ4zdvgnurG5ZK2U
	SC9hRh5jkftA7kbPyfilhE4JF0vjPdDEuqHrSSxw7N6Dn2k25RtDHf6DUXixJ5MQ7eQO
	rGVojLyRBJBuHG823KmBNpJo4oTr4tdYFpv2cgaO1hn6Ylrbv6xyXHpL6Dp76ngipYJc
	gw8sPTKzViERkRzSDskiwJfHgcVRSAV02iKt5orCAH72h493sj32fmKj9sAlinQHfBx2
	nAOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=HDbVP6zwKVKCpFgn6VIK+ndS1OuxUHIrMBqlJZopmII=;
	b=E55zOoqG/pmbyaebCLvwpUHXVmR8xlEhbkDTojqMnx7HDguwnIk3rF0Jcj7jS3Q0sR
	WFC36TtaJYgPGOd53UUHhedaJ/fkbEhd5FCRPMLInmXqUjE3YSsGaSxrI0VE6dwSqVMf
	41s2H2Hvk1mqhTGRMTeF25pJQKy/KpqoEzgN5mLCmA9wZLZkmrq/rxW8ehSe2MU6hCkC
	2DK5IFTxEyNYvGJyXOmMMKNbBO2/idQbDeIl28gPC7fPnp8A3OJU9dWiw+n7jvye0hGt
	OKrMzKYD5pnUxq8oXKE7KvbI5uoMTuL375EpLXSmKbtZYx9uj8yIQqODkVsB/57rJSlu
	J2yQ==
X-Gm-Message-State: ABUngvdW5FSS9Wzuwg4KqP/rb3YE0AjnB0RCX1koIclT5PoE0BpgtWRlBgaHGWvVfBTPmw==
X-Received: by 10.25.170.198 with SMTP id t189mr2207780lfe.129.1478780328270; 
	Thu, 10 Nov 2016 04:18:48 -0800 (PST)
Received: from comp_016_pc_buildenv.localdomain
	(staticline-31-182-60-238.toya.net.pl. [31.182.60.238])
	by smtp.gmail.com with ESMTPSA id g5sm934563lfe.47.2016.11.10.04.18.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Nov 2016 04:18:47 -0800 (PST)
From: Maciej Borzecki <maciej.borzecki@rndity.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Nov 2016 13:18:31 +0100
Message-Id: <cover.1478779674.git.maciej.borzecki@rndity.com>
X-Mailer: git-send-email 2.5.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Maciej Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH v2 00/10] wic: bugfixes & --fixed-size support, tests, selftest: minor fixes
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
X-List-Received-Date: Thu, 10 Nov 2016 12:18:49 -0000

v2 of patch series previously posted here [1].

The series introduces anumber of fixes to wic, as well as a new --fixed-size
option applicable to `part` entries in kickstart files. The option makes it
possible to have a fixed size partition, with additional verification that the
file system image fits into the allocated disk space. This is in cotrast with
--size option, which the minimum size, and partition may in fact be larger in
the final disk image.

The series introduces two tests that verify if wic has created the image with
properly sized partition and that partition size checks work as expected.

Patch `oe-selftest: fix handling of test cases without ID in --list-tests-by` is
a small bugfix for oe-selftes tool which resolves an issue triggered by Python
3.x being more strict than 2.x.

[1]. http://lists.openembedded.org/pipermail/openembedded-core/2016-November/128540.html

Maciej Borzecki (10):
  wic: make sure that partition size is always an integer in internal
    processing
  wic: use partition size when creating empty partition files
  wic: check that filesystem is specified for a rootfs partition
  wic: fix function comment typos
  wic: add --fixed-size wks option
  oe-selftest: fix handling of test cases without ID in --list-tests-by
  wic: selftest: avoid COMPATIBLE_HOST issues
  wic: selftest: do not repeat core-image-minimal
  wic: selftest: do not assume bzImage kernel image
  wic: selftest: add tests for --fixed-size partition flags

 meta/lib/oeqa/selftest/wic.py                 | 193 ++++++++++++++++++++------
 scripts/lib/wic/help.py                       |  14 +-
 scripts/lib/wic/imager/direct.py              |   2 +-
 scripts/lib/wic/ksparser.py                   |  41 +++++-
 scripts/lib/wic/partition.py                  | 104 +++++++++-----
 scripts/lib/wic/plugins/source/bootimg-efi.py |   2 +-
 scripts/lib/wic/plugins/source/rawcopy.py     |   4 +-
 scripts/lib/wic/utils/partitionedfs.py        |   6 +-
 scripts/oe-selftest                           |  13 +-
 9 files changed, 282 insertions(+), 97 deletions(-)

-- 
2.5.0


