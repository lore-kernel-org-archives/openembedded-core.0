Return-Path: <just.another.mariano@gmail.com>
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
	[209.85.210.67])
	by mail.openembedded.org (Postfix) with ESMTP id 90EDF7D299
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Apr 2019 14:26:53 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id d24so5760570otl.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Apr 2019 07:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Acxy2x2HJ671NxMMmmaSX3Q+n9vVfSU1Bn7A/UUtQZk=;
	b=X/Xp2YHJV0sP0tE/NJ7h4ORjUgL4wbPvoBka99L6+zAQQ29n4lWDk0svVOhWIu8zHq
	Bufw2DG5MffaGEPVM3zunFkeK0Z99KFVHkvXIj4O+a4WWXCqQyMuK4iT702xDl64n92d
	ANzFyVkyn0Qo4201X9TxQdbA7qqkvTUy7ByK/HfhZHFegfwT2l1cgPZosyT1TBVjNbDC
	OjQesoP4ZVP0bSRy8OEfJamr8n2IIGVK38mRT7zskKNFxIySDJBPRbzGI914nMFRaxDv
	BTx+eXZQqdekxMcky3VwHVkJLgoj8Qsa+fLXYdUMS7XayehJkqGCK37jBeQl8bh13cqQ
	03Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Acxy2x2HJ671NxMMmmaSX3Q+n9vVfSU1Bn7A/UUtQZk=;
	b=a9ugjUmXwzWlySUNYM2YaHyrIa3HRKobJmCvYCldVJEWTKzzJCSR+/1MBhgyi2VF6V
	dhzPpRx575ea6g2B3Vupm2GV8TgBiNZEG46Fqdg25AML2iDAmN/7Zcmj93lZxUBg1nb5
	clvD5snTs1XGnTUAtxZrjm2FEj2BmRk0FuU7lbfyUlWKz17Vos74CWHR6Ifo1wL2mSWf
	U1fl5F4IQiq35PGW8NFgyIgWQLLOufMuadXPfVCExr3BT8cRgXTwacxg2+PU64yTHjoa
	kCze1015uG9qE2Jy511PWbQKBLZeOkadp4gsYz6loTV9+awhGsfZOChIoFq1mz+Kw0dA
	bgHw==
X-Gm-Message-State: APjAAAVUIrwJ3bRl3DaBFY11PCvEt7m2n6U7FVRKTALp+dAvNssX5jvR
	/17kLCtL0miUpSXogLm9Lynw7Gww
X-Google-Smtp-Source: APXvYqzvvvEUJ8R58Z1CSVMwUoG/OoZzqDou1p9tVOE7Cpz7yKv387/cM2qYh+7awOCFt5c08dPRuw==
X-Received: by 2002:a9d:3983:: with SMTP id y3mr9067273otb.32.1554474414345;
	Fri, 05 Apr 2019 07:26:54 -0700 (PDT)
Received: from ultima.ninicasiopea.net
	([2605:a601:43d5:f700:215:17ff:fe90:1065])
	by smtp.googlemail.com with ESMTPSA id
	j82sm4056967oih.31.2019.04.05.07.26.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 05 Apr 2019 07:26:53 -0700 (PDT)
From: Mariano Lopez <just.another.mariano@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Apr 2019 09:26:38 -0500
Message-Id: <cover.1554391453.git.just.another.mariano@gmail.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Subject: [PATCH 0/3] Feature to use symbolic links to binaries for ptest
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
X-List-Received-Date: Fri, 05 Apr 2019 14:26:53 -0000
Content-Transfer-Encoding: 8bit

Some binaries are renamed by update-alternatives class at build time
and some ptest run against a binary belonging to another package. Take
for example busybox or util-linux.

This series adds a directory within the ptest path with symlinks to the
binaries produced by the package, so just adding this directory to the
PATH will test the correct binaries.

To use this feature just add PTEST_BINDIR = "1" to the recipe.

This will help to solve bug 13238.

[YOCTO #13238]

The following changes since commit ffa5a1bda6741f5dc9f1b8db1bb37b0c6f103c99:

  asciidoc: specify XML catalogue to use (2019-04-03 14:56:27 +0100)

are available in the Git repository at:

  git://github.com/justanotherboy/poky bug12597
  https://github.com/justanotherboy/poky/tree/bug12597

Mariano Lopez (3):
  update-alternatives.bbclass: Add function to get renamed binaries
  ptest.bbclass: Add feature to populate a binary directory
  util-linux: Use PTEST binary directory


-- 
2.19.2


