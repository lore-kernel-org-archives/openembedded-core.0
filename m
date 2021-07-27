Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com [136.143.188.14])
 by mx.groups.io with SMTP id smtpd.web10.50.1627386553059264520
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jul 2021 04:49:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=dwrobel@ertelnet.rybnik.pl header.s=ertelnet header.b=KTySZ/vd;
 spf=pass (domain: ertelnet.rybnik.pl, ip: 136.143.188.14, mailfrom: dwrobel@ertelnet.rybnik.pl)
ARC-Seal: i=1; a=rsa-sha256; t=1627386551; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PeoDxVOtAw2ubVGKfxt4r/eFZziuCo8UNPz8t8E0AmPlHMHtxiVIK/pW1hK+9f8c+TrzhnmNQTKDTbtIwbXlrDNe/Ed+KuV4yYtNvr1PgwJBv7qbyZ0KHRIU9rcz1a6IWMW8xe2lTPOPeDiCPQIM6K9gQc7ScUyFeXi+ipzS5uM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1627386551; h=Content-Transfer-Encoding:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=PLbF0pVZikDlxro8cfPrjqN2dlxy5PnL8EHpkeD51DA=; 
	b=DaCfkAIhZ5oYlCyyzzujOcOnxEv8U2B+BCw9wAgWo9PE4dMZU3p9ff7416EMzLAjMO73kbI032VmnOIv4dunLBFxQvfSw6MjZp0Sk+bc3XSF1blo37B1LfEf7dUfuxZtbUDp0YEodxTypAX3zJ1RZjhFkzXa7IHMHuSXZ7qoMW4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ertelnet.rybnik.pl;
	spf=pass  smtp.mailfrom=dwrobel@ertelnet.rybnik.pl;
	dmarc=pass header.from=<dwrobel@ertelnet.rybnik.pl>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1627386551;
	s=ertelnet; d=ertelnet.rybnik.pl; i=dwrobel@ertelnet.rybnik.pl;
	h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Transfer-Encoding;
	bh=PLbF0pVZikDlxro8cfPrjqN2dlxy5PnL8EHpkeD51DA=;
	b=KTySZ/vdlW0xnPKJfOvjejPQ4IjlBEE5dIJSDFlzLuduzUomPxbD+Lghimw1yHGt
	jb+g2Vnqs84Svu+k18myzxQIuyrNF/DdTinOIlTwkPzwjGrJFUH97m1i+1PatAmYjeK
	ABoSeBwIJlncJs644bSaTEfSaZengy9X8MVl83t8=
Received: from localhost.localdomain.pl (91.230.58.69 [91.230.58.69]) by mx.zohomail.com
	with SMTPS id 1627386549735677.6310756745096; Tue, 27 Jul 2021 04:49:09 -0700 (PDT)
From: "Damian Wrobel" <dwrobel@ertelnet.rybnik.pl>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH pseudo 1/4] Remove -fno-strict-aliasing and -Wno-deprecated-declarations
Date: Tue, 27 Jul 2021 13:49:03 +0200
Message-Id: <20210727114906.191837-1-dwrobel@ertelnet.rybnik.pl>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-ZohoMailClient: External
Content-Transfer-Encoding: 8bit

They seems to be no longer needed. Tested on:

 $ gcc --version
 gcc (GCC) 11.1.1 20210531 (Red Hat 11.1.1-3)

Signed-off-by: Damian Wrobel <dwrobel@ertelnet.rybnik.pl>
---
 Makefile.in | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Makefile.in b/Makefile.in
index 10441ef..1ad8836 100644
--- a/Makefile.in
+++ b/Makefile.in
@@ -42,7 +42,7 @@ LOCALSTATE=var/pseudo
 BINDIR=$(PREFIX)/$(BIN)
 LOCALSTATEDIR=$(PREFIX)/$(LOCALSTATE)
 
-CFLAGS_BASE=-pipe -std=gnu99 -Wall -W -Wextra -Wno-deprecated-declarations
+CFLAGS_BASE=-pipe -std=gnu99 -Wall -W -Wextra
 CFLAGS_CODE=-fPIC -D_LARGEFILE64_SOURCE -D_ATFILE_SOURCE $(ARCH_FLAGS)
 CFLAGS_DEFS=-DPSEUDO_PREFIX='"$(PREFIX)"' -DPSEUDO_SUFFIX='"$(SUFFIX)"' -DPSEUDO_BINDIR='"$(BIN)"' -DPSEUDO_LIBDIR='"$(LIB)"' -DPSEUDO_LOCALSTATEDIR='"$(LOCALSTATE)"' -DPSEUDO_VERSION='"$(VERSION)"' $(SQLITE_MEMORY) $(FORCE_ASYNC) -DPSEUDO_PASSWD_FALLBACK='$(PASSWD_FALLBACK)' $(OPTDEFS) $(EPOLL)
 CFLAGS_DEBUG=-O2 -g
@@ -152,9 +152,8 @@ pseudo_tables.c pseudo_tables.h: tables
 pseudo_tables.o: pseudo_tables.c
 	$(CC) $(CFLAGS) $(CFLAGS_PSEUDO) -c -o pseudo_tables.o pseudo_tables.c
 
-# no-strict-aliasing is needed for the function pointer trickery.
 pseudo_wrappers.o: $(GUTS) pseudo_wrappers.c pseudo_wrapfuncs.c pseudo_wrapfuncs.h pseudo_tables.h
-	$(CC) -fno-strict-aliasing $(CFLAGS) $(CFLAGS_PSEUDO) -D_GNU_SOURCE -c -o pseudo_wrappers.o pseudo_wrappers.c
+	$(CC) $(CFLAGS) $(CFLAGS_PSEUDO) -D_GNU_SOURCE -c -o pseudo_wrappers.o pseudo_wrappers.c
 
 offsets32:
 	$(CC) -m32 -o offsets32 offsets.c
-- 
2.31.1

