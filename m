Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7E24C4708D
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 19:21:33 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.143565.1671132083828139872
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 11:21:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=gBD2DXV3;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id m4so8915pls.4
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 11:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iARxIs7YDm5A0trL914bH470mhQJMkbsA/u9tGKyF58=;
        b=gBD2DXV3VCzP/5Fddj+PBtOV7j4AH0GaJOV/FQDYAhnzicTy6T9gNF8U9Tr8w73f1C
         AVBv4zWq3nG7HdOoY/sGoqPo6XRxJsT+RYyXU4nOpRgj6d2v7IbfM+7rV8KqtZ66dojB
         V/+OzH+uHJNGVz5dTrFaZ0vRZhM1K4EQrEqNTHaW/WeL7MMM2ZjqeeKCzoXr0c5Abxv1
         0/53OH9AYIVqhZ9KttNnfsUQix2QTqSbShLqfSfv54+nYDYgGB2qY7HB1wve1axDx/Gs
         I79tkeluVhGZ0GzzxAOedWjGp9kwTYGPP2gCIsI+rpYEQdCCfZRvkfT/zcYFWyzdpc80
         42Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iARxIs7YDm5A0trL914bH470mhQJMkbsA/u9tGKyF58=;
        b=sUCu/t1pBqsWLk0KQtLpSpLb1HJDTYvqsxHg8EemddRmBpFsmFtmm938Gpo+PdNiUY
         QwHPhXU8+6G4BSFGwBTSsyYqUAjdeo54to4jEV9glbriU70Hnrn7xEIgZNCpW+JQILjH
         20ork+P3hnr/fwelDzro2h6EbtyAOSw40kU+7UZyJq8qCvVTBO4XK38e7qn4Hf8QvvZ4
         T9v8oFCKgoR6PzxOmDHjzyRBd1k3ngaaS+/LXq5s73PbYZZGoPUjlHxFlJVTJ57emqsO
         uscccuPo8l5bQx0BtkCIq+cNmTHG8FbgS3WtV2wwDjt50DgB1ssTDYOhhxa885qCh9RQ
         Qqqw==
X-Gm-Message-State: ANoB5pli6LRYyCxtZhFA31e2qsGzRH2Dbq/YK4Fv6Dp3fSjHhlU/RN//
	dYw0gWZtWlg+9IEapQ0EaSqq1HR3LfMKsDTfvDg=
X-Google-Smtp-Source: AA0mqf5pUElIuYXxQQqYIpMo1rfVhrLA29GhW+Lq2gBRnqGgIxpfsu3f9zQwUE6Jkq/Upl5ZAowdJQ==
X-Received: by 2002:a17:902:e5c8:b0:189:6ab3:9e75 with SMTP id u8-20020a170902e5c800b001896ab39e75mr40435503plf.15.1671132082747;
        Thu, 15 Dec 2022 11:21:22 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id r19-20020a170902c61300b001869b988d93sm4167095plr.187.2022.12.15.11.21.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 11:21:22 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 12/30] go: Update reproducibility patch to fix panic errors
Date: Thu, 15 Dec 2022 09:20:36 -1000
Message-Id: <90a5c46fa36d7fe701d77eac92ed0a1206600930.1671122751.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1671122751.git.steve@sakoman.com>
References: <cover.1671122751.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 19:21:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174604

From: Ryan Eatmon <reatmon@ti.com>

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
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 9eaa3a813555dd016a65be63a258f9c0b548a115)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


