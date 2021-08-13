Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.37397.1628865121588333408
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Aug 2021 07:32:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=IHBtINn4;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id qe12-20020a17090b4f8c00b00179321cbae7so5668308pjb.2
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Aug 2021 07:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=wmasGYkMm4GokwR41AsHck3/G8dT7Eg0Rd+DHt2IaIU=;
        b=IHBtINn40RluuzN7/96EkOqe31IK25wNuVO06dC3Mk3d6ALb1cksw12x85z3UiNhuX
         VevNNOqczgIEyJN94KAaBtUSThsP0FDdDCrsHhP57nqITukJnMQXSS/vk3aFxxQ8ewyw
         bo1hZtlr8F/wGUcPNnhXMZNCQF53SYo4gVaBvakUYQlM3tfDbZ3H6Qa6JlxsnyATfSvO
         MWPw0grgajTQhFs9mGjDHkxoHkH58feE/Klwnb3jrhJ3NGjyifjktiIJnt3SwFBQJpA3
         hpbgh+9kX7foLQm7+/XZeCOQl8B1v0DjzXjIr85Pzozbynv+ubOyjnGBegahOsq/FUoP
         +1WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wmasGYkMm4GokwR41AsHck3/G8dT7Eg0Rd+DHt2IaIU=;
        b=EjGu9J3lFPjsO74LR3hYSB5Q71psgYGXMRcUQ7VGg9KFKKHL8N8SRvMYQqnody8v4r
         0OQ6BgTkuWkwJDoFykYqwWrIz/PWfF2gsSsLJ2P9gSJUf5qq8nGJJORyFH8zznbNpbeK
         4mgAMdDRJSzC+2+Q4aX6WAyhgvJF2b9My3shJOCkMa8ES0o2rNnVAN6q4b8+jP2MTjtU
         Vrufgky+OnAFeZ4g7CegHQG7CgGRMvyqTo6lrzDttHEz2dGL/9jqbzmu3tt2SEkx/ipH
         fI8f2SXnBb2iH6hUsbyVHBiV1ToPxHYn+xABPES/d9TXkQve5gMevtebWWHbdXl+9Ktf
         LnPQ==
X-Gm-Message-State: AOAM5332proh30i3zGNvjn1sXlVJdJSYiwd2ie7iqo0JvZeRbFtXf2zc
	bxANbyj6ly7AF9Ek2QL5WH1Pgt+5WsM77ZC3
X-Google-Smtp-Source: ABdhPJxYWGwxtdoakJ+PgVrSABmAEVftShQBhFW54wZJwhqd+D2v1HsHOs7WZFWRaYUKLl1EGxRwCA==
X-Received: by 2002:a62:e304:0:b029:3c5:f82f:8250 with SMTP id g4-20020a62e3040000b02903c5f82f8250mr2702161pfh.49.1628865120704;
        Fri, 13 Aug 2021 07:32:00 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id nl9sm2113182pjb.33.2021.08.13.07.31.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 07:32:00 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/17] kernel-yocto: Simplify no git repo case in do_kernel_checkout
Date: Fri, 13 Aug 2021 04:29:50 -1000
Message-Id: <17e8ffec9846c460c5cdcb08405eae269e0f3b00.1628863869.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628863869.git.steve@sakoman.com>
References: <cover.1628863869.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Barker <paul@pbarker.dev>

If the kernel sources are not fetched via git, a local git repository is
created in do_kernel_checkout. In this case we know that there will be
no remote branches and we will already be on the correct branch (since
only one branch will exist). So we can simplify things by skipping these
steps.

This also removes the assumption that the default git branch name will
be "master". Prior to this change, the final git checkout command in
do_kernel_checkout could fail if a local git repo was created and the
user had changed init.defaultBranch in their gitconfig.

Signed-off-by: Paul Barker <paul@pbarker.dev>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit af2a9c92d4498492ca23388c7b4bbed48abdc4d7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/kernel-yocto.bbclass | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 66cce92362..a1a073b738 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -320,6 +320,21 @@ do_kernel_checkout() {
 			fi
 		fi
 		cd ${S}
+
+		# convert any remote branches to local tracking ones
+		for i in `git branch -a --no-color | grep remotes | grep -v HEAD`; do
+			b=`echo $i | cut -d' ' -f2 | sed 's%remotes/origin/%%'`;
+			git show-ref --quiet --verify -- "refs/heads/$b"
+			if [ $? -ne 0 ]; then
+				git branch $b $i > /dev/null
+			fi
+		done
+
+		# Create a working tree copy of the kernel by checking out a branch
+		machine_branch="${@ get_machine_branch(d, "${KBRANCH}" )}"
+
+		# checkout and clobber any unimportant files
+		git checkout -f ${machine_branch}
 	else
 		# case: we have no git repository at all. 
 		# To support low bandwidth options for building the kernel, we'll just 
@@ -341,21 +356,6 @@ do_kernel_checkout() {
 		git commit -q -m "baseline commit: creating repo for ${PN}-${PV}"
 		git clean -d -f
 	fi
-
-	# convert any remote branches to local tracking ones
-	for i in `git branch -a --no-color | grep remotes | grep -v HEAD`; do
-		b=`echo $i | cut -d' ' -f2 | sed 's%remotes/origin/%%'`;
-		git show-ref --quiet --verify -- "refs/heads/$b"
-		if [ $? -ne 0 ]; then
-			git branch $b $i > /dev/null
-		fi
-	done
-
-	# Create a working tree copy of the kernel by checking out a branch
-	machine_branch="${@ get_machine_branch(d, "${KBRANCH}" )}"
-
-	# checkout and clobber any unimportant files
-	git checkout -f ${machine_branch}
 }
 do_kernel_checkout[dirs] = "${S}"
 
-- 
2.25.1

