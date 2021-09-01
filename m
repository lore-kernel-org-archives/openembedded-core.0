Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.3124.1630535026145125216
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Sep 2021 15:23:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A6DBD40C34
	for <openembedded-core@lists.openembedded.org>; Wed,  1 Sep 2021 22:23:44 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tVL13f_MrWdY
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Sep 2021 22:23:44 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 999E440C06
	for <openembedded-core@lists.openembedded.org>; Wed,  1 Sep 2021 22:23:44 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 52F5A174670;
	Wed,  1 Sep 2021 18:23:44 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denis@denix.org>
Subject: [PATCH] readline: correct pkg-config dependency for termcap
Date: Wed,  1 Sep 2021 18:23:41 -0400
Message-Id: <1630535021-53888-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

readline uses ncurses for terminal capabilities database, but it fails to
specify it correctly in the pkg-config .pc file, resulting in:
Requires.private: termcap

As ncurses by default provides newer terminfo instead of termcap, there's
no termcap.pc in the system and pkg-config fails when linking with readline:
readline.pc X-> termcap.pc

Help configure script to set pkg-config to use ncurses for the correct
terminal capabilities database:
Requires.private: ncurses

This fixes pkg-config dependency chain:
readline.pc -> ncurses.pc -> tinfo.pc

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 meta/recipes-core/readline/readline.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/readline/readline.inc b/meta/recipes-core/readline/readline.inc
index 7f7f5ad..569e4ff 100644
--- a/meta/recipes-core/readline/readline.inc
+++ b/meta/recipes-core/readline/readline.inc
@@ -18,6 +18,7 @@ SRC_URI += "file://inputrc"
 inherit autotools texinfo
 
 EXTRA_AUTORECONF += "--exclude=autoheader"
+EXTRA_OECONF += "bash_cv_termcap_lib=ncurses"
 
 LEAD_SONAME = "libreadline.so"
 
-- 
2.7.4

