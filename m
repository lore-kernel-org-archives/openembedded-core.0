Return-Path: <armccurdy@gmail.com>
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
	[209.85.210.169])
	by mail.openembedded.org (Postfix) with ESMTP id 7C80F7F281
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2019 19:24:36 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id 205so523837pfw.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2019 12:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=p+DzCUuUer+P3Al7Qgw4+GMkZhKQE6tFW34NFK6w3ig=;
	b=O6FaIrXDa4ml41sG02Z3QJ2jUq8KzJKCBG4s96MeHtQsWYjwuTjS+Qt1Zmu3SMHf+1
	SFD2YrtJkdoFwLGHsseiwnf45WIrDSth2mrGiFlfqi2mDSvrNPe66R7z4sXcIz41iINX
	Tq7mYzC3aPjrbSYNZKGYTyKppU3H9EAUT1Dr6S+FTgve6oWVkQh3w+VKu8x7k3qOpT3m
	V2TrzaOF7g+af5O2EHrZIULWrUvi5rShesT3wA99jI32og6EI9WA5NAOlSOz6q+WfhG4
	vyNB6Z1QhsEo+cgDSHMBAtH0RGx0a5zCLulPzGVggO7HdSOyK3o2Z3pQbnd56JcrTK25
	G08w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=p+DzCUuUer+P3Al7Qgw4+GMkZhKQE6tFW34NFK6w3ig=;
	b=pB4sJVCFsgkKgY3uzCZo3EgphZnBJnS0Dab7Lhi5NEXqq2B41Tbav43E/w9D2BYwMR
	jMP/z+Uadp/hS3SRt+Q5WRsfJjeLo791eV3SvkWtWvnfBMcxT7gvHMGlTlD7xaMKXFsx
	w/QqDBQEuoCCLZ/DnTi5cL+jYwzgTjSo6UWq2Ji0BUxCF+CkyS0AmXX6wRD9rXYFpvIl
	FkUxR6SllamIw9rTYfcS2pYVRwiq0qULYl6x4MUfwX76/iel79qNB3jooCEXZHYy+Jsw
	nmKx8gY2uej43JVczopjjF9G39fU2W5hVhghNs8f3nHn2hSoVvqhX6nFhAdWP6zX9FdU
	/nDA==
X-Gm-Message-State: APjAAAVGIVPqhL/0KL80pHVIsIkZBuIGutwyXFlqzmZ6bSKgRJXAa4cz
	LTi99ATLxaHiBomMmsFwu5MfYJYU
X-Google-Smtp-Source: APXvYqyCyBK+3960WgluLEdPyokqiYjkUKRqmMCwwq0j9aY5T4v2b8k0jvN7G1NbB9aaiw4oI8PmcA==
X-Received: by 2002:aa7:828c:: with SMTP id s12mr311pfm.94.1568661877429;
	Mon, 16 Sep 2019 12:24:37 -0700 (PDT)
Received: from localhost.localdomain ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id d7sm5490494pfr.7.2019.09.16.12.24.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 16 Sep 2019 12:24:37 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Sep 2019 12:24:23 -0700
Message-Id: <20190916192429.27294-2-armccurdy@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190916192429.27294-1-armccurdy@gmail.com>
References: <20190916192429.27294-1-armccurdy@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/8] busybox: rcS and rcK should not be writeable by everyone
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
X-List-Received-Date: Mon, 16 Sep 2019 19:24:36 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/busybox/busybox.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 49165d7f51..4c3969501a 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -316,8 +316,8 @@ do_install () {
 		fi
 	fi
 	if grep -q "CONFIG_INIT=y" ${B}/.config; then
-		install -D -m 0777 ${WORKDIR}/rcS ${D}${sysconfdir}/init.d/rcS
-		install -D -m 0777 ${WORKDIR}/rcK ${D}${sysconfdir}/init.d/rcK
+		install -D -m 0755 ${WORKDIR}/rcS ${D}${sysconfdir}/init.d/rcS
+		install -D -m 0755 ${WORKDIR}/rcK ${D}${sysconfdir}/init.d/rcK
 	fi
 
 	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
-- 
2.23.0


