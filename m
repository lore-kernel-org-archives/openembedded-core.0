Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E20EC46CA0
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 23:55:13 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.7766.1701474911086539714
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Dec 2023 15:55:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=GbvYNuIz;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BA71B20004;
	Fri,  1 Dec 2023 23:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701474909;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/WfTd0CAJw3aEAwrCKrNtOC4zmYqNzhUUEWtO6OsAz4=;
	b=GbvYNuIztyd0CraqA6T+dW35SkUpFrjPd3bBVCiObrTPY6nbc8r6084J2qzBLbLZDUZpbk
	DhBayqOGmPqZNtIYx5NA4cm2hQt3g4gBYEGuqj+eIssj7uiMhPSO9M7GAyYg4eme0z3tXE
	XPOOX7Fi5GdAW25JL/WRZlfxaTTE3jrwFN6Ew8iugOU2/YZEf22F4En39EwWahn6NcN4ge
	WBrr/bFuCTda/J4EaBcdstx6udprJwiaC3ygrXSP7MX9Ljzsdb32HU3xw6n5masfZ1raOa
	ZIRXJxOMBURk2Nzg81j3Y4gF7FY3cQq4C6tAUegqC70RG5d7eoqGaPjTY6ee7Q==
Date: Sat, 2 Dec 2023 00:55:08 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 6/6] llvm: Upgrade to 17.0.6
Message-ID: <2023120123550896838280@mail.local>
References: <20231201183356.311137-1-raj.khem@gmail.com>
 <20231201183356.311137-6-raj.khem@gmail.com>
 <179CD8EAC4F00896.18076@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179CD8EAC4F00896.18076@lists.openembedded.org>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 23:55:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191694

On 02/12/2023 00:27:39+0100, Alexandre Belloni via lists.openembedded.org wrote:
> This breaks:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/106/builds/7190/steps/11/logs/stdio

Actually, this one reproduced without the patch

> https://autobuilder.yoctoproject.org/typhoon/#/builders/146/builds/960/steps/12/logs/stdio

But not this one.

> 
> On 01/12/2023 10:33:54-0800, Khem Raj wrote:
> > Bring in these changes
> > 
> > * 6009708b4367 Revert "[runtimes] Add missing test dependencies to check-all (#72955)"
> > * 04caadc61fa2 [Driver] Enable __float128 support on X86 on FreeBSD / NetBSD (#72788)
> > * e919a83f96fe eliminate python SyntaxWarnings from check-all output.
> > * f6c231c15ec8 [clang-format] Fix crashes in AlignArrayOfStructures (#72520)
> > * f74f3e6f58d3 [clang] Fix sorting module headers (#73146)
> > * 7e30ce9528d9 [JITLink][aarch32] Change writeRegister's return type to void.
> > * 03373fd9cb6c [CMake] Support building shared library for NetBSD
> > * 21af3b62b632 workflows/release-binaries: Do a preliminary build to fill ccache (#72576)
> > * 201faeca595e Add RV64 constraint to SRLIW (#69416)
> > * e957e6dcb29d [runtimes] Add missing test dependencies to check-all (#72955)
> > * f8575ff46f89 [clang-format] Fix a bug in aligning comments above PPDirective (#72791)
> > * a71237b9f67f [clangd] Avoid null result in FindRecordTypeAt()
> > * 308c816de5a4 Bump version to 17.0.6
> > * 442401f7c0ca remove tests from bad merge
> > * 76c7e0e1e2d1 Use the correct namespace for looking up matching operator!= (#68922)
> > * b5cbb35408a3 [libc++] Use correct size for deallocation of arrays in shared_ptr (#68233)
> > * e6de86cb9ef8 Revert "Reland [clang] Canonicalize system headers in dependency file when -canonical-prefixes" (#71697)
> > * bb66d8f8f73b [clang][WebAssembly] Link crt1 even in case of -shared
> > 
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-devtools/llvm/llvm_git.bb | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
> > index de8d4116868..9a88549260a 100644
> > --- a/meta/recipes-devtools/llvm/llvm_git.bb
> > +++ b/meta/recipes-devtools/llvm/llvm_git.bb
> > @@ -14,14 +14,14 @@ RDEPENDS:${PN}:append:class-target = " ncurses-terminfo"
> >  
> >  inherit cmake pkgconfig
> >  
> > -PV = "17.0.5"
> > +PV = "17.0.6"
> >  
> >  MAJOR_VERSION = "${@oe.utils.trim_version("${PV}", 1)}"
> >  
> >  LLVM_RELEASE = "${PV}"
> >  
> >  BRANCH = "release/${MAJOR_VERSION}.x"
> > -SRCREV = "98bfdac5ce82d1679f8af9a57501471812ab68d7"
> > +SRCREV = "6009708b4367171ccdbf4b5905cb6a803753fe18"
> >  SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH};protocol=https \
> >             file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
> >             file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
> > -- 
> > 2.43.0
> > 
> 
> > 
> > 
> > 
> 
> 
> -- 
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191693): https://lists.openembedded.org/g/openembedded-core/message/191693
> Mute This Topic: https://lists.openembedded.org/mt/102921840/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

