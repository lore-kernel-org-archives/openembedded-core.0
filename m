Return-Path: <serhe.popovych@gmail.com>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9898B7BDDB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 22:30:22 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id b20so10697887lfa.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 14:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Rbqfwd0LrRFFkYRoD4sGT1E9HWyEsF68WEPaJ/MY7O4=;
	b=UV8eOVKPBEKUsXpZzAe77+kB+AWp5DHJpOfUn6gtP1Pt31ToDlb4gHAkFFzYxahjF8
	yurF+hqWe9t6jCaHRmBy8hoUTMzkvMO10sFDreuu9LBJ/k/vG3rgJE0tEgkru+iNYdU+
	PfAqBTD3tLmxHMHNXcnlG7h+0FZAdWg0u2OaoI9GH9dO+2VuN5neYQxU7mHPDx3E1x5x
	i1kTwLRk2ew1XU5tsXlsoOWFkoEW3Nite8ffo+ZXkwIMIQTdENnaYMxyh/+Bv96afaYK
	gTiIgX+QCbPtRYPTpKbbhP+ymnE9lZmqdtr7gVHt24CowMxMSfAv8Wqsn4cqMzM/jQAS
	6bNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Rbqfwd0LrRFFkYRoD4sGT1E9HWyEsF68WEPaJ/MY7O4=;
	b=pIbMd0ZWwfDogqBJ6+oNf35oIiAWm/XOA8IViyYp4bxUUPFJHlPv99GIlbFUL2AldQ
	k3a5o8l3/HWeuNYvPOqLV+Rj0VfVtdJSPDuUuWTqd5ZWGI5gimK96dgVUq/RqLA/VuE5
	33NGXlMEB0/7q2i/vMbuvqGRsOnwk3cwf5pkaNxOypaGMsV4BXOERDvawEZT3pIq9A6k
	R7bvxgDrKWy4Q7D5k8c0rLDq9JTihC7o2UeQa56JYE6dF4BJplAmGfwhtqKWlu8UcoeF
	Dt8M3/i9A2WFxfI5XQfKM5KuSq5bRCt+wQsvd5J/wUoHYH8e372vD1QIA0TC9zHhf3ue
	dH0g==
X-Gm-Message-State: AA+aEWbnVQSeSwQj7K+O+AgedILpV+65Dq/fdwFtqwgVUZHmJaTcth2e
	dldBH/XsHlhIFhQMO/VQl4IEN3rI
X-Google-Smtp-Source: AFSGD/XqfhVsYnWuxiCXENZBh2rOTr6Zb+fLzV5ikYHSMT/GE9oJZp9lX0aGm08Hr+POvpWa9GZXZA==
X-Received: by 2002:a19:8fce:: with SMTP id s75mr8162468lfk.151.1545085822892; 
	Mon, 17 Dec 2018 14:30:22 -0800 (PST)
Received: from v-ubt16-x64-sonic.as41781.net ([193.34.155.16])
	by smtp.gmail.com with ESMTPSA id
	v17-v6sm2691726ljg.32.2018.12.17.14.30.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 17 Dec 2018 14:30:22 -0800 (PST)
From: Serhey Popovych <serhe.popovych@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Dec 2018 00:29:52 +0200
Message-Id: <1545085793-30072-2-git-send-email-serhe.popovych@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1545085793-30072-1-git-send-email-serhe.popovych@gmail.com>
References: <1545085793-30072-1-git-send-email-serhe.popovych@gmail.com>
Subject: [PATCH 1/2] musl: Fix ldd symlink install in case of multilib
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
X-List-Received-Date: Mon, 17 Dec 2018 22:30:22 -0000

Otherwise dnf install lib32-musl and musl will fail with below error:

  ERROR: core-image-sato-1.0-r0 do_rootfs: Could not invoke dnf.
  ...
  Error: Transaction check error:
    file /usr/bin/ldd.musl conflicts between attempted installs of \
  musl-1.1.20+git0+39ef612aa1-r0.ppc64p8 and \
  lib32-musl-1.1.20+git0+39ef612aa1-r0.ppcp8
  ...

Signed-off-by: Serhey Popovych <serhe.popovych@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 9cc875c..80dd9f2 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -61,8 +61,9 @@ do_install() {
 	oe_runmake install DESTDIR='${D}'
 
 	install -d ${D}${bindir}
-	rm -f ${D}${bindir}/ldd
-	lnr ${D}${libdir}/libc.so ${D}${bindir}/ldd
+	[ -n "${MLPREFIX}" ] && LDD="ldd.${PN}" || LDD="ldd"
+	rm -f ${D}${bindir}/${LDD}
+	lnr ${D}${libdir}/libc.so ${D}${bindir}/${LDD}
 	lnr ${D}${libdir}/libc.so ${D}${GLIBC_LDSO}
 	for l in crypt dl m pthread resolv rt util xnet
 	do
-- 
2.7.4


