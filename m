Return-Path: <psidhu@gateworks.com>
Received: from mail-pd0-f173.google.com (mail-pd0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 2B0B0735FA
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Apr 2015 00:32:36 +0000 (UTC)
Received: by pdbqd1 with SMTP id qd1so62532400pdb.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Apr 2015 17:32:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=tvXOb0Gh1p1R5brs325OH4COl4RDHaV7QOTMGs8k3g4=;
	b=aijTC3lkddSdG0fn1SLkYfZTo5U2RdVbP5MmE1hkhzguO/8tlkCjYnYqQgfi/1JYIY
	HO4Adc0pN7V811MRK3IcBdjWRjkDM4kYaYPxRzzV5Qbm705T9/Pnoli0A81cRoLzAVdJ
	WAhHZ1fBvvAlunBf6Cq0RNZ+31LDCc9XtUV99mKk6nQd7NcheO0hBJ2TisNDGog+HV25
	IS5/HpnwENlZOJ8WQIq8fu2v952oMQ3SlMw0gjbZoattAKcyzpOul1IGxA2HoPyCIaNV
	wicAHMNcSzACi3TjErW7SbAgLROmCTHO4eMjzQ+77ciTyePBZCy+LHihwZYXSyrQ79Ab
	IQhQ==
X-Gm-Message-State: ALoCoQl0tEUn6idYzoA7QDqXYDAEyNtGNpkbQb+KQB5O92IVMHuPv3OB9B4YEKVVEDy/8+H3t/b9
X-Received: by 10.66.234.233 with SMTP id uh9mr1578619pac.81.1429921957757;
	Fri, 24 Apr 2015 17:32:37 -0700 (PDT)
Received: from psidhu.gw (68-189-91-139.static.snlo.ca.charter.com.
	[68.189.91.139]) by mx.google.com with ESMTPSA id
	nq2sm12230525pdb.70.2015.04.24.17.32.36
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 24 Apr 2015 17:32:36 -0700 (PDT)
From: Pushpal Sidhu <psidhu@gateworks.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Apr 2015 17:32:21 -0700
Message-Id: <1429921942-19804-1-git-send-email-psidhu@gateworks.com>
X-Mailer: git-send-email 2.3.5
Subject: [PATCH 0/1] Add new FSTYPE: multiubi
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
X-List-Received-Date: Sat, 25 Apr 2015 00:32:39 -0000

I am submitting a patch that will add a new filesystem type called 'multiubi'. Without repeating my commit message verbatim, I want the ability to create multiple ubi's that cater to different flash sizes.

This is ideal for some boards I've encountered that can have anywhere from nMB to nGB of flash storage space (but be the same 'machine'), in which case tweaking the machine.conf file to change ubi parameters doesn't make sense. In order to not rewrite code, I have added a function to generically create ubi files where FSTYPE's 'ubi' and 'multiubi' can reuse the code. This should not break any current configs that build with a FSTYPE of 'ubi'.

An example conf file could include the following:
> # Override FS Type Creation
> IMAGE_FSTYPES = "tar.bz2 multiubi"
>
> # Build the following sizes
> MULTIUBI_BUILD ?= "normal large"
>
> # 256MB ('normal' flash layout)
> export MKUBIFS_ARGS_normal = "-F -m 2048 -e 124KiB -c 1912 -x zlib"
> export UBINIZE_ARGS_normal = "-m 2048 -p 128KiB -s 2048"
>
> # 2GB ('large' flash layout)
> export MKUBIFS_ARGS_large = "-F -m 4096 -e 248KiB -c 8124 -x zlib"
> export UBINIZE_ARGS_large = "-m 4096 -p 256KiB -s 4096"

Due to the way OE deals with created images, the shared function 'multiubi_mkfs' has to create its own symbolic links in the DEPLOY_DIR_IMAGE directory and clean up it's own config files. If there are suggestions on how I can overcome this, please let me know.

I appreciate any questions/comments.

Thanks,
- Pushpal


