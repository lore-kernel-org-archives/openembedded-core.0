Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id 3EB7D7D007
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2019 16:56:24 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id j187so4206386wmj.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2019 09:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=kJwUiiJdi8MVQZLcO8AeHuenWWQbRD/W+ATvGlefHgo=;
	b=JGfQ6bXXWIa3/YFFRSuejW3bGCLfLQojyZKeUFV4FRsAGGoLyL0Pg10m8muuEmSUDV
	sBcM97I6/0FKjZjLHBwUiMcJg5TQ/zyxIB+Z+U5vE4uhb9l5gdyFhwjHcbM6hsL9zLH4
	LfAR+I5Ebz2yAabIp6zB7CtcuOKyCaXlAXH1yIsUdr0C+778JUSuBSFUe9Jpm5z6d0S5
	atdjIqghDHpR7u0tQYo8DCdrcKCo0O+vprzsEzWHbc4P/lSk9bvlZMoRHzjCtgsTDJT3
	ALk0wyUy2TvHRMp4sbmpE5T9BKEAOL6sHXrWwDhfAx+KAXNHcbOkEU3+Oe821sEpT/60
	Fg6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=kJwUiiJdi8MVQZLcO8AeHuenWWQbRD/W+ATvGlefHgo=;
	b=CeB+Juho4K/TPIYR3cXE4CEBPLrscbjzswDeTYvf0/LMpQGeoi6tWiHOSbIyN8YhCS
	bdfCvZUuoQgE255B5EjB/pV3zEBGxWpG3iV+RPuca+R80jQ9qUO7KvcS4KKNoKEq15AH
	MkNXIaxNziIISMFYMKV22wFn+2oIb8P4pxkHsmptctSd+TRhW8aM7/mqlQUnHzQ5c5A7
	TyMm2ZSHujbzawfsma48OR9jV0a+gPmC8Eiq0L4uDt9OEaIr/Uy/7erBzOVoZRyIJ2PP
	BDhPvakk1N7mmhqb8Nlz6LnX17lmN0SrN12at3e6Xw8MKJDPsfTBFrjSbNaEMq7E8rMW
	iLSA==
X-Gm-Message-State: APjAAAX0ydOSdMf0z+x39Jcd943QLUqTVi/7fqeVTH79xwjtGR/2A2AO
	RBFGNcJUdjg2WFehMBVlADYJGOdz
X-Google-Smtp-Source: APXvYqw36iXbazzsnRI4rvjRp9vPdAldphykwp95KfSlxYVK1IkUs4TOeUIjR8ZFM/d5rZGeLhiNaQ==
X-Received: by 2002:a1c:e386:: with SMTP id a128mr22208944wmh.69.1558025784591;
	Thu, 16 May 2019 09:56:24 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id g6sm7762359wro.29.2019.05.16.09.56.23
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 16 May 2019 09:56:23 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 May 2019 16:56:24 +0000
Message-Id: <20190516165624.24188-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [RFC][PATCH] tcmode-default.inc: use the same TUNE_PKGARCH variable as PN set in go-cross
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
X-List-Received-Date: Thu, 16 May 2019 16:56:24 -0000

* otherwise P_V might be set for i686 and PN and RECIPE_MAINTAINER for i586
  from bitbake -e lib32-gcc-cross-i686:

  PREFERRED_VERSION_lib32-go-cross-i686="1.12%"
  RECIPE_MAINTAINER_pn-go-cross-i586="Khem Raj <raj.khem@gmail.com>"

  $ git grep 'go-cross-${'
  meta/conf/distro/include/maintainers.inc:RECIPE_MAINTAINER_pn-go-cross-${TUNE_PKGARCH} = "Khem Raj <raj.khem@gmail.com>"
  meta/conf/distro/include/tcmode-default.inc:PREFERRED_VERSION_go-cross-${TARGET_ARCH} ?= "${GOVERSION}"
  meta/recipes-devtools/go/go-cross.inc:PN = "go-cross-${TUNE_PKGARCH}"

* actually is there a reson to use TUNE_PKGARCH here (unlike other cross/canadian-cross recipes
  which are using TARGET_ARCH/TRANSLATED_TARGET_ARCH)?

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index daacfe28c4..668f31324e 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -68,7 +68,7 @@ PREFERRED_VERSION_qemu-native ?= "${QEMUVERSION}"
 PREFERRED_VERSION_nativesdk-qemu ?= "${QEMUVERSION}"
 
 PREFERRED_VERSION_virtual/${TARGET_PREFIX}go ?= "${GOVERSION}"
-PREFERRED_VERSION_go-cross-${TARGET_ARCH} ?= "${GOVERSION}"
+PREFERRED_VERSION_go-cross-${TUNE_PKGARCH} ?= "${GOVERSION}"
 PREFERRED_VERSION_go-crosssdk-${SDK_ARCH} ?= "${GOVERSION}"
 PREFERRED_VERSION_go-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "${GOVERSION}"
 PREFERRED_VERSION_go ?= "${GOVERSION}"
-- 
2.17.1


