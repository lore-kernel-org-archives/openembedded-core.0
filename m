Return-Path: <aehs29@gmail.com>
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
	[209.85.167.194])
	by mail.openembedded.org (Postfix) with ESMTP id 935457DE74
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Jun 2019 17:58:03 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id w79so7180272oif.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Jun 2019 10:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Pd7MO+IHAucbMOyK0IpGnN9ogofxjFVXu69zAULOh+w=;
	b=Q76gCHRQzW7nhfTrmzSzJd3ncCUpcsTKDKyHADyzsZlsWM/JsblFZmsfASz1vf+2Yf
	11G/7iVL9g179yLD985B7i9k3kBsmjkZcdVBRlIe3WjLOV9kuEzwD5G4t/cwCtob2obb
	wOT0x3OAMgTEBxzxGOOKMQXOxaV59EmxLHu9SvWmoEpKds2M9HKL71RRUD+zy9PvaeHw
	X5t3Yc4bfs3QBjh1NQ9dLZk0vXZ8ZtKFdLssg5q2qFLJPcx4qnX7jqcCCDbDPka7gJDt
	CL3+mCaIOjbBPVQa4z4qoKxdWz8mLWhkfrqcYHePiSmRM9Fez2RYp2Ga768vmokmPuHN
	AXgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Pd7MO+IHAucbMOyK0IpGnN9ogofxjFVXu69zAULOh+w=;
	b=H/qUApjIUo9RzSBJNhEooDjXZgVu7gTX0oK8ljzhPN4tMPZCID89iTbiwIsVmgcT2h
	dvxmVv0D1P1/gzcG3CsGjO/U5ToxscDT6KATl7iRVMMw0aursiZBOFV9uCkrZn4D8s+I
	4sTYb26ITATV0uLmIDXayDkjKdCo9zHNt71ZVwj2Dx0XI8W9PejsQQYegSVjbvHovuOA
	+NuK7hm1KJ1VGMZdODLDgZX8xHL1LyP29PvhS44uUS8FGtIGcGi8CHzbphKdJfX+sAt/
	lSrbylE2qJi3Q3+gjEl6BdnFGZ6F3K2Hq5kVe1OUEqQiWwsOm5GA2HS7Ez8JuOSxgFkl
	yIZw==
X-Gm-Message-State: APjAAAUqos/WTkLgCeet8TDfnTtmxArW2OExMpdqw0Bxu4O9rzoAZ+ix
	azCsRoetc/E888csAOuAQ+h9Ewsj6niLbmg+
X-Google-Smtp-Source: APXvYqzK4pqHKm2GMcQVqIAVYL6a+BnsJgySALaPKygWSG064+OjQANRFMDIgiKEKQh30mSujfCj+A==
X-Received: by 2002:aca:4a4e:: with SMTP id x75mr3522219oia.154.1559671083970; 
	Tue, 04 Jun 2019 10:58:03 -0700 (PDT)
Received: from XSJALEJANDR30.rga.ip ([189.237.113.71])
	by smtp.gmail.com with ESMTPSA id
	x13sm4154549oto.48.2019.06.04.10.58.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 04 Jun 2019 10:58:03 -0700 (PDT)
From: aehs29@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Jun 2019 10:57:58 -0700
Message-Id: <1559671078-4613-1-git-send-email-aehs29@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 2/2] newlib: export CC_FOR_TARGET as CC
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
X-List-Received-Date: Tue, 04 Jun 2019 17:58:03 -0000

From: Alejandro Hernandez Samaniego <aehs29@gmail.com>

Newlibs Makefiles use a variable CC_FOR_TARGET to build
libraries for the TARGET machine (as opposed to
CC_FOR_BUILD).

We pass CC on our compile function, which is normally
use to build, although in this case, the configure
script is trimming CC and using simply gcc for the target
machine, basically taking out the TUNE variables we pass
in CC as well, such as march, mfloat-abi and such.
This causes errors when building applications since
CC will try to use hard floating point for example
whereas the libc.a from newlib will contain libraries
built with the defaults which could be soft floating
point for example.

e.g.:
$ ${CC} test.c
real-ld: error: test.out uses VFP register arguments,
/usr/lib/libg.a(lib_a-stdio.o) does not.

Analizing the object files we can see that one of them
uses soft (library) and the other one uses hard
floating point (program):

$ readelf -A test.out | grep VFP
Tag_ABI_VFP_args: VFP registers

$ readelf -A usr/lib/libc.a | grep VFP

Hence why the linker complains.

Pass CC_FOR_TARGET with the contents of CC to override
the trimming from the configure script and build newlib
with the correct tune.

Signed-off-by: Alejandro Enedino Hernandez Samaniego <aehs29@gmail.com>
---
 meta/recipes-core/newlib/newlib_3.1.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/newlib/newlib_3.1.0.bb b/meta/recipes-core/newlib/newlib_3.1.0.bb
index db13724..7ab5b2b 100644
--- a/meta/recipes-core/newlib/newlib_3.1.0.bb
+++ b/meta/recipes-core/newlib/newlib_3.1.0.bb
@@ -3,7 +3,8 @@ require newlib.inc
 PROVIDES += "virtual/libc virtual/libiconv virtual/libintl"
 
 do_configure() {
-	${S}/configure ${EXTRA_OECONF}
+    export CC_FOR_TARGET="${CC}"
+    ${S}/configure ${EXTRA_OECONF}
 }
 
 do_install_append() {
-- 
2.7.4


