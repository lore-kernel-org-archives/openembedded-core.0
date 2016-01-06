Return-Path: <matt@madison.systems>
Received: from mail-pf0-f176.google.com (mail-pf0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id EB79373173
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jan 2016 12:22:23 +0000 (UTC)
Received: by mail-pf0-f176.google.com with SMTP id e65so185246780pfe.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jan 2016 04:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=MDbZF6sil8lBZ4e9XIszFx5WoAb6gW/LkBN01SvnDZY=;
	b=yRrWN/D1gZy7Xm5IHJhQRiSLcKyApYTq5QjcARvC8dlFYwe5lpep/Yax6uXApO6/aT
	C8HGme+cG637JKhFy1PXGgB4UDbBh4/2FIueoCqAgffn5vLXLHDCU7iLdf4X5E4UY2WT
	JFuoN0CpHrM6hHzsa7TtRe3WECvLAH7vzvkMIGqPzmA/kcvJHzVULSFVgBkcxyVzJwX4
	OCoVUT5W71mvHZnFw5r1zNaj+9MyAPeqe6BUpvRg9cTPAgM6NwWal4ghRcanDn0ywjhR
	Z/7oHzoKSi0YwfmKMgcgC6h7v/imV8dGTW3KbMS5MoB1Ige6jEhu4/CqnxEo/llmIdHO
	4YkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-type:content-transfer-encoding;
	bh=MDbZF6sil8lBZ4e9XIszFx5WoAb6gW/LkBN01SvnDZY=;
	b=VJNHW7wngwLUEp4PmJ/cPGwo/bX70wqYT/fH/ksFk5lDlogmsQoM4+MEggJ9My+4TI
	BwVpsJKvNlypYW57lndhu9uYMlDfIwWghQTRzmYPfI7cGra52IHeP+NAtaUaUy7zKXJD
	llJIeR3XKJI+JW8d+uGU7mzt/f1crhf0myzh06ZEZBbN4INyp2q9o5AZz3cifnr2WFRP
	J3/1ARdFoWhV6rJdk6xLZNYTTuGGjFQNXXh0xxiWKZIwefNNq1JXjMFHXrZVqhEKWIMQ
	6HSHHMSGAOXWT3Si0e3wyGOxYzWk4E9/QSUcXaq2zRsgw8FL6YBh8z7CihiqOIjgJgEg
	sR7A==
X-Gm-Message-State: ALoCoQmk0qRryVXR7OCUcxnx7FWy+ynKFrOy+yQ/fb/xplYYcTWBHc58nE1QjRUA5PsIgHT+kV4tMd23GNVqSE3SWKFv9pJrMA==
X-Received: by 10.98.65.140 with SMTP id g12mr86896831pfd.81.1452082944444;
	Wed, 06 Jan 2016 04:22:24 -0800 (PST)
Received: from workhorse.madison.systems
	(70.90.175.93-BusName-ca.sfba.hfc.comcastbusiness.net.
	[70.90.175.93])
	by smtp.gmail.com with ESMTPSA id c5sm1479817pfj.89.2016.01.06.04.22.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 06 Jan 2016 04:22:22 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Jan 2016 04:21:32 -0800
Message-Id: <1452082896-3261-1-git-send-email-matt@madison.systems>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Subject: [PATCH v3 0/4] Debian multilib packaging fixes
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
X-List-Received-Date: Wed, 06 Jan 2016 12:22:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This version adds a fourth patch from Aníbal to skip any
"unmet dependencies" errors reported by APT from the initial
install, which were prematurely terminating the rootfs build.

Aníbal Limón (1):
  DpkgRootfs: Fix logcheck_error false-positive when use multilib

Matt Madison (3):
  package_deb.bbclass, cross-canadian.bbclass: DPKG_ARCH mapping
    function
  package_manager.py: fixes for multilib deb packaging builds
  package_deb.bbclass: add 'Multi-Arch: foreign' tag to allarch packages

 meta/classes/cross-canadian.bbclass |  2 +-
 meta/classes/package_deb.bbclass    | 37 +++++++++++++++++++++++++++----------
 meta/lib/oe/package_manager.py      | 17 +++++++++++------
 meta/lib/oe/rootfs.py               | 13 +++++++++++++
 4 files changed, 52 insertions(+), 17 deletions(-)

-- 
2.5.0


