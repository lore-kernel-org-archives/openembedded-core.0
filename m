Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 72F8E65CC6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 02:30:12 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id s13so1419027pgn.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 19:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=GpGQTnqrN8b0cPJYICXNgMzQCWmood5qUNOOJqsZ2GA=;
	b=NM4pQDXDYcsNsVNAb4GOdjW2/kwr22dnEIQDrnRuo1jX+IBHXyIPXrSX9acBMR+1nV
	aBs3pq4oC3OOAB4w9r2d5YWsuRg2tUfJyaNfEafD9camao2luRKeJjktGAbygcztGNtc
	2wD6R1gm+JKAP8NA++IzEbpDKHW33Rmvwt2PmmfZm5w06lTHCzAUaFZLAbHlRbWkAA7Y
	A9gp0XwwKJHu67ynDnKW/yz5QML8NRzLJ5o4KTNSmrUG8FnIVmvn0CNidUIR4BnX1Xyq
	Zj3zF0Kc8Fi3+quRtGrbjqz5x7jwCv5yzM5nLQy4EmPre0NAcIMnFB7aA/bkpWDPGjvJ
	VIQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=GpGQTnqrN8b0cPJYICXNgMzQCWmood5qUNOOJqsZ2GA=;
	b=QqQzUAML+LdEUfKMDykReWj41fhvlZUKbfv5pGe0i1pHB6nqzVhqr75yx5fQUrCADG
	CezkyRUt25AdntevtBFfUu9lgYTo88K+mi86oxLVerC7B2qQO/v4G8Z0tylNE85LTAsn
	ca3LBR81WhuLfoDzyi1IZE7jGD/XMyC3LfXhc8jKK4htVw91GV0OAlsrywyfgWe3ceE3
	VbfCNf/WfwHs+kfNQKl+GTe/5wv7K/5uFCXjuiqT4OBlbIzuxUwp2dNBxOJEeUU99bpQ
	TDR81bgn/NWuAZBaXt22gub4OmSSDsYNPYdzd/+XlANx8Ylg8SjUT36IZnKgCs6Ng0dn
	wkIg==
X-Gm-Message-State: AElRT7FGyqtOct4/ikb/6QAI4nInfWvOeQ9wm8IBpu0CsQYgVXGGrpuf
	soqmFF2I9abH5+DW8qhK9W1tNuEL
X-Google-Smtp-Source: AG47ELs3MQ76g0/mbBh57Rngr8moPiQDBUZmfr81WN+tlS3TtQEmPVCb0bSRmPFGPkU6hxI0da0c8g==
X-Received: by 10.101.93.71 with SMTP id e7mr13444957pgt.171.1521599414339;
	Tue, 20 Mar 2018 19:30:14 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	i12sm4964252pgr.9.2018.03.20.19.30.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Mar 2018 19:30:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Mar 2018 19:30:04 -0700
Message-Id: <20180321023004.37933-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
Subject: [PATCH] ncurses: Abstract out termlib
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
X-List-Received-Date: Wed, 21 Mar 2018 02:30:13 -0000

termlib needs to be disabled on some targets e.g. mingw
this change paves the way for doing that. Functionally
it does not change anything for other platforms

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/ncurses/ncurses.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index 0bfd644d18..9d06987d1c 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -59,6 +59,7 @@ EX_TERMCAP_class-nativesdk = ":/etc/termcap:/usr/share/misc/termcap"
 EX_TERMINFO = ""
 EX_TERMINFO_class-native = ":/etc/terminfo:/usr/share/terminfo:/usr/share/misc/terminfo:/lib/terminfo"
 EX_TERMINFO_class-nativesdk = ":/etc/terminfo:/usr/share/terminfo:/usr/share/misc/terminfo:/lib/terminfo"
+EX_TERMLIB ?= "tinfo"
 
 # Helper function for do_configure to allow multiple configurations
 # $1 the directory to run configure in
@@ -80,7 +81,7 @@ ncurses_configure() {
 	        --disable-big-core \
 	        --program-prefix= \
 	        --with-ticlib \
-	        --with-termlib=tinfo \
+	        --with-termlib=${EX_TERMLIB} \
 	        --enable-sigwinch \
 	        --enable-pc-files \
 	        --disable-rpath-hack \
-- 
2.16.2


