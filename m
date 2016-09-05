Return-Path: <joshuagloe@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id BC69075CF1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Sep 2016 13:35:20 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id i6so9828167pfe.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Sep 2016 06:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=4ueoTF9zjMU7LPMGnMFWvS5nS+wCh9OInkV+Q13s+ys=;
	b=Gn2nWnW3n9n/vzXeSCKBIoRDkq7iCtQ2FsFdxPPEy8ItRLQN26NRwJaQp1I6IWTwXy
	uoHTW9AMuYw7KuodAu+fugixuj6tzvCYEgveV/JMAw3p92Xm4P0u9Sbab5tknZ/B1aSX
	JmBQsy1+u4CT1Z0UTle7+UKhtTuWyvSk2C6mlF7A8HWWLnRpp6AJAGHWoVxM8LIiXXke
	zipWIcG8l+bjY0qP6DcBBPFILeMJUy19gFgiTkZXrv8l/kg8N9gp4yNszKOWua/IzmEG
	HEgGRNXaRxvh+XPOLjx0FRmK+TLcmoTTjzt0JCMpHwSG/WseRAlr2JyagkibVONCq0ZI
	VW/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=4ueoTF9zjMU7LPMGnMFWvS5nS+wCh9OInkV+Q13s+ys=;
	b=FsbnSRZDGV3qTlnhTr892lVRHUEeY8dU+yrCdFz0eeGuD+7+tOPf5t13hJLzs741Oq
	MVq/FnU4Fr/1vy8mgcPZ74OMZCUWgxHvEpbDVvhhxHdvEH+jqBOOTQKiI3VM0wsFc0Gy
	9HhPZzjWhY+e75emvPsHX9ZodQY7ka8uDinyghDmZHXVIiB3IF6EE0fQ2V66uMTzeD4D
	1MTzqpFPnkk8EYex8Vex+XzLIBPypwCWWjS0rVp5gFSyO4S0rv83yPrR3aLfH/GvQKFz
	fnzn+x3YgYM0+mxDi54pnY4uxpTFgXwCvlXW3Sf8Db64r3cEQ0COf6+OAYpaq4NrOKei
	Srjg==
X-Gm-Message-State: AE9vXwOAZuVKYXeOWlMMMqAGJ1MIB2mhAPYPtC3hABhahzGGM/PoUhk8+z4J5x2gQ3cfPQ==
X-Received: by 10.98.7.200 with SMTP id 69mr63545192pfh.33.1473082521009;
	Mon, 05 Sep 2016 06:35:21 -0700 (PDT)
Received: from jlock-mobl1.ger.corp.intel.com ([192.55.54.42])
	by smtp.gmail.com with ESMTPSA id
	a71sm15312551pfg.38.2016.09.05.06.35.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Sep 2016 06:35:20 -0700 (PDT)
From: Joshua Lock <joshuagloe@gmail.com>
X-Google-Original-From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Sep 2016 14:35:08 +0100
Message-Id: <cover.1473064318.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 0/2] Fix oe.path.copyhardlinktree()
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
X-List-Received-Date: Mon, 05 Sep 2016 13:35:21 -0000

My recent change to preserve extended attributes in oe.path resulted in a
copyhardlinktree() being broken when the source contains hidden files.

This series includes a fix for copyhardlinktree() and a simple selftest for 
copyhardlinktree() which ensures the source and destination have the same number
of files after a copy.

The following changes since commit 9b08503eabf78bc1b114416523b41dcce3449f58:

  toaster: fire TaskArtifacts event (2016-09-04 00:05:13 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib joshuagl/copyhard
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=joshuagl/copyhard

Joshua Lock (2):
  oe.path: fix copyhardlinktree()
  selftest/liboe: add a test for copyhardlinktree()

 meta/lib/oe/path.py             |  9 ++++++---
 meta/lib/oeqa/selftest/liboe.py | 29 +++++++++++++++++++++++++++++
 2 files changed, 35 insertions(+), 3 deletions(-)

-- 
2.7.4

