Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 0ABDD719A0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 09:52:30 +0000 (UTC)
Received: by mail-qk0-f182.google.com with SMTP id n21so128680856qka.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 01:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=fQfef5s3xhbmT0ml8cp4cyi1c6MLFhgx2eO/cWh59Rk=;
	b=W0Tx76OPTIMbrGFf+cENu7LhXjyDuU8YtVMSw87u+9CS1++HivfyZkakagmHqZwe5z
	rv9JzN4pafvfMpqYYqvwtkVTDbMIIN8195RxMHc5p32mRtzhSwa2oM9XA7YwLXBfHpmf
	hBizmCnWyBTtzbT9bR86sy20F7wPTJpGptxq8rzFaSpoin/PqBoCjOM/57WVpkft7SCn
	6JorYJBNE8STHHQQ8dUv9HBcDuTHsvSQ/m/1fDjABFFHpOZRpnHsxuo+A/mI1gtECiyc
	b9WZ8+cLptxeOfin5i/G+urKE2LHBfmo6NnYpn4927YHcgueA8XCLYvLnFTQQv1iyn0F
	u/xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=fQfef5s3xhbmT0ml8cp4cyi1c6MLFhgx2eO/cWh59Rk=;
	b=SLKbCH/BzN4wtWkSFnUwxkyML3UrtPrpkNRJKU3oGgMPn9yf/sdmOSSD0ZhSWe/2vg
	nefU3UYbd+IGruZgM5QfI/Rot/JxAO2gxgpCaoNXHl4PY02g0JzjPAh+Tapw6ekUqcKQ
	EUdxHPWOHQoy1g3ng8/JWem+9DMkWPhCU1OEJ9u7Xki6tKxkgMLOQmSolfytDRb4fJHD
	eKK9H54ZCviBD2uo5HjT6iwhdWp9qrgEafGr7owacMDdbmk2wAc2J7zH96AXmPU7CEiq
	MXZyQY9wMlI6WCWOs2pBjc/jElb3Tvj3MUOvCPL+ysd41kyikUkavoDXkRvqLfHFkkRN
	wuDA==
X-Gm-Message-State: ABUngvfYzXXVDDQwyxSCw8HYmXy5aFFeVmJWfbDfV1WfBy4zF5DNCTQK+ZIZNS9wu0eQuw==
X-Received: by 10.25.99.27 with SMTP id x27mr8887920lfb.128.1479203551937;
	Tue, 15 Nov 2016 01:52:31 -0800 (PST)
Received: from comp_016_pc_buildenv.localdomain
	(staticline-31-182-60-238.toya.net.pl. [31.182.60.238])
	by smtp.gmail.com with ESMTPSA id
	u204sm6093118lja.5.2016.11.15.01.52.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Nov 2016 01:52:30 -0800 (PST)
From: Maciej Borzecki <maciej.borzecki@rndity.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Nov 2016 10:52:00 +0100
Message-Id: <cover.1479201985.git.maciej.borzecki@rndity.com>
X-Mailer: git-send-email 2.5.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Maciej Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH v3 00/11] wic: bugfixes & --fixed-size support, tests, oe-selftest: minor fixes
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
X-List-Received-Date: Tue, 15 Nov 2016 09:52:31 -0000

v3 of patch series previously posted here [1].

I have noticed that Ross has cherry-picked some patches into his
pull request to master. Just for reference, the patches are included in this
series, but have not been changed since the previous version. The
patches in question are:
  oe-selftest: fix handling of test cases without ID in --list-tests-by
  wic: make sure that partition size is always an integer in internal
    processing
  wic: use partition size when creating empty partition files
  wic: check that filesystem is specified for a rootfs partition
  wic: fix function comment typos
  wic: add --fixed-size wks option

Changes since v2:

* COMPATIBLE_HOST workarounds now selectively skip certain wic tests for
  archs that cannot build images included in the test (most commonly
  directdisk-* image is not usable on non x86 archs), wic tests were
  verified to pass for qemux86-64 and beaglebone

* oe-selftest enforces en_US.UTF-8 encoding to enforce stable textual
  output of locaization aware programs

[1]. http://lists.openembedded.org/pipermail/openembedded-core/2016-November/128630.html

Maciej Borzecki (11):
  wic: make sure that partition size is always an integer in internal
    processing
  wic: use partition size when creating empty partition files
  wic: check that filesystem is specified for a rootfs partition
  wic: fix function comment typos
  wic: add --fixed-size wks option
  wic: selftest: avoid COMPATIBLE_HOST issues
  wic: selftest: do not repeat core-image-minimal
  wic: selftest: do not assume bzImage kernel image
  wic: selftest: add tests for --fixed-size partition flags
  oe-selftest: fix handling of test cases without ID in --list-tests-by
  oe-selftest: enforce en_US.UTF-8 locale

 meta/lib/oeqa/selftest/wic.py                 | 230 +++++++++++++++++++++-----
 scripts/lib/wic/help.py                       |  14 +-
 scripts/lib/wic/imager/direct.py              |   2 +-
 scripts/lib/wic/ksparser.py                   |  41 ++++-
 scripts/lib/wic/partition.py                  | 104 ++++++++----
 scripts/lib/wic/plugins/source/bootimg-efi.py |   2 +-
 scripts/lib/wic/plugins/source/rawcopy.py     |   4 +-
 scripts/lib/wic/utils/partitionedfs.py        |   6 +-
 scripts/oe-selftest                           |  16 +-
 9 files changed, 322 insertions(+), 97 deletions(-)

-- 
2.5.0


