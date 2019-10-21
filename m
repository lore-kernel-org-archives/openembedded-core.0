Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 481567F4F1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 20:16:24 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id p10so14015087qkg.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 13:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=bY4nwz1R9Ws+MNkYl1z/wmEZ19mPPd1Mmcy1d2rT3UM=;
	b=FWs1B0wA1vRyVJoyj31zKFmMgM8l37tyCtcCdnoL5LSCbkozfM1tiNvBw58MLJCnKT
	pvXOknva6GcrhGsUOjeRiUq24MHPJ1ssT65JwRGjNBbM6lLOgq4aiC9HFSvMucrZSqho
	pRZjLFdpnoylTO1Rr2DIXilV2b3OwPuReoh/QevwUKSbSCq7m1FCJgRKRUaV2yusJjTO
	j5SguQotvOudfLel6FTi/FXA9tiM/2ZsRE3Wu/cmifgmtkBk3eHdFGMhIhD7C9OOJp0n
	Ormr5HyFSwf4pQPExqab5JaxusnTE0wV+lv9dep0cbXqDpzbP96j0bC69yHurNkH2lzd
	p+iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=bY4nwz1R9Ws+MNkYl1z/wmEZ19mPPd1Mmcy1d2rT3UM=;
	b=h3b4QfqlcVpIqmTWiHX2uGNEd7p/LtO07afoJpqKUpkwf6anUhqXjxln9267Ly/A+F
	0W2ALnS72zm/BssRmBVJhKOCnlE10D2m/7ZV6P1B6WyVzjodWa+AwARXGnEhQ1A3gJWS
	J3h5Rii85jjNAQ2oBWOxftYCHbnNT2niKX92/ypabXYZKOUch0hz70XKsirt7GZvdVp5
	Wd9zustn85jytWNxzubduO7vLO+Uwpej/jCsqgdgb8ytwu+hebSe4SexwldkawI9Hpe9
	knvTEqZvVGCMNMNWDP9cupKv9UeEeMcPwEck8fe2o1MNHhTUwh5Wi8zXWiEFx1WKqBlV
	+FFg==
X-Gm-Message-State: APjAAAWHHlGXLZJTPe6YsYiDOIuk2EDtq4OPQwWOWFtFBEJ8baEa01A0
	eWZVgIxd/ZQbgZp/beo6215fNL6uDXsyoQ==
X-Google-Smtp-Source: APXvYqyT+/LaUI9jAw6ATLICqg3lwnVTr/+OjWNCPDxVuJWemy64lkmVuppLBLd0UVhe+z/AZ9eETg==
X-Received: by 2002:a37:9847:: with SMTP id a68mr15432925qke.223.1571688984865;
	Mon, 21 Oct 2019 13:16:24 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.113.11.95]) by smtp.gmail.com with ESMTPSA id
	o12sm4666903qkk.54.2019.10.21.13.16.23
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 21 Oct 2019 13:16:24 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Mon, 21 Oct 2019 16:16:15 -0400
Message-Id: <501fbbcc04603d80fb47727bdde64ca5abe14e87.1571688520.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1571688520.git.bruce.ashfield@gmail.com>
References: <cover.1571688520.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/6] perf: fix v5.4+ builds
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
X-List-Received-Date: Mon, 21 Oct 2019 20:16:24 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

When building perf for 5.4+, we have some new files that need to
be copied (and synchronized) due to structural changes in the
kernel source tree.

Some of the issues these fixes are warnings, but none the less,
they are worth fixing.

 - We copy arch/${ARCH}/Makefile, since it is source by some perf
   Makefiles

 - We copy scripts/, since the perf utilities are looking for files
   in that directory stucture.

 - We have *three* copies of ctypes.h in the tools/* hierarchy
   during the build. If the tools/perf/util/include/linux/ variant
   is used, it will trigger build errors since it is not complete.
   We copy the kernel's main include/linux/ctype.h to ensure they
   are in sync.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/perf/perf.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 8201c0cb60..0f5df74f11 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -113,6 +113,8 @@ PERF_SRC ?= "Makefile \
              tools/Makefile \
              tools/perf \
              tools/scripts \
+             scripts/ \
+             arch/${ARCH}/Makefile \
 "
 
 PERF_EXTRA_LDFLAGS = ""
@@ -246,6 +248,11 @@ do_configure_prepend () {
 
     # bits.h can have the same issue as unistd.h, so we make the tools variant take precedence
     [ -e ${S}/tools/include/linux/bits.h ] && install -D -m0644 ${S}/tools/include/linux/bits.h ${S}/include/linux/bits.h
+
+    [ -e ${S}/tools/perf/util/include/linux/ctype.h ] && install -D -m0644 ${S}/include/linux/ctype.h ${S}/tools/perf/util/include/linux/ctype.h
+
+    [ -e ${S}/include/uapi/linux/kvm.h ] && install -D -m0644 ${S}/include/uapi/linux/kvm.h  ${S}/tools/include/uapi/linux/kvm.h
+    [ -e ${S}/include/uapi/linux/sched.h ] && install -D -m0644 ${S}/include/uapi/linux/sched.h  ${S}/tools/include/uapi/linux/sched.h
 }
 
 python do_package_prepend() {
-- 
2.19.1


