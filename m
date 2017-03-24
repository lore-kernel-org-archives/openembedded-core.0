Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f43.google.com (mail-it0-f43.google.com
	[209.85.214.43])
	by mail.openembedded.org (Postfix) with ESMTP id 606F977C11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 21:46:23 +0000 (UTC)
Received: by mail-it0-f43.google.com with SMTP id y18so22609890itc.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 14:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=cfyiHUca8LxKp0+ntqfn0oPYlXHlD8cHlhA4kPqmtds=;
	b=W6qRud8MOb4AzyN7f2fKn6OIqoTuPX/gv9pDbT+N/JHEPiGPr3wfV6wYa4TPuW0br4
	lKfw6QAUW6HUqtHbu7E4vZj4OT+LKzI6eY3nfp23CPTU2W+rQVjpr/7vZ5tglv9XCsb1
	cgVW0jyPM9eSbijJyyQEXzNZJQa2Xf1kjlsgihtaFBF7vVkuan2K9yhRaLg5YpYr79mz
	B80+au3pDGnWCkkcGsvRd2mjLRAMq/+AcJInscBqHZM0gW9wpwI0/boSQf7fCvQZjhs1
	qBItxJswEya2E6/mVa5rWRZa9xU0EhuQ/TDuRRcpqFIGWSGbqNgnHqr09ZUtMB5k0rC0
	UMdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=cfyiHUca8LxKp0+ntqfn0oPYlXHlD8cHlhA4kPqmtds=;
	b=mwMM/VIdx9/QJx4hAe3SQONys1W9+T5L/G/DUmss7hT7Pd0NcBBNuHK3S7rgXy7lA3
	uqCakPH8YqQXrUbP5hqBZRvFzTN8zc8xfNAWTRky8jMmCBDWSjFRnvcX9CHU+QgHD7Fv
	2df08PDhHEu14fjJy6Bd3kIDKUC4bqhX+VnsQekD2Y5aBQyRusyiY9dYIYjcZmoCw3l+
	/I04SygRvsCPkg0UoSDx4C/fTqBjEKyJI9aGOSRntLerYj40QTFv9jkO0QwBNywdvsnP
	mvB92G0F/nMbtmaQ3ZAJ9Pbo37fBrZ1lyWxBTqEBkefWV5E+E0A9MMCCW7yMcQEhWe02
	6PXA==
X-Gm-Message-State: AFeK/H3sFYoK1OAEowx0uQixWGy0xvp6tBar/NGDEGooWjAZB5PM1U8P3EbO9tmqMP7xAaT7
X-Received: by 10.36.58.76 with SMTP id m73mr5262969itm.17.1490391984904;
	Fri, 24 Mar 2017 14:46:24 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8E2F9.dip0.t-ipconnect.de.
	[93.232.226.249])
	by smtp.gmail.com with ESMTPSA id 202sm1567370ith.7.2017.03.24.14.46.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 24 Mar 2017 14:46:23 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Mar 2017 22:46:15 +0100
Message-Id: <cover.0d2b67b6fd1ebbbb5d2fa788032f2316e484f09b.1490391921.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.893d808ab8d6ae450d8d95e1b23eeecb627cde36.1490375888.git-series.patrick.ohly@intel.com>
References: <cover.893d808ab8d6ae450d8d95e1b23eeecb627cde36.1490375888.git-series.patrick.ohly@intel.com>
Subject: [PATCH v2 0/4] oeqa: more control over qemu
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
X-List-Received-Date: Fri, 24 Mar 2017 21:46:25 -0000

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

Patrick Ohly (4):
  qemurunner: configurable timeout for run_serial()
  oeqa: allow extending qemuparams="..."
  oeqa: allow customizing image used by runqemu()
  oeqa: allow persistent image writes in runqemu()

 meta/lib/oeqa/targetcontrol.py        | 10 +++++-----
 meta/lib/oeqa/utils/commands.py       |  6 ++++--
 meta/lib/oeqa/utils/qemurunner.py     | 21 ++++++++++++---------
 meta/lib/oeqa/utils/qemutinyrunner.py |  8 +++++---
 4 files changed, 26 insertions(+), 19 deletions(-)

base-commit: 9ff93dd64edb54888e9682ce39d8c3d63cfea4d8
-- 
git-series 0.9.1

