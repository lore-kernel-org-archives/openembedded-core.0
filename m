Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id C32FA7732D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 23:10:56 +0000 (UTC)
Received: by padhx2 with SMTP id hx2so113385430pad.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 15:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=Y0GtaKvpq2S+7ZwW/uSKbG5KLMR2R7OrGL8pqLcNPFE=;
	b=tkDN3WdVEqlMoi1/35oiCOYdVWy4OH0zod0shMi3puA35QpheQH38eVDY6a2Il3a/F
	UlXob/WWrg3V0KOfTXPRalsFo6HttJXg3EJwLHqpkQNmqL3XonpaCz6rLjeF/SM0yppA
	MDnQ1bvsRATAqUwsADiOwLDBw9CNphMiS4jvtRrBFAugynh2gMrGRIF7dPCkWxbv8poa
	Mg588oUJ0C1UByci38pJXvdluiu7IU5oPqUXb2UBiy0zW5CmGJ/lKDlL6nZ/fCgPjh4B
	Ktb2qZvc1QMe18el4NWa9/cWd47/SOs17P3Cwp1iWlZX3PfNgD76yUCbBuIHjB0+HE17
	7YNw==
X-Received: by 10.66.160.194 with SMTP id xm2mr36258310pab.68.1447456256701;
	Fri, 13 Nov 2015 15:10:56 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	pq1sm22366902pbb.91.2015.11.13.15.10.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 Nov 2015 15:10:55 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Nov 2015 16:10:42 -0700
Message-Id: <560be3ead7a4d4293554beea8a19f8251bb4934f.1447455202.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <24014f579fcadd2f2cc5f2378a41454023cf674a.1447455202.git.chris_larson@mentor.com>
References: <24014f579fcadd2f2cc5f2378a41454023cf674a.1447455202.git.chris_larson@mentor.com>
In-Reply-To: <cover.1447455202.git.chris_larson@mentor.com>
References: <cover.1447455202.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCHv2 4/6] systemd: for valgrind, define VALGRIND=1
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
X-List-Received-Date: Fri, 13 Nov 2015 23:10:56 -0000

From: Christopher Larson <chris_larson@mentor.com>

Per the systemd README, this should be defined to run systemd under valgrind,
otherwise false positives will be triggered.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-core/systemd/systemd_225.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_225.bb b/meta/recipes-core/systemd/systemd_225.bb
index 18c2448..74304be 100644
--- a/meta/recipes-core/systemd/systemd_225.bb
+++ b/meta/recipes-core/systemd/systemd_225.bb
@@ -127,6 +127,9 @@ EXTRA_OECONF = " --with-rootprefix=${rootprefix} \
 # uclibc does not have NSS
 EXTRA_OECONF_append_libc-uclibc = " --disable-myhostname "
 
+# per the systemd README, define VALGRIND=1 to run under valgrind
+CFLAGS .= "${@bb.utils.contains('PACKAGECONFIG', 'valgrind', ' -DVALGRIND=1', '', d)}"
+
 # disable problematic GCC 5.2 optimizations [YOCTO #8291]
 FULL_OPTIMIZATION_append_arm = " -fno-schedule-insns -fno-schedule-insns2"
 
-- 
2.2.1


