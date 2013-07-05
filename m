Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f172.google.com (mail-ea0-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id D28AA6B04C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jul 2013 01:29:06 +0000 (UTC)
Received: by mail-ea0-f172.google.com with SMTP id q10so1141801eaj.17
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jul 2013 18:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=RQDvv2LiSHexhe4hOYmj5ygKiys9qxrUKiKQahKUMfI=;
	b=bYM8yOXBJBBHbW+2N2HmTRHWvkDl+m06Oj1GySGOs7lIRbFpO7D6S6jN0Meu/Zq+1I
	rcHHJVJ+Nxd0OB2/GymTAoFGOdGTb6VLJuj19d9dsCDVsusDZdbcQb8DqcoXIIWS9+Ax
	NyDHc2G0c9E6/BLEl+3LbKtYDeiEuvHjkaJvM7iS8KGDJ4Oa/rA3c6KM3bAL7LYzC95q
	udRovFRt646KtFYcdhmdFNsg0713KRsrscqDfnyHYth/HH0tNqGjbfoOPW9w9hly2Trr
	zUBkx9PtzpiVtAUd48TmCOCzWE/aB9pA4YEvdj78aB5o+gzRXdMuJUcG9AFDFu9r0bQ9
	d8sQ==
X-Received: by 10.15.108.142 with SMTP id cd14mr9181976eeb.125.1372987747509; 
	Thu, 04 Jul 2013 18:29:07 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n45sm9793709eew.1.2013.07.04.18.29.06 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 04 Jul 2013 18:29:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Jul 2013 03:28:58 +0200
Message-Id: <16aed38549bbdb8334561e37eeaddbab1e3ae1ce.1372987648.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <ccac3e9b6e275858355dff498555a1bdbbfb1052.1372987648.git.Martin.Jansa@gmail.com>
References: <ccac3e9b6e275858355dff498555a1bdbbfb1052.1372987648.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1372987648.git.Martin.Jansa@gmail.com>
References: <cover.1372987648.git.Martin.Jansa@gmail.com>
Subject: [PATCH 6/8] libpam: inherit pkgconfig
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
X-List-Received-Date: Fri, 05 Jul 2013 01:29:07 -0000

* missing dependency on pkgconfig-native was causing
  that PKG_CHECK_MODULES(DBUS, dbus-1) stayed unexpanded in
  configure script:
  checking for dbm_store in -lndbm... no
  libpam/1.1.6-r2/Linux-PAM-1.1.6/configure:
  line 14217: syntax error near unexpected token `libtirpc,'
  libpam/1.1.6-r2/Linux-PAM-1.1.6/configure:
  line 14217: `      PKG_CHECK_MODULES(libtirpc, libtirpc,'
  Configure failed. The contents of all config.log files follows to aid
  debugging

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-extended/pam/libpam_1.1.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/pam/libpam_1.1.6.bb b/meta/recipes-extended/pam/libpam_1.1.6.bb
index f811f4c..62ad7b1 100644
--- a/meta/recipes-extended/pam/libpam_1.1.6.bb
+++ b/meta/recipes-extended/pam/libpam_1.1.6.bb
@@ -43,7 +43,7 @@ PR = "r2"
 
 S = "${WORKDIR}/Linux-PAM-${PV}"
 
-inherit autotools gettext
+inherit autotools gettext pkgconfig
 
 PACKAGES += "${PN}-runtime ${PN}-xtests"
 FILES_${PN} = "${base_libdir}/lib*${SOLIBS}"
-- 
1.8.2.1


