Return-Path: <just.another.mariano@gmail.com>
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
	[209.85.210.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3E9077D311
	for <openembedded-core@lists.openembedded.org>;
	Sun,  7 Apr 2019 17:16:08 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id d24so9883076otl.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 07 Apr 2019 10:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=xBpzXBFTeRPCGDOZqNzzq9dNA2NN8/5v99l/Qo3tipk=;
	b=VUWWh/fBM1Sv659hubceWZbr+bNJ1+qUSZ9ZYr0hjU+pJi3qOiwWorpjrC8NwNRiwR
	VwhtKPGdoe4kjywFNDW14Q0tuYfy7Vu1pyjMDmDD4T143l/m8Xgf4hZW4q+5R6gpa8BD
	cxOthu55/1TpAdODz8rUJJwI6/dWhDKn5ts02AVsZ8KLO/2C5wsq8C/YaA+/bpadLExl
	136we0r2iBKuYbcDEhbA0X2Yffz0mRNfEwIS45wLr6cD4wzCUYEanMY3ON2vr1/sBOjU
	RqvoWKjb2CtUMv0JZsVDT1j3hWTuJofHVQf2oYawrOlollnmmJLzVlizZ6XWVxT2TqWJ
	kSXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=xBpzXBFTeRPCGDOZqNzzq9dNA2NN8/5v99l/Qo3tipk=;
	b=NrS0nLs9AbZDXNrY4v5oGu9j77ZQo8dD4T1C8lBhkQkSkEU0b24fifKWB6Vn4d5rFm
	Jo484wNby7kSAd1VRry6fcF2NPFOVOok1mVhe0lmlAuQ4bASIPkhX2l3KFMuIrhQUjb9
	AcxN9nVQNaXPpssTVTKwi6qn46e2DUBLDLvTkBdR9hpNV87U+XY+ti0hb3JZR/tVTPPH
	kxQXSIBSqNpIwUkwgXGEhvQqvID2U5VMdKsfG16qpTJ9TCN2/eiK6o77Rl9/YygnMEGt
	lxa9TMomhFnmmYoXXpsclEh9ZEbhs3LjwlfAqacdNevusXhc/UD+x8LAZmmSUPOOdUJT
	zA+Q==
X-Gm-Message-State: APjAAAUzmYr8yrx+kwEH4Wt0OUQi3DLfnURCrNrXalkPSnqu7j1q2Tn0
	mqJy1uJn9LtEwsWHOw4D51a/3s/e
X-Google-Smtp-Source: APXvYqzoXTRI7AFWTeuWPfv33VBVeib1F9flNaK8QIvW8TP8r0JbqRvCBazcUgFTqjscLtNixrMeqw==
X-Received: by 2002:a9d:4c05:: with SMTP id l5mr17289909otf.36.1554657369158; 
	Sun, 07 Apr 2019 10:16:09 -0700 (PDT)
Received: from ultima.ninicasiopea.net
	([2605:a601:43d5:f700:215:17ff:fe90:1065])
	by smtp.googlemail.com with ESMTPSA id
	d70sm14952535oih.18.2019.04.07.10.16.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 07 Apr 2019 10:16:08 -0700 (PDT)
From: Mariano Lopez <just.another.mariano@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  7 Apr 2019 12:15:56 -0500
Message-Id: <cover.1554656203.git.just.another.mariano@gmail.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Subject: [PATCH v2 0/4] Feature to use symbolic links to binaries for ptest
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
X-List-Received-Date: Sun, 07 Apr 2019 17:16:09 -0000
Content-Transfer-Encoding: 8bit

Some binaries are renamed by update-alternatives class at build time
and some ptest run against a binary belonging to another package. Take
for example busybox or util-linux.

This series adds a directory within the ptest with symlinks to the
binaries produced by the package, so just adding this directory to the
PATH will test the correct binaries.

v2 changes:

Add busybox recipe to use this method of symlinks generation.

Refactor the way the binary ptest directory is generated. Now the
directory will contain only symlinks to binaries that were renamed by
update-alternatives and not symlinks to all the package's binaries. This
have some advantages:
- Less lines and the code is cleaner.
- There is no need to have symlinks for every binary.
- Reuse existing update-alternatives functionality, don't need to add
  new features to the class.

To use this feature just add PTEST_BINDIR = "1" to the recipe.

The following changes since commit ffa5a1bda6741f5dc9f1b8db1bb37b0c6f103c99:

  asciidoc: specify XML catalogue to use (2019-04-03 14:56:27 +0100)

are available in the Git repository at:

  git://github.com/justanotherboy/poky bug13238
  https://github.com/justanotherboy/poky/tree/bug13238

Mariano Lopez (4):
  update-alternatives.bbclass: Add function to get metadata
  ptest.bbclass: Add feature to populate a binary directory
  util-linux: Use PTEST binary directory
  busybox: Use PTEST binary directory

 meta/classes/ptest.bbclass                    | 31 ++++++++
 meta/classes/update-alternatives.bbclass      | 74 ++++++++++++-------
 meta/recipes-core/busybox/busybox.inc         | 16 +---
 meta/recipes-core/util-linux/util-linux.inc   |  5 +-
 .../util-linux/util-linux/run-ptest           |  4 +
 5 files changed, 87 insertions(+), 43 deletions(-)

-- 
2.19.2


