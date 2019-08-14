Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8402D7ECB5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2019 16:32:07 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id y8so5751009wrn.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2019 09:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=mcjb+hCHQ7RJT5SM3lNxRgsjxy80IRRmtamcYmDs57A=;
	b=RBVhTmA5mlXyg+q062/Y6/XeXa/8H18GGDZhmF9MqoWM6nyOFm+nsNsm2jS0i3hV+e
	dzJXS8H+98VBDI2urAwYyD97GxY4kEakapSqXVtGpzTm7q5/Ja95JC+bzVPRMsOk0dmV
	4IqWY1jrLps//fQuPgvf3H5YH/V0tXTEZ4RqU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=mcjb+hCHQ7RJT5SM3lNxRgsjxy80IRRmtamcYmDs57A=;
	b=LwiARg4x80nD+bf/1nTW6HbnqhZkgBIShxhS6swXHiCNEhvwqC1DlMJ8Ygrs4nyaa8
	ZOYZLjxTfs9nWgitZNFczEVbmXSSWY4zQ5d/NW5gMxxyJszvTonFWATkihY343p4MPHf
	WrhADYrWYuyYYTn544ePdia/pXFmOBTtG3zEKWxHNFMRopjr4DsAAqSf/SMvvsq1yXHy
	1+mHgiFlkKGKVPVJudtn8bvIFc/tIjBVQgjl/4+rC4Es31zYGAPkHj0PMQtOI7OvR20j
	KjVu+vNPzLhm1DNnFVN6xHpJBMC8r+Nv+5CIryGOc0yfP4PkuAcw4AhXMNSe0LheyzPu
	k5JQ==
X-Gm-Message-State: APjAAAUagTW68eueAvtDzZJumW8l6WyeBK035x8Ml6u+eqs7W8FIysJo
	+yKhQKDNVxaICRqMmyBF5e0HY4w1t2RW/Q==
X-Google-Smtp-Source: APXvYqwYLBQlFrx84gfYaNjMMsuB6Uob1aNzt/xUqSVPUAXKlpLj1ePWcnCgHlP5+ZaAsx2FWCA1vw==
X-Received: by 2002:a5d:42c1:: with SMTP id t1mr605204wrr.344.1565800327826;
	Wed, 14 Aug 2019 09:32:07 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	m6sm165022wrq.95.2019.08.14.09.32.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 14 Aug 2019 09:32:07 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Aug 2019 17:32:06 +0100
Message-Id: <20190814163206.7162-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] gcc-cross-canadian: Drop obsolete shlibs exclusion
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
X-List-Received-Date: Wed, 14 Aug 2019 16:32:07 -0000
Content-Transfer-Encoding: 8bit

This is a very old change as and be inferred from the name in the comment.
We've since had many changes to pkgdata including separating it
to its own sysroot now so the reasons for this blanket exclusion are
likely long gone.

If the shlib provides were really the problem I'd much rather have
a dedicated variable for that too.

Removing this fixes missing dependencies on nativesdk-libc and other
libs which would then happen automatically.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc-cross-canadian.inc | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
index 807e47e0ee2..f14cbf71522 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
@@ -63,9 +63,6 @@ do_compile () {
 	(cd ${B}/${TARGET_SYS}/libgcc; oe_runmake enable-execute-stack.c unwind.h md-unwind-support.h sfp-machine.h gthr-default.h)
 }
 
-# Having anything auto depending on gcc-cross-sdk is a really bad idea...
-EXCLUDE_FROM_SHLIBS = "1"
-
 PACKAGES = "${PN}-dbg ${PN} ${PN}-doc"
 
 FILES_${PN} = "\
-- 
2.20.1


