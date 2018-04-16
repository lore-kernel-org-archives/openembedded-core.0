Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id C9DD16FFA1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2018 06:50:33 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id s13-v6so2229164plq.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Apr 2018 23:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3IoNDPlvoy81APIeG49BLAcc3LVQpG9zZKxHZXzkAs0=;
	b=R3H59UBRRPDyyUMseQucJDdKXPMKxOuR4EHm67DozPdw3z26Fc+F6GbT7hVJqwCmwq
	dVkmiGCKOfUKNbQ8iXjWbiO+dwUzjw5NBllI1jUGzF+NE8NtL70B1SltGSQuRusJbt1V
	qwzxt4BUjsxIoDFxw0RK74iN0E6gya4/FzvARYZCCaRcWzPKiagpOgMTcK72eFTA+bzM
	hB14KaCoQjq7LJA+Z0GaDg0BMgC2MUvMDsdygpQVZ8oqf11uFIOYpXoPMTQhfipmcpGP
	Db6srI7hDlIczm5lRBrjj5FzuXSgrvfDL4i1BgsPkJiDeebuedDIOkftd424iKg5D4eo
	u+Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=3IoNDPlvoy81APIeG49BLAcc3LVQpG9zZKxHZXzkAs0=;
	b=UdaD/wyxoTgQE5nxVuvcb9T/KTHoxrlgAC4SMohrXRf0W1AInGYdbbI2LN6gBs7o8t
	WQTzXmLGuNu2xxibaWCK927gn4+X3wxLpHv6rJ0Hs9gkoZvssqhZS5J6Bo9Pjj4yb9KP
	1VXvuEW1K/ht8NPPcN2Y6SzpH2SVY1yZIjRc5rTj1te86x5x9v+HZ6QJg8YI+2CRDEQY
	E+8X1grelaJcrNgN0zpim9/HKsPIgJ4hkwqpiubwVoUw84HonGllH2ptvc2Kv/+vdBGP
	QuVY95HEo3wiqHxJVSdkd7BlTNfCtS+UMiAFng1ojoaRslRhzr57gLq0SAB7eat8jM0T
	lDpQ==
X-Gm-Message-State: ALQs6tDaG662Xk3FJ6LMZAhsWGLt1C9tCKALk9285vLlqcW7R/Yb+Cjr
	VdhjCREbMEuHLviAPnFhXpe7+w==
X-Google-Smtp-Source: AIpwx49pcuHyvqkuc1C63J1f+tvruogeOB1bQuP4IZGFws9Pws8eKz28mlGeuUjVplS1KIqLmnCXEA==
X-Received: by 2002:a17:902:5c6:: with SMTP id
	f64-v6mr14165122plf.77.1523861434595; 
	Sun, 15 Apr 2018 23:50:34 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c::487b])
	by smtp.gmail.com with ESMTPSA id
	o13sm2388362pgn.54.2018.04.15.23.50.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Apr 2018 23:50:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 15 Apr 2018 23:50:12 -0700
Message-Id: <20180416065014.29385-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180416065014.29385-1-raj.khem@gmail.com>
References: <20180416065014.29385-1-raj.khem@gmail.com>
Subject: [PATCH 2/4] musl: Depend on libssp-nonshared
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
X-List-Received-Date: Mon, 16 Apr 2018 06:50:33 -0000

libssp-nonshared is required on musl since
it does not implement the gcc runtime piece of
libssp, which actually it a gcc optimization to
reach to __stack_chk_fail

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 42ba411f17..d5a9360b70 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -22,6 +22,7 @@ DEPENDS = "virtual/${TARGET_PREFIX}binutils \
            libgcc-initial \
            linux-libc-headers \
            bsd-headers \
+           libssp-nonshared \
           "
 
 export CROSS_COMPILE="${TARGET_PREFIX}"
@@ -65,7 +66,7 @@ do_install() {
 	done
 }
 
-RDEPENDS_${PN}-dev += "linux-libc-headers-dev bsd-headers-dev"
+RDEPENDS_${PN}-dev += "linux-libc-headers-dev bsd-headers-dev libssp-nonshared"
 RPROVIDES_${PN}-dev += "libc-dev virtual-libc-dev"
 RPROVIDES_${PN} += "ldd libsegfault rtld(GNU_HASH)"
 
-- 
2.17.0


