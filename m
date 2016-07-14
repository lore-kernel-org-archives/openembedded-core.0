Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id A19CD6AC4B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2016 15:43:24 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id f126so71140245wma.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2016 08:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=I+W5lKVjxgZbSwLo2sTDgUEqwB1SDKfPFunHyvhM7WM=;
	b=md1HOXZ0EWh3dS+yZko8TFL6DhIUHjXPV4QzvLp+jItLHU85eKzoTpTUxM+sZUKvw4
	a63/qcR87AyDMjtjr6DsjH+UvSuo44AEODh0qyj+tWYa7mL0WJJsSI5o7l3KzgiHjLaY
	5x3wTrU6d0lFQ5my/NJXmFFxF9mD6LfBc7NZHzwnG6NKd3ByxzjSaEKWy47tHWCBvbvV
	0dCzPyCxYF6evaBEmqISeVgqIGnpglJKDk2HiMDzXLujfr92OtjRvkVgqbRWaUAm13YS
	MhXxyJSnf+zWNfPaXS2T0koKiXaqW9WI0Y6GVAlzsaslelD17SIk3ezngh7sUTIjnSK5
	WO9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=I+W5lKVjxgZbSwLo2sTDgUEqwB1SDKfPFunHyvhM7WM=;
	b=cZwbNmkLVFvB9G+sueJt6vQHZRQEbNJPH3MzXBDhOe+P/1frOpNvJpWIR0F+6PA363
	+8fwCbgA1W1SoOVqq979lsP9bgoMQCU1fdEWWemPgj+P5g2hE3QXx2y+2T/l6RRsfOJQ
	ivypfwOXtVNgHXShtW5vuWOFZFF3Y5gDlkld8FH6c9AjfrMvGG07x1WJvVbe+o41BJg6
	IRbKl6dGmFaIbgtBAaWEO97IkM4mOM/VdbQPbN5VCFALhlFDbR5U6zH+PkRxBUl2ucYS
	gouGHwrEycto57qLAtFl2bgj7R1tjSXkM7P1oqXBJdQC1gtc8/AjgZbAvGTlsBuLdlFI
	M2Rw==
X-Gm-Message-State: ALyK8tJdkU1YzVM2oj1N4RRGpd9BNNPV6H0o2P9tUzWZZdtTOIFvdrUiknwpkooo4UXLCfhu
X-Received: by 10.28.26.69 with SMTP id a66mr17899707wma.8.1468511004601;
	Thu, 14 Jul 2016 08:43:24 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id a2sm37525607wma.2.2016.07.14.08.43.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 14 Jul 2016 08:43:23 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jul 2016 16:43:21 +0100
Message-Id: <1468511001-4450-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] bash: ensure LDFLAGS is passed when building ptest
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
X-List-Received-Date: Thu, 14 Jul 2016 15:43:26 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/bash/bash-3.2.48/build-tests.patch | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/bash/bash-3.2.48/build-tests.patch b/meta/recipes-extended/bash/bash-3.2.48/build-tests.patch
index 91341ee..e63457c 100644
--- a/meta/recipes-extended/bash/bash-3.2.48/build-tests.patch
+++ b/meta/recipes-extended/bash/bash-3.2.48/build-tests.patch
@@ -11,15 +11,15 @@ diff -dNaur bash-3.2.48/Makefile.in.orig bash-3.2.48/Makefile.in
  
  recho$(EXEEXT):		$(SUPPORT_SRC)recho.c
 -	@$(CC_FOR_BUILD) $(CCFLAGS_FOR_BUILD) -o $@ $(SUPPORT_SRC)recho.c ${LIBS_FOR_BUILD}
-+	@$(CC) $(CCFLAGS) -o $@ $<
++	@$(CC) $(CCFLAGS) $(LDFLAGS) -o $@ $<
  
  zecho$(EXEEXT):		$(SUPPORT_SRC)zecho.c
 -	@$(CC_FOR_BUILD) $(CCFLAGS_FOR_BUILD) -o $@ $(SUPPORT_SRC)zecho.c ${LIBS_FOR_BUILD}
-+	@$(CC) $(CCFLAGS) -o $@ $<
++	@$(CC) $(CCFLAGS) $(LDFLAGS) -o $@ $<
  
  printenv$(EXEEXT):	$(SUPPORT_SRC)printenv.c
 -	@$(CC_FOR_BUILD) $(CCFLAGS_FOR_BUILD) -o $@ $(SUPPORT_SRC)printenv.c ${LIBS_FOR_BUILD}
-+	@$(CC) $(CCFLAGS) -o $@ $<
++	@$(CC) $(CCFLAGS) $(LDFLAGS) -o $@ $<
  
 -test tests check:	force $(Program) $(TESTS_SUPPORT)
 +test tests check:
-- 
2.8.1


