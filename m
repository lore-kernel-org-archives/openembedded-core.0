Return-Path: <just.another.mariano@gmail.com>
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
	[209.85.167.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5A3F86C227
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Apr 2019 05:44:24 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id y84so12497861oia.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Apr 2019 22:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=V5jGdBaC5WYbBf/FQH0ueLkOYftIGA/mjeGIABMI0Qg=;
	b=rkpM/ynN7w0FlUyWNGg9Xam0l21Ydrfr4z/++6L/IvCVmFHrx3Oi410oAtbEOzpq+M
	3imczJiKnFHwsRHUaSrHtkXdOmppxXP7d70NH3HaLRoRq2M40Kymqk6EuVbuJVq8lcCn
	pdWDQMDKTlylss0rdvOpjvGXMToABacUDweUADRjT7T8Go5wg42jZHwhxFKKXuc4c+yM
	DaH3YG5xtZsqlgEs7aLe92NqocySMM5N0FuHyaTckOi3sU+FUpXamHVRVximSMvBgrgy
	2YIrwBZ/hF56AwUtkZpMw/t8TtF32UtISQwkdJiwE6P/fpCt/Y13xdqoT2LvRT6g1/0Q
	t1vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=V5jGdBaC5WYbBf/FQH0ueLkOYftIGA/mjeGIABMI0Qg=;
	b=pLVr3j38FuCFoqnvlRGSW35fBda+6TGx7VL1v4I24tUH1Ag4rte4MXnIzDCk5QEwGt
	SKxCoWYfu5LxEMwUtHMH1RVSMu1iba6oY1Hcw7kfXJoZ9+5dkGuBBFPGbiQSJj5fs4Ad
	7M8ak7utTgvCb37lbGAYyMV8Jlg2aGqO5NaRQkTcdmrltn5eDHxSyfvg/ABg0mORCS4O
	L0lN7XbzzvKnCbm+9GEWcM2Nbb2pqj0dREYFdY/r8QcEUrNssCLIjHFy15jvpC65VW3/
	l0klhFgwYzpFiynx0hiFtAIK1sN+11nWjKTGHNRq1uAsMNtNp5dJXCTVKwtruPdK+tDP
	53kA==
X-Gm-Message-State: APjAAAVTnOUHj8TTZ+QgoJ/FyuEVYw5HoclvAp6dNEPkgNGewFucbfCQ
	Y4N76kCkkUF8h/e3okPv6LO5RRbk
X-Google-Smtp-Source: APXvYqxPi0zBrNRHboCLn7Ma5amBYVWZolziaSI+ln2hR31lagBZnPAohuvKUD11kAKMnUIV6Z4Gxw==
X-Received: by 2002:aca:6084:: with SMTP id
	u126mr16945201oib.145.1554788665198; 
	Mon, 08 Apr 2019 22:44:25 -0700 (PDT)
Received: from ultima.ninicasiopea.net
	([2605:a601:43d5:f700:215:17ff:fe90:1065])
	by smtp.googlemail.com with ESMTPSA id
	n16sm11787705oic.7.2019.04.08.22.44.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Apr 2019 22:44:24 -0700 (PDT)
From: Mariano Lopez <just.another.mariano@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Apr 2019 00:44:11 -0500
Message-Id: <cover.1554787765.git.just.another.mariano@gmail.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Subject: [PATCH v4 0/4] Feature to use symbolic links to binaries for ptest
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
X-List-Received-Date: Tue, 09 Apr 2019 05:44:24 -0000
Content-Transfer-Encoding: 8bit

Some binaries are renamed by update-alternatives class at build time
and some ptest run against a binary belonging to another package. Take
for example busybox or util-linux.

This series adds a directory within the ptest with symlinks to the
binaries produced by the package, so just adding this directory to the
PATH will test the correct binaries.

To use this feature just add PTEST_BINDIR = "1" to the recipe.

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

v3 changes:

Fix white space mismatch

v4 changes:

Check for PTEST_ENABLED to add the functionality, this will solve the
issue when building nativesdk packages

The following changes since commit ffa5a1bda6741f5dc9f1b8db1bb37b0c6f103c99:

  asciidoc: specify XML catalogue to use (2019-04-03 14:56:27 +0100)

are available in the Git repository at:

  git://github.com/justanotherboy/poky bug13238v4
  https://github.com/justanotherboy/poky/tree/bug13238v4

Mariano Lopez (4):
  update-alternatives.bbclass: Add function to get metadata
  ptest.bbclass: Add feature to populate a binary directory
  util-linux: Use PTEST binary directory
  busybox: Use PTEST binary directory

 meta/classes/ptest.bbclass                    | 32 +++++++++
 meta/classes/update-alternatives.bbclass      | 70 ++++++++++++-------
 meta/recipes-core/busybox/busybox.inc         | 16 +----
 meta/recipes-core/util-linux/util-linux.inc   |  5 +-
 .../util-linux/util-linux/run-ptest           |  4 ++
 5 files changed, 86 insertions(+), 41 deletions(-)

-- 
2.19.2


