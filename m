Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 517946C132
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2018 15:32:23 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id 96so15641947wrb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2018 07:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=IjDw+5mZu3MSgGMmln2UL3DxlTsdTSioQ49hy/rl3Jw=;
	b=dnk3UB27B+UsYOK9Hk/Neu7EzKKx81lscQ9chXjjHLHAsABQULRnD/YoMSr2QWWxcY
	ooJjz/YsYlJBfDRrh4pg1G/vs3et4NPdrlLDqBINSRT86v2SJolk8GslVMFzhec6hJtj
	iPZOW4Mx9S0wrmEK02a2GrnXh5qHsUf+xML8k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=IjDw+5mZu3MSgGMmln2UL3DxlTsdTSioQ49hy/rl3Jw=;
	b=gutPCqH3fb5Bc5dqrJRFWL3IgUiy21UmisWgTHWHSuP5rDKgVbBSD8vOo3M28tGMBB
	/QvaknHYBU0t4v0x4gOXbbeqMm3bBR3lAnjcsjO6ePLKwNFGwXFm/14ERtvxk+ppScY5
	O7kXT5E9gareKSBxXKVVjH837dpjqjyX/rBxp77rYcXo9iLWrUl45RK0UKUCFaKLN52u
	Wh8WJguHXfaQvxRT/4GHJvRrvpfh2CKXaUjaheNtUxjzREsfMspcYrIb6D6mf8pUjTPW
	30fOD6nV8FlmmonDbRNE72j7p1l386q5pucG8BTVoq8N3EUs64fTUQaGdZoh59TlRvyS
	QvmA==
X-Gm-Message-State: AGRZ1gIftYoICbGpXb9CNivl1eydpq+kd+rtG/gLc9yuC30k3IKWhb1z
	mwe5xcYY9iXyXEQrAz4SeR955pGq+4g=
X-Google-Smtp-Source: AJdET5dCQNQ9VjSpPdTq7qM/HOOthD/dYSZ6lGVXM/Keuhm6LrxRkT/wHOkKEuhjEhmOm0ge5+lfOA==
X-Received: by 2002:adf:f58f:: with SMTP id f15mr19910289wro.231.1542641543567;
	Mon, 19 Nov 2018 07:32:23 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	x81sm409180wmg.17.2018.11.19.07.32.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Nov 2018 07:32:22 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Nov 2018 15:32:19 +0000
Message-Id: <20181119153219.21850-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181119153219.21850-1-richard.purdie@linuxfoundation.org>
References: <20181119153219.21850-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 3/3] nasm: Couple of recipe cleanups
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
X-List-Received-Date: Mon, 19 Nov 2018 15:32:23 -0000

The do_install now matches that from autotools.bbclass.

Document that brokensep is still needed.

Use a better form of handling of aclocal.m4

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/nasm/nasm_2.14.bb | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-devtools/nasm/nasm_2.14.bb b/meta/recipes-devtools/nasm/nasm_2.14.bb
index 231d4e6b15f..687a05a5cde 100644
--- a/meta/recipes-devtools/nasm/nasm_2.14.bb
+++ b/meta/recipes-devtools/nasm/nasm_2.14.bb
@@ -8,17 +8,10 @@ SRC_URI = "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.bz2"
 SRC_URI[md5sum] = "238a240d3f869a52f8ac38ee3f8faafa"
 SRC_URI[sha256sum] = "d43cfd27cad53d0c22a9bf9702e9dffcc7018a0df21d15b92c56d250d747c744"
 
+# brokensep since this uses autoconf but not automake
 inherit autotools-brokensep
 
-do_configure_prepend () {
-	if [ -f ${S}/aclocal.m4 ] && [ ! -f ${S}/acinclude.m4 ]; then
-		mv ${S}/aclocal.m4 ${S}/acinclude.m4
-	fi
-}
-
-do_install() {
-	oe_runmake 'DESTDIR=${D}' install
-}
+EXTRA_AUTORECONF += "--exclude=aclocal"
 
 BBCLASSEXTEND = "native"
 
-- 
2.17.1


