Received: from mail-wi0-f173.google.com ([209.85.212.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TiNx0-0001Wr-LC
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Dec 2012 12:24:38 +0100
Received: by mail-wi0-f173.google.com with SMTP id hn17so1903171wib.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2012 03:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=A9coBHU+een3MHzmGpSKB7Ti0drPQIgcv1eR8mxHX1o=;
	b=EktdmXgswoEermY6a77LGAjuFVU/SPW707UZx2hgO11JzXcsRKl39eT/IaU193O+cd
	ufyzl7HcNkd+1lkMNiFiLrMOKKkpcpn6I1s4+A7kTZ3WahBr0qAU56+eHpqh1U6NhMNn
	jCRGg07eE1oaeTNYa7hiuO39zK7QyE23q/lSiRFumts0xnqZSpFYM/Gsplv3dtQi6nMx
	T6kCmXdRgH8FNzvIaHfwyV9lx7YBOzCWeUhMEzDTmU5HIiMt0+kiEugVDGUW2s3GBHB3
	Cz6akSdMKgA/iL8eW7cRrRLnMhXrltDr9/Fqqg1d1kEOEewy1D9e/WVmvu9x3poJDKuI
	iOpw==
Received: by 10.180.107.130 with SMTP id hc2mr15027934wib.12.1355224206870;
	Tue, 11 Dec 2012 03:10:06 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id w5sm6740547wif.11.2012.12.11.03.10.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Dec 2012 03:10:06 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Dec 2012 12:10:18 +0100
Message-Id: <1355224219-16454-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
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
X-List-Received-Date: Tue, 11 Dec 2012 11:24:38 -0000

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



