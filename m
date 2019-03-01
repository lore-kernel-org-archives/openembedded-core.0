Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id E63427CD1F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Mar 2019 03:21:21 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id v11so5340086plg.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 19:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=J9fo9gOTyk0RWWG53mcpCxia3zIWZnRojQ3I42bVGHg=;
	b=Sqc5h6sMu+P3Uz+O6hubWS3IOWjHlaPnRy0Iu1qHm65o2Rvtb958lvBnc4kWmnOCOL
	NJRz185BmHB2gqWQcDMf2vJ5ENV8MyKYi9aIZKu9QzOubhKoFRKhE0CtQVYzO+Xab4IS
	JgpzZdkdZ0jZQnTCIfp3nULxI+53gLVuNM9dxfR+oDGh5aKQRPg1Wvs45d12i5aWMBhc
	zIufeEbS31lFCy7FRqXK9Vlvope2sklbSqp/CFir8DaFieGFnwetgnK6L8MEQdVS7F+f
	RBYWDaOVRbUmPPtlZyxdT1kJoeOOgDJpTqj2nMyK84u1t3ltfFZXyn/n16RBYiHv1OcH
	3o+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=J9fo9gOTyk0RWWG53mcpCxia3zIWZnRojQ3I42bVGHg=;
	b=rWE+iDXkaHOPIoZcak8Bso7odv2DYqFknLus/E/zOfJmZ5+Ni33iql6zbBNycn66Aw
	fR+YoDa7CzgvH9qmaOPN24xtTGCTy6SsZVMQd1IVPPZv5wmHTjXz7l887mLZjOTY7pCX
	lw5VzEKVlVDdEXGX5zR/asKOQeYovL+IeUkcvqG1cbVov01Xtlfue5fnOpxnp0i+NKic
	gvmyK9LRVWC5POSYR+ARJoPRbqKO7utlmPZO09vd6imnBflkk/T54xQvAoj+m9gGPlXD
	5u2skZWmX9aHzxdR6SQwbOrMsy53y6U38zkIQoLjLLhpZO3FE3K8OHFl9Ht/3wlZOuoq
	uFQQ==
X-Gm-Message-State: APjAAAXcKk5W13S2THAIlG7L4d6yYYymR3KYWipjpQA1MwWWTi2p/ceT
	0TCAMTKLeBDNmx605BhMo86mjYCa
X-Google-Smtp-Source: APXvYqxLKp3qOJFGXHCVAh5M6vJtHZSCpu1Mh6i+peg2TtuyN7LbIM+1hATF9A7MWelYbO4pEj4z9w==
X-Received: by 2002:a17:902:4545:: with SMTP id
	m63mr3034223pld.71.1551410482609; 
	Thu, 28 Feb 2019 19:21:22 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::5fa3])
	by smtp.gmail.com with ESMTPSA id
	z127sm37612096pfb.80.2019.02.28.19.21.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Feb 2019 19:21:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Feb 2019 19:21:09 -0800
Message-Id: <20190301032112.38191-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190301032112.38191-1-raj.khem@gmail.com>
References: <20190301032112.38191-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH V2 2/5] glibc: Disable Werror when building with debug options
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
X-List-Received-Date: Fri, 01 Mar 2019 03:21:22 -0000
Content-Transfer-Encoding: 8bit

Since compiler does not optimize away a lot of stuff we end up with
Werrors e.g.

./sysdeps/ieee754/flt-32/s_log1pf.c: In function '__log1pf':
../sysdeps/ieee754/flt-32/s_log1pf.c:114:22: error: 'c' may be used uninitialized in this function [-Werror=maybe-uninitialized]
  114 |        + (k * ln2_lo + c))) - f);
      |          ~~~~~~~~~~~~^~~~

which otherwise wont happen, so lets build with warnings-as-errors
disabled in debug mode

given we disable werror, now we don't have to restrict user to compile
without -O0

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Rebased

 meta/recipes-core/glibc/glibc.inc     | 9 ---------
 meta/recipes-core/glibc/glibc_2.29.bb | 1 +
 2 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
index b550abd877..252fd56c13 100644
--- a/meta/recipes-core/glibc/glibc.inc
+++ b/meta/recipes-core/glibc/glibc.inc
@@ -2,15 +2,6 @@ require glibc-common.inc
 require glibc-ld.inc
 require glibc-testing.inc
 
-python () {
-    opt_effective = "-O"
-    for opt in d.getVar('SELECTED_OPTIMIZATION').split():
-        if opt in ("-O0", "-O", "-O1", "-O2", "-O3", "-Os"):
-            opt_effective = opt
-    if opt_effective == "-O0":
-        bb.fatal("%s can't be built with %s, try -O1 instead" % (d.getVar('PN'), opt_effective))
-}
-
 DEPENDS = "virtual/${TARGET_PREFIX}gcc libgcc-initial linux-libc-headers"
 
 PROVIDES = "virtual/libc"
diff --git a/meta/recipes-core/glibc/glibc_2.29.bb b/meta/recipes-core/glibc/glibc_2.29.bb
index c3e969d2f8..4577350eae 100644
--- a/meta/recipes-core/glibc/glibc_2.29.bb
+++ b/meta/recipes-core/glibc/glibc_2.29.bb
@@ -85,6 +85,7 @@ EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
                 --disable-crypt \
                 --with-default-link \
                 --enable-nscd \
+                ${@bb.utils.contains_any('SELECTED_OPTIMIZATION', '-O0 -Og', '--disable-werror', '', d)} \
                 ${GLIBCPIE} \
                 ${GLIBC_EXTRA_OECONF}"
 
-- 
2.21.0


