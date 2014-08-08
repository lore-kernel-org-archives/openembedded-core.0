Return-Path: <paul.betafive@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 9E3646AC6C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Aug 2014 11:37:17 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id d1so856977wiv.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Aug 2014 04:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=QTm8JAg60azLMTPlkteY0C+aiwKCOtj8Wz12DIhAFs0=;
	b=RzvrRreVmas1MgzbI5v6Z5xbEGYHmPU4iKEgeQPk5cMBggdUJf/A4C/xuOYnJuztUR
	nBUJLsZ9BCeRaFlba3GqMgaVNZ6FI8PAvIwNkVSdpAoEwOJMLEhB0FjPdoGQf5sJgpGR
	fxJoMTeQYqbjdLaqkEb3Y30BbNvVH3G9p610sq5+6dBOm722qqSVPhPQaIZroG2ZVvFc
	l+wtifMRkr6P7td5ay+ZB2S/P1pJ0in5tZtjXOQezokw96M8rFzPqBW+sCTkyPW5tTsg
	Fvxx2DTDq1ig786dNa4zjc4MGmGhzFmCsGoNBtx8onwVgBYuaCYaZxun+RkjhPSIc8Jw
	J6uA==
X-Received: by 10.180.221.172 with SMTP id qf12mr3609247wic.18.1407497838136; 
	Fri, 08 Aug 2014 04:37:18 -0700 (PDT)
Received: from localhost.localdomain (ygg.betafive.co.uk. [5.9.90.21])
	by mx.google.com with ESMTPSA id qa2sm3670889wjc.45.2014.08.08.04.37.17
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Aug 2014 04:37:17 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Aug 2014 11:37:07 +0000
Message-Id: <1407497829-9330-1-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 2.0.3
Subject: [PATCH 0/2] Fix gpg support in opkg
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
X-List-Received-Date: Fri, 08 Aug 2014 11:37:24 -0000

After recent changes to disable binconfig programs, 'gpgme-config' is no longer
installed with gpgme. This prevents opkg from finding gpgme which is needed when
'gpg' is added to PACKAGECONFIG. This is fixed in two stages:

  - A 'gpgme.pc' file was created and added to openembedded-core to be installed
    with gpgme. The Cflags and Libs values for this file were found by running
    'gpgme-config' on my development machine. This patch is included here.

  - Changes were made to 'configure.ac' in opkg to use pkg-config to find gpgme
    instead of using 'gpgme-config'. These changes could be added as a patch in
    openembedded-core but I don't think there's much point. opkg-0.2.3 should be
    released in the next couple of weeks and I'll include the relevant changes
    in that.

Additionally, I found that gpg itself wasn't installed when opkg was installed
with gpg support. The 'opkg-key' program uses gpg to manage the list of trusted
keys so without gpg it isn't possible to set up package feed verification on a
device. Therefore, I've added 'gnupg' to RDEPENDS when 'gpg' is in
PACKAGECONFIG.

Paul Barker (2):
  gpgme: Add pkg-config file
  opkg: Add runtime dep on gnupg if 'gpg' is in PACAKGECONFIG

 meta/recipes-devtools/opkg/opkg.inc             |  2 +-
 meta/recipes-support/gpgme/gpgme-1.4.3/gpgme.pc | 10 ++++++++++
 meta/recipes-support/gpgme/gpgme_1.4.3.bb       |  8 +++++++-
 3 files changed, 18 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/gpgme/gpgme-1.4.3/gpgme.pc

-- 
2.0.3


