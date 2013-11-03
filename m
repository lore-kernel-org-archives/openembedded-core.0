Return-Path: <cazfi74@gmail.com>
Received: from mail-qa0-f48.google.com (mail-qa0-f48.google.com
	[209.85.216.48])
	by mail.openembedded.org (Postfix) with ESMTP id 97C3D6D4A6
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Nov 2013 21:01:22 +0000 (UTC)
Received: by mail-qa0-f48.google.com with SMTP id w8so567996qac.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 03 Nov 2013 13:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=HCGwGLyIBbJ+qpc3s0iWSghwOmpMaQj3D8vGshW0JxM=;
	b=rTa3+VblWHkinqu1j0yHIrPom8TtQAGeAqo614iCPSI/QpFjqfbAZvutTFlmaTVlwA
	ArobfgybNun6ImidrzodwC/War4PUuE1tRdCHT81WOjtArHLOibvzSZPrcJcFzneHIpQ
	tqeDjfKB0oh9hIFducXYyGLm3jIRL27+kPr2turGco9e9w80DTrqoqmdyWa0D0QIbGDb
	FwM/YfaMs21oy7bMU9i8Q8sJaoAfqdrXvy2PE2ir2vGGAokQwfjgBjZh5k/YjWoPKFuD
	PdSX0M2aV8oMzcv3EhGMgG1N29wNRBHqLsXQLFB9GRPjd3QtxyZrgWJ9kq/KlnIiPVuT
	7CaQ==
MIME-Version: 1.0
X-Received: by 10.49.62.137 with SMTP id y9mr17846213qer.59.1383512484037;
	Sun, 03 Nov 2013 13:01:24 -0800 (PST)
Received: by 10.224.124.67 with HTTP; Sun, 3 Nov 2013 13:01:24 -0800 (PST)
Date: Sun, 3 Nov 2013 23:01:24 +0200
Message-ID: <CAF6bG8eDKbRS1M__+s=fvAw-+1SLdj1yr2Y3JOXpvggVbBvCqg@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: grub build problems
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
X-List-Received-Date: Sun, 03 Nov 2013 21:01:23 -0000
Content-Type: text/plain; charset=UTF-8

I've got host compiler that fails on grub configure checks (bug in
system headers that has not manifested itself in any other
compilation). Now, build of grub-efi-native_2.0 recipe fails. It seems
its configure uses host compiler when it's supposed to use oe
cross-compiler.
configure.ac has hack like this (with TARGET_CC set earlier)
# Test the C compiler for the target environment.
...
CC="$TARGET_CC"


One of the problems seems to be that above compiler is then not
consistently used. Many .m4 files have AC_REQUIRE([AC_PROG_CC]) which
resets CC to what autotools usually expect it to be. Removing these
AC_REQUIREs do allow process to progress further, but I'm worried what
ill effects that might have (at least it expects that modified
m4-files from grub-tree are used instead of system ones, even if the
latter has higher serial number).

Another thing I've played with (from the lack of reproducible test
cases cannot really tell if it's needed) is adding dependency to
cross-gcc (one that grub considers "target gcc") as grub build wants
to use also such a thing despite being -native recipe.


 - ML

