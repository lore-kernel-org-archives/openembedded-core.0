Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1000A6C0B7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Dec 2018 14:23:57 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id s12so5447354wrt.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Dec 2018 06:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=C3Cr4qt22o8bSSh5CysUv/Rz+G7DQXG81579Y4IvJno=;
	b=dVvciVigHh0BVRiet0yIOJAJOdmo4qaEF1VKr0j007KuC5WTFWAiau3DO909r2jJuW
	tWvbhRPagVnGGza13fGlI1Do9FYcJ6hkmM1C50EIUlgMTowK/22Qg0fF5smdDuwV2aty
	UlhwcWsQwHw5or7DioLOQ8MPyKDfRtuglhaJ7sVktInpYXcbsTgWoY8zxTMBPpZX0VYx
	S46LGKemJvfn1vVz9oTDjSiDdlgpCnVohgKPY7+pe1xqBt2IjdMr8egZY5jkXXVk4Ya0
	NWidJU/KhYC+7BtrIexq7/mV2zuE7G/Mr2E+DmrKQrUfgBPgfUuB7IQDFeyXadyjQKT1
	Slrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=C3Cr4qt22o8bSSh5CysUv/Rz+G7DQXG81579Y4IvJno=;
	b=IJcsAXsMsUufC1oWfVVs+BuRBKiYYDWY7TpW9Fpy/fY+ZwWl6SsMrRna9iQKJcx1B9
	6WvABtM19RlbiS7QUN65EdQk9rPOFopiHTndb4StwypvweRFYfibLp8F3zmllKbbVZDq
	GT+0uqtu7UhjZZ2oJB+dHIBVQ8E9zXblN38gqrjP3/tX2aM4sAi5yVpqVcDMYeR5tFzI
	RJYJUA39A9UYqklf7sB4Cm/lLZio4ZwgU/xVcsF4bahf7x7anHAyvz3oN2YwAPkF5Cl8
	WqliDhKzKKVsL/6oXKxXQ7VJQNALrgZyzVpFhCNafzk7aUzuANk8PZEfObuhhWz2xzuT
	GavA==
X-Gm-Message-State: AJcUuke3etGhCUogIglET9vfQOyPv5RhCGANbQGdDDeA1MX3lWvWy7H0
	haumteatHCSs2m18gaLUeib/UYPL
X-Google-Smtp-Source: ALg8bN4UmE69fAbjcqZH/pBrjDSvAa/pHiEW5zbXSDXDHPTtN4lTYD5Kv8JL3mwrOUv6WoAMG+ht8A==
X-Received: by 2002:adf:e1c3:: with SMTP id l3mr2923736wri.36.1545402238180;
	Fri, 21 Dec 2018 06:23:58 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id f2sm8768883wre.34.2018.12.21.06.23.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Dec 2018 06:23:57 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Dec 2018 15:23:51 +0100
Message-Id: <20181221142351.71820-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] bitbake.conf: add --enable-new-dtags to linker
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
X-List-Received-Date: Fri, 21 Dec 2018 14:23:58 -0000

Various versions of ld have different defaults for this
(even between e.g. Ubuntu 16.04 and 18.04). This has the
consequence of putting either RPATH or RUNPATH into the binary,
depending on the linker, which have different priorities
vs LD_LIBRARY_PATH env var. Also, I think, the original
executable binary is looked up for the tags when resolving
a dependency of a shared library when using RPATH, but not
RUNPATH.

Let's make this deterministic.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/bitbake.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 64800623545..732e4f93328 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -573,6 +573,7 @@ export TARGET_CXXFLAGS = "${TARGET_CFLAGS}"
 
 export BUILD_LDFLAGS = "-L${STAGING_LIBDIR_NATIVE} \
                         -L${STAGING_BASE_LIBDIR_NATIVE} \
+                        -Wl,--enable-new-dtags \
                         -Wl,-rpath-link,${STAGING_LIBDIR_NATIVE} \
                         -Wl,-rpath-link,${STAGING_BASE_LIBDIR_NATIVE} \
                         -Wl,-rpath,${STAGING_LIBDIR_NATIVE} \
-- 
2.17.1


