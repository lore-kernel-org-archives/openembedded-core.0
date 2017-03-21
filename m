Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-lf0-f50.google.com (mail-lf0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id 84A2D77925
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Mar 2017 11:35:32 +0000 (UTC)
Received: by mail-lf0-f50.google.com with SMTP id z15so66094315lfd.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Mar 2017 04:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=LetyT4g6BX2AT/MTufJq+fv1VQncDA7e+yJmiFqGnuQ=;
	b=BwCPqFpGk4rfiM/DsZlPJ0gIva7jKgDqqfW2GCs9I6112f8jfod8ARjqaPFveFr5gM
	1sbGBzC81lUPRlbB8XoybtQ2XfRcdiuK+cQBKhBOD0xREHLLpYvVu/iF/bD8C5Dx2nBe
	lCxyOUTyePnX8X2Ckwq3YX4+j3/sXmmjmEKA29P7Y+sQD7BnuwgSebQfewlgcAlnhluS
	cXEl5Xd2hWpoVsr/QcNMkA4jr6C0SEqfBrKT3+2WVme6HiA2jAI69JVt/jitftLZwW39
	rpYoAS2kOe3Ccv7HYXHfotxdh6gZ3BA3Iu5diHZp9ycHUcd3lAuL+/OAuKNGpBg7ySBD
	rTtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=LetyT4g6BX2AT/MTufJq+fv1VQncDA7e+yJmiFqGnuQ=;
	b=ZApm0pCKiKN1GO3KwUfmUD5L6yRFKZcHk9D8BSSmf+yLR10uCWAdg8j3qYUiBZ1zzH
	nZ8wuUAAEqHnt+pkeZwqkDvdukDe7aJvl0EZn8/ug1gy84Vzh9jHKs8MYV5tgTgBlDu7
	VeYkfYM/OpQtK4K3mhrxYIlHuAad2xFatQQiZPfd9OVqC3EfPQ3LY1XEaGXs9Ojl9dUW
	Ilp4WZJf2/FOgKd811NqhZu2eVbzZCRNkS/RjlKaqoqdJlu5GdQ9ajWulfs1i0P9hd+E
	13m04wYJ/9AGcp9E4z/1qJNNYkj9KLfcA1yzUTYrSJoxmTvJzz2QABxVFh+DMzlLVk86
	/9Lg==
X-Gm-Message-State: AFeK/H1DgaN2Hm2NpTQ1JROw8GVkYSQj62nJts7up81Wirg1ncg3116NP44WD52KxtxYYA==
X-Received: by 10.46.0.148 with SMTP id e20mr11451383lji.41.1490096133136;
	Tue, 21 Mar 2017 04:35:33 -0700 (PDT)
Received: from localhost.localdomain (staticline-31-182-60-238.toya.net.pl.
	[31.182.60.238]) by smtp.gmail.com with ESMTPSA id
	f28sm3516079lfi.52.2017.03.21.04.35.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Mar 2017 04:35:32 -0700 (PDT)
From: Maciej Borzecki <maciej.borzecki@rndity.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Mar 2017 12:35:00 +0100
Message-Id: <cover.1490095649.git.maciej.borzecki@rndity.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170317144027.GA22297@linux.intel.com>
References: <20170317144027.GA22297@linux.intel.com>
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH v4 0/5] wic: selftest: enhancements for non-x86 MACHINE support & fixed-size tests
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
X-List-Received-Date: Tue, 21 Mar 2017 11:35:33 -0000

v4 of a series with enhancements and new test cases for wic selftest.
The enhancements allow for running wic selftest for non-x86 MACHINE,
such as qemuarm (the whole series was verified on qemux86-64 and
qemuarm).

The first patch adds a machine independent kickstart file - wictestdisk.
Most of test cases build a disk image using one of the kickstart files
shipped in Poky (mostly directdisk. These are usually x86 oriented due
to use of syslinux and cannot be used when running with non-x86
compatible MACHINE. On the other hand, the image built during tests does
not need to be bootable (with exception of TCs that verify if the image
is indeed bootable).

Patch 2 introduces wictestdisk in test cases where its use is possible.

Patch 3 adds only_for_arch() convenience decorator and applies it to test
cases where x86 specific image must be used. In the end, only 13 TCs are
skipped on qemuarm.

Changes from previous version:
- renamed onlyForArch() to only_for_arch(), changed input arguments to
  take image name and list of compatible architectures
- pylint fixes

Patch 4 removes some assumptions about kernel image type.

Patch 5 adds tests for --fixed-size partition flags.

Changes from previous version:
- pylint fixes

Maciej Borzecki (5):
  selftest: wictestdisk: machine agnostic WKS for use with selftest
  selftest: wic: replace directdisk with wictestdisk where possible
  wic: selftest: avoid COMPATIBLE_HOST issues
  wic: selftest: do not assume bzImage kernel image
  wic: selftest: add tests for --fixed-size partition flags

 meta-selftest/wic/wictestdisk.wks |   7 ++
 meta/lib/oeqa/selftest/wic.py     | 171 ++++++++++++++++++++++++++++++--------
 2 files changed, 144 insertions(+), 34 deletions(-)
 create mode 100644 meta-selftest/wic/wictestdisk.wks

-- 
2.9.3


