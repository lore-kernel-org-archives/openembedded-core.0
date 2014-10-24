Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 2307F60557
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Oct 2014 16:22:00 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id lj1so1405369pab.18
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Oct 2014 09:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=yZ5YRmN3cPpitsHwHiJHK+gZnVMLm/e2RQnT0sI+Y4s=;
	b=oQ9tIEve7iSDBxf7EdrZAjLgguEu6Y8lZqEMeXtcU0CuscpLxzev8vx+n97VpBjaq4
	APLtFRhRVB9FEIXxjJAyK9bclMW6BN+iS5UQigioeogg4pdpw9tx22V0Tc49keTxuXYu
	Dl7qqyZqYJxPacRNkHf3kfmh2EQJjIWoqi/4o1wa3p3QLIE7yfo9NW08M6ppDOs1Lyuj
	6BuiuB6u58APxdJoeF1vp3audgkkcN2TICR3st/9D8q1phLk+jP6c3b0FlzHqDPcleJG
	KMddfUJRObXNW9kl/dofyGDjV6hFGYnTXAux82fIehAiQ1HtZ7uzXLMILVa9Ynm7cAo+
	mVYQ==
X-Received: by 10.66.218.168 with SMTP id ph8mr5657441pac.51.1414167721017;
	Fri, 24 Oct 2014 09:22:01 -0700 (PDT)
Received: from haswell.localdomain (c-76-103-58-225.hsd1.ca.comcast.net.
	[76.103.58.225])
	by mx.google.com with ESMTPSA id r9sm4251379pdl.60.2014.10.24.09.22.00
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 24 Oct 2014 09:22:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Oct 2014 09:24:57 -0700
Message-Id: <1414167898-9441-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.2
Subject: [PATCH 1/2] glibc: Delete ldconfig when USE_LDCONFIG is not set
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
X-List-Received-Date: Fri, 24 Oct 2014 16:22:06 -0000

This avoids below QA error/warning
/sbin/ldconfig [installed-vs-shipped]

Change-Id: I028b692eefeaa6e0e0e6507ab4108caa29e41e91
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glibc/glibc-package.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index 13209f5..6212e5b 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -92,8 +92,9 @@ do_install_append () {
 	fi
 
 	if [ "${USE_LDCONFIG}" != "1" ]; then
-		# We won't ship this file (see FILES above) so let's not install it
+		# We won't ship these files (see FILES above) so let's not install them
 		rm -f ${D}${sysconfdir}/ld.so.conf
+		rm -f ${D}${base_sbindir}/ldconfig
 		# This directory will be empty now so remove it too.
 		# But check whether it exists first, since it won't for glibc-initial.
 		if [ -d ${D}${sysconfdir} ]; then
-- 
1.9.1


