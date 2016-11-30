Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id A4B2C71A68
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 09:50:09 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id m5so201439349ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 01:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=ka34NPmYRhDfKfGzeVxSK5Zpqe26oUcZYEt8v5PyxgA=;
	b=VDeqeP1+Qvs4bd1TRohJXE4QgeJZvaSAs9ip7IkXg6o2kvSDg8mnNuGnIv1zSraVWm
	mi1C54aU39ErakKycfQGTovdXdCCKO15ybBMBLmvieoWaUuXShBUsny8ZZptbtiTu2nJ
	1y209leFjt4z75LOYYAdVq4SPRCI85qpE4IRdwwulKk2P9UzNal1zuX/VC9PdEfZ8S6b
	Rvc17iFjMtcNRM+VljqSkVW6nPPZqWchDYwPnooZNgsOhvemKM3dmTbwuxqH9r1BsHrD
	0203hcIVqn2dkllqWIuaNjSGO0rJN9yEQ2cU0vSkZl9LVA19L4UVziH0Ltxd//Yuo63h
	lYmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ka34NPmYRhDfKfGzeVxSK5Zpqe26oUcZYEt8v5PyxgA=;
	b=lov9UO7x2oLLWyzgamWiibqv9ep4cfwgSu4pSN3Ctkx0Tw1uQcZdGCMh6Vwc5ZhDRU
	6/s1+WSPZYDjUQofvLXsKiT5DuU0eiW+JdQ0uGTvEMKmYoripppzjwZV1ROe7MMS1t+m
	waJksUx1NTnOew+m+jpBR9TFirazurB0xyhLcsY2NTEDJsT1wvpKejJctBCSmC3LiVEC
	MuXppNcTKQP6f3F8EAN1LVkZwkUA9ovaJZcZStRavv1lcYRb4FQAthLCQvFvtv6rWQEc
	VHCOBedmeS9NBMCQg+TqmWky6NMkW/oFk7MgO5M+SuoyW2DfQglqMJPxQsmYSu57bTZH
	ANXA==
X-Gm-Message-State: AKaTC03bI+u/qYKn5XURxdacY9gltlv/QcwmNCkRHkCJYwnqMN/Sh/RPL8c2z3Q9kmqRt9Tp
X-Received: by 10.107.200.7 with SMTP id y7mr25777023iof.30.1480499410637;
	Wed, 30 Nov 2016 01:50:10 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8E1B8.dip0.t-ipconnect.de.
	[93.232.225.184]) by smtp.gmail.com with ESMTPSA id
	22sm23099312iog.28.2016.11.30.01.50.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 30 Nov 2016 01:50:09 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Nov 2016 10:50:01 +0100
Message-Id: <cover.1480499133.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH V2 00/11] system statistics sampling
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
X-List-Received-Date: Wed, 30 Nov 2016 09:50:09 -0000

buildstats.bbclass gets extended so that disk bandwidth and capacity,
CPU and memory usage get sampled at regular time intervals by
default. pybootchart had code for most of that data, which gets
restored and re-enabled. The disk capacity graph is new.

The original pybootchart just stored raw dumps of the special files
under /proc. bitbake builds run longer, so a more compact ("reduced")
format is used.

Logging disk capacity was mostly motivated by some work on enhancing
rm_work.bbclass behavior, but could also be useful for others ("how
much free space did my build need").

Changes in V2:
  - SystemStats instance survives between event handler calls by
    storing it in the corresponding datastore, instead of using
    a global variable, and open files get closed properly when
    the build ends. This should work better with memres bitbake (not
    tested, though, because of YOCTO #10741).
  - Sampling now already starts when setscene tasks start to run.

The following changes since commit 9f1fe76727e98e58fc9e46ea2b49cf5c0cb48e6c:

  libpcap: Fix build when PACKAGECONFIG ipv6 is not enable (2016-11-23 11:02:33 +0000)

are available in the git repository at:

  git://github.com/pohly/openembedded-core buildstats
  https://github.com/pohly/openembedded-core/tree/buildstats

Patrick Ohly (11):
  buildstats: add system state sampling
  pybootchartgui/draw.py: allow moving process chart up and down
  pybootchartgui/draw.py: fix drawing of samples not starting at zero
  pybootchartgui: show system utilization
  pybootchartgui/draw.py: skip empty CPU and disk usage charts
  buildstats: record disk space usage
  pybootchartgui/parsing.py: fix error handling in meminfo parser
  pybootchartgui: render disk space usage
  pybootchartgui: simplify drawing of memory usage
  buildstats: reduce amount of data stored for system utilization
  pybootchartgui: support reading reduced /proc logs

 meta/classes/buildstats.bbclass                  |  24 +++
 meta/lib/buildstats.py                           | 153 ++++++++++++++++++
 scripts/pybootchartgui/pybootchartgui/draw.py    | 192 ++++++++++++++++-------
 scripts/pybootchartgui/pybootchartgui/parsing.py | 122 +++++++++++---
 scripts/pybootchartgui/pybootchartgui/samples.py |  27 ++++
 5 files changed, 440 insertions(+), 78 deletions(-)
 create mode 100644 meta/lib/buildstats.py

-- 
2.1.4


