Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id E4B3A78AC7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 11:10:02 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id j5-v6so1297562wrr.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 04:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=7s3g08xoUKqXsl1Q6bYZJAlCjLpYvomYdEiSoP0TJgU=;
	b=oA8n36l4d+3DRj5whAjqOx2E72Nlt7Xp5u9wvn1mclofPadxhoYBNr56hJDVgcUmDE
	C7ylCSdlkV3k9h8u3nUPcDAB9YAoxdGqffK9FIp0+xlA3EMWKBrt8AYLbvpCEp3JdVnD
	hmSv1TiwThO8AOWREwOapNjuytI5EM1tegmrpN9xrcTd1wG40Y9cCFJnkcuFd/SyV2X9
	aHE/HYl5NiP/cluKL4m4gtqfoMdH8jY7X0pF+5jJSTHgXh9qBlny+VjJi3U0yBEJiaE6
	8e8dXQZRIakpIzsTurzhB5m0ZkDyFtjD2ESe7a8+c38h8ob/qJ9RmMAfusll3Lh1SBGj
	dQDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7s3g08xoUKqXsl1Q6bYZJAlCjLpYvomYdEiSoP0TJgU=;
	b=MGXKW8OihoODnonkIGx9g2W1jEv5RyQPeS2TWyzSyCaDQwp6f12w6DlYOl6w8/Riei
	PWsWcPOjYykzyMHc1s0NcuO60NqL1Agm1ylP8f0t0zOyKbOLKMcd3yRBo/hvq5Caaugy
	gwXUFt8QVt+Y83qh+/za1RlyZcLCgWaeRE1e11TtcnXxZrS6NkUQSFzf+w6IKK+gYnzo
	3DfsFubA6USDBpnvBm6q2vgjDjEwI+kvnNvNjR8Zmrl8TeoI5XtTmIVYBSe8W/mp2fD0
	NidPRDLmT03mwvgqByHYVLwEfl2r8wq4WrY/WQD9noAMQdz7tPKWPJ/dLmKGwTsE3z3X
	0Cyg==
X-Gm-Message-State: AOUpUlER44ECPxGegttv4ellBBSNtoAYSDHETgXwEwi390s5fjTDL8Y7
	Es5ZuXio5V23zzyQACQK2Dz7p0kE
X-Google-Smtp-Source: AAOMgpfQ1irjQZD0X+xMb+FmysR/QzU8h2K03KHhfcq0Ge3DnLCJrnN1RAk+594WkuvUeeKH8yNmmg==
X-Received: by 2002:adf:9086:: with SMTP id
	i6-v6mr1181255wri.271.1532603403518; 
	Thu, 26 Jul 2018 04:10:03 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	t6-v6sm1904701wmf.8.2018.07.26.04.10.02
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 26 Jul 2018 04:10:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Jul 2018 11:09:58 +0000
Message-Id: <20180726110958.612-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] package.bbclass: append to FILERPROVIDES_*/FILERDEPENDS_* variables instead of setting them
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
X-List-Received-Date: Thu, 26 Jul 2018 11:10:03 -0000

* this allows to work around some of the issues with file-rdeps
* e.g. in my case I have /usr/lib/libmali.so.0.1 which according to rpmdeps
  provides only following libmali*
  libmali.so(LIBMALI_1.0)
  libmali.so.0.1
  but many users of this link with libmali.so directly and according to
  rpmdeps require libmali.so which causes file-rdeps for a lot of
  recipes
* I was using simple work around to just set:
  RPROVIDES_${PN} = "libmali.so libGLESv2.so libEGL.so"
  but that doesn't work well with multilib, because the value gets
  expanded with MLPREFIX and
  RPROVIDES_${PN} = "lib32-libmali.so lib32-libGLESv2.so lib32-libEGL.so"
  doesn't help at all.

[YOCTO #9217] Many unsolveable QA warnings from build-deps and file-rdeps

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/package.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index be76b30f31..0e6c3be210 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1557,12 +1557,12 @@ python package_do_filedeps() {
         for file in provides:
             provides_files[pkg].append(file)
             key = "FILERPROVIDES_" + file + "_" + pkg
-            d.setVar(key, " ".join(provides[file]))
+            d.appendVar(key, " " + " ".join(provides[file]))
 
         for file in requires:
             requires_files[pkg].append(file)
             key = "FILERDEPENDS_" + file + "_" + pkg
-            d.setVar(key, " ".join(requires[file]))
+            d.appendVar(key, " " + " ".join(requires[file]))
 
     for pkg in requires_files:
         d.setVar("FILERDEPENDSFLIST_" + pkg, " ".join(requires_files[pkg]))
-- 
2.17.1


