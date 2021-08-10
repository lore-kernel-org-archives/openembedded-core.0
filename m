Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web12.7243.1628598766184738862
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Aug 2021 05:32:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: thomas.perrot@bootlin.com)
Received: (Authenticated sender: thomas.perrot@bootlin.com)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 36A3FC0006;
	Tue, 10 Aug 2021 12:32:36 +0000 (UTC)
From: "Thomas Perrot" <thomas.perrot@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: alexandre.belloni@bootlin.com,
	Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [PATCH 0/2] Sign the image nodes with keys different from those for configuration nodes.
Date: Tue, 10 Aug 2021 14:30:11 +0200
Message-Id: <20210810123013.943078-1-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The keys to sign image nodes must be different from those used to sign
configuration nodes, otherwise the "required" property, from UBOOT_DTB_BINARY,
will be set to "conf", because "conf" prevails on "image". Then the images
signature checking will not be mandatory and no error will be raised in case of
failure.

Thomas Perrot (2):
  kernel-fitimage: images should not be signed with the same keys as the
    configurations
  oeqa/selftest/fitimage: update tests to use two keys

 meta/classes/kernel-fitimage.bbclass     | 40 +++++++++++++++++++++---
 meta/lib/oeqa/selftest/cases/fitimage.py | 21 ++++++++-----
 2 files changed, 49 insertions(+), 12 deletions(-)

-- 
2.31.1

