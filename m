Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web11.34268.1607950286034202106
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 04:51:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=UxIjPL/a;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: anbelski@linux.microsoft.com)
Received: from anbelski-lsg-linux-yocto-1.irsgb21fvobu5fvmalxug44hib.xx.internal.cloudapp.net (unknown [52.247.218.173])
	by linux.microsoft.com (Postfix) with ESMTPSA id 3C0AB20B717A
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 04:51:25 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 3C0AB20B717A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1607950285;
	bh=j74YhURK9N55mCpWsfcaLUSdb8vybEgl/LA3DkCZRvw=;
	h=From:To:Subject:Date:From;
	b=UxIjPL/aIQ6VBYtQxj6ir8k0C2jgS4uj3jcn8pXxeF9Kgz8QCFJn0sWx60/PCQEgZ
	 PdAjEpbetb++Px11489bzR/YGXJ7X6B7DXcfrr9Q5dN0G1kr3tGhElu6pDudem4adf
	 T9ZBbG/fKtUJmztgehvvB6NM8D0SWUAiv1nkHbqI=
From: "Anatol Belski" <anbelski@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] iproute2: Make it easier to manipulate SUBDIRS list from bbappend
Date: Mon, 14 Dec 2020 12:51:15 +0000
Message-Id: <20201214125115.32422-1-anbelski@linux.microsoft.com>
X-Mailer: git-send-email 2.17.1

Currently there's no easy way to override this part as it's hardcoded
into the EXTRA_OEMAKE var. This change makes it possible to manipulate
the list of subdirs in a more fine graned and future oriented manner.

Signed-off-by: Anatol Belski <anbelski@linux.microsoft.com>
---
 meta/recipes-connectivity/iproute2/iproute2.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc b/meta/recipes-connectivity/iproute2/iproute2.inc
index 403d264308..7a22fe9252 100644
--- a/meta/recipes-connectivity/iproute2/iproute2.inc
+++ b/meta/recipes-connectivity/iproute2/iproute2.inc
@@ -20,11 +20,13 @@ PACKAGECONFIG[tipc] = ",,libmnl,"
 PACKAGECONFIG[elf] = ",,elfutils,"
 PACKAGECONFIG[devlink] = ",,libmnl,"
 
+IPROUTE2_MAKE_SUBDIRS = "lib tc ip bridge misc genl ${@bb.utils.filter('PACKAGECONFIG', 'devlink tipc', d)}"
+
 EXTRA_OEMAKE = "\
     CC='${CC}' \
     KERNEL_INCLUDE=${STAGING_INCDIR} \
     DOCDIR=${docdir}/iproute2 \
-    SUBDIRS='lib tc ip bridge misc genl ${@bb.utils.filter('PACKAGECONFIG', 'devlink tipc', d)}' \
+    SUBDIRS='${IPROUTE2_MAKE_SUBDIRS}' \
     SBINDIR='${base_sbindir}' \
     LIBDIR='${libdir}' \
 "
-- 
2.17.1

