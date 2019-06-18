Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id 94A177E894
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 11:41:47 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id n4so13560927wrw.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 04:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=qV+iu9zSpevLinxccC6bmtew44c7L0bPAFethDOKFnI=;
	b=SLeqkcgIA/I+84CpdzBYbIxLw/koOJ76EhJUga50HRWy23wSRP5Ga1BHKCcodUE848
	O1zBINv29yWGGpkYrZqyYvRokpjyRgQTTwHWorroIXF4SuOxLBO+wlur5COrhzgjR60W
	UmJoWBlm5KG6kgvyp//GfPiZl++ih5NPX5vAI7zCZxi2Lq5MmJ7mv1pCcdMRN4GLbUbA
	lHl63u1wJsCHiM9kmEs4WKhyZsUor9ub6cW1apGWRFyMr6EOB0HHGgfhWB+RiycasTSP
	OFmd0ylfBiFKWQU6GuNazM63LsZoHMMsUoE+udH2hdPpO6NlEctRsqt1S3h7Z+OGJobB
	EZGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=qV+iu9zSpevLinxccC6bmtew44c7L0bPAFethDOKFnI=;
	b=CtC0RMl4kyO9Kw9MBeRgQhDcRWVaaTiex/BbxfUosqyvCfP9Me751O4domE2XqWJk3
	Dd+IG0Tkhu6xSQQDmg6OMjH45fasR4+hB9p0oRNSoZdwONL43m5ZtM703mbIiK3jf0hR
	wLunTIg/QB7QHyhOftpF+XoYH0X6upyFipAFnIGT82st70LK/33udEcHgkfxX5GDLSF3
	8dT7EYgV56knudQCBeQs71trQzbDaBjHl8csxagifiGUrmLgUt1kit8QII06WbFeNc81
	SUmS01GXyI53UfOQispDWdOnAwDvEICFNZ8UjA1Q9FNLl3hFE/36R7AP1lh46tqe9zDg
	Gd7A==
X-Gm-Message-State: APjAAAWvhkSSBh9RyDdPiowYmbHZ4PS8jETsa0Rk/1nGhgh1wbT78t+N
	vBjXqn/ut0MWMvXnWdEylPer4WF1
X-Google-Smtp-Source: APXvYqwDqnYygCl0EI/nnFLecahfk2+pvcxCQva5v6p7U/zdHvYOp4BSKGZVSXjojZDFOvAs6pkKqA==
X-Received: by 2002:adf:cd8c:: with SMTP id q12mr67097171wrj.103.1560858108035;
	Tue, 18 Jun 2019 04:41:48 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	l12sm37697746wrb.81.2019.06.18.04.41.47
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 18 Jun 2019 04:41:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Jun 2019 11:41:52 +0000
Message-Id: <20190618114152.6172-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CAJTo0LZf4a-p2RpMbdL6Vch+UHC69b3Jm1z5-Gz7LaGq6RZCKA@mail.gmail.com>
References: <CAJTo0LZf4a-p2RpMbdL6Vch+UHC69b3Jm1z5-Gz7LaGq6RZCKA@mail.gmail.com>
Subject: [PATCHv2] base.bbclass: define PACKAGECONFIG_CONFARGS before only sometimes appending to it
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
X-List-Received-Date: Tue, 18 Jun 2019 11:41:48 -0000

* just to make sure it's expaned by bitbake before it gets
  executed in shell
* e.g. with cmake.bbclass and cmake recipe (any recipe without
  PACKAGECONFIG options have this issue) it looks like this:
  bitbake -e cmake | grep EXTRA_OECMAKE=
  EXTRA_OECMAKE="     -DCMAKE_DOC_DIR=share/doc/cmake-3.14
    -DCMAKE_USE_SYSTEM_LIBRARIES=1 -DCMAKE_USE_SYSTEM_LIBRARY_JSONCPP=0
    -DCMAKE_USE_SYSTEM_LIBRARY_LIBUV=0
    -DCMAKE_USE_SYSTEM_LIBRARY_LIBRHASH=0     -DKWSYS_CHAR_IS_SIGNED=1
    -DBUILD_CursesDialog=0     -DKWSYS_LFS_WORKS=1
    \${PACKAGECONFIG_CONFARGS}"

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/base.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 90af8ba72b..0c8a4b2862 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -15,6 +15,8 @@ OE_EXTRA_IMPORTS ?= ""
 OE_IMPORTS += "os sys time oe.path oe.utils oe.types oe.package oe.packagegroup oe.sstatesig oe.lsb oe.cachedpath oe.license ${OE_EXTRA_IMPORTS}"
 OE_IMPORTS[type] = "list"
 
+PACKAGECONFIG_CONFARGS ??= ""
+
 def oe_import(d):
     import sys
 
-- 
2.17.1


