Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f47.google.com (mail-lf0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id 2BAC477553
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Mar 2017 17:19:54 +0000 (UTC)
Received: by mail-lf0-f47.google.com with SMTP id y193so22522561lfd.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Mar 2017 09:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=sZEVbInp1Lto+tFPV29c7G2yrktbjMFrUVLFOcwiuUw=;
	b=uzmkegEXj3XP8WIIWilCql1muP/FbqIeZNmCGS+7l+VKBFn50w5EgZ85wazRvJO+63
	dZWP/cNWgoYsjsLetGOm1NOBJWgD2bNWMCvyj4c9B3sl2lsahI+J2IAp38dvES37z1+r
	qtoOIr/+0ThGmrYDei4Bjcyngg7kWmmosSN3hXoELsULTqkwUFU11ib2vgfapsBDIWyH
	Hsz/AUTOxORTl5n8UBAiVxOAWq36ysXTauayk/FhBLFcV7Wa90cwucUHSQyUN1PtwvD9
	ydVOfV9krAyVfyYkwsE7FZfR4WbbCyFBi/e8GzbJe+kXYgZdiZ2Kq8V0+mTtTsPPcj5j
	DKFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=sZEVbInp1Lto+tFPV29c7G2yrktbjMFrUVLFOcwiuUw=;
	b=PbkNw9nsxy2A3vg9q2YROtpzEemZGx5uPYq5URX6mlbtrUC0061DMwl/GoQ/fnL3zq
	ufJrwh6fV8dI1H3S8J5eMgSQ/yo2z7Mo/xfEgFpnB5OMn3TNf1GawxucvW9p0M/UWyc1
	sS5XnL6rwk/fs1+9cUCO+d1VDgUQ/1zihlLmB8LF5Kz7hRvZP1x+Ylvrd3YaEERKXuEU
	4ErTtcc+erZj9Zss0Zq3ps6wGP3bdj56OYAelvDXYY0cGet0LQ/7bFfrNrA7Iv+EaH1I
	1dY26DQBjvhj261CVppTqL0Adw0LnuRkmOU6W7uMrHMXDPJ0FT7/IKpT75mcL22gtrqO
	U5AA==
X-Gm-Message-State: AMke39kRJcmX9EqsfEK68Ma6rKOL8H9voEwx63kph71VYVkrnNpLf5HhUhZR8xKFB2faOA==
X-Received: by 10.25.37.10 with SMTP id l10mr2832372lfl.17.1488388795386;
	Wed, 01 Mar 2017 09:19:55 -0800 (PST)
Received: from localhost (194-237-220-218.customer.telia.com.
	[194.237.220.218]) by smtp.gmail.com with ESMTPSA id
	e22sm1203773ljb.50.2017.03.01.09.19.54
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 01 Mar 2017 09:19:54 -0800 (PST)
From: Anders Darander <anders@chargestorm.se>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Mar 2017 18:19:52 +0100
Message-Id: <cover.1488388550.git.anders@chargestorm.se>
X-Mailer: git-send-email 2.11.0
Cc: Anders Darander <anders@chargestorm.se>
Subject: [PATCH 0/7] create_npm: fixes to allow eg Angular2 based applications
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
X-List-Received-Date: Wed, 01 Mar 2017 17:19:56 -0000

After the fixes to bitbake, which have gone in to master, there's still some issues
with having devtool add work correctly with a angular2 based applications.

Some of the issues, license strings gets split incorrectly, AND and OR are used in license 
strings in npm, @ and / in npm package names...

There's also a need to be able to install devDependencies from a package.json file.



The following changes since commit 0a1427bf9aeeda6bee2cc0af8da4ea5fd90aef6f:

  recipes: Make use of the new bb.utils.filter() function (2017-03-01 11:17:22 +0000)

are available in the git repository at:

  git://github.com/darander/openembedded-core npm
  https://github.com/darander/openembedded-core/tree/npm

Anders Darander (7):
  create_npm.py: add devDependencies to depends
  create_npm.py: convert MIT/X11 to MIT
  lib/oe/package.py: remove @ from package name
  classes/npm: allow installation of devDependencies
  scripts/lib/create_npm: rewrite see license in eula
  scripts/lib/create_npm: handle AND and OR in licenses
  scripts/lib/create_npm: handle Public Domain licenses

 meta/classes/npm.bbclass             | 13 ++++++++++--
 meta/lib/oe/package.py               |  1 +
 scripts/lib/recipetool/create_npm.py | 38 +++++++++++++++++++++++++++++++-----
 3 files changed, 45 insertions(+), 7 deletions(-)

-- 
2.10.2


