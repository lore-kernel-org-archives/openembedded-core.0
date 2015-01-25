Return-Path: <max.oss.09@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 0EEF872A5A
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Jan 2015 15:34:41 +0000 (UTC)
Received: by mail-wi0-f179.google.com with SMTP id l15so5494574wiw.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Jan 2015 07:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=FoTtIt9HrTMzNUIy2Bur1DIkTyo83/ZQKj34x6P/3Ks=;
	b=LhfJslg2lA0mDS/bd81GFcSMDx0Om+Er7vovwQS2ulL4JnCk5Ut4B+h/Aa1KEIXuVZ
	o/1BUTVQxmc5MQJshfx/933062q0mGu8u+WFE7rsgarF6NRQmP6A1sGBhcGNi3h8I3M4
	v8wiHELwNM2hF2LxuQcKwsffQ6Rub/zPTOrTWbBw3trYkvmNL0rkhmHr+4+UQPicct3S
	icohDgij1rIvTRu00M4Lhs3QKBs2xGLPJrEHMMqswmcK8Sz5XafMqrrxHAIkkftMlaSA
	XkHBl5JudF34pYdKO99n4eiBkD3PeCtvrwy4RvuJD32LDpXA0s7E6RUCo0m7a4MIy9Ai
	ZXAA==
X-Received: by 10.194.84.105 with SMTP id x9mr34589852wjy.17.1422200081997;
	Sun, 25 Jan 2015 07:34:41 -0800 (PST)
Received: from Saturn.local.all (212-41-117-31.adsl.solnet.ch. [212.41.117.31])
	by mx.google.com with ESMTPSA id cg8sm10584279wjc.1.2015.01.25.07.34.40
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 25 Jan 2015 07:34:41 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 25 Jan 2015 16:33:37 +0100
Message-Id: <1422200019-19095-1-git-send-email-max.krummenacher@toradex.com>
X-Mailer: git-send-email 1.8.4.5
Cc: , Max Krummenacher <max.oss.09@gmail.com>
Subject: [oe][Patch 0/2] udev: fix ptest to not influence qemu
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
X-List-Received-Date: Sun, 25 Jan 2015 15:34:43 -0000

From: Max Krummenacher <max.oss.09@gmail.com<>

Hi

On a OE setup configured to build ptest packages udev's ptest test files are
staged to the sysroot.
A run of qemu chockes on this test files and never returns.

A ptest run on the target before any changes failed.
Patch 1/2 first fixes ptest.
Patch 2/2 keeps the test files in its tar-ball. run-ptest unpacks it before
a test and cleans up afterwards.

This fixes the issues with qemu while the ptests can still be run witout
failure.

Tested with distro-less oe-core master on qemux86-64 and 
colibri-t30 (armv7a) machines

Regards
Max

Max Krummenacher (2):
  udev: fix ptest rule syntax check
  udev: don't keep ptest testdata laying around

 meta/recipes-core/udev/udev.inc                    |  3 +-
 .../recipes-core/udev/udev/add-install-ptest.patch | 19 +++++--
 .../udev/udev/fix_rule-syntax-regex-ptest.patch    | 59 ++++++++++++++++++++++
 meta/recipes-core/udev/udev/run-ptest              |  2 +
 4 files changed, 79 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-core/udev/udev/fix_rule-syntax-regex-ptest.patch

-- 
1.8.4.5


