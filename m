Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TiNx8-0001Xp-JB
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Dec 2012 12:24:47 +0100
Received: by mail-wi0-f169.google.com with SMTP id hq12so1745813wib.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2012 03:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=A9coBHU+een3MHzmGpSKB7Ti0drPQIgcv1eR8mxHX1o=;
	b=ey+8TF/0JSU3KQLlwFTrN8nIoKoAzmqtfl1GgOVMP59QkJXCx0ovpPTF/ACtFhOKby
	2qJbrSZ6a/l9QN/pvJQAtz4J+6Jy3NyeP3ZjxxAfpO2/JXECgLFapSCplODlasw+5DNT
	89mk/OUed1wuIiVwyvrXqtq4368EepvVkSWbxWuSar/lycwaIlTqTp+HI06yCWq905+4
	aEIXsQJj+FOCJeRL8XtpLBLcovCrMctI8ulXz8lKGUG2roSnDmjnVg6/hiFuCJhkqN6p
	vi+AVtRF+aWTT1emkT2U+9+PJeq2rscxppTiNzuJzCGJdeO7pcjasjHh5+732HDKoVEF
	kyCg==
Received: by 10.180.99.227 with SMTP id et3mr16102205wib.6.1355224214856;
	Tue, 11 Dec 2012 03:10:14 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id gz3sm13831179wib.2.2012.12.11.03.10.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Dec 2012 03:10:14 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Dec 2012 12:10:19 +0100
Message-Id: <1355224219-16454-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <1355224219-16454-1-git-send-email-Martin.Jansa@gmail.com>
References: <1355224219-16454-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH] autotools: copy also remove-potcdate.sin from ${STAGING_DATADIR_NATIVE}/gettext/po
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Dec 2012 11:24:47 -0000

* some packages (e.g. uptime, cpu, forecasts, news from meta-efl)
  don't have remove-potcdate.sin in po subdirectory, but Makefile.in.in
  supplied by autotools.bbclass depends on it and fails without like this:
  | make[3]: Entering directory `/OE/shr-core/tmp-eglibc/work/x86_64-oe-linux/uptime/0.0.2+svnr80477-r0.0/E-MODULES-EXTRA/uptime/po'
  | make[3]: *** No rule to make target `remove-potcdate.sin', needed by `remove-potcdate.sed'.  Stop.
  | make[3]: Leaving directory `/OE/shr-core/tmp-eglibc/work/x86_64-oe-linux/uptime/0.0.2+svnr80477-r0.0/E-MODULES-EXTRA/uptime/po'
  | make[2]: *** [uptime.pot] Error 2

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/autotools.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index ca981ec..3154435 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -193,6 +193,7 @@ autotools_do_configure() {
 				cp ${STAGING_DATADIR_NATIVE}/gettext/config.rpath ${AUTOTOOLS_AUXDIR}/
 				if [ -d ${S}/po/ ]; then
 					cp ${STAGING_DATADIR_NATIVE}/gettext/po/Makefile.in.in ${S}/po/
+					cp ${STAGING_DATADIR_NATIVE}/gettext/po/remove-potcdate.sin ${S}/po/
 				fi
 				for i in gettext.m4 iconv.m4 lib-ld.m4 lib-link.m4 lib-prefix.m4 nls.m4 po.m4 progtest.m4; do
 					for j in `find ${S} -name $i | grep -v aclocal-copy`; do
-- 
1.8.0



