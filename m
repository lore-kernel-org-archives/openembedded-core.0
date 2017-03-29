Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f44.google.com (mail-it0-f44.google.com
	[209.85.214.44])
	by mail.openembedded.org (Postfix) with ESMTP id 561F677CC6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 11:30:12 +0000 (UTC)
Received: by mail-it0-f44.google.com with SMTP id y18so53043432itc.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 04:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=rLHUfREv9MfcK/CkTAX9JwW4HEJfsmgod+CHluoxfks=;
	b=Z65UequnDAZayNM3NO2AHGfZAuddqDNZDrvPsX5Kvl8zVwLGy8VTEjahV6ai07Bs3d
	ck24NMQRw40n52soRlsA8CwJ4m7CqUUkzRCoOvRtKxTPmdiwJk5gWrT3p1G84USSF5tt
	hLXm3f0DAu5+xR/jB4xA/Hu3jcg/bSyEHwWoJIgGAMCEhUkzOirOee0QNpVsU2tWAfMM
	K/tSOiBrhuMHD0TkmdBHVMTp7QCX72KBMrO11aFZ4ZhtFhis679i7UO02WF6wH0fxYv7
	zWcU9EabVl8P89XrGYVLbaIi5sQBtuAnJbFC+0bXpw0bBHTxw0J1vKSSMdJTtmC0DBZ4
	3fbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=rLHUfREv9MfcK/CkTAX9JwW4HEJfsmgod+CHluoxfks=;
	b=tNWC7As5QbhzkvXqoiHfme0IPzDVkvl2vq6y5B5vaWQD2kqITlBdQ7296nprxD+uji
	Xt8Yq66lPzbzrUGl8hCt2pNCRyvTfZfq/k49HfX6mARpMPQbQyt9PHS3Cd1qLjdiIQtQ
	G8dJz6hC11bw0h8+yEQXY4lgL1sNDmeN+VOxZoNh8nham/+KWO8smKWvzt/L++AZSk3D
	e2bHhlR5B9u6ppMRg/GuogtYrPy21ZLNy2S7i2BiUZJYWMQnIuT32Koe+oOPxl65WFcQ
	ORouX0sV51BE5tf/G2KsM7nwgRNcGgKvxNjUjToiqK7uUA3+6zLJN003IzhoPfEI4ovf
	Ez7w==
X-Gm-Message-State: AFeK/H0zAE1Oz88KDU43Rvph+Sn4oq4g4ku4/yaQ5BIiCmLGxOFLuau14dvZjxLrw3st+BPP
X-Received: by 10.36.1.208 with SMTP id 199mr667747itk.20.1490787013549;
	Wed, 29 Mar 2017 04:30:13 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8D6D7.dip0.t-ipconnect.de.
	[93.232.214.215]) by smtp.gmail.com with ESMTPSA id
	d196sm3579511ioe.3.2017.03.29.04.30.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 29 Mar 2017 04:30:12 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Mar 2017 13:29:48 +0200
Message-Id: <cover.425c03862da4e6657583439f3eb42e3c88fb71ac.1490786957.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 0/2] eSDK: enhance compatibility with rm_work
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
X-List-Received-Date: Wed, 29 Mar 2017 11:30:12 -0000

Currently "-c populate_sdk_ext" enables do_rm_work and then fails when
that runs first. This is simular to the problem discussed with Mike
Crowe: additional tasks that are only meant to run when explicitly
requested by the user cannot be ordered to run before do_rm_work
without also making them part of normal builds.

IMHO this has always been a problem, injecting do_rm_work before
do_build just triggers it more often.

There's no good solution besides avoiding do_rm_work, which is what
the two following patches do. The more reliable solution would be to
have additional ordering dependencies between tasks than the current
"A must run before B".

I also considered solving this in the task scheduler, but I believe
that this wouldn't work because even if it schedules populate_sdk_ext
before rm_work, it wouldn't be able to prevent rm_work from running in
parallel to populate_sdk_ext.

Patrick Ohly (2):
  rm_work.bbclass: introduce do_build_without_rm_work
  populate_sdk_ext.bbclass: enhance compatibility with rm_work.bbclass

 meta/classes/populate_sdk_ext.bbclass |  7 ++++++-
 meta/classes/rm_work.bbclass          | 27 ++++++++++++++++++++++++---
 2 files changed, 30 insertions(+), 4 deletions(-)

base-commit: d68a86d87aa017dd0fecb0f626d22711efefcd3f
-- 
git-series 0.9.1

