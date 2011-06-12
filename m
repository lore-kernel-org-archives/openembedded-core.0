Received: from mail-px0-f178.google.com ([209.85.212.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QVcCP-0001kw-EZ
	for openembedded-core@lists.openembedded.org;
	Sun, 12 Jun 2011 06:22:57 +0200
Received: by pxj1 with SMTP id 1so2424185pxj.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jun 2011 21:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=6R1IeNZZapM6oUz/8pn15VDbmYEHJbsx32reKSxlODM=;
	b=f54MTT9W2EYqKm+Z5Uj5FR+K9uFR7rE8WsR3RfoHaiJaI576m9H1K93GUTEheyLXNr
	kt4kSGQKt5CutYGgxrNJGjVIbvPRXYuy4ucRHjLuLGnkf8z+MOvWOOaLM4+aM9clO8wV
	U4b2iByT7v6R5ePxkNPgmiPN7hDL1v8IG1ZF8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=e8S9qe2Rer/1vbJk9fqHigG8PTId6hvCN3CZMoiqCjFRU06DAKE+983f9yhjuV4tV6
	nPHfnLeOnAc4/9cdbYghPom0vJPfn9Nq4u3PyBSes5KOsRAK+ZYIWuwGQ3h5+kmVb+9O
	YVfbHOb98T09O84sED4WApXRPP0/e9E6aJiVs=
Received: by 10.68.29.8 with SMTP id f8mr1109235pbh.39.1307852363031;
	Sat, 11 Jun 2011 21:19:23 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id m9sm3581222pbd.7.2011.06.11.21.19.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 11 Jun 2011 21:19:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Sat, 11 Jun 2011 21:19:00 -0700
Message-Id: <cover.1307852182.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Cc: Phil Blundell <philb@gnu.org>
Subject: [PATCH 0/6] uclibc cleanups
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
X-List-Received-Date: Sun, 12 Jun 2011 04:22:57 -0000

This set of patches cleans up uclibc recipes and builds
in addition it also fixes the issues where gettext was being
pulled in even when uclibc did not require it and gettext itself
needed to be patched to build on uclibc.

The following changes since commit fb85c6a6184184f6eed942af59ce2cf03f6b623b:

  uclibc: remove PACKAGE_ARCH, fix compilation on i586 (2011-06-11 21:03:57 -0700)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib kraj/uclibc-cleanup
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/uclibc-cleanup

Khem Raj (4):
  util-macros_1.13.0.bb: Depend on virtual/gettext instead of gettext
  uclibc.inc: libsegfault is only RPROVIDED by uclibc
  gettext_0.18.1.1.bb: Fix build on uclibc
  uclibc: Cleanup the machine dependent config files

Phil Blundell (2):
  uclibc: remove redundant python code
  uclibc: remove PACKAGE_ARCH, fix compilation on i586

 .../gnulib-uclibc-sched_param-def.patch            |   21 ++++++
 meta/recipes-core/gettext/gettext_0.18.1.1.bb      |    7 +-
 .../uclibc/uclibc-git/armv5te/uClibc.machine       |    4 +-
 .../{nslu2be => armv5teb}/uClibc.machine           |    0
 .../uclibc/uclibc-git/efika/uClibc.machine         |   45 ------------
 .../uclibc-git/{qemumips => mips}/uClibc.machine   |    0
 .../uclibc/uclibc-git/qemuarm/uClibc.machine       |   77 --------------------
 .../uclibc/uclibc-git/qemux86/uClibc.machine       |   59 ---------------
 meta/recipes-core/uclibc/uclibc-git/uClibc.distro  |   14 ++++-
 meta/recipes-core/uclibc/uclibc.inc                |   19 +----
 meta/recipes-core/uclibc/uclibc_git.bb             |    5 +-
 .../xorg-util/util-macros_1.13.0.bb                |    4 +-
 12 files changed, 47 insertions(+), 208 deletions(-)
 create mode 100644 meta/recipes-core/gettext/gettext-0.18.1.1/gnulib-uclibc-sched_param-def.patch
 rename meta/recipes-core/uclibc/uclibc-git/{nslu2be => armv5teb}/uClibc.machine (100%)
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/efika/uClibc.machine
 rename meta/recipes-core/uclibc/uclibc-git/{qemumips => mips}/uClibc.machine (100%)
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/qemuarm/uClibc.machine
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/qemux86/uClibc.machine
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/uClibc.config

-- 
1.7.4.1



