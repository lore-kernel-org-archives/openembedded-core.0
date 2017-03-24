Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f47.google.com (mail-it0-f47.google.com
	[209.85.214.47])
	by mail.openembedded.org (Postfix) with ESMTP id 5AE2B77BBB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 17:18:46 +0000 (UTC)
Received: by mail-it0-f47.google.com with SMTP id 190so7489117itm.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 10:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=G2AHsXMB1bUdvXvpkDh03qgU3pvpIJqc6dTdTEVhSD8=;
	b=m1Mvlyll8bLs10iNqOZfgxJRvJyarSuiYxQ1+MvwywMkNVs4ScgEGT3e/78wJ4u03n
	bIx9tvwxDEYEqtUgKzRVKXBMOdh4DKg0DS4p00XjBtsrrZiHJag9YLqU2oMpguo9jt18
	EMeAc0pUeF9IERO+5XjfRBVoax0ECLadk5tu0mcpN/RqDYxTUk560PnRIMd0uo26NVLX
	4s02lAh6qM4ASCZbRQ1uNtckL1knL4YDBvHWSEZoWY8r6aZwXX0qVpXDJRStSWpLxf7g
	VZ/9l8ehXko28WMLYGkoCpapChBBbnQ2dzUFfu54r6vGc8XhTqzS3ZM7H9c+gYC0psDf
	LbgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=G2AHsXMB1bUdvXvpkDh03qgU3pvpIJqc6dTdTEVhSD8=;
	b=KEKSEwm8tvi4hyXgGoTwJozj3+7DfQvT8aw0Aoqviir0fVfxM87vabHGrjXexNCMDw
	fjLw+WaqyhvXtHpoGZ41LmTgYUJajs7t4WR1hihTIgt6yPLBLmnBH2TGAE0vcBC94k2y
	1y1jr/dRlpjJ03XaH6Gjm5I1u13PR8sbqcpWtZiCUSrY1mJfmkM1LG5GMKNeWlzSPaU7
	pU6xEI+1W9QwgsY6P5pWMz3+mZVz+udLjNxSbK6MMspN6549lyMWaAtxjCAjnjS77+r5
	Ibkr6KrGz8HXCOJ8gyDLK1GSeCL/+w3obGGVaL38anv8AznvjfgwskzkQoOS92PD01rM
	eKAg==
X-Gm-Message-State: AFeK/H3kbrzKObtuLZnDi+cyf2q0C+TxxHeJaqROKRNF+3oASrDDZDkscVgYu+3ijfS0E4bf
X-Received: by 10.107.143.131 with SMTP id r125mr10359680iod.148.1490375928130;
	Fri, 24 Mar 2017 10:18:48 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8E2F9.dip0.t-ipconnect.de.
	[93.232.226.249]) by smtp.gmail.com with ESMTPSA id
	g23sm1477725ioi.20.2017.03.24.10.18.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 24 Mar 2017 10:18:47 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Mar 2017 18:18:34 +0100
Message-Id: <cover.893d808ab8d6ae450d8d95e1b23eeecb627cde36.1490375888.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 0/4] oeqa: more control over qemu
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
X-List-Received-Date: Fri, 24 Mar 2017 17:18:48 -0000

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

This patch series probably conflicts with the patches that Robert posted.
If those are meant to go in first, then I'll post a rebased V2.

Patrick Ohly (4):
  qemurunner: configurable timeout for run_serial()
  oeqa: allow extending qemuparams="..."
  oeqa: allow customizing image used by runqemu()
  oeqa: allow persistent image writes in runqemu()

 meta/lib/oeqa/targetcontrol.py        |  8 ++++----
 meta/lib/oeqa/utils/commands.py       |  6 ++++--
 meta/lib/oeqa/utils/qemurunner.py     | 21 ++++++++++++---------
 meta/lib/oeqa/utils/qemutinyrunner.py |  8 +++++---
 4 files changed, 25 insertions(+), 18 deletions(-)

base-commit: 95a7bd605ff42fe4ad28042f6a876c651f24c7af
-- 
git-series 0.9.1

