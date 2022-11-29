Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A880C4321E
	for <webhook@archiver.kernel.org>; Tue, 29 Nov 2022 14:12:08 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.150630.1669731123867287421
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Nov 2022 06:12:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=x0UPGVX8;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2ATEC3JR119205;
	Tue, 29 Nov 2022 08:12:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1669731123;
	bh=5BWg5wAaq49t2XNczfQ9t3ToMvY87UhBwmm9VbxWL1c=;
	h=From:To:Subject:Date;
	b=x0UPGVX8gZIXLhuBH1x+nmEtSIGOPZY5+nfoMu2rYIyn0FmVts94HP9+Xp/rMaqGv
	 rBXx2uDfNMTPwaZbl4cSChLXvGMe4o75WcykWXrh9KzscK0JAfVm71lwF0Rzxf0IeL
	 uqVCxpyyFYr1m6IJRQlkE9O46qVCTTirU+bQc6Vs=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2ATEC2OJ067763
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 29 Nov 2022 08:12:03 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 29
 Nov 2022 08:12:02 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 29 Nov 2022 08:12:02 -0600
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2ATEC2tI077660;
	Tue, 29 Nov 2022 08:12:02 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1p01L8-000574-LX; Tue, 29 Nov 2022 08:12:02 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: <raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: [PATCH v3][master] go: Update reproducibility patch to fix panic errors
Date: Tue, 29 Nov 2022 08:12:02 -0600
Message-ID: <20221129141202.19614-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Nov 2022 14:12:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173973

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

[YOCTO #14976]

[1] https://lists.openembedded.org/g/openembedded-core/topic/94022663
[2] https://bugzilla.yoctoproject.org/show_bug.cgi?id=14976

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v3: Added [YOCTO #14976] to commit message.
v2: Added more background and bug report link to commit message.

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


