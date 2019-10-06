Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id D20387D711
	for <openembedded-core@lists.openembedded.org>;
	Sun,  6 Oct 2019 15:48:03 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id 23so6679046pgk.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 06 Oct 2019 08:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=N92GGTiP6n3VZ63OARk+wp1rRBfIwY8K7uBzmqHai+M=;
	b=SMM+O0eAtR02HnzaM6JZ8eEF6nH9VWN5qYIYCv7TOy7MzH0hfConjRQkyp73QR6LRU
	MuG9txXU0/oOlaqBgK9ovr/hOyf8B/xem+IqGy8oHBfLwYMYKcpbsggg+dQ2ATjqrEdt
	ysSv3stNq5Iz8AjxHbcMPvmRZbnTD8gJ1/O2+S++5oGz4N/+ERWSSB2CH751zaneSONm
	moX4MTBPySKo84XDSFDhG+9kGYn4Lh4mIMN3Ye6uUZzJ2YkXeo1JESFf1a4zXwPwNb0t
	m0YzpG46SbTgXJniNJsIuRbc22Zh2ZyWQSH1VKbHA3dZgnuiANhskrXKEcihUMjOF6q5
	8olA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=N92GGTiP6n3VZ63OARk+wp1rRBfIwY8K7uBzmqHai+M=;
	b=rg8ywfw4T4jJSNS8px4xXTyD5x+cnyxhuCWDQkcRPY95DtSZApDw5ElZFcYsu2QTAo
	Qu22r343jFiO2dQ/ZyfD7dn2htczmZv2le/1c8hQRN9/Gvuy6Hwf8Z0HPI33rJTB+5mW
	9aE51N6+X/FGmyxlqvWpHfhs7XjLYyEvQsdYscxyi3JJDr/yEVFDR1g/TLIC73DE78x1
	cvRDS1IdtZxAunXSDTxtX0XUMZ8GnGVGCbyLcg4MkAhui7rWS6dQIavKPZNZGQfl8LV/
	r+d2CiOkyQrSI8zRP6wUE6kHbRRxjbFI5+94sI1+kPRK76dgUiD7+l+i/1lMvo1YlVrM
	7R7A==
X-Gm-Message-State: APjAAAU16je03Q0v7yO3EWcSnP7bqI+ApKRaXbAknpCST58YWkiO/Pxq
	NQhfLVW+c3ah5hu6+kFc5n2bwMiDGPM=
X-Google-Smtp-Source: APXvYqxG5FXt52FZ0yBuu6NAT1bIXkLfDKrM/OFmUhmvf8sk8zChcbp+X52gVwD07c+qPwDWw3z7pQ==
X-Received: by 2002:a62:75d2:: with SMTP id q201mr28039877pfc.43.1570376884326;
	Sun, 06 Oct 2019 08:48:04 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::7275])
	by smtp.gmail.com with ESMTPSA id
	v19sm13081539pff.46.2019.10.06.08.48.03
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 06 Oct 2019 08:48:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  6 Oct 2019 08:47:47 -0700
Message-Id: <20191006154747.7699-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] perl: Handle PACKAGES_DYNAMIC for perl-native
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
X-List-Received-Date: Sun, 06 Oct 2019 15:48:03 -0000
Content-Transfer-Encoding: 8bit

A perl module recipe extending to provide native version causes target
perl dependencies to be pulled into native build if the module recipe
has RDEPENDS_${PN} = "perl-module-XXXX" e.g. libxml-sax-base-perl
recipe.

The reason is that native bbclass empties out PACKAGES_DYNAMIC and
perl's PACKAGES_DYNAMIC_class-target is greedy enough to usurp native
modules as well.

Eventually we end up with errors like when sstate is used across
machines

* ERROR: libxml-sax-base-perl-native different signature for task do_populate_sysroot.sigdata between qemux86copy and qemuarm

Therefore, to fix this native case needs to handled specially when
re-assigning module dependencies in split_perl_packages(), where the
modules are named correctly for native case and have a single dependency
on perl-native, secondly, PACKAGES_DYNAMIC for target case needs to be
reined in to spare, -native modules, thirdly, let perl-native take over
the case for providing native modules

This will fix several sstate signature errors like above with external
perl modules providing native variants and having runtime dependencies on
modules which are provided by perl proper

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/perl/perl_5.30.0.bb | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl_5.30.0.bb b/meta/recipes-devtools/perl/perl_5.30.0.bb
index a221bce52b..9614477982 100644
--- a/meta/recipes-devtools/perl/perl_5.30.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.30.0.bb
@@ -265,13 +265,18 @@ python split_perl_packages () {
     # Read the pre-generated dependency file, and use it to set module dependecies
     for line in open(d.expand("${WORKDIR}") + '/perl-rdepends.txt').readlines():
         splitline = line.split()
-        module = splitline[0].replace("RDEPENDS_perl", "RDEPENDS_${PN}")
-        depends = splitline[2].strip('"').replace("perl-module", "${PN}-module")
+        if bb.data.inherits_class('native', d):
+            module = splitline[0] + '-native'
+            depends = "perl-native"
+        else:
+            module = splitline[0].replace("RDEPENDS_perl", "RDEPENDS_${PN}")
+            depends = splitline[2].strip('"').replace("perl-module", "${PN}-module")
         d.appendVar(d.expand(module), " " + depends)
 }
 
-PACKAGES_DYNAMIC_class-target += "^perl-module-.*"
-PACKAGES_DYNAMIC_class-nativesdk += "^nativesdk-perl-module-.*"
+PACKAGES_DYNAMIC_class-native_forcevariable = "^perl-module-.*-native$"
+PACKAGES_DYNAMIC_class-target = "^perl-module-.*(?<!native)$"
+PACKAGES_DYNAMIC_class-nativesdk = "^nativesdk-perl-module-.*"
 
 RDEPENDS_${PN}-misc += "perl perl-modules"
 RDEPENDS_${PN}-pod += "perl"
-- 
2.23.0


