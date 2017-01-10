Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-lf0-f42.google.com (mail-lf0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id 0247C71A62
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2017 12:50:56 +0000 (UTC)
Received: by mail-lf0-f42.google.com with SMTP id m78so93469771lfg.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2017 04:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=Ppe24g+yibr6E48G4hQVZjXvCnhJqSsSf51JF6vVwCs=;
	b=mqtC8dZbYK43CdoDKcVqagHI6YA+i/bjYnl6WC4VNZe+CEZmuS38CNDXhUHyKYOK0T
	htZvgpYNkUJxFNq1EMj0tVByMkUeTsuDKmBgl85zdv2T1/SDlJlWQqml8fVhtWs8yWSo
	RqXpZ1Nznrji0kcmiPmdMTbswUYE3QTORS/jFyDUEvmHq5qA9plRT7vCeLEYIWC+WC8f
	3zssTv0jIiI03P6jIWCfeIxhKUePb3zKwQifOSoHWqssOnVIoqTGHOoOkKWb+JWxdMqY
	gKotApsmAks/8d7/RNd61SGN9mg4OYZJEADlug+361TrucaLHdpEoYYNt2NvlC2DXOZJ
	TzTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Ppe24g+yibr6E48G4hQVZjXvCnhJqSsSf51JF6vVwCs=;
	b=kQFQzxiV/S+fQcgM6yeC9okcfIB1xzIAnMtdxSmU7mA8MxWXcZSr4t6VCC5xymlEV9
	j00T4NaU+9R8QKjB9CJ09vPvaDkTDPlB/HRJhGrndH3VQwjogK14leLmwSoRq/UEG30y
	Z201EB7G4T3KrYE/pEuqs6aPRycYCgEtnWHV/2h3fLpe9+ji6QScy1j9/R194oqDBdNs
	tAPedio1xB1FqgWkb1c6enMNALaeCXqZvawMt3AuCRA3e5EcmnxDpzQXn0QESvuiv2LA
	fYFVoOpiPo+p5Z1rAUoSqE0HHIFjjg5i6UMC2qxjTRuFfRzAp0xh1V/5XZtD1VUw6NkT
	rgvg==
X-Gm-Message-State: AIkVDXKECKqTdbey+jAW0KXvSh5+dY3Z3jJmTZn8ptSYxQTSTdKxSFBHcFW+pk2ocJLeAA==
X-Received: by 10.25.79.71 with SMTP id a7mr1198100lfk.67.1484052655872;
	Tue, 10 Jan 2017 04:50:55 -0800 (PST)
Received: from comp_016_pc_buildenv.localdomain
	(staticline-31-182-60-238.toya.net.pl. [31.182.60.238])
	by smtp.gmail.com with ESMTPSA id c75sm450711lfe.28.2017.01.10.04.50.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Jan 2017 04:50:54 -0800 (PST)
From: Maciej Borzecki <maciej.borzecki@rndity.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Jan 2017 13:50:10 +0100
Message-Id: <cover.1484051596.git.maciej.borzecki@rndity.com>
X-Mailer: git-send-email 2.5.5
Cc: Maciej Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH 0/5] wic: selftest: enhancements for non-x86 MACHINE support & fixes-size tests
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
X-List-Received-Date: Tue, 10 Jan 2017 12:51:01 -0000

A series with enhancements and new test cases for wic selftest. The
enhancements mostly allow for running wic selftest on non-x86 MACHINE,
such as qemuarm (the whole series was verified on qemux86 and
qemuarm).

Patches in this series were previously a part of [1], but since then
--fixed-size was merged upstream. The remaining selftest patches were
rebased and received performance enhancements.

The first patch adds a machine independent kickstart file - wictestdisk.
Most of test cases build a disk image using one of the kickstart files
shipped in Poky (mostly directdisk. These are usually x86 oriented due
to use of syslinux and cannot be used when running with non-x86
compatible MACHINE. On the other hand, the image built during tests does
not need to be bootable (with exception of TCs that verify if the image
is indeed bootable).

Patch 2 introduces wictestdisk in test cases where its use is possible.

Patch 3 adds onlyForArch() convenience decorator and applies it to test
cases where x86 specific image must be used. Changes since previous
versions:
- only 11 TCs are skipped on non-x86 targets, 17 previously
- performance improvements due to lru_cache() wrapped helper for get_bb_var()

Patch 4 removes some assumptions about kernel image.

Patch 5 adds tests for --fixed-size partition flags, changes:
- cache native sysroot path in class


The changes in this series depend on the following commit
(https://patchwork.openembedded.org/patch/135482/):

commit 4299a3de6789833a27cce4f7e4bc79f48946f171
Author: Ed Bartosh <ed.bartosh@linux.intel.com>
Date:   Fri Dec 23 01:42:14 2016 +0200

    image_types.bbclass: look for wks files in <layer>/wic


Maciej Borzecki (5):
  selftest: wictestdisk: machine agnostic WKS for use with selftest
  selftest: wic: replace directdisk with wictestdisk where possible
  wic: selftest: avoid COMPATIBLE_HOST issues
  wic: selftest: do not assume bzImage kernel image
  wic: selftest: add tests for --fixed-size partition flags

 meta-selftest/wic/wictestdisk.wks |   7 ++
 meta/lib/oeqa/selftest/wic.py     | 183 ++++++++++++++++++++++++++++++--------
 2 files changed, 151 insertions(+), 39 deletions(-)
 create mode 100644 meta-selftest/wic/wictestdisk.wks

-- 
2.5.5


