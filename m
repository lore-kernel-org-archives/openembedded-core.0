Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-lf0-f49.google.com (mail-lf0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id 6ABF36E5FC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 12:44:45 +0000 (UTC)
Received: by mail-lf0-f49.google.com with SMTP id a6so19675024lfa.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 05:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=IdrCIQme9119I117HPWD6X18O88CThzIfpBOPo27QQU=;
	b=xy4Urxox6L3xt+Rk+55qWtxQHwr7tNebcfqy9/gbxyUG0ncEeL45/n+G80GJON0EZL
	VR0I5wp7SuhvsxzVsZRiUQmONnd9NStm9IdhaZgRTAiwCp5gCfLi4wp65K9p4Rloe2dX
	yVvFaPPl0I1+KTgHmhXHCmELb+/CgopY6U9yKMQI0zOsCf76+qxVYTE1fLN0SQuO2XtM
	8Sb5rjoX9CYjAjRNMJXrUYn0iH8OZaFUI9O79LdLYl2brrYNCgTh537JZwdezlp4pVMN
	EnGVOGZO9dw1BVhyUdb57l73yVYSOA+TbttVPKRZ6m69LdyBN3wcOA+Bhh1lSUik5tEV
	oKag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=IdrCIQme9119I117HPWD6X18O88CThzIfpBOPo27QQU=;
	b=NXeJ7StvjId/tpoD/zDMG2Y0fRnOTvGlXVCDJRnHFrPXPzR2wBx3nx8hOztpS3tJUX
	MbcOFfG730nsQxQ5SXcd2SQnY354PMQ7aBFKSY5vo4okfIJL4+mjy0dA3U5ER0uiU0Ek
	XWaJSrPTFwSsrizqLr/5BvCZIXzxZvfH9xn3xRHZB6h9n1CJQ3ZeEl6o/eZn7E0OBQ7k
	AYQMur2S8+KE+KKSrETiUQ6Yp7KMBMt4YzOxUY149qLl72lxVZG7QjKdur7cmZYa4PQj
	4cItSA+hLG+OaRxKbGiaNl9zZwcdOGuk/Ba5QIETzcsfSIdabj/yiIwkF9I2CaX6JjEp
	zeQw==
X-Gm-Message-State: AFeK/H3m1h4YDKKnjAvO46QQ1q1SkdfjRA+FZc2ojTZyl+juyZGZ/b8AUj002qLbzs1n5Q==
X-Received: by 10.46.69.7 with SMTP id s7mr2994838lja.42.1489668285789;
	Thu, 16 Mar 2017 05:44:45 -0700 (PDT)
Received: from localhost.localdomain (staticline-31-182-60-238.toya.net.pl.
	[31.182.60.238])
	by smtp.gmail.com with ESMTPSA id n20sm893148lfb.53.2017.03.16.05.44.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 Mar 2017 05:44:44 -0700 (PDT)
From: Maciej Borzecki <maciej.borzecki@rndity.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Mar 2017 13:44:31 +0100
Message-Id: <cover.1489668133.git.maciej.borzecki@rndity.com>
X-Mailer: git-send-email 2.9.3
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH v3 0/5] wic: selftest: enhancements for non-x86 MACHINE support & fixed-size tests
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
X-List-Received-Date: Thu, 16 Mar 2017 12:44:45 -0000

A series with enhancements and new test cases for wic selftest. The
enhancements allow for running wic selftest for non-x86 MACHINE, such as
qemuarm (the whole series was verified on qemux86-64 and qemuarm).

The first patch adds a machine independent kickstart file - wictestdisk.
Most of test cases build a disk image using one of the kickstart files
shipped in Poky (mostly directdisk. These are usually x86 oriented due
to use of syslinux and cannot be used when running with non-x86
compatible MACHINE. On the other hand, the image built during tests does
not need to be bootable (with exception of TCs that verify if the image
is indeed bootable).

Patch 2 introduces wictestdisk in test cases where its use is possible.

Patch 3 adds onlyForArch() convenience decorator and applies it to test
cases where x86 specific image must be used. In the end, only 13 TCs are
skipped on qemuarm.

Patch 4 removes some assumptions about kernel image type.

Patch 5 adds tests for --fixed-size partition flags

Maciej Borzecki (5):
  selftest: wictestdisk: machine agnostic WKS for use with selftest
  selftest: wic: replace directdisk with wictestdisk where possible
  wic: selftest: avoid COMPATIBLE_HOST issues
  wic: selftest: do not assume bzImage kernel image
  wic: selftest: add tests for --fixed-size partition flags

 meta-selftest/wic/wictestdisk.wks |   7 ++
 meta/lib/oeqa/selftest/wic.py     | 167 ++++++++++++++++++++++++++++++--------
 2 files changed, 140 insertions(+), 34 deletions(-)
 create mode 100644 meta-selftest/wic/wictestdisk.wks

-- 
2.9.3


