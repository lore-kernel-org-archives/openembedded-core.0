Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.4359.1612602260469881934
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Feb 2021 01:04:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LBacg9PU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id l12so10495306wry.2
        for <openembedded-core@lists.openembedded.org>; Sat, 06 Feb 2021 01:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tmwcWyGF2QAKQfMLQOhboAAvWgMJtsPNbkAZQf50AgU=;
        b=LBacg9PUy65iWYNQXfP4iFJS4KHeIF6JvV63dktqMy1ji5752uzSHImcZx8IyrUFx2
         UNONpF6zy5zHXnkmyiNnwXyKx+WcEJqcVQpm30LDCBJDD9CpnVe7lrI7ff1EIXO1opKR
         xJXZneQB7BfU01XxXaFYm8s0737FdbTihhpaE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tmwcWyGF2QAKQfMLQOhboAAvWgMJtsPNbkAZQf50AgU=;
        b=HyCARZ0QtvVtJRMLXO7J/CvqnRyezFDg1DQExazPCeuGcckOPCbKa7p1WkwU+XMiYo
         js7zfzIXQw0aIMRShhD/sr4BZz/6QI8iRzgzVXge0vgD3W1rbCxWS02vZFmjJV3+si2O
         DBqy98c/fIjWgENcufQBvwT72MjuZ98g0Re4F6oWgovrrytn3lHXV7+8kUz5EZlGxdR6
         coEZ5n70lU7GrjfC32fO6wDJGvG7zq+G+lHb1b1JPvOOiCl73MoSqM71waSwhM1+FZIB
         MgqJfS/erraJhce3VV4vxdi7kkX/VyG6pILrNbfnCINQlGFLITj9VncgYU8p3ukR0C5/
         PSbg==
X-Gm-Message-State: AOAM530XsO1WTdR5duPMUC7M7gCKuK+CsCuAnzNqPLtRQNMhnHbOuFXQ
	JhUmOnm3DZFzMBflVyHv0tFTdgoIkLHSrA==
X-Google-Smtp-Source: ABdhPJzqtRWUqkCCf/kJyvQaRLPWiTeh1bE0+8WQ6ETocVBret1ZApaDadIpD/6fLAzBC36rBCL3CA==
X-Received: by 2002:a5d:4203:: with SMTP id n3mr9274303wrq.49.1612602259065;
        Sat, 06 Feb 2021 01:04:19 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:be75:a088:9c76:71df])
        by smtp.gmail.com with ESMTPSA id o124sm11332678wmb.5.2021.02.06.01.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Feb 2021 01:04:18 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>
Subject: [PATCH 06/10] autotools: don't warn about obsolete usage
Date: Sat,  6 Feb 2021 09:04:11 +0000
Message-Id: <20210206090415.1707868-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210206090415.1707868-1-richard.purdie@linuxfoundation.org>
References: <20210206090415.1707868-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@arm.com>

New autoconf warns about obsolete macro usage, but there is quite
a lot of obsolete usage in the wild which isn't really in our problem.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/autotools.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index 2ceb790b5cf..36eb56c70d9 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -229,7 +229,7 @@ autotools_do_configure() {
 		done
 
 		bbnote Executing ACLOCAL=\"$ACLOCAL\" autoreconf -Wcross --verbose --install --force ${EXTRA_AUTORECONF} $acpaths
-		ACLOCAL="$ACLOCAL" autoreconf -Wcross --verbose --install --force ${EXTRA_AUTORECONF} $acpaths || die "autoreconf execution failed."
+		ACLOCAL="$ACLOCAL" autoreconf -Wcross -Wno-obsolete --verbose --install --force ${EXTRA_AUTORECONF} $acpaths || die "autoreconf execution failed."
 		cd $olddir
 	fi
 	if [ -e ${CONFIGURE_SCRIPT} ]; then
-- 
2.27.0

