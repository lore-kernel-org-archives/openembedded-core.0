Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id E145A6013D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jul 2016 21:08:39 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id l202so3554185ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jul 2016 14:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=7phcwdMEgXskCkYLJE8Iylce76dv8yYLOlEqh4Wh5mY=;
	b=d1zrxAaPHmyFo7X59J2ergz5AUfreqpGvxrNMvEJ/uXVl9XmYQJUQ5y4eB9uSR/0Qz
	t0bqi+A/4/L+lfYyUo5TAgEOjRO6ASErnhuuF1eQuU12VC6lyTLRd1lWg7gOPXuRF9d/
	ItjUQBxUbthICAMwq/7Ol36i9G42sMuHQepXL4Rzt/bt9D6W7BOkDKiyczDKD8UrraVL
	f+AFjH8AlrcX5e1u2TqwujON8eIm6fcYbWPr/V1e0hNfa+rU9wwjPv5yyQGRlRM1Z/KQ
	x0aLUjPBfpKQF/T3rYO/EgA9rW0JzoPyFiTQ18a7FnwY15wStCB4v8w+8YcZY2QijwVf
	7OSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7phcwdMEgXskCkYLJE8Iylce76dv8yYLOlEqh4Wh5mY=;
	b=H1dEcHULlaqAg2UxBAH2MoZMhG6NDGkd3Vzem4wGxpRBmjKaOliVycI0AsHMoH0/+l
	mlb+0ZQEMv0+vTJb3YjIfXDGwX3OxChC6eh246L0BwisRgCY8ap3FE1Tsvwra8/HpMeF
	pWhu9UG1CUWm2wSzEitHLVlszoN38wX7lemmYPfM2lcWTVD8Fcnqeu1594byGYvettEa
	7EtuiMp/yu/v3JCnhQ6vSDHA8nejiYCJVEFi/0pvJc6H5eur+X++w7KI8hceNvGOooKz
	W6e4e9TLBEG1UKSvta87F3yswPNzt17LsLe9v909vbi/KZ9jvzCMRTjDqGVQ+9m4rm9Z
	B3tQ==
X-Gm-Message-State: ALyK8tJkMzcpc4gRUrRGPCLaoTSyMMT+nyZgzX8uiQL4/2lFgVnTNQ7jnBAMEw8HAkilGA==
X-Received: by 10.107.173.72 with SMTP id w69mr5367577ioe.127.1467925720172;
	Thu, 07 Jul 2016 14:08:40 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	i13sm1676902ita.18.2016.07.07.14.08.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 07 Jul 2016 14:08:38 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jul 2016 14:08:33 -0700
Message-Id: <1467925713-13460-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 2.8.0
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCHv3] gcc-cross: default linker hash style to sysv
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
X-List-Received-Date: Thu, 07 Jul 2016 21:08:40 -0000

From: Christopher Larson <chris_larson@mentor.com>

We explicitly set the hash style to gnu in our LDFLAGS. Setting the default to
this in the toolchain, while convenient, actually hides bugs, as a failure to
obey LDFLAGS isn't noticed. By removing this, it's not dissimilar to how we
poison the sysroot -- rather than relying on the default, notice right away if
somoeone isn't obeying the needed flags.

This will result in a failure to obey LDFLAGS causing a GNU_HASH QA failure,
which is what's often seen with external toolchains. This brings us all on the
same page, and makes sure a failure to obey LDFLAGS is seen early.

This is limited to cross, to retain ease of use for SDKs.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---

Supercedes '[PATCHv2] gcc-cross: remove --with-linker-hash-style'
v3 changes: per khem's advice, switched to use of LINKER_HASH_STYLE

diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
index f479360..c0b8751 100644
--- a/meta/recipes-devtools/gcc/gcc-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross.inc
@@ -13,6 +13,11 @@ PN = "gcc-cross-${TARGET_ARCH}"
 
 require gcc-configure-common.inc
 
+# While we want the 'gnu' hash style, we explicitly set it to sysv here to
+# ensure that any recipe which doesn't obey our LDFLAGS (which also set it to
+# gnu) will hit a QA failure.
+LINKER_HASH_STYLE ?= "sysv"
+
 EXTRA_OECONF += "--enable-poison-system-directories"
 EXTRA_OECONF_append_sh4 = " \
     --with-multilib-list= \
-- 
2.8.0


