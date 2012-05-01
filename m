Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SPFc6-0000im-Kt
	for openembedded-core@lists.openembedded.org;
	Tue, 01 May 2012 18:07:42 +0200
Received: by obhx4 with SMTP id x4so5074723obh.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 May 2012 08:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer;
	bh=okF8LkLcycQv6zEnUtXHs4Dmv1ArG+kJ3nN0eTn7z24=;
	b=tgbwKzJs7jkc9VGpUgXTXcvFX6pt8YkRdwmRLzp+Ajt0ys1XyUOj3OMX7w6RoOFN1G
	U0KKnYLT1DM0jALIiUR77bij4f+c15vdoJy3/ADGSueGUZP7skLRAFG6V383jmQqQuPF
	d0Y2I0hB+eTsbLo4s/2hZb3QM0owo0j9/B+fm1DwRFHbByi5bdiZkrTPqEXNW39R4vxX
	9GSRS2MSNzwYTc31pfJzcJy/N8A45dAT5EQS06j2gtTNybuo7NZtmzvUGuGS2QXmK/nV
	NIB7Xl2NYSkM+6uhM5+xGlJZ0DYSpF7ZUSDXKoeRQDYVqSUm0vPMHATl7SmwjRwVP9pz
	cCmg==
Received: by 10.182.188.41 with SMTP id fx9mr32169486obc.3.1335887878869;
	Tue, 01 May 2012 08:57:58 -0700 (PDT)
Received: from localhost.localdomain (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id h7sm16733267oeh.9.2012.05.01.08.57.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 May 2012 08:57:57 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 May 2012 10:58:18 -0500
Message-Id: <cover.1335887732.git.kergoth@gmail.com>
X-Mailer: git-send-email 1.7.7
Subject: [PATCH 0/8] External CSL toolchain improvements
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
X-List-Received-Date: Tue, 01 May 2012 16:07:42 -0000

See the commit message summaries for details, but this syncs up my local
external-csl-toolchain recipe with upstream, which includes general cleanup
and use of base_libdir to fix issues with mips64, splits out
libstdc++-staticdev, adds CSL_VER_MAIN to target recipe signatures, and fixes
and uses precompiled locales rather than regenerating them.

Most of this is straightforward, but I would appreciate review in particular
of the "libc-package: rework 'precompiled' locale handling". Thanks.

The following changes since commit 26d822ad059dd4839cc6fee2a65714e73cc146e1:

  nfs-utils: don't try to unload nfsd module (2012-05-01 14:28:47 +0100)

are available in the git repository at:
  git://github.com/kergoth/oe-core external-csl-improvements

Christopher Larson (8):
      csl-versions.inc: capture version in signatures
      external-csl-toolchain: split out a libstdc++-staticdev package
      external-csl-toolchain: silence .a/.debug QA warnings
      external-csl-toolchain: cleanup, simplify, use base_libdir
      external-csl-toolchain: update SUPPORTED to match toolchain
      tclibc-eglibc: drop hardcoded locale-base-en-us/en-gb
      libc-package: rework ''precompiled' locale handling
      tcmode-external-csl: use the existing precompiled locale files

 meta/classes/libc-package.bbclass                  |   96 ++++----
 meta/conf/distro/include/csl-versions.inc          |    4 +
 meta/conf/distro/include/tclibc-eglibc.inc         |   12 +-
 meta/conf/distro/include/tcmode-external-csl.inc   |    4 +
 meta/recipes-core/meta/external-csl-toolchain.bb   |   68 +++---
 .../meta/external-csl-toolchain/SUPPORTED          |  257 +++++++++++++++++++-
 6 files changed, 346 insertions(+), 95 deletions(-)

Christopher Larson (8):
  csl-versions.inc: capture version in signatures
  external-csl-toolchain: split out a libstdc++-staticdev package
  external-csl-toolchain: silence .a/.debug QA warnings
  external-csl-toolchain: cleanup, simplify, use base_libdir
  external-csl-toolchain: update SUPPORTED to match toolchain
  tclibc-eglibc: drop hardcoded locale-base-en-us/en-gb
  libc-package: rework ''precompiled' locale handling
  tcmode-external-csl: use the existing precompiled locale files

 meta/classes/libc-package.bbclass                  |   96 ++++----
 meta/conf/distro/include/csl-versions.inc          |    4 +
 meta/conf/distro/include/tclibc-eglibc.inc         |   12 +-
 meta/conf/distro/include/tcmode-external-csl.inc   |    4 +
 meta/recipes-core/meta/external-csl-toolchain.bb   |   68 +++---
 .../meta/external-csl-toolchain/SUPPORTED          |  257 +++++++++++++++++++-
 6 files changed, 346 insertions(+), 95 deletions(-)

-- 
1.7.7



