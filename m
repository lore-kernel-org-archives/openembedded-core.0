Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1A307780BD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Nov 2017 17:12:06 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id v19so884765wmh.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Nov 2017 09:12:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=k0gp3aeK4fXJh/HrSKi9+CA7rxX6FmFOmx/PHsmeoP0=;
	b=zRA11IlW88GD6iATv/i9iAyF/+N2WiQG4koJIzOoOJpseY3ycxODfdX/A7h8DDH78L
	LW3H9QkLAqr6VdyhVhJNmIIlfcuNItxVqhZ81zCuZkZX79Qak//4lTvi1afMx9qz0mtW
	EfGnIgsAtJLu6Yxhn1D8fXufYc9McKvF10TMYweZvONO7xF6ouwYsf1WBa68sxxVlXlb
	yBFffLDabzS2aT/fTM8O17vEHgU1w+TBsdDqQiB/1Z6tW+viVGbrXSNwh1zIlqreYDwF
	5qx45Nrt2dziqCMRARASln7SyIrjC5mqxn41JcFBkUztANUyKgFxvAh4hUYdtXeNsF/R
	N4zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=k0gp3aeK4fXJh/HrSKi9+CA7rxX6FmFOmx/PHsmeoP0=;
	b=MjtitDrVgpcyKOX5sfqrjtnmT6uFEuvvYlZN+Lo496x+OJZlxNfsSnh3GHa5kjh8JL
	tDWVaTVizBImq/yqigdwPX52divOBDTbfrxYCttDpdfnypZcCbVL+B+FzwuVDTtjVCtk
	GhSwaH8uphZToq0p4BxMGtxJD0x+KDM6H9xs/fjoQ4nI391guDJq+dhVPp/pcMJeKXKB
	q69mSWNn2aqLqrCtk56mSiOztJSQIqHL6qCwYsrSEztxPiPXxtx5kHHAoBrCRFz3YEgq
	1EayPv/Nea4GbXkcD3TIKESXe4NUTJV3/Txr2efWILB2halc90jzPavfYbqz7pkQnFfz
	qEdg==
X-Gm-Message-State: AJaThX4VoOKwWfcIBtWodviCDxAzKjMIddHNkei268+qNhKfo0JSpV02
	hWKf330zxXHJ+rXbWExA5l0jGxZ7
X-Google-Smtp-Source: AGs4zMYY3t0ykFKvPHzMCvEdgi90NJEXkk9MUx6M9WMzm8sxttZWP8aR6Cc4uNDEwUymweljSiRW4Q==
X-Received: by 10.80.245.181 with SMTP id u50mr3594347edm.171.1511889127497;
	Tue, 28 Nov 2017 09:12:07 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	d58sm12451678ede.62.2017.11.28.09.12.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Nov 2017 09:12:06 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Nov 2017 17:12:04 +0000
Message-Id: <20171128171204.11665-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] bash: disable aclocal
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
X-List-Received-Date: Tue, 28 Nov 2017 17:12:07 -0000

Bash hand-maintains their aclocal.m4, so stop autoreconf from invoking aclocal
and overwriting it.  This means we can remove the kludge to copy aclocal.m4 to
acinclude.m4.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/bash/bash.inc | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/bash/bash.inc
index f4e1f7a11f4..89c35bd59c1 100644
--- a/meta/recipes-extended/bash/bash.inc
+++ b/meta/recipes-extended/bash/bash.inc
@@ -6,7 +6,7 @@ DEPENDS = "ncurses bison-native virtual/libiconv"
 
 inherit autotools gettext texinfo update-alternatives ptest
 
-EXTRA_AUTORECONF += "--exclude=autoheader"
+EXTRA_AUTORECONF += "--exclude=autoheader --exclude=aclocal"
 EXTRA_OECONF = "--enable-job-control --without-bash-malloc"
 
 # If NON_INTERACTIVE_LOGIN_SHELLS is defined, all login shells read the
@@ -33,12 +33,6 @@ USERADD_PARAM_${PN}-ptest = "--create-home --user-group test"
 
 CACHED_CONFIGUREVARS += "headersdir=${includedir}/${PN}"
 
-do_configure_prepend () {
-	if [ ! -e ${S}/acinclude.m4 ]; then
-		cat ${S}/aclocal.m4 > ${S}/acinclude.m4
-	fi
-}
-
 do_compile_ptest () {
 	oe_runmake buildtest
 }
-- 
2.11.0


