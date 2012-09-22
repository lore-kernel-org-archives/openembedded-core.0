Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TFT7c-0002ma-Et
	for openembedded-core@lists.openembedded.org;
	Sat, 22 Sep 2012 19:04:04 +0200
Received: by wibhq4 with SMTP id hq4so2794256wib.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Sep 2012 09:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer;
	bh=Gw8WqJS5orz3QyQunZe/TQ9ywi2Tc+M8qb9dqvhha/k=;
	b=Bks+R2v6ABTqkLYFgNP2n+IbNd3CBPAGnuMwT5bBPKoJyZLFCmoFs4xZkDEhOm2ktn
	UcQdrPZR6Pfjb3DplwF8HCBeO5u3+XpWmOZDe9uJDef+a+/6ezaSuYtG/udlz+FroHf5
	r0/PoU+ag43Al7Avc879jiqVEpSnvvi5VxdgpLJvXpdgoReD6II4e/NKLQ/qL3Yaax4N
	wcTJ7t0BAB7Ol8+zRcdkBaKWYooQh0rMjCslozdW+DTzPW1ac+SatFAbqd6L8FoZOY5D
	qyUq8jLup+K1edLYPuLTtnMAiUEDRAEOD2YhMKpe7ap4IPINas5lK9X2twfgGfP1qW5t
	wipg==
Received: by 10.180.81.193 with SMTP id c1mr3885846wiy.12.1348332679127;
	Sat, 22 Sep 2012 09:51:19 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k2sm5130756wiz.7.2012.09.22.09.51.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 22 Sep 2012 09:51:18 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 22 Sep 2012 18:51:12 +0200
Message-Id: <cover.1348330479.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
Subject: [RFC 0/5] OPTDEFAULTTUNE for arm tune files
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 22 Sep 2012 17:04:04 -0000

This patchset is just RFC because I've modified and tested it only for
tune-arm926ejs and tune-xscale (because I've tried to build qemuarm and
same builddir).

Also I have no strong opinion about used TUNE as suffix (see 1. patch)
or as ARMPKGARCH (see last patch, which reverts most of 1. patch).

And what's even bigger mess are PACKAGE_EXTRA_ARCHS, because to be correct
we should repeat all tune-armv5te variations with xscale prefix/suffix too,
while most people will have only
armv5te and (armv5te-xscale or xscale-te)
current tune files allow also armv4t-xscale etc...

But FWIW with this patchset I can build openssl for qemuarm and qemuarmx,
everything except openssl is shared and built just once and also just once in feed.

qemuarmx is the same like qemuarm but using tune-xscale, see
http://git.openembedded.org/openembedded-core-contrib/log/?h=jansa/qemu-tests

If we decide this is right way to fix it then it should be extended to all arm tune
files. And also somehow set default DEFAULTTUNE to OPTDEFAULTTUNE if 
PACKAGE_ARCH == MACHINE_ARCH (in this case we know we won't share the feed, so why
use best mtune available).

This allows finer control of which DEFAULTTUNE to use

1) default: don't use mtune, optimize only for march (don't mix mtune in
the same feed).

2) include optimized-tune.inc in distro.conf: use mtune only for some packages, but
with separate package feed for them

3) DEFAULTTUNE = ${OPTDEFAULTTUNE} in distro.conf: always use best mtune
available for MACHINE, but unlike current default, don't mix them in
same package feed

More info in thread:
http://lists.linuxtogo.org/pipermail/openembedded-core/2012-September/029414.html

The following changes since commit 5e03d1e83d0536a2fc69a88d3e5407108836203f:

  gcc: Use 4.7.2 release tarball (2012-09-21 14:55:26 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib jansa/tune
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/tune

Martin Jansa (5):
  arch-arm: add ARMPKGSFX_CPU to TUNE_PKGARCH because we're using
    different TUNE_CCARGS
  tune-xscale, tune-arm926ejs: add OPTDEFAULTTUNE variable and use more
    generic DEFAULTTUNE as default
  optimized-tune.inc: add optional distro include
  bitbake.conf: add TUNE_CCARGS[vardepvalue]
  tune-xscale, tune-arm926ejs: drop ARMPKGSFX_CPU, change ARMPKGARCH
    instead

 meta/conf/bitbake.conf                       | 2 ++
 meta/conf/distro/include/optimized-tune.inc  | 2 ++
 meta/conf/machine/include/tune-arm926ejs.inc | 7 ++++---
 meta/conf/machine/include/tune-xscale.inc    | 8 +++++---
 4 files changed, 13 insertions(+), 6 deletions(-)
 create mode 100644 meta/conf/distro/include/optimized-tune.inc

-- 
1.7.12



