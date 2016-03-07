Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 30E54731DF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Mar 2016 14:51:12 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id z76so31616536iof.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Mar 2016 06:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=ueFz68Br/0ECQXJA0C1mDMsAsXNkTFCef8hYjGVhGIY=;
	b=nNpAtl70innnkeyd5p0E8dcg/gNh6frtjuSu8Ta1EYRwTc90gQUiwuH6eifxdFx/Kg
	aYXzPvAWiKEeiD4Np17qvrZbKdktSucV4IjzcFZg4R3QQ09G20pwg7akoIkyswaa7a5d
	mozAxonaNf0sRsBMhUbmHv9rytnbxtOjhpoSU+P0hEEw75+4FR4xLTMIVEXTnDmuzD2v
	oCwcpz90qpPBvWEemcJWbN0kg7sPnzfoe84PI9+gZmNJvtlCePjSm+Dyih+k/imgOMK0
	m0bGISNtYrYii+lAR4EI2bv8nG6yOP3ddEuPb6gMiaUUWzbVrx8t5eC0E7UAuF0SxaLg
	BDQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ueFz68Br/0ECQXJA0C1mDMsAsXNkTFCef8hYjGVhGIY=;
	b=QgP0PmqwJI6B94kwV3bOUZDSApdKSSRWMoGmStnyIDyK+wshH5B0t09WDzMPYsvQ66
	osq7Bzc3H6ze4kNl/eefWa4+rQyRYYWkP4TiwAae/8I64wiwp1i0/35ivN/c6Q/SlabD
	vY3t5B92hA2h8nhvP+ykic9VOrkMdi5PLYhfr6TcK41DIJcpRNwb5vOD+8a5rS/Cl0/g
	6Ve3hGxF5StCZRsQwQwipm/i1MIY2KoKNPaN/wEjWKQ8VjJ/HoUZXhMXskKhz6CRW2Ws
	dWW61TESeXj6wmoZKyTkvIxg3jw7MclIUt0MH1RE3WhsK4Vlbuq+5q3FNLZOt88qRROf
	yTMQ==
X-Gm-Message-State: AD7BkJLE1/Lq7W0X13TTRwRBCa9OBYbgY62lthsqPWQ5oplcgcu6bZXiqMKTxyV6s52zkizq
X-Received: by 10.107.135.202 with SMTP id r71mr16527841ioi.103.1457362273675; 
	Mon, 07 Mar 2016 06:51:13 -0800 (PST)
Received: from pohly-desktop.fritz.box (p57A56D71.dip0.t-ipconnect.de.
	[87.165.109.113]) by smtp.gmail.com with ESMTPSA id
	t62sm2265777ioi.41.2016.03.07.06.51.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 07 Mar 2016 06:51:13 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Mar 2016 15:51:06 +0100
Message-Id: <cover.1457361747.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/2] more flexible image conversion
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
X-List-Received-Date: Mon, 07 Mar 2016 14:51:13 -0000

In Ostro OS (https://ostroproject.org) we have a custom image class
which creates a whole-disk image
(https://github.com/ostroproject/meta-ostro/blob/master/meta-ostro/classes/image-dsk.bbclass).

Currently that class is more complex than it should be because it
re-implements image compression and conversion to VirtualBox, due to
limitations in OE-core's image.bbclass and because we wanted to get
rid of the redundant and misleading ".rootfs" suffix in image file
names.

These two patches make it possible to simplify the custom code to just
the actual dsk image and leverage OE-core for the rest.

The removal of the ".rootfs" suffix would also make sense for
OE-core. The first commit can be seen as a first step towards that. It
does not change the default, so nothing changes yet, but interested
distros or users can already get rid of the suffix by overriding the
IMAGE_NAME_SUFFIX variable.

https://bugzilla.yoctoproject.org/show_bug.cgi?id=9076 describes the
problem and probably can be considered resolved by these changes.

The following changes since commit 331ad5c5f80044a5e82abca0e87a85b162126411:

  mtools: Drop GCONV_PATH manipulation (2016-03-07 12:41:09 +0000)

are available in the git repository at:

  git://github.com/pohly/openembedded-core image-conversion
  https://github.com/pohly/openembedded-core/tree/image-conversion

Patrick Ohly (2):
  image creation: allow overriding .rootfs suffix
  image.bbclass: support chaining compression (aka conversion) commands

 meta/classes/image.bbclass       | 29 +++++++++++++++---
 meta/classes/image_types.bbclass | 63 ++++++++++++++++++++++------------------
 2 files changed, 59 insertions(+), 33 deletions(-)

-- 
2.1.4


