Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web12.3435.1611009419026381838
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jan 2021 14:36:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=xIk6fvlj;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id j12so3870431pfj.12
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Jan 2021 14:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=SGI0n+q7UD29p0hqsw0F+1KZV2zDN8snScM/xIWZcJM=;
        b=xIk6fvljHSoLVxLPcodFQC2ViQpwRB+fib34bgOFaVPHp8YSlcQSg8Wpq/yB5Pzb2X
         L/9vSiGjN6SrofdLcTkudcK2rc6r6BSumLq4kePmTy2oDZEPea2ee6NNTbWMmlbidVi0
         uxgwTeV7UB+d9ncWUZz3C+yXZIQWMcX+O/Ol54VRn9gqPY1+ehqTcIh0pTQV680FBk7W
         Ywbt8L9nyjQwN3FQObT7P7rNe/m8fn4ihTJYzEvwsYKNAKEhRqbJz9arwXCZf4lCPlTc
         yVfdhyrmDPp4Pa8VauA2RPHKq8Vz7bgxjgNfH3BFzbBAge3m6evqobI+jxTzE3DfEhjg
         kDJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=SGI0n+q7UD29p0hqsw0F+1KZV2zDN8snScM/xIWZcJM=;
        b=RcccAhhuFcz7bxbZFxEt/AtOcGnVhlYGeiHwX4C3cth6CH4m23kCFEvgTBpiQhTZe8
         cc6CvEp9Cb0IrEuUaqZcCUujbLPS6IRETgXkRi6EXkFkQWqSDlU6Nnmo2CCNF+KjBzJG
         td/5q9RkVkRWfXY9/Nn1JCmhiAqSxog5ns1t/WYlQaUAFdWooEALvRjBlPoZIHUuk17H
         I7UHAPiqUtcfupEarIzel3wdDs1BA8zbJo0uBZtakzQPaNrOSawxyO7mdTMpEGsRJ/U3
         ZeleCH6M9imiplP+0N+9M90Tj1Sd66D3ljiNaGAoo7+wLuUCHtf39OKkQgxDZOhiIpqK
         nxug==
X-Gm-Message-State: AOAM533AJUxg3CKlbbkmbHnnG9o2+UB56nVx5wE8RpdpQd+NRwePIAqO
	zZo4aQFUISapQjp7wkzgmYy3Tstf7Aess2bww00=
X-Google-Smtp-Source: ABdhPJzIuwUNPoM7z//txTpEA3UaDYhb3KwoF6JjKQGnqzmgrymHdfhtgSHDmriMxd7c/LaBdHvWfg==
X-Received: by 2002:a62:1590:0:b029:1b7:b4ea:5ea with SMTP id 138-20020a6215900000b02901b7b4ea05eamr1504132pfv.39.1611009417852;
        Mon, 18 Jan 2021 14:36:57 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.150])
        by smtp.gmail.com with ESMTPSA id a12sm16835556pgq.5.2021.01.18.14.36.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jan 2021 14:36:57 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/19] go.bbclass: don't stage test data with sources of dependencies
Date: Mon, 18 Jan 2021 12:36:09 -1000
Message-Id: <ea5bd7d3eac87dfb145f98c697f356eb84c9b0ec.1611009050.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1611009050.git.steve@sakoman.com>
References: <cover.1611009050.git.steve@sakoman.com>

From: Thomas Perrot <thomas.perrot@bootlin.com>

As for the sources the dependencies contain test data, ELF files and other
binaries which aren't necessary for building and which lead to unnecessary QA
warnings.

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7faea9766127fe4e1023c89b140cc98020655155)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/go.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index a9e31b50ea..e6c3591479 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -115,7 +115,8 @@ go_do_install() {
 	install -d ${D}${libdir}/go/src/${GO_IMPORT}
 	tar -C ${S}/src/${GO_IMPORT} -cf - --exclude-vcs --exclude '*.test' --exclude 'testdata' . | \
 		tar -C ${D}${libdir}/go/src/${GO_IMPORT} --no-same-owner -xf -
-	tar -C ${B} -cf - --exclude-vcs pkg | tar -C ${D}${libdir}/go --no-same-owner -xf -
+	tar -C ${B} -cf - --exclude-vcs --exclude '*.test' --exclude 'testdata' pkg | \
+		tar -C ${D}${libdir}/go --no-same-owner -xf -
 
 	if [ -n "`ls ${B}/${GO_BUILD_BINDIR}/`" ]; then
 		install -d ${D}${bindir}
-- 
2.17.1

