Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 68F037F3F3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 15:53:55 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id s18so7516810wrn.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 08:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=z3lBm5m5EO/bHqlTT8bBx07RhjVe6UhqXq+2ZQtZrg0=;
	b=IgwWe4YlGsjDohOffJF2sokvK08fKwRdKnSCwCI/FcVGKkB8eTrgdEO/EGUSasghTT
	unRT3n4ZAfW5FVsdihRAFfcuLRWAWU3YBwSKMD7uX+gQmO+B4veNZPnaQxQ911OZd0R3
	So/09bkVj9XHgtMI+8Fh5rwbLCYy+tYGK9/mQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=z3lBm5m5EO/bHqlTT8bBx07RhjVe6UhqXq+2ZQtZrg0=;
	b=V1ixynLnraqtb7aj+kmTx8j6V58TZiccEQPOqK2VbFRDbGiEFd7UqxF8a7zl2vyo0W
	9x+gEuyNNPmCPy1ndXrdtjayDLSfOgW26Od3D6sltG95+1hb0JKX7UQbbdNh+foA4KM2
	KouuRJEfj0bd4hnYVA8Jn8WQh3V0YXHGN95eU14U2BPz6IiqopFLopwzgR3FCxfU3hPw
	+x/TljfiFOGvBaq/85Tr8BiKcNLIe0Y62rZw1czyp4CZOBJKi9Pcbv2kjYpm6mpliUsI
	FdxxF/uL9jBb4Jzs08nzq2JEPes4P3QhWzI230ulx8PwOse4mdiSqLa8AB25dEBF8ZiO
	ehEw==
X-Gm-Message-State: APjAAAVeoYzyfXswbsQrzkITIMOrHyi90PtnzeCF6F3RWhr6aOkZFra/
	PAe3vrQDHizwovMELNHAACQgRF1v2aBNxw==
X-Google-Smtp-Source: APXvYqz9zHLtGxVYcNxQCA+7kIgC+mCGrRs89S4Rpt2IWqJYtrxmuEU7jZUQhwGKexKdg1XIpB8CWA==
X-Received: by 2002:adf:fad0:: with SMTP id a16mr19235760wrs.195.1567180435741;
	Fri, 30 Aug 2019 08:53:55 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	c201sm12655927wmd.33.2019.08.30.08.53.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 30 Aug 2019 08:53:55 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Aug 2019 16:53:54 +0100
Message-Id: <20190830155354.18038-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] gcc-cross: Clean up fixed-includes
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
X-List-Received-Date: Fri, 30 Aug 2019 15:53:55 -0000
Content-Transfer-Encoding: 8bit

We had interesting failures where building gcc-cross-powerpc with 5.0 kernel
headers, then building eudev after moving to 5.2 headers failed.

gcc-cross doesn't rebuild when linux-libc-headers changes due to its
listing in SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS. This shouldn't matter but
fixincludes as adding asm-generic/socket.h to its filtered list which
was then replacing the real header with an older version. This mismatch
lead to build failures.

We trust the Linux kernel headers to be ANSI safe so lets just clear out
any headers and trust the originals to be correct.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc-cross.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
index 6222c2e8c91..e417b898734 100644
--- a/meta/recipes-devtools/gcc/gcc-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross.inc
@@ -196,6 +196,8 @@ do_install () {
 	# We use libiberty from binutils
 	find ${D}${exec_prefix}/lib -name libiberty.a | xargs rm -f
 	find ${D}${exec_prefix}/lib -name libiberty.h | xargs rm -f
+
+	find ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include-fixed -type f -not -name "README" -not -name limits.h -not -name syslimits.h | xargs rm -f
 }
 
 do_package[noexec] = "1"
-- 
2.20.1


