Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 3E95878E42
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 15:58:12 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id y2-v6so3286106wma.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2018 08:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=CtUJoff+VOabja+Pl+cQ7qy+L4NKUe7y+zX6En6cT0k=;
	b=QOqXERi8XFL0m/2cu4ZqKzyuvmqeh0XYreYAWpKd7S4VhFsJ9C0gOU776kufjA8Ba3
	RUPQgcpNjYqm1uNErqCip0Z9ZfdSNTiL/3+bqeGMzfxIM3yZoAr+pJwFyP6y+XeH7YF1
	L9RB2svSk/yHEBzwAQGPCmCOyWKPBwsYeiFwSnO7XhV7xmowc4FqL58W/YLwEFjf7DSO
	9JPRsUNFzUvO5Lp7lj2gooG4Xf/p/XUyTnw3sqafr+sDueiCQpcgFLBA/KwI50S/lzaD
	EKF9UqxH4Fx65NAn9PRVq4BxXcLtC3QUDLdfX5ma+qMl8sd8imrXaKknDl0vsK5Bdw+Y
	NL7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=CtUJoff+VOabja+Pl+cQ7qy+L4NKUe7y+zX6En6cT0k=;
	b=L8puWZhbHKXbJj3+eklMdcdNnqUp15W1HvT0U+xvpuIX/RpD9X+H4jVsD9JJ50FfNx
	7H9qEVltKg1Dcz5Q+2nrujJtIMmrkdiz1CTfw+83hnLgYhu7Ym8AkGyNQuS0PHN3yokz
	SxQSHDXFWfURkyI4RFSYFeZ106gHtnHLF5jQUhCA5KngSkyNAO6yy9U7UljqcMH7rzAO
	FYN0Q4t+N/3robf5DaZQQTx5mwbPfY+qDikFWJHnHbPhRz4FoWoV1PG4IZXhfgPpfxRC
	GnIsMkAlkgBTUW8XeypJ2Y9WSeHEvzVtrFyCTSWaE2skq9WXWkEYIw/ygr63c1V6AHJx
	4evA==
X-Gm-Message-State: AOUpUlF5pPxAP03cmex4+m0jzL+F2cwtVsZV07SdgoqeRQyok35gwEkj
	g1wxBSUEPZU3r5JtvB2YozttH/zK
X-Google-Smtp-Source: AA+uWPzGEu53DC6rl0x3fAkr79P3+mY8QVl0+lzyTdHwHo00FB/Vjvv25bzG1+WOBU+MPWfxkcPh1w==
X-Received: by 2002:a1c:c14:: with SMTP id 20-v6mr2382402wmm.117.1533743892860;
	Wed, 08 Aug 2018 08:58:12 -0700 (PDT)
Received: from beaker.muppets.liwing.de (b2b-78-94-80-58.unitymedia.biz.
	[78.94.80.58]) by smtp.gmail.com with ESMTPSA id
	r12-v6sm13000187wmh.0.2018.08.08.08.58.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Aug 2018 08:58:12 -0700 (PDT)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Aug 2018 17:58:03 +0200
Message-Id: <20180808155803.32738-2-sno@netbsd.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180808155803.32738-1-sno@netbsd.org>
References: <20180808155803.32738-1-sno@netbsd.org>
Cc: Jens Rehsack <sno@netbsd.org>
Subject: [PATCH 2/2] libxml-parser-perl: fix "...contains bad RPATH"
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
X-List-Received-Date: Wed, 08 Aug 2018 15:58:12 -0000

The perl distribution "XML-Parser" relies for configuration
on the tooling of Devel::CheckLib - which is not aware of
sysroot locations nor of reasonable compiler/link definitions
from outside.

This causes

    ERROR: libxml-parser-perl-2.44-r0 do_package_qa: QA Issue: package libxml-parser-perl contains bad RPATH ${BUILDDIR}/tmp/work/core2-64-poky-linux/libxml-parser-perl/2.44-r0/recipe-sysroot/usr/lib in file ${BUILDDIR}/tmp/work/core2-64-poky-linux/libxml-parser-perl/2.44-r0/packages-split/libxml-parser-perl/usr/lib/perl/vendor_perl/5.24.4/auto/XML/Parser/Expat/Expat.so
    package libxml-parser-perl contains bad RPATH ${BUILDDIR}/tmp/work/core2-64-poky-linux/libxml-parser-perl/2.44-r0/recipe-sysroot/usr/lib in file ${BUILDDIR}/tmp/work/core2-64-poky-linux/libxml-parser-perl/2.44-r0/packages-split/libxml-parser-perl/usr/lib/perl/vendor_perl/5.24.4/auto/XML/Parser/Expat/Expat.so [rpaths]
    ERROR: libxml-parser-perl-2.44-r0 do_package_qa: QA run found fatal errors. Please consider fixing them.
    ERROR: libxml-parser-perl-2.44-r0 do_package_qa: Function failed: do_package_qa

It's strongly encouraged to the maintainer @toddr to rework the
toolchain for up to date environments.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 meta/recipes-devtools/perl/libxml-parser-perl_2.44.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/perl/libxml-parser-perl_2.44.bb b/meta/recipes-devtools/perl/libxml-parser-perl_2.44.bb
index c5e0ae6769..2ca8d506f4 100644
--- a/meta/recipes-devtools/perl/libxml-parser-perl_2.44.bb
+++ b/meta/recipes-devtools/perl/libxml-parser-perl_2.44.bb
@@ -19,7 +19,11 @@ inherit cpan ptest-perl
 # fix up sub MakeMaker project as arguments don't get propagated though
 # see https://rt.cpan.org/Public/Bug/Display.html?id=28632
 do_configure_append() {
-	sed 's:--sysroot=.*\(\s\|$\):--sysroot=${STAGING_DIR_TARGET} :g' -i Makefile Expat/Makefile
+	sed -E \
+	    -e 's:--sysroot=.*\(\s\|$\):--sysroot=${STAGING_DIR_TARGET} :g' \
+	    -e 's:-L${STAGING_LIBDIR}::g' -e 's:-I${STAGING_INCDIR}::g' \
+	    -e 's:LD_RUN_PATH ?= ?"?[^"]*"?::g' \
+	    -i Makefile Expat/Makefile
 	sed 's:^FULL_AR = .*:FULL_AR = ${AR}:g' -i Expat/Makefile
 	# make sure these two do not build in parallel
 	sed 's!^$(INST_DYNAMIC):!$(INST_DYNAMIC): $(BOOTSTRAP)!' -i Expat/Makefile
-- 
2.17.1


