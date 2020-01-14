Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1A9D07FC4F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 14:00:31 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id p17so13872281wma.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 06:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=OWJaJjxtWuPc/OQMUH+Y+hCYco3lLxuih2YMqUGECoU=;
	b=ov0WIhX/tni0WoHpEgBhoIzO/frOcXs6nHBdKLLE1YGM37O3k2zdFBiePtrOw081CP
	QOqyqAwvFYXsMISyJcBvMmBHNQVOucxRHznlroKlKf72Vz1zBvaj/e/jdzO+DpWdb4tx
	y0/X1jCWJ941WIykkHJvGKcmAT7DKjEEl/gCG7kJNzRit/V4CYtnlATch1Q+FiduEhAf
	oWf3cL2YBViT6aGaJ+Wwjxdqyw32+fcG4fX9JF890t7+ZgGDcrXNeWXd9vEdq/G0hvVm
	p4Bksh3yFt6pmgfVnoI7vJ7HAy+HpgZu+vstt8SnzW52Lo5EtVMeNxU1EkzrHtndXEgd
	Zvqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=OWJaJjxtWuPc/OQMUH+Y+hCYco3lLxuih2YMqUGECoU=;
	b=XuPhs5O1F+5ZmYXpz/M8V5FCs7i99BnUkcDstEuxi9rHTF03PuB6AAgubr+pc28uNE
	113P5i4c3FPHObT183XcLwpmzcecqVM7l/ySxZFDa7PNotcBQk6FXaDuJy8qZLDVWmpu
	1W++t9+3G2j52RODkNbct78dS5MHgcNY8xA83H04pm9dOU3WvxGeB17UT2IoM4mfTv8a
	6WTeNVjxwfLKoJtIQUKan2grlT8YwW9U479D9D08JOBNtTp3L/ecmXJtofX2XPYVgrBZ
	MJ/5kdfvhGEu0s05eewudowuA7mZUWetgwTOBk6B3+v/X65INkyggazVvEzTN/b6TZQO
	l7eg==
X-Gm-Message-State: APjAAAW2KCfOfqQ64MBWr+j1yYQdX+HJvgqFkcR+8FY0NAIjgAtDpJRY
	KQj5kggdzkKkT46p7OpsJzuHhKCS
X-Google-Smtp-Source: APXvYqwMqaal/0ERImJ33eO4APQ1PkW7stBmzT+0gF5Ag5w2MAE1jeZPcT44s+fWBadXIBZXARc4ww==
X-Received: by 2002:a1c:5a0a:: with SMTP id o10mr26496934wmb.114.1579010431651;
	Tue, 14 Jan 2020 06:00:31 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	r62sm20147333wma.32.2020.01.14.06.00.30
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 14 Jan 2020 06:00:31 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jan 2020 15:00:07 +0100
Message-Id: <20200114140007.36622-20-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200114140007.36622-1-alex.kanavin@gmail.com>
References: <20200114140007.36622-1-alex.kanavin@gmail.com>
Subject: [PATCH 20/20] valgrind: partially fix ptests
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
X-List-Received-Date: Tue, 14 Jan 2020 14:00:31 -0000

Unfortunately the ptests assume that $S=$B, and also require
the presence of original source code.

There are still some failures left which require additional investigation.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/valgrind/valgrind_3.15.0.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
index aedaab27b33..6a3834cfdc6 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
@@ -64,7 +64,8 @@ COMPATIBLE_HOST_linux-gnun32 = 'null'
 # Disable for powerpc64 with musl
 COMPATIBLE_HOST_libc-musl_powerpc64 = 'null'
 
-inherit autotools ptest multilib_header
+# brokenseip is unfortunately required by ptests to pass
+inherit autotools-brokensep ptest multilib_header
 
 EXTRA_OECONF = "--enable-tls --without-mpicc"
 EXTRA_OECONF += "${@['--enable-only32bit','--enable-only64bit'][d.getVar('SITEINFO_BITS') != '32']}"
@@ -116,7 +117,7 @@ RDEPENDS_${PN}-ptest += " bash coreutils file \
    gdb libgomp \
    perl \
    perl-module-getopt-long perl-module-file-basename perl-module-file-glob \
-   procps sed ${PN}-dbg"
+   procps sed ${PN}-dbg ${PN}-src"
 RDEPENDS_${PN}-ptest_append_libc-glibc = " glibc-utils"
 
 # One of the tests contains a bogus interpreter path on purpose.
-- 
2.17.1


