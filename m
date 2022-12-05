Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18707C4332F
	for <webhook@archiver.kernel.org>; Mon,  5 Dec 2022 19:49:57 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.26252.1670269792371104947
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Dec 2022 11:49:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ZnuNsnHo;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2B5JnnRC059414;
	Mon, 5 Dec 2022 13:49:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1670269789;
	bh=HCI5PRw8hNdMVGCXpZCyvJjrk6OuvlO69/WNhf2xqWA=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=ZnuNsnHofBd+fe5SmjozzjZk9c7J3STeTrIlMEZDdOFEiaRF3X8KPgorlsp5TCSiS
	 7ePBQ7/Qu0WbNv9TC6W6c6mPjSAfv3IQKarUi16DV6cSZF48FZYEd1LY1v5d7zBbgO
	 7u8RAPWbBrrR2oRsa1UvydP5KYa1vwsA47CKKF/8=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2B5Jnnkm018986
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 5 Dec 2022 13:49:49 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 5
 Dec 2022 13:49:49 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 5 Dec 2022 13:49:49 -0600
Received: from [10.250.35.27] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2B5JnnYZ046166;
	Mon, 5 Dec 2022 13:49:49 -0600
Message-ID: <c949cf5a-fe8f-c842-514b-75a016e8e111@ti.com>
Date: Mon, 5 Dec 2022 13:49:48 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [OE-core] [PATCH v3][master] go: Update reproducibility patch to
 fix panic errors
Content-Language: en-US
To: <raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>
References: <172C139C5D52718E.368@lists.openembedded.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <172C139C5D52718E.368@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Dec 2022 19:49:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174301


This might have gotten lost in the fun of the YPS and the many 
discussions around the previous versions of then patch.  Was there any 
more feedback or changes that folks want me to make for this patch, or 
is it good to go?  Just curious if there was more that you needed from me?


On 11/29/2022 8:12, Ryan Eatmon via lists.openembedded.org wrote:
> Based on a discussion on the mailing list [1], there are panic
> errors that occur on a few platforms caused by the patch.  We
> cannot simply remove the original patch due to the
> reproducibility issues that it addresses, so this patch on the
> original patch fixes the cause of the panic errors.
> 
> The previous version of this patch was a little too aggressive
> in cleaning up the environment.  Some of the variables impacted
> by the filerCompilerFlags() function require at least one value
> to remain in the array.  In this case, the values for ccExe,
> cxxExe, and fcExe require a value or later code that access
> them result in a panic related to accessing a value out of range.
> 
> This updated patch adds a flag that requires keeping the first
> value so that at least one thing remains and the assignments
> for the Exes set that flag to true.  The first item in the
> array should be the executable name, so leaving it should be
> safe.
> 
> I have run the oe-selftest and everything passed in my setup.
> 
> There is a bug report [2] filed for the issue that this patch
> addresses.
> 
> [YOCTO #14976]
> 
> [1] https://lists.openembedded.org/g/openembedded-core/topic/94022663
> [2] https://bugzilla.yoctoproject.org/show_bug.cgi?id=14976
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
> v3: Added [YOCTO #14976] to commit message.
> v2: Added more background and bug report link to commit message.
> 
>   ...ent-based-hash-generation-less-pedan.patch | 30 ++++++++++---------
>   1 file changed, 16 insertions(+), 14 deletions(-)
> 
> diff --git a/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch b/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
> index 17fa9d9831..43be5cd2e8 100644
> --- a/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
> +++ b/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
> @@ -74,7 +74,7 @@ index c88b315..a06455c 100644
>   +		cppflags, cflags, cxxflags, fflags, ldflags, _ := b.CFlags(p, true)
>    
>   -		ccExe := b.ccExe()
> -+		ccExe := filterCompilerFlags(b.ccExe())
> ++		ccExe := filterCompilerFlags(b.ccExe(), true)
>    		fmt.Fprintf(h, "CC=%q %q %q %q\n", ccExe, cppflags, cflags, ldflags)
>    		// Include the C compiler tool ID so that if the C
>    		// compiler changes we rebuild the package.
> @@ -83,7 +83,7 @@ index c88b315..a06455c 100644
>    		}
>    		if len(p.CXXFiles)+len(p.SwigCXXFiles) > 0 {
>   -			cxxExe := b.cxxExe()
> -+			cxxExe := filterCompilerFlags(b.cxxExe())
> ++			cxxExe := filterCompilerFlags(b.cxxExe(), true)
>    			fmt.Fprintf(h, "CXX=%q %q\n", cxxExe, cxxflags)
>    			if cxxID, err := b.gccToolID(cxxExe[0], "c++"); err == nil {
>    				fmt.Fprintf(h, "CXX ID=%q\n", cxxID)
> @@ -91,7 +91,7 @@ index c88b315..a06455c 100644
>    		}
>    		if len(p.FFiles) > 0 {
>   -			fcExe := b.fcExe()
> -+			fcExe := filterCompilerFlags(b.fcExe())
> ++			fcExe := filterCompilerFlags(b.fcExe(), true)
>    			fmt.Fprintf(h, "FC=%q %q\n", fcExe, fflags)
>    			if fcID, err := b.gccToolID(fcExe[0], "f95"); err == nil {
>    				fmt.Fprintf(h, "FC ID=%q\n", fcID)
> @@ -104,20 +104,22 @@ index c88b315..a06455c 100644
>    	}
>    
>    	// Configuration specific to compiler toolchain.
> -@@ -2705,8 +2707,23 @@ func envList(key, def string) []string {
> +@@ -2705,8 +2707,25 @@ func envList(key, def string) []string {
>    	return args
>    }
>    
>   +var filterFlags = os.Getenv("CGO_PEDANTIC") == ""
>   +
> -+func filterCompilerFlags(flags []string) []string {
> ++func filterCompilerFlags(flags []string, keepfirst bool) []string {
>   +	var newflags []string
> ++   var realkeepfirst bool = keepfirst
>   +	if !filterFlags {
>   +		return flags
>   +	}
>   +	for _, flag := range flags {
> -+		if strings.HasPrefix(flag, "-m") {
> ++		if strings.HasPrefix(flag, "-m") || realkeepfirst {
>   +			newflags = append(newflags, flag)
> ++           realkeepfirst = false
>   +		}
>   +	}
>   +	return newflags
> @@ -129,21 +131,21 @@ index c88b315..a06455c 100644
>    	defaults := "-g -O2"
>    
>    	if cppflags, err = buildFlags("CPPFLAGS", "", p.CgoCPPFLAGS, checkCompilerFlags); err != nil {
> -@@ -2724,6 +2741,13 @@ func (b *Builder) CFlags(p *load.Package) (cppflags, cflags, cxxflags, fflags, l
> +@@ -2724,6 +2743,13 @@ func (b *Builder) CFlags(p *load.Package) (cppflags, cflags, cxxflags, fflags, l
>    	if ldflags, err = buildFlags("LDFLAGS", defaults, p.CgoLDFLAGS, checkLinkerFlags); err != nil {
>    		return
>    	}
>   +	if filtered {
> -+		cppflags = filterCompilerFlags(cppflags)
> -+		cflags = filterCompilerFlags(cflags)
> -+		cxxflags = filterCompilerFlags(cxxflags)
> -+		fflags = filterCompilerFlags(fflags)
> -+		ldflags = filterCompilerFlags(ldflags)
> ++		cppflags = filterCompilerFlags(cppflags, false)
> ++		cflags = filterCompilerFlags(cflags, false)
> ++		cxxflags = filterCompilerFlags(cxxflags, false)
> ++		fflags = filterCompilerFlags(fflags, false)
> ++		ldflags = filterCompilerFlags(ldflags, false)
>   +	}
>    
>    	return
>    }
> -@@ -2739,7 +2763,7 @@ var cgoRe = lazyregexp.New(`[/\\:]`)
> +@@ -2739,7 +2765,7 @@ var cgoRe = lazyregexp.New(`[/\\:]`)
>    
>    func (b *Builder) cgo(a *Action, cgoExe, objdir string, pcCFLAGS, pcLDFLAGS, cgofiles, gccfiles, gxxfiles, mfiles, ffiles []string) (outGo, outObj []string, err error) {
>    	p := a.Package
> @@ -152,7 +154,7 @@ index c88b315..a06455c 100644
>    	if err != nil {
>    		return nil, nil, err
>    	}
> -@@ -3246,7 +3270,7 @@ func (b *Builder) swigIntSize(objdir string) (intsize string, err error) {
> +@@ -3246,7 +3272,7 @@ func (b *Builder) swigIntSize(objdir string) (intsize string, err error) {
>    
>    // Run SWIG on one SWIG input file.
>    func (b *Builder) swigOne(a *Action, p *load.Package, file, objdir string, pcCFLAGS []string, cxx bool, intgosize string) (outGo, outC string, err error) {
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173973): https://lists.openembedded.org/g/openembedded-core/message/173973
> Mute This Topic: https://lists.openembedded.org/mt/95334740/6551054
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

