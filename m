Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Q7BRq-0005ek-F3
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Apr 2011 20:57:54 +0200
Received: by gxk3 with SMTP id 3so284943gxk.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Apr 2011 11:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=i0Ospg28TAj1nL2P4wOY3pgG7P2M/M/AVI3THICRq2c=;
	b=a6BCihBfDy/iPQGyxBBEypLTKqzKltHJf1N36AUYKfzyouiDfiYDtsL0/TllBXRMkH
	TrNGVtZpOR5qe2Y4nKVP51OZ/Lik28s/4TMPCHhxgLWMQLm9zG3tlzfrdY1Ehoh/6F9M
	AbalWyeC1bDbiibHFDzoeBKb7cJjiWyY69FRQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=ktlO+7Lu2hPKTOBrgLHGXYY+j/bDPtKoapftN8o7Hu9uzR31IcXXOBpRFm/CBYV7iN
	FHXjGiLuSuw16mkpVngYhp0U8G1MQX5DY8gb+3E684nJsvwEDVRXNkV6A9zcdH3Dplw8
	HrfDLfDgDFCLcTlf/xPSv9Ej7pSvaV5dnZI8I=
Received: by 10.236.201.228 with SMTP id b64mr1077793yho.384.1302029747806;
	Tue, 05 Apr 2011 11:55:47 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-170-95.ph.ph.cox.net
	[24.251.170.95])
	by mx.google.com with ESMTPS id 41sm2973245yhl.23.2011.04.05.11.55.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 05 Apr 2011 11:55:46 -0700 (PDT)
From: Chris Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Apr 2011 11:55:09 -0700
Message-Id: <cover.1302029575.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.4.1
Cc: Chris Larson <chris_larson@mentor.com>
Subject: Pull Request - misc + image features
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Apr 2011 18:57:54 -0000

From: Chris Larson <chris_larson@mentor.com>

This is a resend of the bits from the previous pull requests, but with the
final bit worked out.

Pull URL: https://github.com/kergoth/oe-core
  Branch: oe-sync
  Browse: https://github.com/kergoth/oe-core/commits/oe-sync

Thanks,
    Chris Larson <chris_larson@mentor.com>
---


Chris Larson (9):
  base.bbclass: switch to current OE's imports handling
  Shift oe import logic out of the event handler
  Implement variable typing (sync from OE)
  oe.packagegroup: add code for package groups (sync from OE)
  Move packagedata code into oe.packagedata (sync from OE)
  packagedata: don't choke on empty PACKAGES
  image.bbclass: switch to OE's IMAGE_FEATURES
  Use oe.data for IMAGE_FEATURES
  oe.data: expand the flags

 meta/classes/base.bbclass                          |   44 ++++----
 meta/classes/image.bbclass                         |   41 +++++++-
 meta/classes/package.bbclass                       |    4 +-
 meta/classes/package_rpm.bbclass                   |    3 +-
 meta/classes/packagedata.bbclass                   |   68 +------------
 meta/classes/poky-image.bbclass                    |   88 ++++------------
 meta/classes/typecheck.bbclass                     |   12 ++
 meta/conf/bitbake.conf                             |    1 +
 meta/lib/oe/data.py                                |   15 +++
 meta/lib/oe/maketype.py                            |   97 ++++++++++++++++++
 meta/lib/oe/packagedata.py                         |  107 ++++++++++++++++++++
 meta/lib/oe/packagegroup.py                        |   29 ++++++
 meta/lib/oe/test_types.py                          |   62 +++++++++++
 meta/lib/oe/types.py                               |  104 +++++++++++++++++++
 meta/recipes-core/images/poky-image-minimal-dev.bb |    2 +-
 meta/recipes-extended/images/poky-image-lsb-dev.bb |    2 +-
 meta/recipes-extended/images/poky-image-lsb-sdk.bb |    2 +-
 meta/recipes-sato/images/poky-image-sato-dev.bb    |    2 +-
 meta/recipes-sato/images/poky-image-sato-sdk.bb    |    2 +-
 19 files changed, 524 insertions(+), 161 deletions(-)
 create mode 100644 meta/classes/typecheck.bbclass
 create mode 100644 meta/lib/oe/data.py
 create mode 100644 meta/lib/oe/maketype.py
 create mode 100644 meta/lib/oe/packagedata.py
 create mode 100644 meta/lib/oe/packagegroup.py
 create mode 100644 meta/lib/oe/test_types.py
 create mode 100644 meta/lib/oe/types.py

-- 
1.7.4.1



