Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web09.4128.1616036177442795138
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Mar 2021 19:56:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 12I2uFiU016442
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Mar 2021 19:56:15 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 17 Mar 2021 19:56:06 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Wed, 17 Mar 2021 19:56:06 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] autotools: don't wipe elfutils macros
Date: Thu, 18 Mar 2021 10:56:05 +0800
Message-ID: <20210318025605.48080-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
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
patch against iconv.m4 shippped with elfutils.

So we skip elfutils to not let the elfutils m4 macros removed and also
fix below issue:
 $ bitbake elfutils -cconfigure && bitbake elfutils -cpatch

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/classes/autotools.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index 9dc8ebdaa7..4b462c5aba 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -203,7 +203,7 @@ autotools_do_configure() {
 				bbnote Executing glib-gettextize --force --copy
 				echo "no" | glib-gettextize --force --copy
 			fi
-		elif [ "${BPN}" != "gettext" ] && grep -q "^[[:space:]]*AM_GNU_GETTEXT" $CONFIGURE_AC; then
+		elif [ "${BPN}" != "gettext" -a "${BPN}" != "elfutils" ] && grep -q "^[[:space:]]*AM_GNU_GETTEXT" $CONFIGURE_AC; then
 			# We'd call gettextize here if it wasn't so broken...
 			cp ${STAGING_DATADIR_NATIVE}/gettext/config.rpath ${AUTOTOOLS_AUXDIR}/
 			if [ -d ${S}/po/ ]; then
-- 
2.17.1

