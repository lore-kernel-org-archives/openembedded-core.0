Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB5C4C4708C
	for <webhook@archiver.kernel.org>; Mon,  5 Dec 2022 22:16:17 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.30401.1670278573914485883
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Dec 2022 14:16:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Ds2XJLac;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id C16B740002;
	Mon,  5 Dec 2022 22:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1670278572;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=e1MZ0Hl9H6JZULQ3pd23jP+cRUnTCSfF0YZUCW7HMBg=;
	b=Ds2XJLacfnbVB8CsKv3SJKwyO5zhErVnMmIIaxAN0128cMc4qO8MU94R5HU2hC/NkSYKAB
	FKIYI/KDqht3UsDV3mv2G3B6AXnU+FZyu6xeQvgZ3+IiwuLuIhD4FRBObsYvjgBTVRus4A
	rHBPwU4WMEPJ1cFQ3szXVWyIVUHctjG+QKMaFNWpTIuxQxonhtG1qPL7GhqGxXj+HBXiJi
	HuAKww7qOetNneRws80lFkjAfHW4oALN6B9P83ZI24OtY5Nfo33drdxq65GGjflA+OGxOP
	9JKzZq27rVM4si5eFvh6as/qOT4NC7s57Kw5PlUwce2BkMlPaazwEFsVxgP9og==
Date: Mon, 5 Dec 2022 23:16:11 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: reatmon@ti.com
Cc: raj.khem@gmail.com, openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v3][master] go: Update reproducibility patch to
 fix panic errors
Message-ID: <Y45tq3xWsOyWAPpo@mail.local>
References: <172C139C5D52718E.368@lists.openembedded.org>
 <c949cf5a-fe8f-c842-514b-75a016e8e111@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c949cf5a-fe8f-c842-514b-75a016e8e111@ti.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Dec 2022 22:16:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174306

Hello,

On 05/12/2022 13:49:48-0600, Ryan Eatmon via lists.openembedded.org wrote:
> 
> This might have gotten lost in the fun of the YPS and the many discussions
> around the previous versions of then patch.  Was there any more feedback or
> changes that folks want me to make for this patch, or is it good to go?
> Just curious if there was more that you needed from me?
> 

It passed successfully on the autobuilders, it is now up to Richard to
merge.

> 
> On 11/29/2022 8:12, Ryan Eatmon via lists.openembedded.org wrote:
> > Based on a discussion on the mailing list [1], there are panic
> > errors that occur on a few platforms caused by the patch.  We
> > cannot simply remove the original patch due to the
> > reproducibility issues that it addresses, so this patch on the
> > original patch fixes the cause of the panic errors.
> > 
> > The previous version of this patch was a little too aggressive
> > in cleaning up the environment.  Some of the variables impacted
> > by the filerCompilerFlags() function require at least one value
> > to remain in the array.  In this case, the values for ccExe,
> > cxxExe, and fcExe require a value or later code that access
> > them result in a panic related to accessing a value out of range.
> > 
> > This updated patch adds a flag that requires keeping the first
> > value so that at least one thing remains and the assignments
> > for the Exes set that flag to true.  The first item in the
> > array should be the executable name, so leaving it should be
> > safe.
> > 
> > I have run the oe-selftest and everything passed in my setup.
> > 
> > There is a bug report [2] filed for the issue that this patch
> > addresses.
> > 
> > [YOCTO #14976]
> > 
> > [1] https://lists.openembedded.org/g/openembedded-core/topic/94022663
> > [2] https://bugzilla.yoctoproject.org/show_bug.cgi?id=14976
> > 
> > Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> > ---
> > v3: Added [YOCTO #14976] to commit message.
> > v2: Added more background and bug report link to commit message.
> > 
> >   ...ent-based-hash-generation-less-pedan.patch | 30 ++++++++++---------
> >   1 file changed, 16 insertions(+), 14 deletions(-)
> > 
> > diff --git a/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch b/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
> > index 17fa9d9831..43be5cd2e8 100644
> > --- a/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
> > +++ b/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
> > @@ -74,7 +74,7 @@ index c88b315..a06455c 100644
> >   +		cppflags, cflags, cxxflags, fflags, ldflags, _ := b.CFlags(p, true)
> >   -		ccExe := b.ccExe()
> > -+		ccExe := filterCompilerFlags(b.ccExe())
> > ++		ccExe := filterCompilerFlags(b.ccExe(), true)
> >    		fmt.Fprintf(h, "CC=%q %q %q %q\n", ccExe, cppflags, cflags, ldflags)
> >    		// Include the C compiler tool ID so that if the C
> >    		// compiler changes we rebuild the package.
> > @@ -83,7 +83,7 @@ index c88b315..a06455c 100644
> >    		}
> >    		if len(p.CXXFiles)+len(p.SwigCXXFiles) > 0 {
> >   -			cxxExe := b.cxxExe()
> > -+			cxxExe := filterCompilerFlags(b.cxxExe())
> > ++			cxxExe := filterCompilerFlags(b.cxxExe(), true)
> >    			fmt.Fprintf(h, "CXX=%q %q\n", cxxExe, cxxflags)
> >    			if cxxID, err := b.gccToolID(cxxExe[0], "c++"); err == nil {
> >    				fmt.Fprintf(h, "CXX ID=%q\n", cxxID)
> > @@ -91,7 +91,7 @@ index c88b315..a06455c 100644
> >    		}
> >    		if len(p.FFiles) > 0 {
> >   -			fcExe := b.fcExe()
> > -+			fcExe := filterCompilerFlags(b.fcExe())
> > ++			fcExe := filterCompilerFlags(b.fcExe(), true)
> >    			fmt.Fprintf(h, "FC=%q %q\n", fcExe, fflags)
> >    			if fcID, err := b.gccToolID(fcExe[0], "f95"); err == nil {
> >    				fmt.Fprintf(h, "FC ID=%q\n", fcID)
> > @@ -104,20 +104,22 @@ index c88b315..a06455c 100644
> >    	}
> >    	// Configuration specific to compiler toolchain.
> > -@@ -2705,8 +2707,23 @@ func envList(key, def string) []string {
> > +@@ -2705,8 +2707,25 @@ func envList(key, def string) []string {
> >    	return args
> >    }
> >   +var filterFlags = os.Getenv("CGO_PEDANTIC") == ""
> >   +
> > -+func filterCompilerFlags(flags []string) []string {
> > ++func filterCompilerFlags(flags []string, keepfirst bool) []string {
> >   +	var newflags []string
> > ++   var realkeepfirst bool = keepfirst
> >   +	if !filterFlags {
> >   +		return flags
> >   +	}
> >   +	for _, flag := range flags {
> > -+		if strings.HasPrefix(flag, "-m") {
> > ++		if strings.HasPrefix(flag, "-m") || realkeepfirst {
> >   +			newflags = append(newflags, flag)
> > ++           realkeepfirst = false
> >   +		}
> >   +	}
> >   +	return newflags
> > @@ -129,21 +131,21 @@ index c88b315..a06455c 100644
> >    	defaults := "-g -O2"
> >    	if cppflags, err = buildFlags("CPPFLAGS", "", p.CgoCPPFLAGS, checkCompilerFlags); err != nil {
> > -@@ -2724,6 +2741,13 @@ func (b *Builder) CFlags(p *load.Package) (cppflags, cflags, cxxflags, fflags, l
> > +@@ -2724,6 +2743,13 @@ func (b *Builder) CFlags(p *load.Package) (cppflags, cflags, cxxflags, fflags, l
> >    	if ldflags, err = buildFlags("LDFLAGS", defaults, p.CgoLDFLAGS, checkLinkerFlags); err != nil {
> >    		return
> >    	}
> >   +	if filtered {
> > -+		cppflags = filterCompilerFlags(cppflags)
> > -+		cflags = filterCompilerFlags(cflags)
> > -+		cxxflags = filterCompilerFlags(cxxflags)
> > -+		fflags = filterCompilerFlags(fflags)
> > -+		ldflags = filterCompilerFlags(ldflags)
> > ++		cppflags = filterCompilerFlags(cppflags, false)
> > ++		cflags = filterCompilerFlags(cflags, false)
> > ++		cxxflags = filterCompilerFlags(cxxflags, false)
> > ++		fflags = filterCompilerFlags(fflags, false)
> > ++		ldflags = filterCompilerFlags(ldflags, false)
> >   +	}
> >    	return
> >    }
> > -@@ -2739,7 +2763,7 @@ var cgoRe = lazyregexp.New(`[/\\:]`)
> > +@@ -2739,7 +2765,7 @@ var cgoRe = lazyregexp.New(`[/\\:]`)
> >    func (b *Builder) cgo(a *Action, cgoExe, objdir string, pcCFLAGS, pcLDFLAGS, cgofiles, gccfiles, gxxfiles, mfiles, ffiles []string) (outGo, outObj []string, err error) {
> >    	p := a.Package
> > @@ -152,7 +154,7 @@ index c88b315..a06455c 100644
> >    	if err != nil {
> >    		return nil, nil, err
> >    	}
> > -@@ -3246,7 +3270,7 @@ func (b *Builder) swigIntSize(objdir string) (intsize string, err error) {
> > +@@ -3246,7 +3272,7 @@ func (b *Builder) swigIntSize(objdir string) (intsize string, err error) {
> >    // Run SWIG on one SWIG input file.
> >    func (b *Builder) swigOne(a *Action, p *load.Package, file, objdir string, pcCFLAGS []string, cxx bool, intgosize string) (outGo, outC string, err error) {
> > 
> > 
> > 
> > 
> > 
> 
> -- 
> Ryan Eatmon                reatmon@ti.com
> -----------------------------------------
> Texas Instruments, Inc.  -  LCPD  -  MGTS

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#174301): https://lists.openembedded.org/g/openembedded-core/message/174301
> Mute This Topic: https://lists.openembedded.org/mt/95334740/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

