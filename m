Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QZCXg-00034j-RP
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 03:47:45 +0200
Received: by mail-pv0-f175.google.com with SMTP id 24so242869pvf.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2011 18:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=EUbrZkBnsl8bo16DkV9/0G948F1vWYhAG1FxN/P/tTQ=;
	b=Kxj8EOYTdpubVCDFMmnq+Mx7SbpDSGeXyNdtphcWU+HDuYRq8Vhgcrq1B9I1PYsrA2
	RNqlw8MTpEQS6vYA3nxukJbi9UHkkGacRxrq1PSth0NQ/Xwehba7pVqaWmuk7dbEHNka
	yxbhqAZHlWc2ox08YGGn2x8AkU1pAIXyFSiU4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=BHmz8fGZ48In4q3VcS0BAB+jIIjz2usb9AUq0AcfyqnML4oNNUsb8ti5HDOYZWxxAA
	v2XxJr5lH1xOMkBNHFO1U8vCU+k8Wxo/NlxkMuzajQo1U/w7W2Xfswr6eq3Vc8nAfGXY
	OkF42dZlpYbryM/hW1eBq44Ki/btUQWGotKXA=
Received: by 10.68.71.134 with SMTP id v6mr31118pbu.359.1308707052915;
	Tue, 21 Jun 2011 18:44:12 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id p5sm55027pbd.92.2011.06.21.18.44.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 21 Jun 2011 18:44:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Tue, 21 Jun 2011 18:44:05 -0700
Message-Id: <cover.1308706511.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/4] uclibc and related fixes
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
X-List-Received-Date: Wed, 22 Jun 2011 01:47:45 -0000

Fix uclibc build for x86_64
gettext compile failed on uclibc so fix it and additionally
remove unused patches
Add required support for systemd to function with uclibc
Quash a parse warning where uclibc-initial and uclibc
both provided libsegfault

The following changes since commit 78de64f58b98101f5be5778e9ecbdaae5ba32997:

  binutils_2.21.bb: Fix ld segfault exposed by eglibc 2.14 on x86_64 (2011-06-21 17:58:06 -0700)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib kraj/uclibc
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/uclibc

Khem Raj (4):
  uclibc.inc: libsegfault is only RPROVIDED by uclibc
  gettext-0.18.1.1: Remove unused patches
  uclibc/x86_64/uClibc.machine: Enable ARCH_USE_MMU
  uclibc: Add support for $ORIGIN

 .../gettext/gettext-0.18.1.1/autotools.patch       |   64 ------
 .../gettext-error_print_progname.patch             |   15 --
 .../gettext/gettext-0.18.1.1/m4fix.patch           |   52 -----
 .../gettext-0.18.1.1/use_open_properly.patch       |   17 --
 meta/recipes-core/gettext/gettext_0.18.1.1.bb      |    1 -
 .../uclibc/uclibc-git/orign_path.patch             |  183 +++++++++++++++++
 meta/recipes-core/uclibc/uclibc-git/rtld_no.patch  |  215 ++++++++++++++++++++
 .../uclibc/uclibc-git/x86_64/uClibc.machine        |    3 +-
 meta/recipes-core/uclibc/uclibc.inc                |    2 +-
 meta/recipes-core/uclibc/uclibc_git.bb             |    4 +-
 10 files changed, 403 insertions(+), 153 deletions(-)
 delete mode 100644 meta/recipes-core/gettext/gettext-0.18.1.1/autotools.patch
 delete mode 100644 meta/recipes-core/gettext/gettext-0.18.1.1/gettext-error_print_progname.patch
 delete mode 100644 meta/recipes-core/gettext/gettext-0.18.1.1/m4fix.patch
 delete mode 100644 meta/recipes-core/gettext/gettext-0.18.1.1/use_open_properly.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/orign_path.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/rtld_no.patch

-- 
1.7.5.1



