Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D61F3C4321E
	for <webhook@archiver.kernel.org>; Tue, 29 Nov 2022 12:23:07 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.147760.1669724584124896346
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Nov 2022 04:23:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=vEKAidTJ;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2ATCN3xZ059557;
	Tue, 29 Nov 2022 06:23:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1669724583;
	bh=545lIlkKGpXDxT04ePrSEaZ/WqV1IDTBdbCZDzcOEpI=;
	h=From:To:Subject:Date;
	b=vEKAidTJH6tghoM3wpm0Bck9L5UsOs6fZtErr2CEM51ULZ65iWHbJbTFWhviWWZAL
	 4mBiZrCdzVvNe1yQlsaBsJTTFgpcF7CosGlvZYitjtGoUcottgXkver0LEibK+8AwQ
	 hk5r/23Qxw1BYWr3mJ+5VoSq/i7kFIyOnQgOFkKs=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2ATCN3hb012254
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 29 Nov 2022 06:23:03 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 29
 Nov 2022 06:23:02 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 29 Nov 2022 06:23:02 -0600
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2ATCN2fn116530;
	Tue, 29 Nov 2022 06:23:02 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1ozzde-0003o1-JT; Tue, 29 Nov 2022 06:23:02 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: <raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2][master] go: Update reproducibility patch to fix panic errors
Date: Tue, 29 Nov 2022 06:23:02 -0600
Message-ID: <20221129122302.14589-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Nov 2022 12:23:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173965

Based on a discussion on the mailing list [1], there are panic
errors that occur on a few platforms caused by the patch.  We
cannot simply remove the original patch due to the
reproducibility issues that it addresses, so this patch on the
original patch fixes the cause of the panic errors.

The previous version of this patch was a little too aggressive
in cleaning up the environment.  Some of the variables impacted
by the filerCompilerFlags() function require at least one value
to remain in the array.  In this case, the values for ccExe,
cxxExe, and fcExe require a value or later code that access
them result in a panic related to accessing a value out of range.

This updated patch adds a flag that requires keeping the first
value so that at least one thing remains and the assignments
for the Exes set that flag to true.  The first item in the
array should be the executable name, so leaving it should be
safe.

I have run the oe-selftest and everything passed in my setup.

There is a bug report [2] filed for the issue that this patch
addresses.

[1] https://lists.openembedded.org/g/openembedded-core/topic/94022663
[2] https://bugzilla.yoctoproject.org/show_bug.cgi?id=14976

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 ...ent-based-hash-generation-less-pedan.patch | 30 ++++++++++---------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch b/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
index 17fa9d9831..43be5cd2e8 100644
--- a/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
+++ b/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
@@ -74,7 +74,7 @@ index c88b315..a06455c 100644
 +		cppflags, cflags, cxxflags, fflags, ldflags, _ := b.CFlags(p, true)
  
 -		ccExe := b.ccExe()
-+		ccExe := filterCompilerFlags(b.ccExe())
++		ccExe := filterCompilerFlags(b.ccExe(), true)
  		fmt.Fprintf(h, "CC=%q %q %q %q\n", ccExe, cppflags, cflags, ldflags)
  		// Include the C compiler tool ID so that if the C
  		// compiler changes we rebuild the package.
@@ -83,7 +83,7 @@ index c88b315..a06455c 100644
  		}
  		if len(p.CXXFiles)+len(p.SwigCXXFiles) > 0 {
 -			cxxExe := b.cxxExe()
-+			cxxExe := filterCompilerFlags(b.cxxExe())
++			cxxExe := filterCompilerFlags(b.cxxExe(), true)
  			fmt.Fprintf(h, "CXX=%q %q\n", cxxExe, cxxflags)
  			if cxxID, err := b.gccToolID(cxxExe[0], "c++"); err == nil {
  				fmt.Fprintf(h, "CXX ID=%q\n", cxxID)
@@ -91,7 +91,7 @@ index c88b315..a06455c 100644
  		}
  		if len(p.FFiles) > 0 {
 -			fcExe := b.fcExe()
-+			fcExe := filterCompilerFlags(b.fcExe())
++			fcExe := filterCompilerFlags(b.fcExe(), true)
  			fmt.Fprintf(h, "FC=%q %q\n", fcExe, fflags)
  			if fcID, err := b.gccToolID(fcExe[0], "f95"); err == nil {
  				fmt.Fprintf(h, "FC ID=%q\n", fcID)
@@ -104,20 +104,22 @@ index c88b315..a06455c 100644
  	}
  
  	// Configuration specific to compiler toolchain.
-@@ -2705,8 +2707,23 @@ func envList(key, def string) []string {
+@@ -2705,8 +2707,25 @@ func envList(key, def string) []string {
  	return args
  }
  
 +var filterFlags = os.Getenv("CGO_PEDANTIC") == ""
 +
-+func filterCompilerFlags(flags []string) []string {
++func filterCompilerFlags(flags []string, keepfirst bool) []string {
 +	var newflags []string
++   var realkeepfirst bool = keepfirst
 +	if !filterFlags {
 +		return flags
 +	}
 +	for _, flag := range flags {
-+		if strings.HasPrefix(flag, "-m") {
++		if strings.HasPrefix(flag, "-m") || realkeepfirst {
 +			newflags = append(newflags, flag)
++           realkeepfirst = false
 +		}
 +	}
 +	return newflags
@@ -129,21 +131,21 @@ index c88b315..a06455c 100644
  	defaults := "-g -O2"
  
  	if cppflags, err = buildFlags("CPPFLAGS", "", p.CgoCPPFLAGS, checkCompilerFlags); err != nil {
-@@ -2724,6 +2741,13 @@ func (b *Builder) CFlags(p *load.Package) (cppflags, cflags, cxxflags, fflags, l
+@@ -2724,6 +2743,13 @@ func (b *Builder) CFlags(p *load.Package) (cppflags, cflags, cxxflags, fflags, l
  	if ldflags, err = buildFlags("LDFLAGS", defaults, p.CgoLDFLAGS, checkLinkerFlags); err != nil {
  		return
  	}
 +	if filtered {
-+		cppflags = filterCompilerFlags(cppflags)
-+		cflags = filterCompilerFlags(cflags)
-+		cxxflags = filterCompilerFlags(cxxflags)
-+		fflags = filterCompilerFlags(fflags)
-+		ldflags = filterCompilerFlags(ldflags)
++		cppflags = filterCompilerFlags(cppflags, false)
++		cflags = filterCompilerFlags(cflags, false)
++		cxxflags = filterCompilerFlags(cxxflags, false)
++		fflags = filterCompilerFlags(fflags, false)
++		ldflags = filterCompilerFlags(ldflags, false)
 +	}
  
  	return
  }
-@@ -2739,7 +2763,7 @@ var cgoRe = lazyregexp.New(`[/\\:]`)
+@@ -2739,7 +2765,7 @@ var cgoRe = lazyregexp.New(`[/\\:]`)
  
  func (b *Builder) cgo(a *Action, cgoExe, objdir string, pcCFLAGS, pcLDFLAGS, cgofiles, gccfiles, gxxfiles, mfiles, ffiles []string) (outGo, outObj []string, err error) {
  	p := a.Package
@@ -152,7 +154,7 @@ index c88b315..a06455c 100644
  	if err != nil {
  		return nil, nil, err
  	}
-@@ -3246,7 +3270,7 @@ func (b *Builder) swigIntSize(objdir string) (intsize string, err error) {
+@@ -3246,7 +3272,7 @@ func (b *Builder) swigIntSize(objdir string) (intsize string, err error) {
  
  // Run SWIG on one SWIG input file.
  func (b *Builder) swigOne(a *Action, p *load.Package, file, objdir string, pcCFLAGS []string, cxx bool, intgosize string) (outGo, outC string, err error) {
-- 
2.17.1


