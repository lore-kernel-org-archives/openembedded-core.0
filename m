Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QOxB8-00029K-Rt
	for openembedded-core@lists.openembedded.org;
	Tue, 24 May 2011 21:22:07 +0200
Received: by pwj9 with SMTP id 9so3238555pwj.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2011 12:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=sQC2bd7dtsB5URvF9LX9w4B9BylsAU6jq2gAisAjcCc=;
	b=eIPy5zF9dzH89NgbGyW+evc49Gryg90B6/leWsrvRgcGbvbDhWgqgUxG7P8SMOfB5e
	uslsSBk3v6hIZP+2B6JapxnOyTQoLbZM7oXeFWODNxQEPdRN5oqwYbeIlmuZCR01Eb1A
	7vKzW/r2upBnkDyJ3xLpVkpzsL3I+qSf1dyXM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=tVL/CM20uMPFjpH8S+3d5ABZkkkY56IbM3uUhLa1a3OKu0CsKURiCvpQI7zbhu02Lg
	mR4BGMyiq21RIO2RRydr+DA3CoIpM2SURbrPNMiOHyDAlEA5TYNAYLusWTg1sR/IWCaZ
	vkPj6yM0UT4LE5rYDkc1wHlG27Iji/lJVknjE=
Received: by 10.68.36.234 with SMTP id t10mr2872295pbj.361.1306264733197;
	Tue, 24 May 2011 12:18:53 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id q10sm5169166pbk.39.2011.05.24.12.18.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 24 May 2011 12:18:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Tue, 24 May 2011 12:18:45 -0700
Message-Id: <cover.1306264437.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/2] Fixes for eglibc parallel build and elfutils on uclibc
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
X-List-Received-Date: Tue, 24 May 2011 19:22:07 -0000

This patchset addresses the issue Saul ran into with do_install on eglibc
second patch is to get elfutils compile partially for uclibc, the reason is that
it also provides libelf which is needed by other packages such as gcc 4.5
to build. So either we add a new recipe for just providing libelf and add
magic to chose which one to use or we make elfutils to not build everything
but only elfutils when doing it for uclibc. I chose the second aproach


The following changes since commit d33ada10fdcc830f11dc47bd55f529157d1d280b:

  elfutils_0.148.bb: Fix compilation on uclibc (2011-05-24 12:06:30 -0700)

are available in the git repository at:
  git@git.openembedded.org:openembedded-core-contrib.git kraj/misc-fixes
  http://cgit.openembedded.org/cgit.cgi//log/?h=kraj/misc-fixes

Khem Raj (2):
  elfutils_0.148.bb: Fix compilation on uclibc
  eglibc.inc: Transfer PARALLEL_MAKE to PARALLELMFLAGS

 meta/recipes-core/eglibc/eglibc.inc                |    6 ++
 .../elfutils/elfutils-0.148/uclibc-support.patch   |   91 ++++++++++++++++++++
 meta/recipes-devtools/elfutils/elfutils_0.148.bb   |   15 +++-
 3 files changed, 109 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.148/uclibc-support.patch

-- 
1.7.4.1



