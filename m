Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88776C433FE
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 20:46:42 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.130402.1669668394408365152
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Nov 2022 12:46:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=mzsg19n4;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2ASKkWik068515;
	Mon, 28 Nov 2022 14:46:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1669668392;
	bh=S9T/kSXLEhRAepCaCgJaF9IXI8s0alXh10OzOx3bVJQ=;
	h=From:To:Subject:Date;
	b=mzsg19n4jEKrZnUlmVBvVfmGmi+LKh+sM5QtzW/1lQQj/k+egYy+QzA9hvhV9PUb1
	 u0vYURl6AU6y76v2tYY51bhlnvydkz5txVczhZo+/PiTRAMrINPD2WcN6XyV1jgto7
	 tcE4yQo0+STt4bCBRqsnrB9KYjTDUs76zkJ2rjag=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2ASKkWsK019051
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 28 Nov 2022 14:46:32 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 28
 Nov 2022 14:46:31 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 28 Nov 2022 14:46:31 -0600
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2ASKkVlQ066424;
	Mon, 28 Nov 2022 14:46:31 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1ozl1L-0003pA-Hd; Mon, 28 Nov 2022 14:46:31 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: <raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: [PATCH][master] go: Update patch due to build errors
Date: Mon, 28 Nov 2022 14:46:31 -0600
Message-ID: <20221128204631.14661-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 20:46:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173944

The previous version of this patch was a little too zealous in
cleaning up the envvironment.  Some of the variable impacted
by the filerCompilerFlags() function require at least one
value to remain in the array.  In this case, the values for
ccExe, cxxExe, and fcExe require a value or it results in
a panic related to accessing a value out of range.

The updated patch adds a flag that requires keeping the first
value so that at least one thing remains and the assignments
for the Exes set that flag to true.  The first item in the
array should be the compiler name anyway so it should remain.

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


