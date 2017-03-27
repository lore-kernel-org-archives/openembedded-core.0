Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com
	[209.85.214.45])
	by mail.openembedded.org (Postfix) with ESMTP id 54C0271D31
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 19:39:18 +0000 (UTC)
Received: by mail-it0-f45.google.com with SMTP id y18so87955389itc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 12:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=/zWzKtXJpxvzOhWCh+gs5MXxiiapMwLYf3qMnwaGrM0=;
	b=K1d0gttd+gSsWBwAGI/xE8spOPayFYbS7QHkVFTMwKJMZ+ucvZF+JjEGRV5WrpBu8I
	SW/STUIDfQSVnj+qBETuXvyVRFvWko30/DH91ijUpwL8ue8UOlgPVdrQ/9KwRjCNm60D
	ut7laasx7vIvdjXgzBtA5ieQB4N/mkBDPGiZJyImQt8gQm161W3VV7pPaLPUDrhfIJNP
	+19It25rDKr9Qbi+Sg0QJXtsM1REB39imVxChecvU68zZwdDGF0+kzoa02u7WwZHUwM3
	wt/OC3mr9FFOXAMTpb7/1gFyXOqx99SovPySuqYTsbeJblAe67e5BpAxlV+MkU01UQ9W
	7ZJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=/zWzKtXJpxvzOhWCh+gs5MXxiiapMwLYf3qMnwaGrM0=;
	b=iGOMPnDOxSnqEpgYDshkdlxbGo4njwArUIQeynyEMqnLoV0wLA+3kG/XsQWB8+Jtxc
	oYeIYufo0u53qq331EZ5pDQe/wqTdrbAM+OFof9t1pXznSYzNhqMQM/k0ks6xT1KXhMC
	dGjkCh0Y4DxmU/RJqgY8vQjb47Oie399nwbznTHH8x8EbERMdJBKU/ExcXI2/xYJAzlS
	klCjQ++p/Zi+Q7p+xsTn9VbvOEemQ65LkSrr3JLLmnWFlEml7+DWdjzjZ641bD843WO3
	Zo2WP1yQNpBjO/3H4dphBuFYzeUDSWPLMX0wWWF8e8zdzC3ALQ5LdThJp+AvnM7MaMTV
	6WjA==
X-Gm-Message-State: AFeK/H2kvVrDqMEfqFNJMOFI3rDJcv2dJUOIiXTpioY58nbUeqm32UX4Kz+4lNOSl/a5aWfU
X-Received: by 10.36.216.4 with SMTP id b4mr12163582itg.100.1490643560235;
	Mon, 27 Mar 2017 12:39:20 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8D2B5.dip0.t-ipconnect.de.
	[93.232.210.181])
	by smtp.gmail.com with ESMTPSA id 17sm698073ioq.45.2017.03.27.12.39.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 27 Mar 2017 12:39:18 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Mar 2017 21:39:11 +0200
Message-Id: <cover.e904b46a3797bd3e32fa34431a5549f485271170.1490643522.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH v4 0/3] oeqa: more control over qemu
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
X-List-Received-Date: Mon, 27 Mar 2017 19:39:19 -0000

I'm currently working on testing an installer image. During that test
I need to:
- boot with two drives attached to the virtual machine (installer image
  and internal disk)
- install to internal disk
- reboot with just the internal disk

There were several problems doing that:
- attaching second disk via qemuparams was not possible
- run_serial() timed out too early during the long-running install command
- writes to the internal disks were discarded
- booting with only the non-standard internal disk instead of the
  recipe's image was not possible

V2: rebased on top of master-next + Robert's "runqemu: add selftest" series,
    no other changes (merge V1 if not taking Robert's patches first)
V3: rebased on top of current master
V4: QemuTinyRunner.start() also needs to accept the new "discard_writes" parameter

Patrick Ohly (3):
  oeqa: allow extending qemuparams="..."
  oeqa: allow customizing image used by runqemu()
  oeqa: allow persistent image writes in runqemu()

 meta/lib/oeqa/targetcontrol.py        | 6 +++---
 meta/lib/oeqa/utils/commands.py       | 6 ++++--
 meta/lib/oeqa/utils/qemurunner.py     | 4 ++--
 meta/lib/oeqa/utils/qemutinyrunner.py | 2 +-
 4 files changed, 10 insertions(+), 8 deletions(-)

base-commit: b2a785f19fe25d244179b8672c846925da6d455a
-- 
git-series 0.9.1

