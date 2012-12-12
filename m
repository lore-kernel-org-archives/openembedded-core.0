Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tiv61-00029R-7b
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Dec 2012 23:48:09 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so830943eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Dec 2012 14:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=kiqaYVKEEPJ/No0X0H5Bi24N1gi3w6JcPJOp9T4oqrM=;
	b=pAwH2zn5OFYWKMjfImyvYLUgfV3QhMT8X8rzVsyhEF1EMZz2A8wU0t73ZqAPPHlZ/8
	08JCKSIR9MLOSXbU0fx9H5Pbm32br7tM79kDg1D6604KqWqWD7aDG8whs8ZYN5Vmba7z
	wt/RovYfP8otWk7UQyXiEtOHkvBZ39Dfu/5JO2/9FApJT9mzA+CKrRS37LQ7qW1GRCJV
	chcelZP1ciHWwe93MwCd/MWhPFUFffup4omDlvY34jSxq+8Zv9/efIPLfVid8bq7JhUr
	ndfc7WU88gXUW/5kamPoGk8etmq0dLQESz+8NNuwMsJgHQzYIYDlJRFDD5aua5Oh9dKB
	HrjQ==
Received: by 10.14.199.5 with SMTP id w5mr6616830een.31.1355351615162;
	Wed, 12 Dec 2012 14:33:35 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id 46sm58659251eeg.4.2012.12.12.14.33.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 12 Dec 2012 14:33:34 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Dec 2012 23:33:43 +0100
Message-Id: <1355351624-16993-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <20121212212745.GD1756@jama.jama.net>
References: <20121212212745.GD1756@jama.jama.net>
Subject: [PATCHv2 1/2] autotools: copy also remove-potcdate.sin from ${STAGING_DATADIR_NATIVE}/gettext/po
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
X-List-Received-Date: Wed, 12 Dec 2012 22:48:09 -0000

* some packages (e.g. uptime, cpu, forecasts, news from meta-efl)
  don't have remove-potcdate.sin in po subdirectory, but Makefile.in.in
  supplied by autotools.bbclass depends on it and fails without like this:
  | make[3]: Entering directory `/OE/shr-core/tmp-eglibc/work/x86_64-oe-linux/uptime/0.0.2+svnr80477-r0.0/E-MODULES-EXTRA/uptime/po'
  | make[3]: *** No rule to make target `remove-potcdate.sin', needed by `remove-potcdate.sed'.  Stop.
  | make[3]: Leaving directory `/OE/shr-core/tmp-eglibc/work/x86_64-oe-linux/uptime/0.0.2+svnr80477-r0.0/E-MODULES-EXTRA/uptime/po'
  | make[2]: *** [uptime.pot] Error 2

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---

 v2: added if to test existence of that file, because bash has it with wrong permissions
     -r--r--r-- 1 bitbake bitbake 432 Dec  9  2003 ../work/armv7a-vfp-neon-oe-linux-gnueabi/bash/4.2-r6/bash-4.2/po/remove-potcdate.sin

 meta/classes/autotools.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index ca981ec..9d1a299 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -193,6 +193,9 @@ autotools_do_configure() {
 				cp ${STAGING_DATADIR_NATIVE}/gettext/config.rpath ${AUTOTOOLS_AUXDIR}/
 				if [ -d ${S}/po/ ]; then
 					cp ${STAGING_DATADIR_NATIVE}/gettext/po/Makefile.in.in ${S}/po/
+					if [ ! -e ${S}/po/remove-potcdate.sin ]; then
+						cp ${STAGING_DATADIR_NATIVE}/gettext/po/remove-potcdate.sin ${S}/po/
+					fi
 				fi
 				for i in gettext.m4 iconv.m4 lib-ld.m4 lib-link.m4 lib-prefix.m4 nls.m4 po.m4 progtest.m4; do
 					for j in `find ${S} -name $i | grep -v aclocal-copy`; do
-- 
1.8.0



