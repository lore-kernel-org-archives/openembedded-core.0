Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
	[209.85.214.176])
	by mail.openembedded.org (Postfix) with ESMTP id 2998A6D7A2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 16:53:45 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id m7so1749406pls.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 09:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=aIv8pJ3WUEb06Y0/DoOgNWHtpRzUittm9mT0+UehMng=;
	b=jqScKdNK2wiS/PxGAp3TPNKbgPw2xgw+RPf1ymeFO50qUO36FTuHQRNyPJACh4L2UN
	pQWTdPu4NbqxdttvtRkIRO3uz7IrzbI42CgRcjnITc5A+FaDtLUkZzGORf4bl5JkZIaD
	nt5CaqVhbbkCmT6J+XcJhJV9d3wt10Gz2GlMGL0uaU0P0WrbIhtRE8XrDT2AGtzbXAcB
	lwPP9UlpUSmbUN0nC8EaRulDPuodqa9B8iYfjzoudG9GcKiJbv7730+s4jQxW82GZWp7
	C3MEDaZWwusXGF6/Rz01CYwSz+ydMrg6B49cmeoRk9WFYX+oFaO0PSpko9QzWG8b/8gg
	cRPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=aIv8pJ3WUEb06Y0/DoOgNWHtpRzUittm9mT0+UehMng=;
	b=ed1JJ3pg2r9bVXsCQzP8U7CVAOxiqQm8X3oiRo4LoU69UBFu0X+EdoDrmZRHwJt8tx
	ZJAFRaSriUrJ8yIhS4Y22LzxNyK/lBpqxKDnp4NFhT9BoSKgfr6tHjARIgSl37gHuoRw
	RadXH2OgeSoo5W7YCaNeJaE0+ANNtagljHeBfJcElEJSvRF1ltHnIueV7G6hy5BJRSve
	2AIguh/n4V4ZSgOoBGbZY8dhdSf04b9Qbiu8I83aV2i/X0giKT0U5PeMkGmVExAkvnHg
	B1fqbEAB5mQZTbkxt95gM17sVHvMsH/o8AuP5713d3CoteiniKC4wEt18r3omC9v+TpN
	MYcw==
X-Gm-Message-State: APjAAAUKBhNOZwffom+wES7yhdF8Uc4zIQp+isiE7xMY7LWTVNln2P44
	fiZ2TdNy8PWLiDmiO7h44bGptEkcSHA=
X-Google-Smtp-Source: APXvYqwLOi/BrRRhn8df53FMiSSdCXn6OUp5yVHW6FF0dugDTMEAHxUz8IuFPN5m/kbWUgE7ZxB83g==
X-Received: by 2002:a17:902:7043:: with SMTP id
	h3mr6853057plt.10.1561568027123; 
	Wed, 26 Jun 2019 09:53:47 -0700 (PDT)
Received: from localhost.localdomain ([45.19.219.178])
	by smtp.gmail.com with ESMTPSA id
	t11sm15339687pgp.1.2019.06.26.09.53.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 26 Jun 2019 09:53:46 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Jun 2019 09:53:13 -0700
Message-Id: <fca74928bf2002daf526ad8c1446c8d9ba891a78.1561566521.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1561566521.git.akuster808@gmail.com>
References: <cover.1561566521.git.akuster808@gmail.com>
Subject: [thud][ 12/25] go-target.inc: fix go not found while multilib enabled
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
X-List-Received-Date: Wed, 26 Jun 2019 16:53:46 -0000

From: Hongxu Jia <hongxu.jia@windriver.com>

Go binaries were installed to ${libdir}/go/bin, and create symlink
in ${bindir}, while enabling multilib, libdir was extended (such as
/usr/lib64), but BASELIB was not (still /lib), so use
baselib (such as /lib64)) to replace

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/go/go-target.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/go/go-target.inc b/meta/recipes-devtools/go/go-target.inc
index c229ab2..379f87b 100644
--- a/meta/recipes-devtools/go/go-target.inc
+++ b/meta/recipes-devtools/go/go-target.inc
@@ -40,7 +40,7 @@ do_install() {
 	for f in ${B}/${GO_BUILD_BINDIR}/*; do
 		name=`basename $f`
 		install -m 0755 $f ${D}${libdir}/go/bin/
-		ln -sf ../${BASELIB}/go/bin/$name ${D}${bindir}/
+		ln -sf ../${baselib}/go/bin/$name ${D}${bindir}/
 	done
 }
 
-- 
2.7.4


