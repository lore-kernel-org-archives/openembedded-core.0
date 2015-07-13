Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 026EF739BE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 14:09:07 +0000 (UTC)
Received: by wicmz13 with SMTP id mz13so63013564wic.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 07:09:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=lD2IGHYfPDii16h9P86c3ChB4k/XHAzltJBTYRCYwI0=;
	b=I9uqTg4Reqkypeiy8RxIeUuUO5J2uA2KYQ0cEJbBVZM7azeJx0PV6ViX6e2JMwbOsu
	tcpcYLC1hfpUe5u9Zq3F7l143gVWLGgD9Pxr9izzw906kvKlHV5BEi8eawEiAI220Imc
	yuB7TF3vlI9GF2gE7I5h1Ig19pyNsbGWOyRujgFEGhBNJBkwnkEWOiBF6liI62CfSlzQ
	q1MakPB4bdzry/D2nMH5s7Fv27BzHOBgZk0nPAq685wEZZ/JPR2D+fb6gIAIwDoJWoxz
	jOJEU7/Ksh1UizY+yd+asX3EIzOxmBmhfYkMnjFZDWCMQQvGYIeT2V3Ukj0Lq5TK44Tj
	zfzw==
X-Gm-Message-State: ALoCoQmwrIS+ABaXi2qqi/tntucsAaEfBOPM8XhmvN5gvaU8yWd6SZvI4pS6OJ2gM5O4PfUY9HXa
X-Received: by 10.180.72.35 with SMTP id a3mr22279970wiv.21.1436796546462;
	Mon, 13 Jul 2015 07:09:06 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	f3sm14841438wiz.13.2015.07.13.07.09.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 Jul 2015 07:09:05 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Jul 2015 15:03:03 +0100
Message-Id: <2fb67de5244b1b4dac9e728678d54ca533dd0887.1436795781.git.ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1436795781.git.ross.burton@intel.com>
References: <cover.1436795781.git.ross.burton@intel.com>
In-Reply-To: <cover.1436795781.git.ross.burton@intel.com>
References: <cover.1436795781.git.ross.burton@intel.com>
Subject: [PATCH 5/7] python: add explicit directory when copying
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
X-List-Received-Date: Mon, 13 Jul 2015 14:09:09 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/python/python3_3.4.3.bb | 2 +-
 meta/recipes-devtools/python/python_2.7.9.bb  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3_3.4.3.bb b/meta/recipes-devtools/python/python3_3.4.3.bb
index 3efa7de..dce778a 100644
--- a/meta/recipes-devtools/python/python3_3.4.3.bb
+++ b/meta/recipes-devtools/python/python3_3.4.3.bb
@@ -180,7 +180,7 @@ PACKAGE_PREPROCESS_FUNCS += "py_package_preprocess"
 
 py_package_preprocess () {
 	# copy back the old Makefile to fix target package
-	install -m 0644 Makefile.orig ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile
+	install -m 0644 ${B}/Makefile.orig ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile
 	# Remove references to buildmachine paths in target Makefile
 	sed -i -e 's:--sysroot=${STAGING_DIR_TARGET}::g' -e s:'--with-libtool-sysroot=${STAGING_DIR_TARGET}'::g ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile
 }
diff --git a/meta/recipes-devtools/python/python_2.7.9.bb b/meta/recipes-devtools/python/python_2.7.9.bb
index 19190c3..803a1fc 100644
--- a/meta/recipes-devtools/python/python_2.7.9.bb
+++ b/meta/recipes-devtools/python/python_2.7.9.bb
@@ -135,7 +135,7 @@ PACKAGE_PREPROCESS_FUNCS += "py_package_preprocess"
 
 py_package_preprocess () {
 	# copy back the old Makefile to fix target package
-	install -m 0644 Makefile.orig ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile
+	install -m 0644 ${B}/Makefile.orig ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile
 
 	# Remove references to buildmachine paths in target Makefile
 	sed -i -e 's:--sysroot=${STAGING_DIR_TARGET}::g' -e s:'--with-libtool-sysroot=${STAGING_DIR_TARGET}'::g ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile
-- 
2.1.4


