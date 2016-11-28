Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 72DC971AB7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 15:33:11 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id m5so97690519ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 07:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=wEotuVAvkCSUgf7u5iTZQUDUt/FzyD1p7iLDDDXwU3g=;
	b=qv6q7KGokCKqNd2lECV08lcF++dWmrnvNiNx4QGeLedN52962wDEl9dfioBjaLLWv3
	GeuFaOA3gDYQHQW4+OhMnYhbZ4suDiOGImNtHieuEz+x3e226We7sRwU8k4J8ZxMlYGJ
	4tlwmOFcnCwSoxYmrqsQoDnSJadzabnohQok5sD1gFNugbVDlSq9U8kWGN6jARd0W91h
	RTm+Hu/VznXsi4s1VTD22Bb4ZQA2/g6eOZuyhbwFznW8P3kkLivNvPFRW98+AETVLXCj
	LSl05jpFCFmAgb3mLi5yR2efc7eQcNP3ivDjuLjhBvtqylKCvlyqENzieQ+EOHq0gZRb
	z/Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=wEotuVAvkCSUgf7u5iTZQUDUt/FzyD1p7iLDDDXwU3g=;
	b=cpIqXsoDu4FLZXP9wlepl4YkgFEakSJZF+coFR9slpWw7SLipr0m0vtSz2mgEY7ezl
	A/qn0+tCMwP/Ixce9J42vmCUAKSMiiOErQuOBsjJKFaDK7MprQyaFfeHgfZ5wanz4p4b
	k/M2xeFYdeeShMmgAqpyj0dKnj+0sv+3sH1mFwTMuhqcRoWngk+/mFhpsaut5hfLg9XY
	a0k8GJ5VlZqbi8Ug62cArFWMZj8KrFSidbA4T/p18uRnywejPMvLgJs5H25hfyA70Q0a
	RKJiNFjv2J29U+wxwkep5rIdsaxGZmeuG2XpbchEl4TsipRRKS5xv2RV7mASjTO8FD1+
	9z/g==
X-Gm-Message-State: AKaTC02FxTNbKzg6wBNtrCN2PtYVe20iI4zKg8aDpKuLY6qUM1dw3qS2Q7pAaY7ax4j7xA1C
X-Received: by 10.36.184.194 with SMTP id m185mr18639307ite.3.1480347192220;
	Mon, 28 Nov 2016 07:33:12 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8C83A.dip0.t-ipconnect.de.
	[93.232.200.58]) by smtp.gmail.com with ESMTPSA id
	n102sm19966747ioi.38.2016.11.28.07.33.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 28 Nov 2016 07:33:10 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Nov 2016 16:33:03 +0100
Message-Id: <cover.1480346284.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 00/11] system statistics sampling
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
X-List-Received-Date: Mon, 28 Nov 2016 15:33:14 -0000

These patches depend on the corresponding patches to bitbake.

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

 meta/classes/buildstats.bbclass                  |  16 ++
 meta/lib/buildstats.py                           | 156 ++++++++++++++++++
 scripts/pybootchartgui/pybootchartgui/draw.py    | 192 ++++++++++++++++-------
 scripts/pybootchartgui/pybootchartgui/parsing.py | 122 +++++++++++---
 scripts/pybootchartgui/pybootchartgui/samples.py |  27 ++++
 5 files changed, 435 insertions(+), 78 deletions(-)
 create mode 100644 meta/lib/buildstats.py

-- 
2.1.4


