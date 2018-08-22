Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 5396079034
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 09:04:31 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id c14-v6so1302957wmb.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 02:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=dBKXX5gXhmmRVzzffuBU3Wr860GaNeJHF2IT+3ZCYDU=;
	b=MMCPZDjJwFbw5jHR6nw3CjSUnA1CeCMa1TurESUC/3J1WAOfh3nqNRG1LRA9kz0qdh
	hgFmTHhuPXXL9EAY6Mu9esWWKYa+LtxATYXPb581JQ/LuXrh/iu8GDraclKiNhq2Q0ym
	QFwF3wHLtkmk1pgUZdCnJXJh6d/R777NkWcePI/Hl+tGLo/Y6BV2lC9yji1x/ddjDcT9
	W5ASXIMRZrlDxF7wTDnrrvR0NvSxIc4W8bLqhrhNGwXOaoxe+GZICrS8EDL4elw5OwmF
	KIdftu5+fC/3Ov5jG4EuV9tmnzgBhk58nEH7DaKxSjXB8JNT21hm6Z3SuElwlsmuLQnS
	fBJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=dBKXX5gXhmmRVzzffuBU3Wr860GaNeJHF2IT+3ZCYDU=;
	b=eDgf3Gw8myxH4KJwMOpwz98O49WguVmfuLENKoAOqeifl9+V1zvEgl6xa3awDL4FK7
	qBxt32MlJs8n2qoChjc2t/wVMptD2bDnJv05wmefFbyQ6n+Zdivn2dhvXAdOblHu80hd
	lBwX0Wdd6hr2N9F0StUUBWdJZuLaOCe4sRa9M4IaaoLarKV2GbQUP8WWb8MW1QnVVR7I
	Af5LnHtlyn4idcRvlZLqrEDQNTNkQ6PiYmHXY3koQoRrRAQyTpCERbDcbzg3jkya9dps
	ZZoPXkiZfe9FiADo3mZiQD8FmeQ/7xhZJ8h/klwV9KY4s32NxyyWWk/BHWmuaVq7/aOr
	dU/Q==
X-Gm-Message-State: APzg51CRHvVEwXImOn/z+y/w2lTNrSq/KKVMz9hZmxP/TpQ8R5Lsam2j
	Mme+dl00WHUe/wB3m1M389x+uhWr
X-Google-Smtp-Source: ANB0VdZAhd2eP4/cil6zKm8v/anJl7pXtZHH9l4HmQlTl7SVWie+wmqBOz4JDuVlXZ25kM7Z8l9zjA==
X-Received: by 2002:a1c:8016:: with SMTP id b22-v6mr1851641wmd.9.1534928671784;
	Wed, 22 Aug 2018 02:04:31 -0700 (PDT)
Received: from beaker.muppets.liwing.de (b2b-78-94-80-58.unitymedia.biz.
	[78.94.80.58]) by smtp.gmail.com with ESMTPSA id
	v5-v6sm1093753wru.60.2018.08.22.02.04.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Aug 2018 02:04:30 -0700 (PDT)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 11:04:24 +0200
Message-Id: <20180822090424.14573-2-sno@netbsd.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180822090424.14573-1-sno@netbsd.org>
References: <20180822090424.14573-1-sno@netbsd.org>
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
X-List-Received-Date: Wed, 22 Aug 2018 09:04:31 -0000

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
 meta/recipes-devtools/perl/libxml-parser-perl_2.44.bb | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/perl/libxml-parser-perl_2.44.bb b/meta/recipes-devtools/perl/libxml-parser-perl_2.44.bb
index c5e0ae6769..4494e2286c 100644
--- a/meta/recipes-devtools/perl/libxml-parser-perl_2.44.bb
+++ b/meta/recipes-devtools/perl/libxml-parser-perl_2.44.bb
@@ -18,8 +18,16 @@ inherit cpan ptest-perl
 
 # fix up sub MakeMaker project as arguments don't get propagated though
 # see https://rt.cpan.org/Public/Bug/Display.html?id=28632
+do_configure_append_class-target() {
+	sed -E \
+	    -e 's:-L${STAGING_LIBDIR}::g' -e 's:-I${STAGING_INCDIR}::g' \
+	    -e 's:LD_RUN_PATH ?= ?"?[^"]*"?::g' \
+	    -i Makefile Expat/Makefile
+}
+
 do_configure_append() {
-	sed 's:--sysroot=.*\(\s\|$\):--sysroot=${STAGING_DIR_TARGET} :g' -i Makefile Expat/Makefile
+	sed -e 's:--sysroot=.*\(\s\|$\):--sysroot=${STAGING_DIR_TARGET} :g' \
+	    -i Makefile Expat/Makefile
 	sed 's:^FULL_AR = .*:FULL_AR = ${AR}:g' -i Expat/Makefile
 	# make sure these two do not build in parallel
 	sed 's!^$(INST_DYNAMIC):!$(INST_DYNAMIC): $(BOOTSTRAP)!' -i Expat/Makefile
-- 
2.17.1


