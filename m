Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2611C47422
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 12:47:01 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.14848.1706273215260153686
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jan 2024 04:46:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=myoE4Fqx;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=cEPuUknD9zlQgEcH8JelguRLh2nZmTHm1wllwguaOog=; b=myoE4FqxDrnJ62tQWqYbP+SkLv
	p/6UqpicX0O390N58jLgqyHy/Fc03WGfKNI05B4/8wC5zw3sFZ9aVqvi620x/qhS6BCQt1s5s52dB
	UzdhWsk83MoAQqNaUSd0yaGYmrx/OtKFnqskmE6KIJqB8iuesxMnUG2qHrjkwuZzD3uL8HcQUDrlh
	y4/lsooy9DiFNKEPkm9r+eoigjAc88rN3BcI2xTA36q1uoonpuLswX06Ix3km7LtpfskJkepQQuvU
	Dq6GZUDFvkJOToEfyNAHBl8R0ESefaSlCbByTKW7hfBNwES2pfllTOEZRhYdlNmZUvRnTItjSdX5r
	n54Mvf9Q==;
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.102.5]:50298 helo=fedora)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1rTLbc-009zgb-2X
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Jan 2024 07:46:54 -0500
Date: Fri, 26 Jan 2024 07:46:42 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: trying to create simple example of "externalsrc" recipe
Message-ID: <436ae552-2fad-8de3-9435-b03df2d2a823@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 12:47:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194356


  i've been trying to put together a really basic example of a recipe
using "externalsrc" that refers to some local source, and cannot get
it to work. so here's what i'm trying.

  as a demo, i selected a random simple OE recipe -- in this case,
"dmidecode", whose recipe you can see here (and which seems
conveniently simple for demonstration purposes):

https://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools/dmidecode/dmidecode_3.5.bb?h=master

so to start, since the SRC_URI is a tarball, i downloaded the tarball
so that i have the equivalent local source here:

  $ ls /home/rpjday/oe/srcs/dmidecode-3.5
  AUTHORS       dmioem.h     Makefile     util.c
  biosdecode.c  dmiopt.c     man          util.h
  config.h      dmiopt.h     NEWS         version.h
  dmidecode.c   dmioutput.c  ownership.c  vpddecode.c
  dmidecode.h   dmioutput.h  README       vpdopt.c
  dmioem.c      LICENSE      types.h      vpdopt.h
  $

  as my first test, i set the build to the source directory in my
dmid_1.0.bb recipe file:

  inherit externalsrc
  EXTERNALSRC = "/home/rpjday/oe/srcs/dmidecode-3.5"
  EXTERNALSRC_BUILD = "${EXTERNALSRC}"

  do_install() {
    oe_runmake \
        DESTDIR="${D}" \
        prefix="${prefix}" \
        sbindir="${sbindir}" \
        docdir="${docdir}/${BPN}" \
        mandir="${mandir}" \
        install

then ran:

  $ bitbake dmid

sure enough, that build in the source directory, generating:

  AUTHORS       dmidecode.o  dmioutput.h  ownership*   version.h
  biosdecode*   dmioem.c     dmioutput.o  ownership.c  vpddecode*
  biosdecode.c  dmioem.h     LICENSE      ownership.o  vpddecode.c
  biosdecode.o  dmioem.o     Makefile     README       vpddecode.o
  config.h      dmiopt.c     man/         types.h      vpdopt.c
  dmidecode*    dmiopt.h     NEWS         util.c       vpdopt.h
  dmidecode.c   dmiopt.o     oe-logs@     util.h       vpdopt.o
  dmidecode.h   dmioutput.c  oe-workdir@  util.o

  great, but i really want to build out-of-tree to preserve the
pristine state of the source, so i followed the instructions and
allowed EXTERNALSRC_BUILD to default to ${WORKDIR}/${BPN}-${PV}:

  inherit externalsrc
  EXTERNALSRC = "/home/rpjday/oe/srcs/dmidecode-3.5"
  # EXTERNALSRC_BUILD = "${EXTERNALSRC}"

so I did a "make clean" in the source directory to start with the
pristine source (also deleted the "oe-" symlinks), then:

$ bitbake dmid
... snip ...
| NOTE: make -j 8
DESTDIR=/home/rpjday/oe/builds/qemux86/tmp/work/core2-64-poky-linux/dmid/1.0/image
prefix=/usr sbindir=/usr/sbin docdir=/usr/share/doc/dmid
mandir=/usr/share/man install
| make: *** No rule to make target 'install'.  Stop.
| ERROR: oe_runmake failed

  from "bitbake -e dmid", i can see:

S="/home/rpjday/oe/srcs/dmidecode-3.5"
WORKDIR="/home/rpjday/oe/builds/qemux86/tmp/work/core2-64-poky-linux/dmid/1.0"
B="/home/rpjday/oe/builds/qemux86/tmp/work/core2-64-poky-linux/dmid/1.0/dmid-1.0"

but there is nothing unloaded into the B directory; hence, the
failure. in fact, the log file for the compile step is:

DEBUG: Executing python function externalsrc_compile_prefunc
NOTE: dmid: compiling from external source tree
/home/rpjday/oe/srcs/dmidecode-3.5
DEBUG: Python function externalsrc_compile_prefunc finished
DEBUG: Executing python function fetcher_hashes_dummyfunc
DEBUG: Python function fetcher_hashes_dummyfunc finished
DEBUG: Executing shell function do_compile
NOTE: nothing to compile
DEBUG: Shell function do_compile finished

  so ... what have i overlooked? did i grab an inappropriate sample
recipe that does not support building out-of-tree? the build directory
is empty, so i'm perusing the externalsrc.bbclass to see what i have
misunderstood.

rday



