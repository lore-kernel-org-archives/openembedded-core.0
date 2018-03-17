Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2F33278975
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Mar 2018 03:40:43 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id e9so4832802pgs.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2018 20:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Y1liX0m2MnAiNqDIlM1H6KtHt6N1aXFS2xr8zNbRuYY=;
	b=eQRnujqh0jGfoLg06W5bcj+L4cl42FKyT1X/wYHGKdX0HqwaT70Li7DkgN+xc+vL3T
	WDkUyXDMm5vQlmuHv1vOnWtGKR3a/XzDbUrnFTXev088iOy6FEqSCX9/DMyBtQX4+bMq
	zfcKs+IfG67M1UMuaMEVwvad7rXPHM+RDecGPn3yMee9FNTEqqXNqvAMAQ1XqmaG2zKI
	Lb9O9OsJqmB5BTxTSqJM1i4z/DQMcVYMj5ejH9aDRZnaOqr5Yq6QoBkl45ISpboKMNPk
	aynUIkqmzUDRrwCpmdInd97SFUJYA8daRx3b70N82T2M5pNMwxovWPffCZCHdDiqZdEv
	NxXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Y1liX0m2MnAiNqDIlM1H6KtHt6N1aXFS2xr8zNbRuYY=;
	b=T4zpYHzibpc5o6l26VmlQ4iLfDJMAL+2vokeXrOuLqRk1j5SS/M71h2glVpxgJuKCi
	R9ViRt7johjLsIycC0ygZhs4QlCbwU93Ey0w3KNTJc/2d4FETFHuIG7T61B1m9RJzfZX
	ofCju/Z2LMeCvF7RbOqMifHFpsohg/joSgtrQSvSwQdW6nQREpvJyqKm9RTlCpBd6Bpw
	WP6CB+n//PqfdwZuBaxUfSalD4muDyboGng3SdtI0cvbawrzwmWFZh3BkqjcHqT8Ei0g
	HSZC8BW14GMCIGoa8m7fD6PPY0npojfGmc28IdHbWOgsT+mhxliBK2LnICq28FeZv6Hv
	rsdA==
X-Gm-Message-State: AElRT7EEE4SVYzVHzTx0SYpJgucs9W28RT9tz1qN1ODsd1SxtHHm44xG
	vrdCWtgFyA1izf45ErhkYPHxgQ==
X-Google-Smtp-Source: AG47ELtj1GxrZTWPtiV2677ur2+ldWeMS61CZRk4jKDaFPWIXRby4in1GsuVhq6UYLyyzJkhhEMZ5A==
X-Received: by 10.99.115.3 with SMTP id o3mr3353987pgc.428.1521258045064;
	Fri, 16 Mar 2018 20:40:45 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	184sm874800pfg.124.2018.03.16.20.40.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Mar 2018 20:40:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2018 20:40:32 -0700
Message-Id: <61dfa9e2dce4ac2ac04ab2e6d8730a3be00bfa7a.1521257828.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <cover.1521257828.git.raj.khem@gmail.com>
References: <cover.1521257828.git.raj.khem@gmail.com>
Subject: [PATCH 1/5] gcc: Do not use --with-linker-hash-style if LINKER_HASH_STYLE is empty
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
X-List-Received-Date: Sat, 17 Mar 2018 03:40:44 -0000

We allow to set LINKER_HASH_STYLE to be empty so this would fail
since --with-linker-hash-style needs an argument and cant be empty

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-7.3.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-7.3.inc b/meta/recipes-devtools/gcc/gcc-7.3.inc
index d56d2c5e06..a80926216b 100644
--- a/meta/recipes-devtools/gcc/gcc-7.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-7.3.inc
@@ -100,7 +100,7 @@ EXTRA_OECONF_BASE = "\
     --disable-bootstrap \
     --disable-libmudflap \
     --with-system-zlib \
-    --with-linker-hash-style=${LINKER_HASH_STYLE} \
+    ${@'--with-linker-hash-style=${LINKER_HASH_STYLE}' if '${LINKER_HASH_STYLE}' else ''} \
     --enable-linker-build-id \
     --with-ppl=no \
     --with-cloog=no \
-- 
2.16.2


