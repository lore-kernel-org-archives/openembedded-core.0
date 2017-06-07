Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com
	[209.85.214.45])
	by mail.openembedded.org (Postfix) with ESMTP id 7E99F780D3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jun 2017 15:31:39 +0000 (UTC)
Received: by mail-it0-f45.google.com with SMTP id m47so8266342iti.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Jun 2017 08:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=lmch12ZzDJFtADZ0JJEVTub3t7/4UNvSxvFrW4PvgYs=;
	b=DaMmx2Gu3hEBi+c9VT3PHWjl+hGC5jexmrU5ehjHtx6vG4bzgkO1xjc2EMU29d7AK+
	vL+BxsAnol/XGHXJUT1v8W5sVxXVAcYpGvp+Pr7vpfNbIvMY+NtAvlMjAs9eUJUghOpP
	Tkv+LXUPLINbepG1qxrLHRzdV//Vs4awZPKrhrnYKOyM7UE/x0j3PtsWCyK8W9DGi5QQ
	qTkyfaRrm+QI689qo+kFBqfoTiz0+hjT7rKyQbIB1vud89psSsD85l1YSZJVhkJDELnV
	ZZ4Y5cE3fo2CBCpyLy0eOrYdWwttWbcyRxTzB61CoZxTTYl4yIUfGjLDHnaSidZ48qmG
	brEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=lmch12ZzDJFtADZ0JJEVTub3t7/4UNvSxvFrW4PvgYs=;
	b=TZ3mpqZj07/zkN1x0a1+daYBzZJDl+sB052llDaftwA5ZRYWFWXF6cDvY2z2+A0SbK
	8UdAa2h428BkdJVdthQrUwCnHCv7Tgq6+XWCJWUPJI2i/MScHZ8sWazsUXR5LHxG7CmW
	M53neB+vjbNcff/QgXriVUyno3mmZrc0Bh04ch8jnaDtKlRBe+5NXUw/SYJR4LlAUOQM
	QeccHrdBgzwroMq1/UIs6iA7ihOCODSD7vbH7SjsDOq0vpPVoyVHmDPqElFkdVuICwoM
	G0PytCRugxafgbu4jsM/mKlKFtledSSzZZ1tRTpWpt0twaUX7+87ePXXPkIb6+MBpzPv
	NjDQ==
X-Gm-Message-State: AODbwcCLRY2tc677AhzmQyLBai9WWSTz1qo14XENL1qHeXDMpH7Jf7Bh
	TC4YZKBqjqmqSxf4VRw=
X-Received: by 10.36.31.74 with SMTP id d71mr280286itd.85.1496849500466;
	Wed, 07 Jun 2017 08:31:40 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8FFF1.dip0.t-ipconnect.de.
	[93.232.255.241])
	by smtp.gmail.com with ESMTPSA id y93sm1115855ita.9.2017.06.07.08.31.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 Jun 2017 08:31:39 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Jun 2017 17:31:31 +0200
Message-Id: <cover.8ea05a588020117b72a57015f699c7acd76b93e6.1496849345.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 0/2] Yocto Compatible 2.0 support code
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
X-List-Received-Date: Wed, 07 Jun 2017 15:31:46 -0000

As discussed in the "[Openembedded-architecture] Yocto Compatible 2.0
+ signature changes" mail thread, changes in a .bbappend cannot be
done unconditionally. Making _append and _remove depend on overrides
which get set based on DISTRO_FEATURES is one way of achieving this.

The oe.utils.optional_includes() helper function has not been
discussed before. It's an attempt to address concerns by developers
that having to write code for (potentially complex) condition checking
is error prone and hard to read.

It depends on the bitbake enhancement that allows including multiple
files at once.

Patrick Ohly (2):
  bitbake.conf: DISTRO_FEATURES as overrides
  utils.py: helper function for optional include files

 meta/conf/bitbake.conf | 17 ++++++++++++++++-
 meta/lib/oe/utils.py   | 29 +++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+), 1 deletion(-)

base-commit: 49c255494c1d0704a1c8c428281c81541b05dc3e
-- 
git-series 0.9.1

