Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tjf6g-0003sx-C0
	for openembedded-core@lists.openembedded.org;
	Sat, 15 Dec 2012 00:55:59 +0100
Received: by mail-pb0-f47.google.com with SMTP id un1so2447186pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2012 15:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=txhsMvakLDRdRPs9O9KwsGvu9X5xrWv8b+tWOM4E8pU=;
	b=cNdfQU7NhMMcgCD6r5iqFoKLIo04Goqa6RAIh6CaYHqPuxYJwpZMkteDiwVLBhrbhT
	qKjJDDCxwjjFGqTPXFcSu/lRah9/2qUg5H1/68SDyIZDP0N5eJynT6LMvhWEr+Wd9ooc
	hiI+dmwiyhXVw2hAyI2ZmhVh4d0VbVT7wPzXToOEFNKK/k3rxrg8Oqh6BLRbf9m/rdWd
	GyXeX5RgKJVnQ+aU1Yls0Nsy0MQ1Hld64DVVmUsF4Jh4OZlfz8KKKNFgYfy53g5mCbtd
	rEZZDhSoIOjlxAlNTzlgwuOHCkobu/wHGbG3ydUgPkW0GnRAc/iyO3NdTQvlCYF4+Y2z
	T+5A==
Received: by 10.66.79.195 with SMTP id l3mr19781817pax.82.1355528476901;
	Fri, 14 Dec 2012 15:41:16 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id z5sm3965970pax.9.2012.12.14.15.41.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 14 Dec 2012 15:41:16 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 15 Dec 2012 00:40:46 +0100
Message-Id: <3f175edc9ebe00308b5503b217e5d6927096c1a8.1355475937.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1355475937.git.Martin.Jansa@gmail.com>
References: <cover.1355475937.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1355475937.git.Martin.Jansa@gmail.com>
References: <cover.1355475937.git.Martin.Jansa@gmail.com>
Subject: [PATCH 08/10] autotools: copy also remove-potcdate.sin from ${STAGING_DATADIR_NATIVE}/gettext/po
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
X-List-Received-Date: Fri, 14 Dec 2012 23:55:59 -0000

* some packages (e.g. uptime, cpu, forecasts, news from meta-efl)
  don't have remove-potcdate.sin in po subdirectory, but Makefile.in.in
  supplied by autotools.bbclass depends on it and fails without like this:
  | make[3]: Entering directory `/OE/shr-core/tmp-eglibc/work/x86_64-oe-linux/uptime/0.0.2+svnr80477-r0.0/E-MODULES-EXTRA/uptime/po'
  | make[3]: *** No rule to make target `remove-potcdate.sin', needed by `remove-potcdate.sed'.  Stop.
  | make[3]: Leaving directory `/OE/shr-core/tmp-eglibc/work/x86_64-oe-linux/uptime/0.0.2+svnr80477-r0.0/E-MODULES-EXTRA/uptime/po'
  | make[2]: *** [uptime.pot] Error 2

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
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
1.8.0.2



