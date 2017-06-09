Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 7F134780F3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 13:04:09 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id t87so12955926ioe.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Jun 2017 06:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=PlR9P0XWmczIU/yWfb4ofHkxDZbS+HbVDrR1xSr6hSM=;
	b=vdFQuBC67fNLBwbw38bVbKyw3BquRu9kGJVZIhWxd2RsbmdUI6L7bprwvIKrhlCj1D
	9NWpyNRtK4fgW3/iyABUT933NHngvcviuiV3uLj74MtEEhRQHZ7QONa4D4Owpkqc4OoS
	V0WDt68YywT3DAW75Jocr901IAS1VDoNklC0WQD5gaeVRQC44pTkj6L4r9l2Wn7P04aO
	HH5ojahRBbPTTLRg3wR7648sBMDDNk8XqwBwbAqTagmPkSKe51pew5wwRm3nEXMz027b
	pPkiGbPHZw+WGcVhm+ce5GXgwEn0lKccTwUHcpyuQhavmC6TbloOPvmJT4mJr3h2X/DQ
	go9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=PlR9P0XWmczIU/yWfb4ofHkxDZbS+HbVDrR1xSr6hSM=;
	b=Dz+6XUElxVNxUsXwXZXmsWjjSiN2sfO9if3fLDME0uA7JPEr/bK67rhmMxczf1ef6t
	dvmxKqlyPBH9csg/O6Yx+Qc0HN2IZmErSa5vGyNqydx+LwfwMnoivlIaWGzYeud6Z1cg
	s2ekLgv1f6dicJdg4eZlutowFGKeQTY48BhauePU0eMsllgS8Ol5BB5gnxEvc8/XbHy+
	tmMJeZ2lAqlcTlqBFDHYymNrLoSMH0T5Wm498JdWs8PdVlj0AD9rv1fPT/NXFGjW7Txd
	Gn9YnIlkHlMEKi9CstaEbCX3XS74CRszksFdu/NtKHGL+vPKkvTIV6NZBFWS2XyqJj0C
	Eslw==
X-Gm-Message-State: AKS2vOxpDFceClSYJeOf7Um14FKo1AAsB/XcS3lwAkcLtUA/jLvgEI0h
	NCEzTD4WFboVjmJDlmo=
X-Received: by 10.107.132.86 with SMTP id g83mr22761577iod.181.1497013450398; 
	Fri, 09 Jun 2017 06:04:10 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8C0DE.dip0.t-ipconnect.de.
	[93.232.192.222])
	by smtp.gmail.com with ESMTPSA id e81sm861643ite.6.2017.06.09.06.04.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 09 Jun 2017 06:04:09 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Jun 2017 15:04:02 +0200
Message-Id: <cover.85d08ae286e0b2f8503f9e657148201e6b90edde.1497013310.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.8ea05a588020117b72a57015f699c7acd76b93e6.1496849345.git-series.patrick.ohly@intel.com>
References: <cover.8ea05a588020117b72a57015f699c7acd76b93e6.1496849345.git-series.patrick.ohly@intel.com>
Subject: [PATCH v2 0/2] Yocto Compatible 2.0 support code
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
X-List-Received-Date: Fri, 09 Jun 2017 13:04:10 -0000

As discussed in the "[Openembedded-architecture] Yocto Compatible 2.0
+ signature changes" mail thread, changes in a .bbappend cannot be
done unconditionally. Making _append and _remove depend on overrides
which get set based on DISTRO_FEATURES is one way of achieving this.

Conditional includes can have unexpected results when used with checks
that still change during parsing. Helper functions might make this a bit
safer and easier to review by limiting the check to DISTRO_FEATURES.

Changes in V2:
  - added df- prefix to distro feature overrides
  - replaced too complex optional_includes() with simpler
    all/any_distro_features()

Patrick Ohly (2):
  bitbake.conf: DISTRO_FEATURES as overrides
  utils.py: helper function for optional include files

 meta/conf/bitbake.conf | 17 ++++++++++++++++-
 meta/lib/oe/utils.py   | 40 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 56 insertions(+), 1 deletion(-)

base-commit: 186882ca62bf683b93cd7a250963921b89ba071f
-- 
git-series 0.9.1

