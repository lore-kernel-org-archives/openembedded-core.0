Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2D53B7DE8F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Oct 2019 05:06:41 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id v4so10092737pff.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Oct 2019 22:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=c4S34ruHHchM42msZhy0XGTuiW9fWBqqqmMy3eLC47c=;
	b=oeeKoEyBwd+8hhC5NPsvEYMh2L77x+GhUf6aeYyE7R4VZlBanbCi5H0iXegrl5XgP2
	/OFfrBh3G+8Crnd8wyFQG32OxkZCkW7SBheS3MOi7htXWMV+Hu9ZR93tzio4PeP93AeH
	tna1GvV/rcxeHYBSk6KuV8l0wBKYrY+bi1Z9K3pJ9aLAdWJ/Z2kvf9lefZCrUsOiKM8w
	O4s0iQmGivBsVReNpExEx/ZlPQbS6lz1/D7TRq14nk3xaJewJsJRld5O5gnhABiAUHhE
	YfmtKvUAJS/tRl9WmnaDpVOUm/i9DotoeQqv+Fnk9AQiI0t8otwV3efi2djH/tdZ6+n/
	iHRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=c4S34ruHHchM42msZhy0XGTuiW9fWBqqqmMy3eLC47c=;
	b=f0wzuas+pohMPv4YI4FmUJtSRaDNCIu1E+3LpRJxw9YfnWqTivR/UGFN9+U/zAGZQa
	FyRpBwxUKSTKEbPfwwv0qhb4UI75eyq94+w+pnhD+KV5gX1YXw+UqX6hLOZf5QHUf+t4
	ZuntavSn09LSJSEnakCqMyd934SdKaiorXzV3c2PG5RDE0V0cxv+np/TRF0Z0BLaszwj
	uDi2v2eruQByLLTzITmrutCZVOUlK5FU9887nVsSFY+syREcdgqTL2Mw6cHiROlTtsHE
	d8ieTIPA2q8LE7EN781xv8dDVvbqk9+KTJKqUzhzEmkRoP5DAB8QSpD9ed2SzMxymGWY
	P6eg==
X-Gm-Message-State: APjAAAXMjTPY+nFhkdT4LlhCp30CtOXxwn0QXqQYloH/XHifRuom055/
	yZm8xIxj8DgU3Odc3GQmeT1NMZxIbPw=
X-Google-Smtp-Source: APXvYqzf0ZfjFAtWFT8InswpAgls/OfyISbDr1OdGDG29kZkXKhz3M1tfFkZdW6RevoH+8Yhgk5uDA==
X-Received: by 2002:a65:4884:: with SMTP id n4mr21854773pgs.348.1570511202607; 
	Mon, 07 Oct 2019 22:06:42 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::7275])
	by smtp.gmail.com with ESMTPSA id 2sm16341679pfo.91.2019.10.07.22.06.41
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 07 Oct 2019 22:06:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Oct 2019 22:06:29 -0700
Message-Id: <20191008050629.588374-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH V2] perl: Handle PACKAGES_DYNAMIC for perl-native
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
X-List-Received-Date: Tue, 08 Oct 2019 05:06:42 -0000
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
v2: Use anon python to set PACKAGES_DYNAMIC instead of forcevariable
    override

 meta/recipes-devtools/perl/perl_5.30.0.bb | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl_5.30.0.bb b/meta/recipes-devtools/perl/perl_5.30.0.bb
index a221bce52b..ba2a8437d4 100644
--- a/meta/recipes-devtools/perl/perl_5.30.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.30.0.bb
@@ -265,13 +265,23 @@ python split_perl_packages () {
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
+python() {
+    if d.getVar('CLASSOVERRIDE') == "class-target":
+        d.setVar("PACKAGES_DYNAMIC", "^perl-module-.*(?<!native)$")
+    elif d.getVar('CLASSOVERRIDE') == "class-native":
+        d.setVar("PACKAGES_DYNAMIC", "^perl-module-.*-native$")
+    elif d.getVar('CLASSOVERRIDE') == "class-nativesdk":
+        d.setVar("PACKAGES_DYNAMIC", "^nativesdk-perl-module-.*")
+}
 
 RDEPENDS_${PN}-misc += "perl perl-modules"
 RDEPENDS_${PN}-pod += "perl"
-- 
2.23.0


