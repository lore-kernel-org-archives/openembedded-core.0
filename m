Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-lf0-f44.google.com (mail-lf0-f44.google.com
	[209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id 0493471A80
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Nov 2016 15:56:23 +0000 (UTC)
Received: by mail-lf0-f44.google.com with SMTP id o141so70836264lff.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Nov 2016 07:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=BUHwRDfeMvtish3ZmttW7E6cenJ3e1kKr0dYpw6+TwY=;
	b=XjnmcUZLlXv1DPa5aiEbDnt9SwiKwWP+j4xt51ox6PmBmr6HLvsk+weepO8yCW4NSd
	FiTUS+O+HHYpsFP6bGWPv5pnDuq8C4kMNhxbVETafW8sLM4EHF7qvL/upLxKOWjELhGo
	QKHFP3VHuA8EYKNpCFwrbmatutjopGeoD760sKNOj51JWuxk9Tac4K8B66DJesrP/En7
	kNBITUzOSyBOvghTUlouTHKy4SauC5HDg55ZcDjjCl3jgaUF9TogkDmgAiaqhtpo6wjw
	ZQqsnc+gnpbB/kEllfjXsmwG2TC1BN4/VQD0PianCOj0OG4SNgNHxQjDhAaPj/FpXx3C
	ygSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=BUHwRDfeMvtish3ZmttW7E6cenJ3e1kKr0dYpw6+TwY=;
	b=T/RhC9qTM9bQD5WCN/f3wHAjlL0b2ogfBsqUEgvWTuRPOAub0MNb1sZcOq/atqmxnQ
	kg6bOfC8Sg1/9wxC32h4jXiOUybmFLpYa2AB2cFTLYlM0/4EeYynnbfaWWSUFokoq0kb
	KllALb8gYNTKgoSQwYWfHo4rJMEp+4buHh3+SY4/hGBEAsgbk4ejrGOXgWX/ivCqzfDS
	9wo14x/BGNsuwmeYZ0lTGAs3/rV1bdS1GT95FS1qEX/F8FIyd2T7kvu0twgJsclDKF07
	y3rFdfDCF+yJyboURQufTnak7wkP1hnaw7q1JntsjiHR0xJeOm1JSFAcIU37Dv5Hz0IS
	zmUA==
X-Gm-Message-State: ABUngvev08Asi8gcfdpH1aXsI+oSp3mxB5bJmpx69cOaCNNFEBOCg6L2GKvaFCwt3L8k7A==
X-Received: by 10.25.165.144 with SMTP id o138mr913047lfe.80.1478620584704;
	Tue, 08 Nov 2016 07:56:24 -0800 (PST)
Received: from comp_016_pc_buildenv.localdomain
	(staticline-31-182-60-238.toya.net.pl. [31.182.60.238])
	by smtp.gmail.com with ESMTPSA id
	h95sm2976939ljh.13.2016.11.08.07.56.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Nov 2016 07:56:23 -0800 (PST)
From: Maciej Borzecki <maciej.borzecki@rndity.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Nov 2016 16:56:06 +0100
Message-Id: <cover.1478619682.git.maciej.borzecki@rndity.com>
X-Mailer: git-send-email 2.5.0
Cc: Maciej Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH 0/5] wic: bugfixes & --fixed-size support
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
X-List-Received-Date: Tue, 08 Nov 2016 15:56:26 -0000

The patch series is a follow-up after a previous attempt of adding
--reserved-size option to wic[1].

The series introduces a number of fixes in patches 1 - 4.

The last patch in the series introduces --fixed-size option as discussed in [1].
The patch also introduces minor refactoring to code responsible for computing
partition size.

Aside from new option, another user-visible change is how the size rootfs
partitions with vfat is calculated. In previous code, vfat rootfs partition size
did not account for --extra-space nor --overhead-factor. Now, all rootfs
partitions (except for squashfs) are subject to the same rules of partition
sizing.

http://lists.openembedded.org/pipermail/openembedded-core/2016-October/127634.html

Maciej Borzecki (5):
  wic: make sure that partition size is always an integer in internal
    processing
  wic: use partition size when creating empty partition files
  wic: check that filesystem is specified for a rootfs partition
  wic: fix function comment typos
  wic: add --fixed-size wks option

 scripts/lib/wic/help.py                | 14 +++--
 scripts/lib/wic/imager/direct.py       |  2 +-
 scripts/lib/wic/ksparser.py            | 41 +++++++++++++--
 scripts/lib/wic/partition.py           | 93 +++++++++++++++++++++-------------
 scripts/lib/wic/utils/partitionedfs.py |  6 +--
 5 files changed, 109 insertions(+), 47 deletions(-)

-- 
2.5.0


