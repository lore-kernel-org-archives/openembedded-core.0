Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RqpUX-0005Wb-N8
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jan 2012 18:21:38 +0100
Received: by ghbg19 with SMTP id g19so802214ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2012 09:13:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=WVCZFVobBNsRLzIqCN3ArWAhMCC8yl2TwgXOnl1JgC4=;
	b=GKTOHIFAAjRVP/SVzcXXL/rQTB7jdKa3sE1542m53G1OjOJydLTtXZ610UxXYte7ZV
	L6xOFyIsCpXJT6Bfe15U2ezBndRxiuTdGapINFqKNk0zceO64IEuGO7v8FveC3MvLgc2
	vO6MrvGA636Fk0ipm3P7aV5PForKqfp4y/TWE=
Received: by 10.236.183.133 with SMTP id q5mr11740496yhm.38.1327684427719;
	Fri, 27 Jan 2012 09:13:47 -0800 (PST)
Received: from sb-u1004lts-64bit.alm.mentorg.com (hsvwanfw1-nat.mentorg.com.
	[139.181.24.34])
	by mx.google.com with ESMTPS id f47sm14547996yhh.8.2012.01.27.09.13.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 Jan 2012 09:13:47 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jan 2012 11:13:38 -0600
Message-Id: <cover.1327684024.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.8.rc4
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 00/10] external-csl-toolchain fixes and improvements
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
X-List-Received-Date: Fri, 27 Jan 2012 17:21:38 -0000

From: Christopher Larson <chris_larson@mentor.com>

- Fixes the external-csl-toolchain and corresponding tcmode to be compatible
  with current metadata (e.g. uses current providers), and ensures it works again
- Kills the arch and version specific bits, making it work fine with a number
  of different versions of the CodeSourcery arm, mips, ppc, and ia32 toolchains
- Makes the packaging match up with the packaging of the internal toolchain by
  leveraging the eglibc packaging .inc and ensuring our other packages are
  named correctly
- Extracts versioning information for both the recipe and emitted packages
  from the external toolchain at ConfigParsed time. This code is not pretty,
  largely kept as is from the Mentor internal external toolchain, but it does
  work. A future commit or commits will clean that up.

I've tested with with the fall 2010, spring 2011, and fall 2011 releases, for
the qemux86, qemuarm, qemumips, and qemuppc machines. I used buildhistory to
compare the packages and image content between internal and external, ensuring
that they match up with almost no differences.

The following changes since commit fba0459da7f274ae284d36b7fdbf2f9d10a52610:

  distro_tracking_fields: fix the typos in the field of maintainer. (2012-01-27 09:52:00 +0000)

are available in the git repository at:
  git://github.com/kergoth/oe-core external-toolchain

Christopher Larson (10):
      libc-package: fix typo in LOCALETREESRC default value
      eglibc-package.inc: don't include debug files in -pic
      binutils: fixes for build with an external csl toolchain
      external-csl-toolchain: fix critical PATH manipulation bug
      external-csl-toolchain: fixes for metadata changes
      external-csl-toolchain: avoid the hardcoded version/prefix
      external-csl-toolchain: support mips/ppc/arm
      external-csl-toolchain: support ia32
      external-csl-toolchain: leverage eglibc's packaging for more granular output
      external-csl-toolchain: extract version info from the toolchain

 meta/classes/libc-package.bbclass                  |    6 +-
 meta/conf/distro/include/csl-versions.inc          |  105 +++++++++++++++
 meta/conf/distro/include/tcmode-external-csl.inc   |  112 ++++++++++++++++
 .../distro/include/tcmode-external-csl2008q3.inc   |   28 ----
 meta/recipes-core/eglibc/eglibc-package.inc        |    2 +-
 meta/recipes-core/meta/external-csl-toolchain.bb   |  140 ++++++++++++++++++++
 .../meta/external-csl-toolchain_2008q3-72.bb       |   64 ---------
 meta/recipes-devtools/binutils/binutils.inc        |    5 +-
 8 files changed, 365 insertions(+), 97 deletions(-)
 create mode 100644 meta/conf/distro/include/csl-versions.inc
 create mode 100644 meta/conf/distro/include/tcmode-external-csl.inc
 delete mode 100644 meta/conf/distro/include/tcmode-external-csl2008q3.inc
 create mode 100644 meta/recipes-core/meta/external-csl-toolchain.bb
 delete mode 100644 meta/recipes-core/meta/external-csl-toolchain_2008q3-72.bb

Christopher Larson (10):
  libc-package: fix typo in LOCALETREESRC default value
  eglibc-package.inc: don't include debug files in -pic
  binutils: fixes for build with an external csl toolchain
  external-csl-toolchain: fix critical PATH manipulation bug
  external-csl-toolchain: fixes for metadata changes
  external-csl-toolchain: avoid the hardcoded version/prefix
  external-csl-toolchain: support mips/ppc/arm
  external-csl-toolchain: support ia32
  external-csl-toolchain: leverage eglibc's packaging for more granular
    output
  external-csl-toolchain: extract version info from the toolchain

 meta/classes/libc-package.bbclass                  |    6 +-
 meta/conf/distro/include/csl-versions.inc          |  105 +++++++++++++++
 meta/conf/distro/include/tcmode-external-csl.inc   |  112 ++++++++++++++++
 .../distro/include/tcmode-external-csl2008q3.inc   |   28 ----
 meta/recipes-core/eglibc/eglibc-package.inc        |    2 +-
 meta/recipes-core/meta/external-csl-toolchain.bb   |  140 ++++++++++++++++++++
 .../meta/external-csl-toolchain_2008q3-72.bb       |   64 ---------
 meta/recipes-devtools/binutils/binutils.inc        |    5 +-
 8 files changed, 365 insertions(+), 97 deletions(-)
 create mode 100644 meta/conf/distro/include/csl-versions.inc
 create mode 100644 meta/conf/distro/include/tcmode-external-csl.inc
 delete mode 100644 meta/conf/distro/include/tcmode-external-csl2008q3.inc
 create mode 100644 meta/recipes-core/meta/external-csl-toolchain.bb
 delete mode 100644 meta/recipes-core/meta/external-csl-toolchain_2008q3-72.bb

-- 
1.7.8.rc4



