Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web08.9593.1616399469283340884
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Mar 2021 00:51:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 12M7oww4021925
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Mar 2021 00:51:06 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 22 Mar 2021 00:51:04 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Mon, 22 Mar 2021 00:51:04 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v3 1/2] gettext-minimal: Disable the unnecessary check in iconv.m4
Date: Mon, 22 Mar 2021 15:51:02 +0800
Message-ID: <20210322075103.9694-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <166D65C2E097270E.28077@lists.openembedded.org>
References: <166D65C2E097270E.28077@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

The below m4 macros files shipped with recipe will be removed if the
recipe use AM_GNU_GETTEXT.
gettext.m4
iconv.m4
lib-ld.m4
lib-link.m4
lib-prefix.m4
nls.m4 po.m4
progtest.m4

After elfutils upgrades to 0.183, it begins to use AM_GNU_GETTEXT as the
commit (dd52d2ab Modernize gettext infrastructure) included, so the above
m4 macros files such as iconv.m4 is removed and it's bad as we need to
patch against iconv.m4 shipped with elfutils.

BTW, the logic to Disable the unnecessary check in iconv.m4 comes since
2015 as [1], so move the related logic to gettext-minimal which provides
iconv.m4 now to fix the gap.

[1] https://git.openembedded.org/openembedded-core/commit/?id=3dd269e027fda173ee40d671ea47da22300fd51d

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-core/gettext/gettext-minimal-0.21/aclocal/iconv.m4 | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/gettext/gettext-minimal-0.21/aclocal/iconv.m4 b/meta/recipes-core/gettext/gettext-minimal-0.21/aclocal/iconv.m4
index e593b7270a..e04476bb7f 100644
--- a/meta/recipes-core/gettext/gettext-minimal-0.21/aclocal/iconv.m4
+++ b/meta/recipes-core/gettext/gettext-minimal-0.21/aclocal/iconv.m4
@@ -166,6 +166,7 @@ AC_DEFUN([AM_ICONV_LINK],
       }
   }
 #endif
+#if 0
   /* Test against HP-UX 11.11 bug: No converter from EUC-JP to UTF-8 is
      provided.  */
   {
@@ -189,6 +190,7 @@ AC_DEFUN([AM_ICONV_LINK],
     if (cd4 != (iconv_t)(-1))
       iconv_close (cd4);
   }
+#endif
   return result;
 ]])],
           [am_cv_func_iconv_works=yes], ,
-- 
2.17.1

